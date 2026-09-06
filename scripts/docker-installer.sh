```bash
#!/bin/bash

# Arrête le script dès qu'une commande échoue
set -e

echo "=========================================="
echo "       INSTALLATION DE DOCKER"
echo "=========================================="

echo ""
echo "[1/5] Suppression des anciens paquets Docker..."
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc | cut -f1)

echo ""
echo "[2/5] Installation des dépendances..."
sudo apt update
sudo apt install ca-certificates curl

echo ""
echo "[3/5] Ajout de la clé GPG officielle Docker..."
sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL \
    https://download.docker.com/linux/ubuntu/gpg \
    -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

echo ""
echo "[4/5] Ajout du dépôt officiel Docker..."
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

echo ""
echo "Mise à jour des dépôts..."
sudo apt update

echo ""
echo "[5/5] Installation de Docker Engine..."
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo ""
echo "=========================================="
echo "       VÉRIFICATION DE DOCKER"
echo "=========================================="

echo ""
echo "Vérification du service Docker..."
sudo systemctl status docker

echo ""
echo "Test de l'installation avec hello-world..."
sudo docker run hello-world

echo ""
echo "=========================================="
echo "       DOCKER INSTALLÉ AVEC SUCCÈS"
echo "=========================================="
```

