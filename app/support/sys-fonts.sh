#!/bin/bash

# Copy the system fonts in C:\Windows\system

# Do the work only if the font path exists ( we expect that wine has already created it )
FONT_PATH=`find ./prefix/drive_c/*indows/*onts | grep -ix "./prefix/drive_c/windows/fonts" 2>/dev/null`

if [ $FONT_PATH ]; then

	FONT_LIST=`find ./support/fonts`
	FONT_LIST=`echo $FONT_LIST | sed "s/.\/support\/fonts//g"`

	for FONT in $FONT_LIST; do
		SIZE1=$(stat -c%s "./support/fonts/$FONT" 2>/dev/null)

		SIZE2=$(stat -c%s "$FONT_PATH/$FONT" 2>/dev/null)
		if [ ! $SIZE2 ]; then
			SIZE2=0
		fi

		if [ $(expr $SIZE1 -  $SIZE2) != 0 ]; then
			cp -r ./support/fonts/$FONT $FONT_PATH/$FONT
		fi
	done
fi
