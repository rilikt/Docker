# 🧱 Inception – Docker-Based Web Infrastructure

**Inception** is a system administration project using **Docker** and **Docker Compose** to build a fully containerized web infrastructure. This was my first deep dive into Docker, and although it was challenging at first, I learned a lot about containerization, service isolation, and secure deployment practices.

---

## 🧠 What I Built

A mini-infrastructure running in Docker containers, including:

- **NGINX** container (with TLSv1.2/1.3) – entry point via HTTPS only
- **WordPress** container (with PHP-FPM) – no web server inside
- **MariaDB** container – stores WordPress database
- **Two Docker Volumes**:
  - WordPress website files
  - WordPress database
- **Custom Docker network** connecting the containers
- **Automatic container restarts** on failure
- **Secure environment variables** stored via `.env` and Docker secrets

---

## 🌐 Access

The WordPress site is accessible at:  
`https://<your-login>.42.fr`  
Example: `https://timschmi.42.fr`

> You must map this domain to your local IP for testing.

---

## 🛠️ Build & Run

```bash
make
```

This builds all Docker images and starts the stack using `docker-compose`.

To stop:
```bash
docker-compose down
```

---

## 🔐 Security Best Practices

- No passwords or credentials hardcoded in Dockerfiles
- Environment variables loaded securely
- Containers do not run infinite loops or hacky commands
- Only secure TLS protocols (v1.2/1.3) accepted

---
