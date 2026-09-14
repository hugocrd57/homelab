```bash
#!/bin/bash

# Arrête le script dès qu'une commande échoue
set -e

echo "=========================================="
echo "       INSTALLATION DE TAILSCALE"
echo "=========================================="

echo ""
echo "[1/3] Mise à jour des dépôts..."
sudo apt update

echo ""
echo "[2/3] Installation de Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo ""
echo "[3/3] Vérification de l'installation..."

echo ""
echo "Vérification du service Tailscale..."
sudo systemctl status tailscaled --no-pager

echo ""
echo "Version de Tailscale..."
tailscale version

echo ""
echo "=========================================="
echo "       TAILSCALE INSTALLÉ AVEC SUCCÈS"
echo "=========================================="

echo ""
echo "Pour connecter ce serveur à votre réseau Tailscale,"
echo "exécutez la commande suivante :"
echo ""
echo "    sudo tailscale up"
echo ""
echo "Une URL d'authentification sera affichée."
echo "Ouvrez cette URL dans votre navigateur pour connecter"
echo "le serveur à votre compte Tailscale."
echo ""
```

