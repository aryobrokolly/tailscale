#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin

install_netcat()
{
	echo "Update (opkg update) ..."
    opkg -V0 update
}

finish(){
	echo ""
    echo "INSTALL SUCCESSFULLY ;)"
#    echo "There are 2 important steps to finish this setup:"
#    echo ""
#    echo "1. Make sure this line is in the cron. To open the cron editor, run: crontab -e"
#    echo "   */2 * * * * $DIR/wwan-keep-alive.sh"
#    echo ""  
#    echo "2. The interface representing the LTE connection is set to 'wwan0'."
#    echo "   To change the interface, please edit the line INTERFACE='wwan0' in the 'restart-interface.sh'."
    echo ""
    echo "Enjoy!"
}

download_files()
{
	DIR=/usr/bin
    	touch $DIR/log.txt
  	echo "Downloading files from https://raw.githubusercontent.com/aryobrokolly/modepesawat ..."
   	wget -O $DIR/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscale/main/usr/bin/tailscale && chmod +x $DIR/tailscale
 	wget -O $DIR/tailscaled https://raw.githubusercontent.com/aryobrokolly/tailscale/main/usr/bin/tailscaled && chmod +x $DIR/tailscaled
  	wget -O etc/init.d/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscale/main/etc/init.d/tailscale && chmod +x /etc/init.d/tailscale
    	finish
}

echo ""
echo "Aryo Install Script code."

while true; do
    read -p "This will update as a prerequisite. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) install_netcat; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done

echo ""

while true; do
    read -p "This will download the files ais sia into $DIR. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
