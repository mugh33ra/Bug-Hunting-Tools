<h1 align="center" style="font-weight:bold; font-size: 32px;">
  🐞 Bug Hunting Toolkit — by <a href="https://github.com/mugh33ra">@mugh33ra</a>
</h1>

<p align="center">
  <img src="https://img.shields.io/github/stars/mugh33ra/Bug-Hunting-Tools?style=flat-square" />
  <img src="https://img.shields.io/github/forks/mugh33ra/Bug-Hunting-Tools?style=flat-square" />
  <img src="https://img.shields.io/github/license/mugh33ra/Bug-Hunting-Tools?style=flat-square" />
</p>

---

> 🎯 A fully automated installation and update script for essential tools used in **bug bounty hunting**, **web application recon**, and **vulnerability assessment**. This script ensures you're always one command away from a battle-ready pentesting setup.

---

## 🌟 Features

- ✅ Automated installation of 25+ top bug bounty tools
- 🔄 Self-updating script mechanism
- 🔍 Smart detection of installed tools
- 📦 Uses apt, go, pipx, wget, git, and manual fallbacks
- 🧪 Supports OSINT, fuzzing, XSS/SQLi scanners, parameter miners & more

---

## 🧠 Tool Overview

Each tool is automatically installed only if missing, using the best available method.

| Tool            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| **Arjun**       | 🚪 Best tool for finding hidden or undocumented HTTP parameters             |
| **anew**        | 📄 Appends unique lines to a file (handy for de-duplication in recon)       |
| **403-bypass**  | 🚫 Collection of techniques to bypass 403 Forbidden responses                |
| **Dalfox**      | 🧠 Advanced XSS scanning and parameter analysis toolkit                      |
| **Dirsearch**   | 📂 Brute-force tool for directories and file discovery                       |
| **FFUF**        | ⚡ Fast web fuzzer written in Go                                             |
| **GAU**         | 📜 Fetch known URLs from AlienVault’s OTX, Wayback, Common Crawl            |
| **GetJS**       | 🔗 Fetch and extract JavaScript file URLs from a domain                     |
| **Ghauri**      | 🧬 Automated SQLi detection & exploitation (alternative to sqlmap)          |
| **GoSpider**    | 🕸️ Fast web spider to find endpoints and parameters                         |
| **HTTPX Toolkit** | 🌐 Probes for HTTP info, status, title, and technologies                  |
| **LinkFinder**  | 🔍 Extract JS links and endpoints from JavaScript code                      |
| **Nuclei**      | 💥 Powerful vulnerability scanner based on customizable templates           |
| **Pipx**        | 🧪 Tool to install and run Python apps in isolated environments             |
| **SecretFinder**| 🔐 Detect API keys/secrets in JS files using RegEx-based analysis           |
| **Seclists**    | 📚 Large collection of wordlists for pentesters and security researchers    |
| **SQLMap**      | 💉 Industry-standard SQL injection automation tool                          |
| **Subfinder**   | 🌐 Passive subdomain discovery tool from ProjectDiscovery                   |
| **Subprober**   | 🛰️ Custom wordlist-based subdomain probing tool                             |
| **Tree**        | 🌲 Outputs directory structure in a tree-like format                        |
| **Uro**         | 🧹 URL sanitizer and de-duplication tool                                    |
| **X8**          | 🕵️ Fast parameter discovery tool using wordlists                           |
| **XSStrike**    | 🧪 Advanced XSS detection suite                                              |
| **Freq**        | 📊 URL frequency-based parameter mining tool                                |

---

## 🔧 Installation

```bash
git clone https://github.com/mugh33ra/Bug-Hunting-Tools.git
cd Bug-Hunting-Tools
chmod +x tools.sh
./tools.sh
