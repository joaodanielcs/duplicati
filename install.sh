apt update
apt upgrade -y
apt install sudo curl -y
#DUPLICATI_URL="https://github.com/duplicati/duplicati/releases/latest"
#DUPLICATI_PACKAGE=$(curl -s $DUPLICATI_URL | grep -oP '(?<=href=")[^"]+\.deb')
#wget -q https://github.com/duplicati/duplicati/releases/download/$DUPLICATI_PACKAGE -O duplicati_latest.deb
wget -q "https://updates.duplicati.com/stable/duplicati-2.1.0.4_stable_2025-01-31-linux-x64-gui.deb" -O duplicati_latest.deb
sudo dpkg -i duplicati_latest.deb
rm duplicati_latest.deb
echo "Duplicati instalado com sucesso!"
