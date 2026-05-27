# 💪 SweatTrack

> Plataforma de monitoramento de hidratação e nutrição para atletas — Projeto de PI, São Camilo.

---

## 🗂️ Estrutura do Projeto

```
SweatTrack/
├── backend/              # API v1 (Python + FastAPI)
├── frontend/             # Frontend v1 (React + Vite)
├── database/             # Schema v1
└── sweattrack-v2/        # ✨ Versão atual
    ├── backend/          # API v2 (Node.js + Express)
    ├── frontend/         # Frontend v2 (React + Vite + Tailwind)
    └── database/         # Schema v2 (MySQL)
```

---

## ⚙️ Pré-requisitos

Antes de qualquer coisa, garante que tem isso instalado na sua máquina:

- 🟢 **Node.js** v18+ → [nodejs.org](https://nodejs.org)
- 🐬 **MySQL** 8+ → [mysql.com](https://dev.mysql.com/downloads/)
- 🐍 **Python** 3.10+ + **pip** *(só pra versão v1)*

---

## 🚀 Rodando a V2 (versão atual)

### 1️⃣ Banco de Dados

```bash
mysql -u root < sweattrack-v2/database/schema.sql
```

> Isso cria o banco `sweattrack` e todas as tabelas. Só precisa rodar **uma vez**!

---

### 2️⃣ Backend

```bash
cd sweattrack-v2/backend

# Cria o .env a partir do exemplo
cp .env.example .env
```

Abre o `.env` e preenche:

```env
PORT=3001
CLIENT_URL=http://localhost:5173

DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=sua_senha_aqui   # deixa vazio se não tiver senha
DB_NAME=sweattrack

JWT_SECRET=coloca_qualquer_string_longa_aqui
```

```bash
npm install
npm run dev
```

✅ API rodando em `http://localhost:3001`

---

### 3️⃣ Frontend

Em **outro terminal**:

```bash
cd sweattrack-v2/frontend
npm install
npm run dev
```

🌐 App rodando em `http://localhost:5173`

---

### 🔑 Login de Demo

| Campo | Valor |
|-------|-------|
| Email | `demo@sweattrack.com` |
| Senha | `demo1234` |

---

## 🐍 Rodando a V1 (legado)

### 1️⃣ Banco de Dados

```bash
mysql -u root < database/schema.sql
```

### 2️⃣ Backend (Python)

```bash
cd backend
cp .env.example .env   # edita com seus dados
pip install -r requirements.txt
python main.py
```

### 3️⃣ Frontend

```bash
cd frontend
npm install
npm run dev
```

---

## 📁 O que NÃO vai pro repositório

Esses arquivos ficam só na sua máquina (estão no `.gitignore`):

| Arquivo/Pasta | Motivo |
|---|---|
| `node_modules/` | Gerado com `npm install` |
| `.env` | Suas credenciais locais — nunca sobe! |
| `dist/` / `build/` | Gerado no build |
| `.DS_Store` | Lixo do macOS 🍎 |

> 💡 Os arquivos `.env.example` **sim** ficam no repo — servem de referência pra equipe saber o que preencher.

---

## 🛠️ Comandos úteis

```bash
# Verifica se a API está no ar
curl http://localhost:3001/health

# Reinstala tudo do zero (backend v2)
cd sweattrack-v2/backend && rm -rf node_modules && npm install

# Reinstala tudo do zero (frontend v2)
cd sweattrack-v2/frontend && rm -rf node_modules && npm install
```

---

## 👥 Equipe

Projeto Integrador — Faculdade São Camilo 🏥
