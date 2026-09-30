# Production Deployment Guide

## 📋 Pre-Deployment Checklist

### Code
- [ ] All tests pass: `./validate-system.sh`
- [ ] No secrets in `.env` or `config.php` 
- [ ] All environment variables documented
- [ ] Git history is clean
- [ ] Latest commits are tagged

### Infrastructure
- [ ] Database backups configured (3-2-1 rule)
- [ ] PHP 8.2+ installed and configured
- [ ] MySQL 8.3+ with proper character set (utf8mb4)
- [ ] Ollama running with Qwen model
- [ ] All ports accessible (80/443, 11434 for Ollama)

### Security
- [ ] HTTPS configured (SSL certificate)
- [ ] Database credentials in secure vault
- [ ] Microsoft credentials in Azure Key Vault
- [ ] `.gitignore` updated
- [ ] File permissions set correctly (644 files, 755 dirs)

### Monitoring
- [ ] Error logging configured
- [ ] Performance monitoring enabled
- [ ] Backup validation tested
- [ ] Rollback plan documented

## 🚀 Deployment Steps

### 1. Prepare Server

```bash
# Create app directory
mkdir -p /var/www/novos-sistemas-ipc
cd /var/www/novos-sistemas-ipc

# Clone repository
git clone https://github.com/raphaeldcb/newipcsistemas.git .

# Set permissions
chmod 755 . html logs
chmod 644 html/*.php api.php index.php
chmod 750 python/*.py
```

### 2. Configure Environment

```bash
# Copy and configure
cp config/config.example.php config/config.php

# Edit with production values
nano config/config.php

# Secure the config file
chmod 600 config/config.php
chown www-data:www-data config/config.php
```

### 3. Setup Database

```bash
# Create database
mysql -u root -p < database/install.sql

# Or if using secure connection
mysql -h db-host -u admin -p < database/install.sql
```

### 4. Configure Web Server

#### Nginx Example

```nginx
server {
    listen 80;
    server_name novos-sistemas.example.com;
    
    # Redirect HTTP to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name novos-sistemas.example.com;
    
    # SSL certificates
    ssl_certificate /etc/ssl/certs/your-cert.crt;
    ssl_certificate_key /etc/ssl/private/your-key.key;
    
    root /var/www/novos-sistemas-ipc;
    index index.php index.html;
    
    # Logs
    access_log /var/log/nginx/novos-sistemas-access.log;
    error_log /var/log/nginx/novos-sistemas-error.log;
    
    # Security headers
    add_header Strict-Transport-Security "max-age=31536000" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    
    # PHP configuration
    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    
    # Block access to sensitive files
    location ~ /config/ {
        deny all;
    }
    
    location ~ /database/ {
        deny all;
    }
    
    location ~ /\. {
        deny all;
    }
}
```

#### Apache Example

```apache
<VirtualHost *:443>
    ServerName novos-sistemas.example.com
    DocumentRoot /var/www/novos-sistemas-ipc/html
    
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/your-cert.crt
    SSLCertificateKeyFile /etc/ssl/private/your-key.key
    
    # Logs
    ErrorLog ${APACHE_LOG_DIR}/novos-sistemas-error.log
    CustomLog ${APACHE_LOG_DIR}/novos-sistemas-access.log combined
    
    # Security headers
    Header set Strict-Transport-Security "max-age=31536000"
    Header set X-Content-Type-Options "nosniff"
    Header set X-Frame-Options "SAMEORIGIN"
    
    # PHP handler
    <FilesMatch \.php$>
        SetHandler application/x-httpd-php
    </FilesMatch>
    
    # Block access to sensitive directories
    <Directory /var/www/novos-sistemas-ipc/config>
        Deny from all
    </Directory>
    
    <Directory /var/www/novos-sistemas-ipc/database>
        Deny from all
    </Directory>
</VirtualHost>
```

### 5. Start Services

```bash
# Ollama (background)
nohup ollama serve > /var/log/ollama.log 2>&1 &

# PHP-FPM (systemd)
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

### 6. Configure Cron for Batch Extraction

```bash
# Add to crontab
crontab -e

# Every 10 minutes: extract new communications
*/10 * * * * cd /var/www/novos-sistemas-ipc && /usr/bin/php -r "require 'config/config.php'; require 'html/controllers/ExtractionController.php'; \$controller = new ExtractionController(\$pdo, \$config); \$controller->extractBatch('new', 10);" >> /var/log/extraction.log 2>&1
```

### 7. Setup Backups

```bash
# Database backup script
#!/bin/bash
# /usr/local/bin/backup-novos-sistemas.sh

BACKUP_DIR="/mnt/backups/novos-sistemas"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# MySQL backup
mysqldump -u root -p$MYSQL_PASSWORD novos_sistemas_ipc | gzip > $BACKUP_DIR/db-$DATE.sql.gz

# Application backup
tar -czf $BACKUP_DIR/app-$DATE.tar.gz /var/www/novos-sistemas-ipc

# Keep only last 30 days
find $BACKUP_DIR -mtime +30 -delete
```

Add to crontab:
```bash
# Daily backup at 2 AM
0 2 * * * /usr/local/bin/backup-novos-sistemas.sh
```

## 🔒 Security Hardening

### PHP Configuration

Edit `/etc/php/8.2/fpm/php.ini`:

```ini
# Security
expose_php = Off
display_errors = Off
log_errors = On
error_log = /var/log/php-error.log

# Session security
session.use_strict_mode = 1
session.cookie_httponly = 1
session.cookie_secure = 1
session.cookie_samesite = Strict

# File upload limits
upload_max_filesize = 10M
post_max_size = 10M

# Execution limits
max_execution_time = 30
max_input_time = 60
memory_limit = 256M
```

### Database Security

```sql
-- Create limited user (not root)
CREATE USER 'novos_sistemas'@'localhost' IDENTIFIED BY 'strong_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON novos_sistemas_ipc.* TO 'novos_sistemas'@'localhost';
FLUSH PRIVILEGES;

-- Disable remote root login
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');
```

### Firewall

```bash
# Allow only necessary ports
ufw allow 22/tcp      # SSH
ufw allow 80/tcp      # HTTP
ufw allow 443/tcp     # HTTPS
ufw allow 11434/tcp   # Ollama (internal only - consider restricting)
ufw enable
```

## 📊 Monitoring

### Application Monitoring

```bash
# Check PHP-FPM status
systemctl status php-fpm

# Check Ollama status
curl http://localhost:11434/api/tags

# Monitor MySQL
mysql -u root -p -e "SHOW PROCESSLIST;"
```

### Log Monitoring

```bash
# Real-time PHP errors
tail -f /var/log/php-error.log

# Extraction logs
tail -f /var/log/extraction.log

# Web server logs
tail -f /var/log/nginx/novos-sistemas-error.log
```

### Performance Monitoring

```bash
# Database query performance
mysql -u root -p -e "SELECT * FROM performance_schema.events_statements_summary_by_digest LIMIT 10;"

# Slow queries
tail -f /var/log/mysql-slow.log
```

## 🔄 Rollback Plan

If deployment fails:

```bash
# 1. Restore from backup
cd /var/www/novos-sistemas-ipc
git reset --hard <previous-commit-hash>

# 2. Restore database
mysql -u root -p novos_sistemas_ipc < /mnt/backups/db-backup.sql.gz

# 3. Restart services
systemctl restart php-fpm nginx

# 4. Verify
curl https://novos-sistemas.example.com
```

## 🧪 Post-Deployment Testing

```bash
# 1. Access application
curl -I https://novos-sistemas.example.com

# 2. Test login
curl -X POST https://novos-sistemas.example.com/index.php \
  -d "email=admin@ipcms.com.br&password=admin123"

# 3. Test API
curl https://novos-sistemas.example.com/api.php?action=stats

# 4. Test extraction
echo '{"id":1,"subject":"Test","from_name":"Test","from_address":"test@example.com","body_preview":"Test","received_datetime":"2024-09-29T10:00:00"}' | \
  python3 /var/www/novos-sistemas-ipc/python/extraction_service.py extract

# 5. Check databases are syncing
mysql -e "SELECT COUNT(*) FROM novos_sistemas_ipc.communications;"
```

## 📈 Scaling Considerations

### Horizontal Scaling

- Use load balancer (nginx, HAProxy)
- Database replication (primary-replica)
- Redis for session storage
- Separate Ollama service

### Vertical Scaling

- Increase PHP-FPM workers
- Allocate more MySQL buffer pool
- Increase Ollama GPU memory

### Performance Optimization

- Enable query caching
- Implement application-level caching
- Optimize Python extraction service
- Use CDN for static assets

## 📞 Support & Maintenance

### Regular Tasks

- [ ] Monitor disk space
- [ ] Review error logs weekly
- [ ] Test backups monthly
- [ ] Update software quarterly
- [ ] Review security settings

### Emergency Contacts

- Database admin: [contact]
- System administrator: [contact]
- Security team: [contact]

## 📚 References

- [PHP 8.2 Documentation](https://www.php.net/manual/en/index.php)
- [MySQL 8.3 Documentation](https://dev.mysql.com/doc/)
- [Nginx Best Practices](https://nginx.org/en/docs/)
- [OWASP Security Guide](https://owasp.org/www-project-secure-coding-practices/)
