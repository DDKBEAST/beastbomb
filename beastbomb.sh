#!/usr/bin/env bash
#set -x
#for darkhack as a collabrator
#date:- 14/09/2021
args="$@"
comand="beastbomb.sh ${args}"
CWD=$(pwd)
exit_on_signal_SIGINT () {
    echo -e "${S1} [✗] Received INTR call - Exiting...${R0}" # credit to cyberknight777
    rm -rf headapis* tailapis* anonapi* > /dev/null 2>&1
    exit 0
}
trap exit_on_signal_SIGINT SIGINT
#<<<----------color codes substitution by variables--------->>>
S0="\033[1;30m" B0="\033[40m" SI0="\033[30m"
S1="\033[1;31m" B1="\033[41m" SI1="\033[30m"
S2="\033[1;32m" B2="\033[42m" SI2="\033[30m"
S3="\033[1;33m" B3="\033[43m" SI3="\033[30m"
S4="\033[1;34m" B4="\033[44m" SI4="\033[30m"
S5="\033[1;35m" B5="\033[45m" SI5="\033[30m"
S6="\033[1;36m" B6="\033[46m" SI6="\033[30m"
S7="\033[1;37m" B7="\033[47m" SI7="\033[30m"
R0="\033[0;00m" ST="\033[5;32m"
#<<<---------Internet check--------->>>
INTERNET() {
  python assets/load.py -H checking-internet -P BHUTUU
  ping -c 1 google.com > /dev/null 2>&1
  if [[ $? != '0' ]]; then
    printf "\n${SI2}[${SI1}!${SI2}]${SI1}Check your internet connection! You are offline!!${R0}\n"
    printf "\n${SI3}Exiting......${R0}\n\n"
    exit 1
  else
    printf "\n${S4}Status:- ${S1}[${S2}✓${S1}]${SI2}online.${R0}\n\n"
  fi
}

#<<<----------Requirements---------->>>
REQUIREMENTS() {
OS=$(uname -o)
case ${OS} in
  Android)
    pkg=(git curl wget espeak pv figlet)
    for i in "${pkg[@]}"; do
      sleep 0.3
      if ! hash "${i}" 2>/dev/null; then
        printf "${S2}[${S1}!${S2}]${S1}${i} not found in your system!!${R0}\n"
        printf "${S5}Installing${i}.......${R0}\n"
        pkg install ${i} -y
      fi
    done
    ;;
  GNU/Linux)
    pkg=(git curl wget espeak pv figlet)
    os="$(source \etc\os-release echo "${ID}")"
    case "${os}" in
      arch|archarm|arcolinux|artix|manjaro|garuda|predator|endeavouros)
        pm="sudo pacman -Syu --noconfirm"
        ;;
      debian|ubuntu|linuxmint|kali|parrot|raspbian)
        pm="sudo apt install -y"
        ;;
      fedora)
        pm="sudo dnf install -y"
        ;;
      freebsd)
        pm="sudo pkg install -y"
        ;;
      gentoo)
        pm="sudo emerge --ask"
        ;;
      void)
        pm="sudo xbps-install"
        ;;
      puppy_fossapup64)
        pm="sudo pkg g"
        ;;
      nixos)
        pm="nix-env -iA nixos."
        ;;
      solus)
        pm="eopkg install -y"
        ;;
      *)
        echo -e $RED "Sorry... this is sadly not a supported distro!"
        ;;
    esac
    for i in "${pkg[@]}"; do
      sleep 0.3
      if ! hash "${i}" 2>/dev/null;then
        echo -e "${R1}Installing ${i}"
        ${pm} "${i}"
      fi
    done
    ;;
esac
}

#<<<----------Program---------->>>
PROGRAM() {

#<<-----check server----->>>
rm -rf .server.txt
server=$(wget -L https://raw.githubusercontent.com/BHUTUU/test/main/.server.txt > /dev/null 2>&1)
serverup="on"
server=$(cat .server.txt | grep on)
if [[ $server = $serverup ]]; then
  echo; clear
else
  clear; echo; figlet ERROR 404
  echo -e "      ${S2}[${S3}~${S2}]${R0} Sorry for the inconvenience :(${R0}" | pv -qL 30
  echo; echo -e "      ${S2}[${S3}~${S2}]${S6} The Server is under maintenance !!" | pv -qL 20
  echo; echo -e "      ${S2}[${S3}~${S2}]${R0} Contact the developer !" | pv -qL 30
  rm -rf headapis* tailapis* anonapi* > /dev/null 2>&1
  exit 1
fi
banner() {
echo -e "${S2}"
figlet BEAST BOMB
echo
sleep 1
echo -e "  ${S7} Author:${S1} DDK- BEAST(DEVARAG)"
echo

}
bombrecord() {
  clear; echo; figlet Bomb Record; echo; echo
  sleep 1
  echo -e "     ${S2}[${S6}~${S2}]${S3} This is a record of numbers which had been bombed !${R0}" 
  sleep 1
  printf "${S2}\n"
  cat .bombrecord.txt
  sleep 1
  echo
  printf "${S1}!!wait for 7 seconds it will automatically go to the main menu!!${R0}\n" | pv -qL 100  
  sleep 7
  menux 
}
cd $CWD/assets
cp headapis $CWD
cp tailapis $CWD
cp anonapi $CWD
cd ..
#<<<-----------SELF PROTECTION------------>>>
#DDKBEAST(DEVARAG)
#normal format
no1=97e9982b862f2dfe4e340469bf1e7e37
#91format
no2=6f87a7141322a85982ed4eeba200f3e5
#+91format
no3=3a5e029df21e7d45544201de1d6f2e32 

#DDKBEAST(DEVARAG)2
#normal format
mo1=a651fb32e2200d1d0dcc10200c3cbf39
#91format
mo2=cf1d1fc967ecbf9881269547c35d2772
#+91format
mo3=0bfedc75b5fefccd20ed488ccce08a48 

about() {
clear
echo -e '''
         \e[1;91m      ╔═══════════╗
         \e[1;91m    ╔═╝\e[1;97m███████████\e[1;91m╚═╗
         \e[1;91m   ╔╝\e[1;97m███████████████\e[1;91m╚╗
         \e[1;91m   ║\e[1;97m█████\e[1;92mBeastBomb\e[1;97m████\e[1;91m║
         \e[1;91m   ║\e[1;97m█████████████████\e[1;91m║\e[1;91m
         \e[1;91m   ║\e[1;97m█████████████████\e[1;91m║\e[1;91m
         \e[1;91m   ║\e[1;97m█\e[1;91m╔\e[1;97m█████████████\e[1;91m╗\e[1;97m█\e[1;91m║\e[1;91m
         \e[1;91m   ╚╦╝\e[1;97m███\e[1;90m▒▒\e[1;97m███\e[1;90m▒▒\e[1;97m███\e[1;91m╚╦╝\e[1;91m
         \e[1;91m   ╔╝\e[1;97m██\e[1;90m▒▒▒▒\e[1;97m███\e[1;90m▒▒▒▒\e[1;97m██\e[1;91m╚╗\e[1;91m
         \e[1;91m   ║\e[1;97m██\e[1;90m▒▒▒▒▒\e[1;97m███\e[1;90m▒▒▒▒▒\e[1;97m██\e[1;91m|\e[1;91m
         \e[1;91m   ║\e[1;97m██\e[1;90m▒▒▒▒\e[1;97m█████\e[1;90m▒▒▒▒\e[1;97m██\e[1;91m║\e[1;94m
         \e[1;91m   ╚╗\e[1;97m███████████████\e[1;91m╔╝\e[1;94m
         \e[1;91m  ╔═╬══╦╝\e[1;97m██\e[1;90m▒\e[1;97m█\e[1;90m▒\e[1;97m██\e[1;91m╚╦══╝\e[1;90m .▒..
         \e[1;91m  ║\e[1;97m█\e[1;91m║══║\e[1;97m█████████\e[1;91m║\e[1;90m ...▒.       \e[1;93m
         \e[1;91m  ║\e[1;97m█\e[1;91m║══║\e[1;97m█\e[1;91m║\e[1;97m██\e[1;91m║\e[1;97m██\e[1;91m║\e[1;97m█\e[1;91m║\e[1;90m　.▒..
         \e[1;91m  ║\e[1;97m█\e[1;91m║══╚═╩══╩╦═╩═╩═╦╗\e[1;90m▒.
         \e[1;91m ╔╝\e[1;97m█\e[1;91m╚══╦═╦══╦╩═╦═╦═╩╝  \e[38;5;48m
         \e[1;91m╔╝\e[1;97m█████\e[1;91m║\e[1;97m█\e[1;91m║\e[1;97m██\e[1;91m║\e[1;97m██\e[1;91m║\e[1;97m█\e[1;91m║
         \e[1;91m║\e[1;97m██████\e[1;91m║\e[1;97m█████████\e[1;91m║
''' | pv -qL 300
sleep 1

echo -e "                Tool made by  ${S2} DDK-BEAST(DEVARAG)" | pv -qL 150

echo "                        DDK BEAST!" | pv -qL 150
echo
echo -e "     ${S2}  Ethical Hacker${S7} |${S2} CyberSec Student${S7} |${S2} Programmer" | pv -qL 10
echo
echo
echo -e "       ${S6}          My social handles are below !!" | pv -qL 10
echo
printf "${S2}          Github ${S1}     :    ${S6}https://github.com/DDKBEAST/${R0}\n" | pv -qL 50
echo
printf "${S2}         Instagram ${S1}   :   ${S6}https://instagram.com/hydrabeast56?utm_medium${R0}\n" | pv -qL 50    
echo
echo -e "${S1}                        ENJOY:)${R0}" | pv -qL 10 
sleep 7
menux
}
eexec() {
echo "Under construction"
exit
}

menu() {
clear
echo -e "${S1}"
figlet Bombing
echo
echo
printf "             ${S2}[${R0} BEAST_BOMB${S2}] ${S3}Enter target  >>> ${R0}"
read targett
passd=$(printf "$targett" | md5sum | awk '{printf $1}')
if [[ $passd == $no1 || $passd == $no2 || $passd == $no3 || $passd == $mo1 || $passd == $mo2 || $passd == $mo3 ]]; then
echo

printf "${S2}[${S1}!${S2}]${S1}Wrong number lol ;)! its developer here!! this bombing may results to self bomb for you so don't be so smart!!!!DDKBEAST  ${R0}\n" | pv -qL 10

echo
exit 1
elif [[ $passd == $no4 || $passd == $no5 || $passd == $no6 || $passd == $no7 || $passd == $no8 || $passd == $no9 ]]; then
echo

printf "${S2}[${S1}!${S2}]${S1}Wrong number lol! it developer here!! this bombing may results to self bomb for you so don't be so smart!!!!DDKBEAST ${R0}\n" | pv -qL 10 

echo
exit 1
else
printf "\n"
echo
Date=$(date)
echo -e "      $targett was bombed on $Date"  >> .bombrecord.txt
printf "  Bombing\n"
echo
printf "             ~~~${S2} Attack Started On +91$targett ${R0}~~~\n"
sleep 1
echo
echo
printf "\n"
printf "   Press ctrl+c to quit ! \n"
echo
echo -e "   ${S2}[${S1}~${S2}]${S3} Else it will automatically stop after 5 min${R0}"
echo
echo -e "   ${S2}[${S1}~${S2}]${S3} After sending 250 msgs and 50 calls !!${R0}"
echo

while read a; do
    echo ${a//€shushhi/$targett}
done < headapis > headapis.t
mv headapis{.t,}

while read a; do
    echo ${a//€shushhi/$targett}
done < tailapis > tailapis.t
mv tailapis{.t,}

for i in {1..4}
do bash headapis
done

for i in {1..27}
do bash tailapis 
done

exit 1
fi
}






menux() {
clear
clear
banner
sleep 1
DATE=$(date)
echo -e "${S7}✯ Started on ${S1}${DATE}"
echo -e "${S7}------------------------------"
printf "${S3}⚡ This tool is only for Educational Purposes !!${R0}\n" 
echo "------------------------------"
echo ""
sleep 1
printf "${S2}[${R0} 0${S2} ]${R0}>>>${S3} BOMB RECORD ${R0}\n"
printf "${S2}[${R0} 1${S2} ]${R0}>>>${S3} MASS BOMBING ${R0}\n"
printf "${S2}[${R0} 2${S2} ]${R0}>>>${S3} UPDATE ${R0}\n"
printf "${S2}[${R0} 3${S2} ]${R0}>>>${S3} ABOUT ${R0}\n"
printf "${S2}[${R0} 4${S2} ]${R0}>>>${S3} QUIT ${R0}\n"
echo
printf "${S1} Select Option !! ${R0}−−⋙⋙⋙ "
read options
if [ "$options" -eq "0" ];then
  bombrecord
fi
if [ "$options" -eq "1" ];then
  menu
fi
if [ "$options" -eq "2" ];then
  INTERNET
  REQUIREMENTS
  rm -rf $PREFIX/bin/beastbomb > /dev/null 2>&1
  cd $PREFIX/share
  rm -rf beastbomb > /dev/null 2>&1
  git clone https://github.com/King-Nazim/darkhack
  cd $PREFIX/share/beastbomb && chmod +x beastbomb.sh  
  sleep 1
cat <<- CONFI > $PREFIX/bin/beastbomb
#!/bin/bash
args="\$@"
cd \$PREFIX/share/darkhack && bash beastbomb.sh \$args
CONFI
chmod +x $PREFIX/bin/beastbomb
printf "\n${S2}Just run 'beastbomb' to run this program${R0}\n"
fi
if [ "$options" -eq "3" ];then
  about
fi
if [ "$options" -eq "007" ];then
  eexec
fi
if [ "$options" -eq "4" ];then
  echo
  echo -e "${S2}[${S1}~${S2}]${S3} Thanks for Using BEAST_BOMB !${S3}"
  echo
  rm -rf headapis* tailapis* anonapi* > /dev/null 2>&1
  exit 0
else
  menux
fi


}
menux

}





if [[ $comand == 'beastbomb.sh -u' ||$comand == 'beastbomb.sh --update' ]]; then
  INTERNET
  git pull
  printf "\n${S2}beastbomb is updated successfully${R0}\n\n"
elif [[ $comand == 'beastbomb.sh -i' || $comand == 'beastbomb.sh --install' ]]; then
  INTERNET
  REQUIREMENTS
  rm -rf $PREFIX/bin/beastbomb > /dev/null 2>&1
  cd $PREFIX/share
  rm -rf beastbomb> /dev/null 2>&1
  git clone https://github.com/King-Nazim/darkhack
  cd $PREFIX/share/beastbomb && chmod +x beastbomb.sh
  sleep 1
cat <<- CONF > $PREFIX/bin/beastbomb
#!/bin/bash
args="\$@"
cd \$PREFIX/share/beastbomb && bash beastbomb.sh \$args
CONF
chmod +x $PREFIX/bin/beastbomn
printf "\n${S2}Just run 'beastbomb' to run this program${R0}\n"
else
  INTERNET
  REQUIREMENTS
  PROGRAM
fi
rm -rf headapis* tailapis* anonapi* > /dev/null 2>&1 
