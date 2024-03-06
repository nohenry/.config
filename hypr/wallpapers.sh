#!/bin/sh

user='quartix'
img_array=(~/DynamicWallpapers/*)

img_array_rndm=( $(echo "${img_array[@]}" | tr ' ' '\n' | sort -R) )

transition="--transition-type outer --transition-pos 1,1 --transition-step 90 --transition-fps 144"

delay=15m # Delay in minutes

while true; do
	selected_img=${img_array[$RANDOM % ${#img_array[@]}]}
	# swww img $selected_img $transition
	swaybg -m fill -i $selected_img
	sleep ${delay}
done
