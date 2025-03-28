#!/bin/bash

# 💀 RedOps God Installer for WSL Ubuntu
# Turns your WSL into a full-spectrum cyberwarfare machine

set -e

REDOPS_DIR="$HOME/redops"
TOOLS_DIR="$REDOPS_DIR/tools"
echo "[+] Creating directories..."
mkdir -p "$TOOLS_DIR"
cd "$REDOPS_DIR"

sudo apt update && sudo apt upgrade -y

# 📦 Core packages
sudo apt install -y git curl wget build-essential python3 python3-pip ruby zsh \
  nmap netcat neofetch htop unzip figlet lolcat tmux \
  hydra bettercap gobuster john x11-utils xdg-utils \
  aircrack-ng reaver hcxtools hcxdumptool wifite \
  adb scrcpy apktool openjdk-17-jdk upx-ucl \
  wireshark masscan

# 🔧 Metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfupdate | sudo bash

# 🧪 sqlmap
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git "$TOOLS_DIR/sqlmap"

# 🔍 theHarvester
git clone https://github.com/laramies/theHarvester.git "$TOOLS_DIR/theHarvester"
cd "$TOOLS_DIR/theHarvester" && sudo pip3 install -r requirements.txt

# 📡 Evil-Droid (Android payload injector)
cd "$TOOLS_DIR"
git clone https://github.com/M4sc3r4n0/Evil-Droid.git

# 🧬 Objection (iOS/Android runtime mobile pwn toolkit)
sudo pip3 install objection frida-tools

# 🛠 ApkTool setup
cd "$TOOLS_DIR"
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O apktool
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.3.jar -O apktool.jar
chmod +x apktool
sudo mv apktool apktool.jar /usr/local/bin/

# ⚡️ ZSH + Oh-My-Zsh
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 🎨 Aliases and environment
cat <<EOF >> ~/.zshrc
alias dash='~/redops/dashboard.sh'
export PATH="\$HOME/redops/tools/sqlmap:\$PATH"
export PATH="\$HOME/redops/tools/theHarvester:\$PATH"
EOF

# 📁 GUI support
pip3 install PySimpleGUI

# 🎯 Done
figlet "RedOps Ready" | lolcat
neofetch
echo -e "\n[✓] RedOps God Installer Complete. Type 'dash' to launch your dashboard."
