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
