#!/bin/sh

echo "export PATH=$PATH:/usr/local/bin" >> .bashrc

# eduroam

curl -o eduroam-linux-UdM-Perfil_general.py "https://cat.eduroam.org/user/API.php?action=downloadInstaller&profile=15765&lang=es&device=linux"

sudo python3 eduroam-linux-UdM-Perfil_general.py

# vsc

echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
curl -O http://install-party.local/software/code_1.136.1-1788413865_amd64.deb
sudo apt-get install -y ./code_1.136.1-1788413865_amd64.deb
rm code_1.136.1-1788413865_amd64.deb

# sagemath sagetex

sudo curl -o /opt/SageMath-10.9-x86_64.AppImage http://install-party.local/software/SageMath-10.9-x86_64.AppImage
sudo chmod +x /opt/SageMath-10.9-x86_64.AppImage
sudo ln -s /opt/SageMath-10.9-x86_64.AppImage /usr/local/bin

# Rstudio

curl -O http://install-party.local/software/rstudio-2026.08.2-200-amd64.deb
sudo apt-get install -y ./rstudio-2026.08.2-200-amd64.deb
rm rstudio-2026.08.2-200-amd64.deb

# MARS

sudo curl -o /opt/Mars4_5.jar http://install-party.local/software/Mars4_5.jar

cat | sudo tee /usr/local/bin/mars << "EOF"
#!/bin/bash
java -jar /opt/Mars4_5.jar
EOF

cat > ~/Desktop/mars.desktop << "EOF"
[Desktop Entry]
Type=Application
Version=1.0
Name=MARS
Comment=MARS (original) MIPS Assembler and Runtime Simulator
Exec=java -jar /opt/Mars4_5.jar
Terminal=false
EOF

# Oracle SQL Developer

curl -O http://install-party.local/software/sqldeveloper_26.2.0-186.2220_noarch.deb
sudo apt-get install -y ./sqldeveloper_26.2.0-186.2220_noarch.deb
rm sqldeveloper_26.2.0-186.2220_noarch.deb

# Oracle VirtuaBox

curl -O "https://install-party.local/software/virtualbox-7.2_7.2.16-174877~Debian~trixie_amd64.deb"
sudo apt-get install -y "./virtualbox-7.2_7.2.16-174877~Debian~trixie_amd64.deb"
rm "virtualbox-7.2_7.2.16-174877~Debian~trixie_amd64.deb"

