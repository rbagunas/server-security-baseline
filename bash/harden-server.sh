#!/bin/bash

# Exit on any error
set -e

echo "🔐 Starting server hardening..."

# Update packages
apt update && apt upgrade -y

# Install necessary packages
apt install -y ufw fail2ban unattended-upgrades

# Setup UFW firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw --force enable

# Disable root SSH login
sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

# Configure Fail2Ban
cat <<EOL > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = systemd
maxretry = 3
EOL

systemctl restart fail2ban

# Enable auto-updates
dpkg-reconfigure --priority=low unattended-upgrades

echo "✅ Server hardening complete!"
