#!/bin/sh

echo "export PATH=$PATH:/usr/local/bin" >> .bashrc

# eduroam

curl -o eduroam-linux-UdM-Perfil_general.py "https://cat.eduroam.org/user/API.php?action=downloadInstaller&profile=15765&lang=es&device=linux"

sudo python3 eduroam-linux-UdM-Perfil_general.py

# codium

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update && sudo dnf install code

# sagemath sagetex

sudo curl -o /opt/SageMath-10.9-x86_64.AppImage http://install-party.local/software/SageMath-10.9-x86_64.AppImage
sudo chmod +x /opt/SageMath-10.9-x86_64.AppImage
sudo ln -s /opt/SageMath-10.9-x86_64.AppImage /usr/local/bin

# Rstudio

curl -O http://install-party.local/software/rstudio-2026.08.2-200-x86_64.rpm
sudo dnf install rstudio-2026.08.2-200-x86_64.rpm
rm rstudio-2026.08.2-200-x86_64.rpm

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

curl -O http://install-party.local/software/sqldeveloper-26.2.0-186.2220.noarch.rpm
sudo dnf install sqldeveloper-26.2.0-186.2220.noarch.rpm
rm sqldeveloper-26.2.0-186.2220.noarch.rpm

