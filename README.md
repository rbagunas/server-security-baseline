# 🔐 Server Security Baseline

This project provides a basic server hardening setup using **Bash scripts** and optional **Ansible**. It's designed to secure a fresh Ubuntu server with essential best practices.

## 🎯 What It Does

- Sets up **UFW** (Uncomplicated Firewall) with default rules
- Disables **root SSH login**
- Installs and configures **Fail2Ban**
- Enables **automatic security updates**

## 📂 Project Structure

```
server-security-baseline/
├── bash/
│   └── harden-server.sh
└── ansible/
    └── playbook.yml
```

## 🚀 Usage

### 🔧 Option 1: Bash Script (Quick Setup)

```bash
chmod +x bash/harden-server.sh
sudo ./bash/harden-server.sh
```

### 🧰 Option 2: Ansible Playbook

```bash
ansible-playbook ansible/playbook.yml -i "your.server.ip," --user=username --ask-pass --ask-become-pass
```

---

> Ideal for VPS security hardening, especially after initial provisioning.
