#!/bin/bash

function advancedMenu(){
	ADVSEL = $(whiptail --title "Menu" --fb --menu "Select option" 15 60 4 \
	"1" "Option" \
	"2" "Option" \
	"3" "Option" 3>&1 1>&2 2>&3)
	
	case $ADVSEL in
	
	1)
	echo "Option 1"
	whiptail --title "Option 1" --msgbox "you chose option 1" 8 45
		
	;;
		
		
	esac
	

}
advancedMenu
