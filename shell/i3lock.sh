#!/usr/bin/env bash

image=$(mktemp --tmpdir --suffix=.png lock.XXXXXXXXXX)
trap 'rm -f "$image"' SIGINT SIGTERM EXIT

declare -a lines

# line position (from center)
P=0

maim -u -m 1 |
	convert png:- -scale 10% -scale 1000% \
		-fill "#282828" -colorize 10% \
		"$image"

i3lock \
	--color=282828 \
	--image="$image" \
	--inside-color=282828FF \
	--insidever-color=282828FF \
	--insidewrong-color=282828FF \
	--ring-color=282828FF \
	--ringver-color=FABD2FFF \
	--ringwrong-color=FB4934FF \
	--separator-color=282828FF \
	--line-color=EBDBB2FF \
	--keyhl-color=EBDBB2FF \
	--bshl-color=FB4934FF \
	--ring-width=6 \
	--radius=32 \
	--ind-pos="x+w/2:y+h/2-$P" \
	--time-color=A89984FF \
	--time-pos='ix-180:iy+12' \
	--time-pos='ix-r-50:iy+12' \
	--time-str='%H:%M:%S' \
	--time-font='monospace bold' \
	--time-align=2 \
	--time-size=32 \
	--date-color=A89984FF \
	--date-pos='ix+180:iy+12' \
	--date-pos='ix+r+50:iy+12' \
	--date-str='%d.%m.%y' \
	--date-font='monospace bold' \
	--date-align=1 \
	--date-size=32 \
	--greeter-pos='x+100:iy+12' \
	--verif-color=00000000 \
	--wrong-color=00000000 \
	--modif-color=00000000 \
	--layout-color=00000000 \
	--greeter-color=00000000 \
	--verif-text='' \
	--wrong-text='' \
	--noinput-text='' \
	--lock-text='' \
	--lockfailed-text='' \
	--greeter-text='' \
	--ignore-empty-password \
	--pass-media-keys \
	--pass-screen-keys \
	--indicator \
	--clock
