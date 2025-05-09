#!/bin/sh


BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

tools=("ffuf" "subfinder" "httpx" "dalfox" "gospider" "uro" "secretfinder" "seclists" "linkfinder" "xsstrike" "403-bypass" "anew" "x8" "arjun" "sqlmap" "ghauri" "gau" "subprober" "katana")

apt update

if [[ ! -d "tools" ]]; then
	mkdir ~/tools && cd ~/tools/
fi

for tool in "${tools[@]}"; do

	if ! command -v $tool > /dev/null 2>&1; then
		echo -e "${RED}${BOLD}[>] "$tool" is not installed..."
		sleep 0.5
		echo -e "${GREEN}${BOLD}[>] installing the $tool...⏳"

        case "$tool" in
            ffuf)
				echo -e "${YELLOW}${BOLD}[>] installing ffuf...⏳"
                apt install ffuf
                ;;
            subfinder)
        		echo -e "${YELLOW}${BOLD}[>] installing subfinder...⏳"
				go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
				cp /root/go/bin/subfinder /usr/bin
                ;;
            httpx)
        		echo -e "${GREEN}${BOLD}[>] installing httpx...⏳"
				go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
				cp /root/go/bin/httpx /usr/bin/httpx-toolkit
                ;;
            dalfox)
            	echo -e "${YELLOW}${BOLD}[>] installing dalfox...⏳"
				go install github.com/hahwul/dalfox/v2@latest
				cp /root/go/bin/dalfox /usr/bin
                ;;
            gospider)
        		echo -e "${GREEN}${BOLD}[>] installing gospider...⏳"
				go install github.com/jaeles-project/gospider@latest
				cp /root/go/bin/gospider /usr/bin
                ;;
            uro)
            	echo -e "${GREEN}${BOLD}[>] installing uro...⏳"
				pip3 install uro
                ;;
            secretfinder)
        		echo -e "${YELLOW}${BOLD}[>] installing secretfinder...⏳"
				git clone https://github.com/m4ll0k/SecretFinder.git
				pip3 install -r /root/tools/SecretFinder/requirements.txt
				chmod +x /root/tools/SecretFinder/SecretFinder.py
				cp /root/tools/SecretFinder/SecretFinder.py /usr/bin/secretfinder
                ;;
            seclists)
        		echo -e "${GREEN}${BOLD}[>] installing seclists...⏳"
				snap install seclists
                ;;
            linkfinder)
				echo -e "${GREEN}${BOLD}[>] installing linkfinder...⏳"
                git clone https://github.com/GerbenJavado/LinkFinder.git
                cd LinkFinder && pip3 install -r requirements.txt
                chmod +x linkfinder.py
                cp /root/tools/LinkFinder/linkfinder.py /usr/bin/linkfinder
                cd ..
                ;;
            xsstrike)
                echo -e "${YELLOW}${BOLD}[>] installing XSStrike...⏳"
				pip3 install xsstrike
                ;;
            403-bypass)
				echo -e "${YELLOW}${BOLD}[>] installing 4-Zero-3 Bypass...⏳"
				git clone https://github.com/Dheerajmadhukar/4-ZERO-3.git
				cd 4-ZERO-3
				chmod +x *
				cp 403-bypass.sh /usr/bin/403-bypass
				cd ..
				;;
  			anew)
				echo -e "${YELLOW}${BOLD}[>] installing anew...⏳"
				go install -v github.com/tomnomnom/anew@latest
				cp /root/go/bin/anew /usr/bin
				;;
			x8)
				echo -e "${YELLOW}${BOLD}[>] installing x8...⏳"
				git clone https://github.com/sh1yo/x8.git
				cd x8/
				apt install cargo
				rustup default stable
				cargo build --release
				cp ./target/release/x8 /usr/local/bin
				cd ..
				;;			
			arjun)
				echo -e "${YELLOW}${BOLD}[>] installing arjun...⏳"
				pip3 install arjun
				;;				
			sqlmap)
				echo -e "${YELLOW}${BOLD}[>] installing sqlmap...⏳"
				pip3 install sqlmap
				;;			
			ghauri)
				echo -e "${YELLOW}${BOLD}[>] installing ghauri...⏳"
				git clone https://github.com/r0oth3x49/ghauri.git
				cd ghauri/
				pip3 install -r requirements.txt
				python3 setup.py install
				cd ..
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
    			subprober)
				echo -e "${GREEN}${BOLD}[>] installing katana...⏳"
				go install github.com/projectdiscovery/katana/cmd/katana@latest
				cp /root/go/bin/katana /usr/bin/katana
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
