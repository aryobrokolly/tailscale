#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin
DIR2=/etc/init.d



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
    echo "Next configuration firewall, etc !"
}

download_files()
{
    	touch $DIR/logtailscale.txt
  	echo "Downloading files from repo..."
   	wget -O $DIR/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscale/main/usr/bin/tailscale && chmod +x $DIR/tailscale
 	wget -O $DIR/tailscaled https://raw.githubusercontent.com/aryobrokolly/tailscale/main/usr/bin/tailscaled && chmod +x $DIR/tailscaled
  	wget -O $DIR2/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscale/main/etc/init.d/tailscale && chmod +x $DIR2/tailscale
    	finish
}

echo ""
echo "Aryo Install Script code from repo."

while true; do
    read -p "This will download the files into $DIR and $DIR2. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
