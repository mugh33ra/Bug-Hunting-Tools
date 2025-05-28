#!/bin/sh


BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

update() {
    echo -e "${YELLOW}${BOLD}[+] Do you want to update the tool? (y/n): "
    read choice_update

    if [[ "$choice_update" == "y" ]]; then
        echo -e "${GREEN}${BOLD}[+] Downloading the latest version..."

        TMP_FILE=$(mktemp)
        curl -s -L "https://raw.githubusercontent.com/mugh33ra/Bug-Hunting-Tools/main/tools.sh" -o "$TMP_FILE"

        if [ $? -ne 0 ]; then
            echo -e "${RED}${BOLD}[!] Download failed."
            return
        fi

        # 🔥 Get absolute path of this script file
        SCRIPT_PATH="$(realpath "$0" 2>/dev/null || readlink -f "$0")"

        echo -e "${GREEN}${BOLD}[+] Updating the script at $SCRIPT_PATH..."
        cp "$TMP_FILE" "$SCRIPT_PATH"
        chmod +x "$SCRIPT_PATH"
        rm -f "$TMP_FILE"

        echo -e "${YELLOW}${BOLD}[+] Script updated successfully. Restarting now..."
        sleep 1

        exec "$SCRIPT_PATH"  # 💥 Re-run using full path
    elif [[ "$choice_update" == "n" ]]; then
        echo -e "${YELLOW}${BOLD}[+] Starting without updating."
    else
        echo -e "${RED}${BOLD}[!] Invalid input. Please enter 'y' or 'n'."
    fi
}
update

tools=("go" "pipx" "ffuf" "dirsearch" "subfinder" "httpx-toolkit" "dalfox" "gospider" "uro" "nuclei" "secretfinder" "seclists" "linkfinder" "xsstrike" "403-bypass" "anew" "x8" "arjun" "sqlmap" "ghauri" "gau" "subprober" "freq")

#clear the terminal
clear

apt update

cd "/opt"
if [[ ! -d "tools" ]]; then
	mkdir tools && cd tools/
fi

for tool in "${tools[@]}"; do

	if ! command -v $tool > /dev/null 2>&1; then
		echo -e "${RED}${BOLD}[>] "$tool" is not installed..."
		sleep 0.5

        case "$tool" in
                go)
				echo -e "${YELLOW}${BOLD}[>] installing go...⏳"
                apt install golang-go -y
                ;;
                pipx)
				echo -e "${YELLOW}${BOLD}[>] installing pipx...⏳"
                apt install pipx -y
                ;;
            ffuf)
				echo -e "${YELLOW}${BOLD}[>] installing ffuf...⏳"
                apt install ffuf -y
                ;;
            dirsearch)
				echo -e "${YELLOW}${BOLD}[>] installing dirsearch...⏳"
                pip3 install dirsearch --break-system-packages
                ;;
            subfinder)
        		echo -e "${YELLOW}${BOLD}[>] installing subfinder...⏳"
				go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
				cp $HOME/go/bin/subfinder /usr/bin || \
				echo -e "${RED}${BOLD}[>] Something Went Wrong installing manually...${BOLD}"
				wget "https://github.com/projectdiscovery/subfinder/releases/download/v2.7.1/subfinder_2.7.1_linux_amd64.zip" -O subfinder.zip \
				&& unzip subfinder.zip && chmod +x * && mv subfinder /usr/bin && rm subfinder.zip
                ;;
            httpx-toolkit)
        		echo -e "${GREEN}${BOLD}[>] installing httpx...⏳"
				wget "https://github.com/projectdiscovery/httpx/releases/download/v1.7.0/httpx_1.7.0_linux_amd64.zip" -O httpx.zip
				unzip httpx.zip && chmod +x * && mv httpx /usr/local/bin/httpx-toolkit && rm httpx.zip
                ;;
            dalfox)
            	echo -e "${YELLOW}${BOLD}[>] installing dalfox...⏳"
            	wget "https://github.com/hahwul/dalfox/releases/download/v2.11.0/dalfox_2.11.0_linux_amd64.tar.gz" -O dalfox.tar.gz && tar -xzf dalfox.tar.gz && chmod +x * && mv dalfox /usr/local/bin && rm dalfox.tar.gz
                ;;
            nuclei)
            	echo -e "${YELLOW}${BOLD}[>] installing nuclei...⏳"
            	wget "https://github.com/projectdiscovery/nuclei/releases/download/v3.4.4/nuclei_3.4.4_linux_amd64.zip" -O "nuclei.zip"
            	unzip nuclei.zip && rm *.md && chmod +x * && mv nuclei /usr/bin && rm nuclei.zip
                ;;
            gospider)
        		echo -e "${GREEN}${BOLD}[>] installing gospider...⏳"
				go install github.com/jaeles-project/gospider@latest
				cp $HOME/go/bin/gospider /usr/bin
                ;;
            uro)
            	echo -e "${GREEN}${BOLD}[>] installing uro...⏳"
				pip3 install uro  --break-system-packages
                ;;
            secretfinder)
        		echo -e "${YELLOW}${BOLD}[>] installing secretfinder...⏳"
				git clone https://github.com/m4ll0k/SecretFinder.git
				pip3 install -r SecretFinder/requirements.txt --break-system-packages
				chmod +x SecretFinder/SecretFinder.py
				cp SecretFinder/SecretFinder.py /usr/bin/secretfinder
                ;;
            seclists)
				if [[ ! -d '/usr/share/seclists' ]]; then
					echo -e "${GREEN}${BOLD}[>] installing seclists...⏳"
					apt-get install seclists || wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip && unzip SecList.zip && rm -f SecList.zip && mv SecLists-master /usr/share/seclists
				else
					echo -e "${GREEN}${BOLD}[>] Seclists is Already Available in /usr/share/seclists"
				fi
                ;;
            linkfinder)
				echo -e "${GREEN}${BOLD}[>] installing linkfinder...⏳"
                git clone https://github.com/GerbenJavado/LinkFinder.git
                pip3 install -r LinkFinder/requirements.txt --break-system-packages
                chmod +x LinkFinder/linkfinder.py
                cp LinkFinder/linkfinder.py /usr/bin/linkfinder
                ;;
            xsstrike)
                echo -e "${YELLOW}${BOLD}[>] installing XSStrike...⏳"
				pip3 install xsstrike  --break-system-packages
                ;;
            403-bypass)
				echo -e "${YELLOW}${BOLD}[>] installing 4-Zero-3 Bypass...⏳"
				git clone https://github.com/Dheerajmadhukar/4-ZERO-3.git
				chmod +x 4-ZERO-3/*
				cp 4-ZERO-3/403-bypass.sh /usr/bin/403-bypass
				;;
  			anew)
				echo -e "${YELLOW}${BOLD}[>] installing anew...⏳"
				go install github.com/tomnomnom/anew@latest
				cp $HOME/go/bin/anew /usr/bin
				;;
			x8)
				echo -e "${YELLOW}${BOLD}[>] installing x8...⏳"
				wget "https://github.com/Sh1Yo/x8/releases/download/v4.3.0/x86_64-linux-x8.gz" -O x8.gz && gunzip x8.gz && chmod +x * 
				mv x8 /usr/bin && rm x8.gz
				;;			
			arjun)
				echo -e "${YELLOW}${BOLD}[>] installing arjun...⏳"
				pip3 install arjun  --break-system-packages
				;;				
			sqlmap)
				echo -e "${YELLOW}${BOLD}[>] installing sqlmap...⏳"
				pip3 install sqlmap  --break-system-packages
				;;			
			ghauri)
				echo -e "${YELLOW}${BOLD}[>] installing ghauri...⏳"
				git clone https://github.com/r0oth3x49/ghauri.git
				pip3 install -r ghauri/requirements.txt
				python3 ghauri/setup.py install
				rm -rf ghauri/
				;;
			gau)
				echo -e "${GREEN}${BOLD}[>] installing gau...⏳"
				go install github.com/lc/gau/v2/cmd/gau@latest
				cp ~/go/bin/gau /usr/bin
				;;
			subprober)
				echo -e "${GREEN}${BOLD}[>] installing subprober...⏳"
				pipx install git+https://github.com/RevoltSecurities/Subprober.git
				;;
			freq)
				echo -e "${GREEN}${BOLD}[>] installing freq...⏳"
				go install github.com/takshal/freq@latest && cp $HOME/go/bin/freq /usr/bin || echo "[!] Install freq manually"
				;;

            *)
                echo -e "[!] No install method defined for $tool"
                ;;
        esac

    else
        echo -e "${GREEN}${BOLD}[+] $tool is already installed."
    fi
done



echo -e "${GREEN}${BOLD}[+] Configuring tools...."
echo -e "${GREEN}${BOLD}[+] Ensuring Pipx path"
pipx ensurepath
sleep 1
echo -e "${YELLOW}${BOLD}[+] Done🎉"

