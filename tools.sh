#!/bin/sh


BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

update() {

	echo -e "$YELLOW $BOLD [+] Would You want to update the tool(y/n)"
	read choice_update

	if [[ $choice_update == "y" ]]; then
		echo -e "$GREEN $BOLD [+] Updating......"
		wget "https://raw.githubusercontent.com/mugh33ra/Bug-Hunting-Tools/refs/heads/main/tools.sh" -o update_tool.sh &
		cat update_tool.sh > tools.sh && echo -e "$YELLOW $BOLD [+] Script is Updated Successfully"

	elif [[ $choice_update == "n" ]]; then
		echo "Script is Running"
	fi
}

update

tools=("go" "ffuf" "dirsearch" "subfinder" "httpx" "dalfox" "gospider" "uro" "nuclei" "secretfinder" "seclists" "linkfinder" "xsstrike" "403-bypass" "anew" "x8" "arjun" "sqlmap" "ghauri" "gau" "subprober")

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
		echo -e "${GREEN}${BOLD}[>] installing the $tool...⏳"

        case "$tool" in
                go)
				echo -e "${YELLOW}${BOLD}[>] installing go...⏳"
                apt install golang-go -y
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
				go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
				cp $HOME/go/bin/subfinder /usr/bin
                ;;
            httpx)
        		echo -e "${GREEN}${BOLD}[>] installing httpx...⏳"
				go install github.com/projectdiscovery/httpx/cmd/httpx@latest
				cp $HOME/go/bin/httpx /usr/bin
                ;;
            dalfox)
            	echo -e "${YELLOW}${BOLD}[>] installing dalfox...⏳"
				go install github.com/hahwul/dalfox/v2@latest
				cp $HOME/go/bin/dalfox /usr/bin
                ;;
            nuclei)
            	echo -e "${YELLOW}${BOLD}[>] installing nuclei...⏳"
				go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
				cp $HOME/go/bin/nuclei /usr/bin
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
				pip3 install -r SecretFinder/requirements.txt
				chmod +x /SecretFinder/SecretFinder.py
				cp SecretFinder/SecretFinder.py /usr/bin/secretfinder
                ;;
            seclists)
        		echo -e "${GREEN}${BOLD}[>] installing seclists...⏳"
				snap install seclists || apt install seclists
                ;;
            linkfinder)
				echo -e "${GREEN}${BOLD}[>] installing linkfinder...⏳"
                git clone https://github.com/GerbenJavado/LinkFinder.git
                pip3 install -r LinkFinder/requirements.txt
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
				git clone https://github.com/sh1yo/x8.git
				cd x8/
				apt install cargo -y
				rustup default stable
				cargo build --release
				cp ./target/release/x8 /usr/local/bin
				cd ..
				rm -rf x8/
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
				;;
			gau)
				echo -e "${GREEN}${BOLD}[>] installing gau...⏳"
				go install github.com/lc/gau/v2/cmd/gau@latest
				cp ~/go/bin/gau /usr/bin
				;;
			subprober)
				echo -e "${GREEN}${BOLD}[>] installing subprober...⏳"
				pip install git+https://github.com/RevoltSecurities/Subprober.git
				pip3 install httpx
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
sleep 1
echo -e "${YELLOW}${BOLD}[+] Done🎉"
