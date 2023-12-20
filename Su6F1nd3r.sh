#!/bin/bash


RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

logo(){
echo "${BLUE}

 _______            ______  _______  __    _        ______   ______   _______
(  ____ \|\     /| / ____ \(  ____ \/  \  ( (    /|(  __  \ / ___  \ (  ____ )
| (    \/| )   ( |( (    \/| (    \/\/) ) |  \  ( || (  \  )\/   \  \| (    )|
| (_____ | |   | || (____  | (__      | | |   \ | || |   ) |   ___) /| (____)|
(_____  )| |   | ||  ___ \ |  __)     | | | (\ \) || |   | |  (___ ( |     __)
      ) || |   | || (   ) )| (        | | | | \   || |   ) |      ) \| (\ (
/\____) || (___) |( (___) )| )      __) (_| )  \  || (__/  )/\___/  /| ) \ \__
\_______)(_______) \_____/ |/       \____/|/    )_)(______/ \______/ |/   \__/


${RESET}"
}
logo
echo ""
echo "${RED}   Make Sure You Have These Tools Installed !!      ${RESET}"
echo "${RED}   Subfindr || Amass || Sublist3r || Assetfinder    ${RESET}"
echo ""

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1

echo "${GREEN} [+] Creating a directory to store the output files ${RESET}"
output_dir="output_$domain"
mkdir -p "$output_dir"

# Subfinder
echo "${GREEN} [+] Running Subfinder..... ${RESET}"
subfinder -d $domain -o $output_dir/subfinder_output.txt
echo "${BLUE}[+] subfinder results saved in '$output_dir/subfinder_output.txt'.${RESET}"

# Sublist3r
echo "${GREEN} [+] Running Sublist3r..... ${RESET}"
sublist3r -d $domain -o $output_dir/sublist3r_output.txt
echo "${BLUE}[+] sublist3r results saved in '$output_dir/sublist3r_output.txt'.${RESET}"

# Amass
echo "${GREEN} [+] Running Amass..... ${RESET}"
amass enum -d $domain -o $output_dir/amass_output.txt
echo "${BLUE}[+] amass results saved in '$output_dir/amass_output.txt'.${RESET}"

# Assetfinder
echo "${GREEN} [+] Running Assetfinder..... ${RESET}"
assetfinder -subs-only $domain > $output_dir/assetfinder_output.txt
echo "${BLUE}[+] assetfinder results saved in '$output_dir/assetfinder_output.txt'.${RESET}"

echo "${Blue} Script completed. Output saved in $output_dir ${RESET}"
echo "${Blue} --------------------------------------------- ${RESET}"
