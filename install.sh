apt update
apt upgrade -y
apt install sudo -y
DUPLICATI_URL="https://github.com/duplicati/duplicati/releases/latest"
DUPLICATI_PACKAGE=$(curl -s $DUPLICATI_URL | grep -oP '(?<=href=")[^"]+\.deb')
wget "https://github.com/duplicati/duplicati/releases/download/$DUPLICATI_PACKAGE" -O duplicati_latest.deb
sudo dpkg -i duplicati_latest.deb
rm duplicati_latest.deb
echo "Duplicati instalado com sucesso!"
