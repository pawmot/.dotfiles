#!/bin/sh

img=/tmp/i3lock.png
icon=$HOME/.config/i3/icons/password.png

scrot -o $img
stackblur -in $img -out $img
#convert $img -scale 10% -scale 1000% $img
#convert $img -blur 0x16 $img
echo "Image blurred"

if [[ -f $icon ]]
then
	PX=0
	PY=0
	R=$(file $icon | grep -o '[0-9]* x [0-9]*')
	RX=$(echo $R | cut -d' ' -f 1)
	RY=$(echo $R | cut -d' ' -f 3)

	SR=$(xrandr --query | grep ' connected' | grep -o '[0-9]*x[0-9]*+[0-9]*+[0-9]*')
	for RES in $SR
	do
		SRX=$(echo $RES | cut -d'x' -f 1)
		SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)
		SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2)
		SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3)
		PX=$(($SROX + $SRX/2 - $RX/2))
		PY=$(($SROY + $SRY/2 - $RY/2))
		convert $img $icon -geometry +$PX+$PY -composite -matte $img
                echo "Image composited for $RES"
	done
fi
i3lock -u -i $img
rm $img

