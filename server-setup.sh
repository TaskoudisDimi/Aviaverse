#!/usr/bin/env bash
# ─── Aviaverse Academy — Server Setup ─────────────────────────────────────────
# Run this ONCE on a fresh Ubuntu 22.04 / Debian 12 VPS as root.
# Usage: bash server-setup.sh

set -euo pipefail

echo "→ Updating packages..."
apt-get update -q && apt-get upgrade -y -q

echo "→ Installing Docker..."
curl -fsSL https://get.docker.com | sh

echo "→ Installing git and utilities..."
apt-get install -y -q git curl nano ufw

echo "→ Configuring firewall (HTTP + SSH)..."
ufw allow 22/tcp
ufw allow 80/tcp
ufw --force enable

echo "→ Adding current user to docker group..."
usermod -aG docker "${SUDO_USER:-$USER}"

echo ""
echo "✓ Server setup complete!"
echo ""
echo "Next steps:"
echo "  1. Log out and back in (for docker group to take effect)"
echo "  2. git clone <your_repo_url> /opt/aviaverse"
echo "  3. cd /opt/aviaverse"
echo "  4. cp .env.prod.example .env.prod && nano .env.prod"
echo "  5. bash deploy.sh"
echo ""
