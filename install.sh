read -sp "Insira uma senha de acesso ao Duplicati: " pass
apt update
apt upgrade -y
apt install sudo -y
wget -q "https://updates.duplicati.com/stable/duplicati-2.1.0.4_stable_2025-01-31-linux-x64-gui.deb" -O duplicati.deb
sudo apt install -f ./duplicati.deb -y
systemctl enable duplicati.service
systemctl daemon-reload
echo 'DAEMON_OPTS="--webservice-password='$pass' --webservice-interface=any --webservice-port=8200 --portable-mode"' | sudo tee /etc/default/duplicati
systemctl start duplicati.service
read -sp "Acesse o Duplicati Web e depois volte aqui e pressione enter: " 
echo 'DAEMON_OPTS="--webservice-interface=any --webservice-port=8200 --portable-mode"' | sudo tee /etc/default/duplicati
rm duplicati.deb
mkdir -p /mnt/global/, /mnt/nas/, /mnt/profiles/
init 6
