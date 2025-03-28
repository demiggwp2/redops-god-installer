#!/bin/bash

# RedOps Dashboard Enhancer
echo "🚀 Upgrading RedOps dashboard..."

# Install figlet, lolcat, htop, iftop
sudo apt update
sudo apt install -y figlet lolcat htop iftop

# Create or overwrite dashboard.sh
cat > ~/redops/dashboard.sh << 'EOF'
#!/bin/bash

CYAN='\033[0;36m'; RED='\033[0;31m'; GREEN='\033[0;32m'; NC='\033[0m'

# RedOps Boot Screen
clear
echo -e "\n${CYAN}Initializing RedOps HQ...${NC}"
sleep 1
echo "[▖] Loading system modules..." && sleep 0.8
echo "[▘] Activating payload forge..." && sleep 0.8
echo "[▝] Scanning memory for agents..." && sleep 0.8
echo "[▗] Disabling auditd logs..." && sleep 0.8
echo "[✓] RedOps is now live." && sleep 0.5
figlet "RedOps HQ" | lolcat
echo -e "${CYAN}Welcome to your World-Destroying Terminal.${NC}\n"

while true; do
echo -e "${GREEN}Choose your mission:${NC}"
echo "1) Run GUI Payload Builder"
echo "2) Metasploit Console"
echo "3) Web App Attacks (sqlmap, gobuster, nikto)"
echo "4) Wireless Attacks (aircrack, wifite)"
echo "5) Android/iOS Toolkit"
echo "6) OSINT & Recon (theHarvester, recon-ng)"
echo "7) Bruteforce & Login Cracking (Hydra, John)"
echo "8) Network Scanners (nmap, masscan)"
echo "9) System Info / Neofetch"
echo "10) Real-Time Monitors (htop, iftop, ss)"
echo "0) Exit"
read -p ">> " choice

case $choice in
  1) echo "Launching GUI Payload Builder..."; python3 ~/redops/payloadforge_gui.py ;;
  2) echo "Starting Metasploit..."; msfconsole ;;
  3) echo " - sqlmap: python3 ~/redops/tools/sqlmap/sqlmap.py"
     echo " - gobuster: gobuster dir -u http://target.com -w /usr/share/wordlists/dirb/common.txt"
     echo " - nikto: nikto -h http://target.com"
     ;;
  4) echo " - aircrack-ng, wifite, hcxtools"
     ;;
  5) echo " - Evil-Droid, apktool, frida, objection"
     ;;
  6) echo " - theHarvester"
     echo " - recon-ng"
     ;;
  7) echo " - hydra, john the ripper"
     ;;
  8) echo " - nmap, masscan, bettercap"
     ;;
  9) neofetch ;;
  10)
    echo "Choose monitor:"
    echo "1) htop"
    echo "2) iftop"
    echo "3) ss -tuln"
    read -p ">> " monitor
    case $monitor in
      1) htop ;;
      2) sudo iftop ;;
      3) ss -tuln ;;
      *) echo "Invalid choice";;
    esac
    ;;
  0) echo -e "${RED}Exiting RedOps HQ...${NC}"; break ;;
  *) echo -e "${RED}Invalid choice${NC}";;
esac
echo -e "\n"
done
EOF

chmod +x ~/redops/dashboard.sh

# Add alias if not already present
if ! grep -q "alias redops=" ~/.zshrc; then
  echo "alias redops='bash ~/redops/dashboard.sh'" >> ~/.zshrc
  source ~/.zshrc
fi

echo "✅ RedOps Dashboard is now upgraded."

#!/bin/bash

echo "🚀 Upgrading RedOps Dashboard..."

# Install core tools
sudo apt update
sudo apt install -y figlet lolcat htop iftop neofetch python3-pip

# Install PySimpleGUI (force system override to bypass Python lock)
python3 -m pip install --break-system-packages --upgrade --extra-index-url https://PySimpleGUI.net/install PySimpleGUI

# Create dashboard.sh
cat > ~/redops-god-installer/dashboard.sh << 'EOF'
#!/bin/bash

CYAN='\033[0;36m'; RED='\033[0;31m'; GREEN='\033[0;32m'; NC='\033[0m'
clear
echo -e "\n${CYAN}Initializing RedOps HQ...${NC}"
sleep 1
echo "[▖] Loading modules..." && sleep 0.6
echo "[▘] Activating payload forge..." && sleep 0.6
echo "[▝] Disabling auditd logs..." && sleep 0.6
figlet "RedOps HQ" | lolcat
echo -e "${CYAN}Welcome to your World-Destroying Terminal.${NC}\n"

while true; do
echo -e "${GREEN}Choose your mission:${NC}"
echo "1) Run GUI Payload Builder"
echo "2) Metasploit Console"
echo "3) Web App Attacks (sqlmap, gobuster, nikto)"
echo "4) Wireless Attacks (aircrack, wifite)"
echo "5) Android/iOS Toolkit"
echo "6) OSINT & Recon"
echo "7) Bruteforce & Cracking"
echo "8) Network Scanners"
echo "9) System Info / Neofetch"
echo "10) Real-Time Monitors (htop, iftop, ss)"
echo "0) Exit"
read -p ">> " choice

case $choice in
  1) python3 ~/redops-god-installer/payloadforge_gui.py ;;
  2) msfconsole ;;
  3) echo "Use sqlmap, gobuster, nikto in terminal manually." ;;
  4) echo "aircrack-ng, wifite, hcxtools..." ;;
  5) echo "Use Evil-Droid, apktool, objection, frida..." ;;
  6) echo "Recon tools: theHarvester, recon-ng" ;;
  7) echo "Crackers: hydra, john" ;;
  8) echo "Scanners: nmap, masscan" ;;
  9) neofetch ;;
  10)
    echo "1) htop"
    echo "2) iftop"
    echo "3) ss -tuln"
    read -p "Monitor: " mon
    [[ $mon == 1 ]] && htop
    [[ $mon == 2 ]] && sudo iftop
    [[ $mon == 3 ]] && ss -tuln
    ;;
  0) echo -e "${RED}Shutting down RedOps HQ...${NC}"; break ;;
  *) echo "Invalid choice" ;;
esac
done
EOF

chmod +x ~/redops-god-installer/dashboard.sh

# Create alias
if ! grep -q "alias redops=" ~/.zshrc && ! grep -q "alias redops=" ~/.bashrc; then
  echo "alias redops='bash ~/redops-god-installer/dashboard.sh'" >> ~/.bashrc
  echo "alias redops='bash ~/redops-god-installer/dashboard.sh'" >> ~/.zshrc
fi

echo "✅ RedOps Dashboard is now live. Launch it with: redops"
