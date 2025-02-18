read -sp "Insira uma senha de acesso ao Duplicati: " pass
apt update
apt upgrade -y
apt install sudo curl -y
wget -q "https://updates.duplicati.com/stable/duplicati-2.1.0.4_stable_2025-01-31-linux-x64-gui.deb" -O duplicati_latest.deb
sudo dpkg -i duplicati_latest.deb ; apt-get -f install -y
systemctl enable duplicati.service
systemctl daemon-reload
echo 'DAEMON_OPTS="--webservice-password='$pass' --webservice-interface=any --webservice-port=8200 --portable-mode"' | sudo tee /etc/default/duplicati
systemctl start duplicati.service
echo 'DAEMON_OPTS="--webservice-interface=any --webservice-port=8200 --portable-mode"' | sudo tee /etc/default/duplicati
rm duplicati_latest.deb
init 6
