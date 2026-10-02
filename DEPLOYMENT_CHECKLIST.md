# Deployment Checklist: Qwen Classifier v2.0

## Pre-Deployment (Local Validation)

### Environment
- [ ] All 7 tasks committed to git
- [ ] All tests passing locally: `pytest tests/ -v`
- [ ] Ollama running on port 11434: `curl http://localhost:11434/api/tags`
- [ ] Model `perito-qwen` available in Ollama
- [ ] Python 3.13+ installed: `python --version`
- [ ] MySQL 8.3+ running: `mysql --version`
- [ ] PHP 8.2+ running: `php --version`

### Code Quality
- [ ] No syntax errors: `php -l api.php`
- [ ] No Python errors: `python -m py_compile python/services/classifier.py`
- [ ] No uncommitted changes: `git status` (clean)
- [ ] Latest code pulled: `git log --oneline -5`

### Database Backup
- [ ] Full backup created: `mysqldump -u root newipcsistemas > backup-2026-10-02.sql`
- [ ] Backup verified: `ls -lh backup-*.sql`
- [ ] Backup location noted: `/path/to/backup-2026-10-02.sql`

---

## Migration (VPS Execution)

### Pre-Migration Checklist
- [ ] SSH access to VPS verified: `ssh root@129.121.34.186 -p 22022`
- [ ] VPS backup created before migration
- [ ] Maintenance window scheduled (off-peak hours)
- [ ] Team notified of downtime (if any)

### Database Migrations
```bash
# Execute migrations on VPS
mysql -u root -p newipcsistemas < database/migrations/001_add_confidence_columns.sql
mysql -u root -p newipcsistemas < database/migrations/002_add_body_column.sql
mysql -u root -p newipcsistemas < database/migrations/003_create_indexes.sql
```

- [ ] Migration 1 applied: `DESCRIBE communications;` shows `confidence` column
- [ ] Migration 2 applied: `DESCRIBE communications;` shows `full_body` column
- [ ] Migration 3 applied: `SHOW INDEX FROM communications;` shows new indexes
- [ ] All data intact: `SELECT COUNT(*) FROM communications;` (should match pre-migration count)
- [ ] No errors in MySQL logs: `tail -20 /var/log/mysql/error.log`

### Code Deployment
```bash
# On VPS, in project directory
cd /var/www/newipcsistemas

# Pull latest code
git pull origin master

# Verify commits
git log --oneline -5

# Install/update dependencies
composer install  # if using PHP dependencies
pip install -r python/requirements.txt --upgrade
```

- [ ] Latest code pulled: `git status` (on master, up to date)
- [ ] Commits match local: `git log --oneline -5`
- [ ] Dependencies installed: `pip list | grep requests`
- [ ] No syntax errors: `php -l api.php`

### Service Restart
```bash
# Restart web server
sudo systemctl restart apache2

# Restart PHP-FPM (if using)
sudo systemctl restart php8.2-fpm

# Verify services running
sudo systemctl status apache2
sudo systemctl status php8.2-fpm
```

- [ ] Apache running: `sudo systemctl status apache2` (active)
- [ ] PHP-FPM running: `sudo systemctl status php8.2-fpm` (active)
- [ ] Ollama running: `curl http://localhost:11434/api/tags` (200 OK)
- [ ] No error logs: `tail -20 /var/log/apache2/error.log` (no ERRORs)

---

## Post-Deployment Verification

### API Health Checks
```bash
# Test basic API
curl http://localhost:8000/api.php?action=list

# Test with jq (if installed)
curl http://localhost:8000/api.php?action=list | jq '.status'
```

- [ ] API responds: HTTP 200
- [ ] Response includes `confidence` field
- [ ] Response includes `reasoning` field
- [ ] Response includes `extracted_at` field
- [ ] Response includes `full_body` field

### Database Verification
```bash
# Check new columns
mysql -u root newipcsistemas -e "DESCRIBE communications LIKE '%confidence%';"
mysql -u root newipcsistemas -e "DESCRIBE communications LIKE '%reasoning%';"
mysql -u root newipcsistemas -e "DESCRIBE communications LIKE '%extracted_at%';"
mysql -u root newipcsistemas -e "DESCRIBE communications LIKE '%full_body%';"

# Check indexes
mysql -u root newipcsistemas -e "SHOW INDEX FROM communications WHERE Key_name IN ('idx_confidence', 'idx_extracted_at');"
```

- [ ] Column `confidence` exists
- [ ] Column `reasoning` exists
- [ ] Column `extracted_at` exists
- [ ] Column `full_body` exists
- [ ] Both indexes created

### Classification Test
```php
<?php
// Test in browser or via PHP CLI
include 'api.php';
$classifier = new \Services\QwenClassifierService();
$result = $classifier->classify(
    "PODER JUDICIÁRIO DE MATO GROSSO...",
    "Intimação para apresentar quesitos..."
);
var_dump($result);
?>
```

- [ ] Classification returns without error
- [ ] `classification` field present (JUDICIAL, NON_JUDICIAL, UNKNOWN)
- [ ] `confidence` score present (0.0-1.0)
- [ ] `reasoning` field present with explanation
- [ ] `extracted_fields` contains CNJ, Vara, Comarca (if applicable)

### UI Verification
- [ ] Login works: `http://localhost/newipcsistemas/`
- [ ] Dashboard loads
- [ ] Comunicações page loads
- [ ] "Extract" button appears on emails
- [ ] Extracted emails show confidence badge
- [ ] Confidence badge shows correct score (0.9-1.0 for confident)
- [ ] Hover over confidence shows reasoning

### Performance Check
```bash
# Monitor classification times
tail -f /var/log/app.log | grep "Classification completed"

# Should see times like: "2.3s", "3.1s", etc.
# Anything over 30s = Qwen timeout, check Ollama
```

- [ ] Classifications complete within 5-30 seconds
- [ ] No 503 Service Unavailable errors
- [ ] Fallback triggers on Ollama timeout (logs show "Using fallback")

### Monitoring & Logging
```bash
# Check application logs
tail -50 /var/log/app.log

# Look for any ERRORs
grep ERROR /var/log/app.log

# Check MySQL logs
tail -20 /var/log/mysql/error.log
```

- [ ] No ERROR entries in logs
- [ ] No MySQL connection errors
- [ ] No timeout errors (Ollama timeout = expected fallback)
- [ ] Timestamp format is correct (extracted_at column)

---

## Rollback (if needed)

### Quick Rollback (without code revert)
```bash
# If only data needs fixing:
mysql -u root newipcsistemas < backup-2026-10-02.sql

# Restart services
sudo systemctl restart apache2
```

- [ ] Backup file intact: `ls -lh backup-2026-10-02.sql`
- [ ] Backup restored: `mysql -u root newipcsistemas < backup-2026-10-02.sql`
- [ ] Restored data verified: `SELECT COUNT(*) FROM communications;`

### Full Code Rollback
```bash
# Revert to previous commit
cd /var/www/newipcsistemas
git log --oneline -10  # Find previous stable commit
git reset --hard <commit-hash>

# Restart services
sudo systemctl restart apache2
```

- [ ] Previous code deployed
- [ ] Database columns remain (safe, non-destructive)
- [ ] Services restarted
- [ ] API responds

---

## Post-Rollout Monitoring (First Week)

### Daily Checks
- [ ] Classification accuracy > 95%
- [ ] No error spikes in logs
- [ ] Response times stable (< 30s)
- [ ] Fallback rate < 5%
- [ ] Database size growing normally (no bloat)

### Weekly Report (After 7 Days)
- [ ] Total emails classified: ____
- [ ] Qwen classifications: ____ (avg confidence: ____)
- [ ] Fallback classifications: ____
- [ ] Classification errors: ____
- [ ] User feedback collected: ____

### Optimization (If Needed)
- [ ] Fine-tune Qwen with your email dataset
- [ ] Adjust confidence thresholds if needed
- [ ] Reduce timeout if Ollama is consistently fast
- [ ] Archive old emails to reduce DB size

---

## Deployment Sign-Off

| Role | Name | Date | Notes |
|------|------|------|-------|
| Developer | ______ | ____ | |
| QA | ______ | ____ | |
| Ops | ______ | ____ | |
| PM | ______ | ____ | |

---

**Deployment Date**: _________
**Deployed By**: _________
**Backup Location**: /path/to/backup-2026-10-02.sql
**Rollback Plan**: Ready (revert git commit or restore backup)
**Monitoring**: Active (logs monitored daily)
