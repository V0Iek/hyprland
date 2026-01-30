#!/usr/bin/env bash

# Theme Elements
prompt="`hostname`"
mesg="Uptime : `uptime -p | sed -e 's/up //g'`"

# Options
option_1=""
option_2=""
option_3=""
option_4=""
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window { width: 20%; }" \
    -theme-str "listview {columns: 4; lines: 1;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
    -theme-str "element-text { horizontal-align: 0.5; vertical-align: 0.5; }" \
		-dmenu \
		-p "$prompt" \
		-placeholder "$mesg" \
		-markup-rows \
		-no-show-icons
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window { location: center; anchor: center; fullscreen: false; width: 200px; }' \
		-theme-str 'mainbox { orientation: vertical; children: [ "message", "listview" ]; }' \
		-theme-str 'listview { columns: 2; lines: 1; }' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-no-show-icons
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Confirm and execute
confirm_run () {	
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
    ${1} && ${2} && ${3}
  else
    exit
  fi	
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		hyprlock
	elif [[ "$1" == '--opt2' ]]; then
		confirm_run 'kill -9 -1'
	elif [[ "$1" == '--opt3' ]]; then
		confirm_run 'systemctl reboot'
	elif [[ "$1" == '--opt4' ]]; then
		confirm_run 'systemctl poweroff'
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
  $option_1)
	run_cmd --opt1
  ;;
  $option_2)
	run_cmd --opt2
  ;;
  $option_3)
	run_cmd --opt3
  ;;
  $option_4)
	run_cmd --opt4
  ;;
esac
