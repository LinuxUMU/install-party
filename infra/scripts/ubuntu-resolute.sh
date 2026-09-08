#!/bin/sh

echo "export PATH=$PATH:/usr/local/bin" >> .bashrc

# eduroam

curl -o eduroam-linux-UdM-Perfil_general.py "https://cat.eduroam.org/user/API.php?action=downloadInstaller&profile=15765&lang=es&device=linux"

sudo python3 eduroam-linux-UdM-Perfil_general.py

# codium

curl -fsSL https://repo.vscodium.dev/vscodium.gpg \
  | gpg --dearmor \
  | sudo dd of=/usr/share/keyrings/vscodium.gpg

sudo curl --output-dir /etc/apt/sources.list.d -LO https://repo.vscodium.dev/vscodium.sources

sudo apt-get update && sudo apt-get install -y codium

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

# Oracle Database

curl -O http://install-party.local/software/sqldeveloper_26.2.0-186.2220_noarch.deb
sudo apt-get install -y ./sqldeveloper_26.2.0-186.2220_noarch.deb
rm sqldeveloper_26.2.0-186.2220_noarch.deb

