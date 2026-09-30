<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autenticando...</title>

    <style>
        /**
 * Theme Unified CSS
 * Paleta corporativa Perito v6 + componentes para newipcsistemas
 * Dark/Light mode automático
 */

/* ============================================
   ROOT THEME VARIABLES
   ============================================ */
:root {
  /* Cores Corporativas - Perito v6 */
  --color-primary: #132F4A;        /* Azul topo */
  --color-primary-light: #1A4A6F;  /* Azul secundário */
  --color-primary-dark: #0D1F2D;   /* Azul escuro */

  /* Cinzas */
  --color-gray-50: #F9FAFB;
  --color-gray-100: #F3F4F6;
  --color-gray-200: #E5E7EB;
  --color-gray-300: #D1D5DB;
  --color-gray-400: #9CA3AF;
  --color-gray-500: #6B7280;
  --color-gray-600: #4B5563;
  --color-gray-700: #374151;
  --color-gray-800: #1F2937;
  --color-gray-900: #111827;

  /* Status Colors */
  --color-success: #10B981;     /* Verde */
  --color-warning: #F59E0B;     /* Laranja */
  --color-error: #EF4444;       /* Vermelho */
  --color-info: #3B82F6;        /* Azul */

  /* Modo Claro - Default */
  --bg-primary: #FFFFFF;
  --bg-secondary: #F9FAFB;
  --bg-tertiary: #F3F4F6;
  --bg-card: #FFFFFF;
  --bg-hover: #F3F4F6;
  --bg-active: #E5E7EB;

  --text-primary: #1F2937;
  --text-secondary: #6B7280;
  --text-muted: #9CA3AF;
  --text-light: #D1D5DB;

  --border-color: #E5E7EB;
  --border-subtle: #D1D5DB;
  --shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.08);
  --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.1);

  /* Spacing */
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;
  --spacing-2xl: 3rem;

  /* Border Radius */
  --radius-sm: 4px;
  --radius-md: 6px;
  --radius-lg: 8px;
  --radius-xl: 12px;
  --radius-full: 9999px;

  /* Transitions */
  --transition: all 0.2s ease;
  --transition-slow: all 0.3s ease;
}

/* Modo Escuro */
@media (prefers-color-scheme: dark) {
  :root {
    --bg-primary: #0F172A;
    --bg-secondary: #1F2937;
    --bg-tertiary: #374151;
    --bg-card: #1F2937;
    --bg-hover: #374151;
    --bg-active: #4B5563;

    --text-primary: #F3F4F6;
    --text-secondary: #D1D5DB;
    --text-muted: #9CA3AF;
    --text-light: #6B7280;

    --border-color: #374151;
    --border-subtle: #4B5563;
    --shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.5);
    --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.6);
  }
}

/* ============================================
   RESET & GLOBAL STYLES
   ============================================ */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
  background-color: var(--bg-primary);
  color: var(--text-primary);
  line-height: 1.6;
  transition: var(--transition-slow);
}

/* ============================================
   TYPOGRAPHY
   ============================================ */
h1, h2, h3, h4, h5, h6 {
  font-weight: 600;
  line-height: 1.2;
  margin-bottom: var(--spacing-md);
  color: var(--text-primary);
}

h1 { font-size: 2rem; }
h2 { font-size: 1.5rem; }
h3 { font-size: 1.25rem; }
h4 { font-size: 1.1rem; }
h5 { font-size: 1rem; }
h6 { font-size: 0.9rem; }

p {
  margin-bottom: var(--spacing-md);
  color: var(--text-secondary);
}

a {
  color: var(--color-primary);
  text-decoration: none;
  transition: var(--transition);
}

a:hover {
  color: var(--color-primary-light);
  text-decoration: underline;
}

/* ============================================
   BUTTONS
   ============================================ */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: var(--spacing-sm) var(--spacing-lg);
  border: none;
  border-radius: var(--radius-md);
  font-size: 1rem;
  font-weight: 500;
  cursor: pointer;
  transition: var(--transition);
  text-decoration: none;
  white-space: nowrap;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-primary {
  background-color: var(--color-primary);
  color: white;
}

.btn-primary:hover:not(:disabled) {
  background-color: var(--color-primary-dark);
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}

.btn-secondary {
  background-color: var(--bg-secondary);
  color: var(--text-primary);
  border: 1px solid var(--border-color);
}

.btn-secondary:hover:not(:disabled) {
  background-color: var(--bg-active);
  transform: translateY(-2px);
}

.btn-success {
  background-color: var(--color-success);
  color: white;
}

.btn-success:hover:not(:disabled) {
  background-color: #059669;
  transform: translateY(-2px);
}

.btn-warning {
  background-color: var(--color-warning);
  color: white;
}

.btn-warning:hover:not(:disabled) {
  background-color: #D97706;
  transform: translateY(-2px);
}

.btn-error {
  background-color: var(--color-error);
  color: white;
}

.btn-error:hover:not(:disabled) {
  background-color: #DC2626;
  transform: translateY(-2px);
}

.btn-outline {
  background-color: transparent;
  color: var(--text-primary);
  border: 2px solid var(--border-color);
}

.btn-outline:hover:not(:disabled) {
  background-color: var(--bg-secondary);
  border-color: var(--color-primary);
  color: var(--color-primary);
}

.btn-sm {
  padding: var(--spacing-xs) var(--spacing-md);
  font-size: 0.875rem;
}

.btn-lg {
  padding: var(--spacing-md) var(--spacing-xl);
  font-size: 1.125rem;
}

/* ============================================
   FORMS
   ============================================ */
.form-group {
  margin-bottom: var(--spacing-lg);
  display: flex;
  flex-direction: column;
}

.form-label {
  font-weight: 500;
  margin-bottom: var(--spacing-sm);
  color: var(--text-primary);
  font-size: 0.95rem;
}

.form-input,
.form-textarea,
.form-select {
  padding: var(--spacing-sm) var(--spacing-md);
  border: 1px solid var(--border-color);
  border-radius: var(--radius-md);
  background-color: var(--bg-card);
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: var(--transition);
}

.form-input:focus,
.form-textarea:focus,
.form-select:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(19, 47, 74, 0.1);
}

.form-input::placeholder,
.form-textarea::placeholder {
  color: var(--text-muted);
}

.form-textarea {
  resize: vertical;
  min-height: 120px;
  font-family: inherit;
}

.form-error {
  color: var(--color-error);
  font-size: 0.875rem;
  margin-top: var(--spacing-xs);
}

/* ============================================
   CARDS & CONTAINERS
   ============================================ */
.card {
  background-color: var(--bg-card);
  border: 1px solid var(--border-color);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow);
  overflow: hidden;
  transition: var(--transition);
}

.card:hover {
  box-shadow: var(--shadow-md);
}

.card-header {
  padding: var(--spacing-lg);
  background-color: var(--bg-secondary);
  border-bottom: 1px solid var(--border-color);
}

.card-body {
  padding: var(--spacing-lg);
}

.card-footer {
  padding: var(--spacing-lg);
  background-color: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  display: flex;
  gap: var(--spacing-md);
}

.panel {
  background-color: var(--bg-card);
  border: 1px solid var(--border-color);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
}

.section {
  margin-bottom: var(--spacing-2xl);
}

/* ============================================
   MODALS & DIALOGS
   ============================================ */
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 1000;
  align-items: center;
  justify-content: center;
  padding: var(--spacing-md);
}

.modal.active {
  display: flex;
}

.modal-content {
  background-color: var(--bg-card);
  border-radius: var(--radius-lg);
  width: 100%;
  max-width: 600px;
  max-height: 90vh;
  overflow-y: auto;
  box-shadow: var(--shadow-lg);
  animation: slideUp 0.3s ease;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--spacing-lg);
  border-bottom: 1px solid var(--border-color);
}

.modal-title {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--text-primary);
}

.modal-close {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  color: var(--text-muted);
  transition: var(--transition);
}

.modal-close:hover {
  color: var(--text-primary);
}

.modal-body {
  padding: var(--spacing-lg);
}

.modal-footer {
  padding: var(--spacing-lg);
  border-top: 1px solid var(--border-color);
  display: flex;
  gap: var(--spacing-md);
  justify-content: flex-end;
}

/* ============================================
   TABLES
   ============================================ */
.table {
  width: 100%;
  border-collapse: collapse;
  background-color: var(--bg-card);
}

.table-header {
  background-color: var(--bg-secondary);
  font-weight: 600;
  text-align: left;
}

.table-header th {
  padding: var(--spacing-md);
  color: var(--text-primary);
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  border-bottom: 1px solid var(--border-color);
}

.table tbody tr {
  border-bottom: 1px solid var(--border-color);
}

.table tbody td {
  padding: var(--spacing-md);
  color: var(--text-secondary);
}

.table tbody tr:hover {
  background-color: var(--bg-secondary);
}

.table-striped tbody tr:nth-child(odd) {
  background-color: var(--bg-secondary);
}

/* ============================================
   BADGES & STATUS
   ============================================ */
.badge {
  display: inline-block;
  padding: var(--spacing-xs) var(--spacing-md);
  border-radius: var(--radius-full);
  font-size: 0.8rem;
  font-weight: 500;
  white-space: nowrap;
}

.badge-success {
  background-color: rgba(16, 185, 129, 0.1);
  color: var(--color-success);
}

.badge-warning {
  background-color: rgba(245, 158, 11, 0.1);
  color: var(--color-warning);
}

.badge-error {
  background-color: rgba(239, 68, 68, 0.1);
  color: var(--color-error);
}

.badge-info {
  background-color: rgba(59, 130, 246, 0.1);
  color: var(--color-info);
}

.badge-primary {
  background-color: rgba(19, 47, 74, 0.1);
  color: var(--color-primary);
}

/* ============================================
   UTILITIES
   ============================================ */
.flex {
  display: flex;
}

.flex-center {
  display: flex;
  align-items: center;
  justify-content: center;
}

.flex-between {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.flex-col {
  flex-direction: column;
}

.flex-wrap {
  flex-wrap: wrap;
}

.gap-xs { gap: var(--spacing-xs); }
.gap-sm { gap: var(--spacing-sm); }
.gap-md { gap: var(--spacing-md); }
.gap-lg { gap: var(--spacing-lg); }
.gap-xl { gap: var(--spacing-xl); }

.grid {
  display: grid;
}

.grid-2 {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--spacing-lg);
}

.grid-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--spacing-lg);
}

.grid-4 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--spacing-lg);
}

/* Spacing */
.mb-xs { margin-bottom: var(--spacing-xs); }
.mb-sm { margin-bottom: var(--spacing-sm); }
.mb-md { margin-bottom: var(--spacing-md); }
.mb-lg { margin-bottom: var(--spacing-lg); }
.mb-xl { margin-bottom: var(--spacing-xl); }

.mt-xs { margin-top: var(--spacing-xs); }
.mt-sm { margin-top: var(--spacing-sm); }
.mt-md { margin-top: var(--spacing-md); }
.mt-lg { margin-top: var(--spacing-lg); }
.mt-xl { margin-top: var(--spacing-xl); }

.px-sm { padding-left: var(--spacing-sm); padding-right: var(--spacing-sm); }
.px-md { padding-left: var(--spacing-md); padding-right: var(--spacing-md); }
.px-lg { padding-left: var(--spacing-lg); padding-right: var(--spacing-lg); }

.py-sm { padding-top: var(--spacing-sm); padding-bottom: var(--spacing-sm); }
.py-md { padding-top: var(--spacing-md); padding-bottom: var(--spacing-md); }
.py-lg { padding-top: var(--spacing-lg); padding-bottom: var(--spacing-lg); }

/* Border Radius */
.rounded { border-radius: var(--radius-md); }
.rounded-lg { border-radius: var(--radius-lg); }
.rounded-xl { border-radius: var(--radius-xl); }
.rounded-full { border-radius: var(--radius-full); }

/* Shadow */
.shadow { box-shadow: var(--shadow); }
.shadow-md { box-shadow: var(--shadow-md); }
.shadow-lg { box-shadow: var(--shadow-lg); }

/* Text Utilities */
.text-primary { color: var(--text-primary); }
.text-secondary { color: var(--text-secondary); }
.text-muted { color: var(--text-muted); }
.text-error { color: var(--color-error); }
.text-success { color: var(--color-success); }
.text-warning { color: var(--color-warning); }

.text-sm { font-size: 0.875rem; }
.text-base { font-size: 1rem; }
.text-lg { font-size: 1.125rem; }
.text-xl { font-size: 1.25rem; }

.font-bold { font-weight: 700; }
.font-semibold { font-weight: 600; }
.font-normal { font-weight: 400; }

/* Opacity */
.opacity-50 { opacity: 0.5; }
.opacity-75 { opacity: 0.75; }
.opacity-100 { opacity: 1; }

/* Display */
.hidden { display: none; }
.block { display: block; }
.inline-block { display: inline-block; }
.inline { display: inline; }

/* ============================================
   ANIMATIONS
   ============================================ */
@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/* ============================================
   RESPONSIVE DESIGN
   ============================================ */
@media (max-width: 1200px) {
  .grid-4 {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 768px) {
  html {
    font-size: 14px;
  }

  h1 { font-size: 1.5rem; }
  h2 { font-size: 1.25rem; }
  h3 { font-size: 1.1rem; }

  .grid-2,
  .grid-3,
  .grid-4 {
    grid-template-columns: 1fr;
  }

  .modal-content {
    width: 100%;
    max-width: 100%;
    border-radius: 0;
    max-height: 100vh;
  }

  .card-body,
  .card-header,
  .card-footer {
    padding: var(--spacing-md);
  }
}

@media (max-width: 600px) {
  .btn {
    width: 100%;
  }

  .table {
    font-size: 0.9rem;
  }

  .table-header th,
  .table tbody td {
    padding: var(--spacing-sm);
  }
}

    </style>
</head>
<body>
    <div class="container">
        <?php if ($result['success']): ?>
            <div class="spinner"></div>
            <h1>✅ Autenticação Bem-Sucedida</h1>
            <p>Conectando ao Microsoft 365...</p>
            <p>Você será redirecionado em alguns segundos.</p>

            <script>
                // Redirect after 2 seconds
                setTimeout(() => {
                    window.location.href = '<?php echo htmlspecialchars($result['redirect']); ?>';
                }, 2000);
            </script>
        <?php else: ?>
            <div class="spinner"></div>
            <h1>❌ Erro na Autenticação</h1>

            <div class="error">
                <h2>Falha ao conectar com Microsoft 365</h2>
                <div class="error-message">
                    <?php echo htmlspecialchars($result['error']); ?>
                </div>
            </div>

            <p>Por favor, tente novamente.</p>

            <a href="/" class="back-link">← Voltar para Painel</a>
        <?php endif; ?>
    </div>
</body>
</html>
