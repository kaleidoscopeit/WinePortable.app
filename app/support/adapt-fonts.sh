#!/bin/bash

function make_hex {
	# Builds the convertible string
	FONT_NAME=$1
	FONT_SIZE=$2
	HEX_PADDING=$3

	# Sets the real font name if "sans" is founded 
	if [ $FONT_NAME = "Sans" ]; then
		FONT_NAME="Bitstream Vera Sans"
	fi

	# Hex convert the size of font
	FONT_SIZE=`echo ""$(( 254 - ( $FONT_SIZE )))" "16" o p" | dc`

	HEX_OUT=$FONT_SIZE",ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,00,00,00,00,00,"

	# Write the name of the font with spaces
	for (( i = 0 ; i < ${#FONT_NAME}; i++ ))
	do
		HEXTEMP=`echo -n "${FONT_NAME:$i:1}" | xxd -ps`
		HEX_OUT=$HEX_OUT`echo -n $HEXTEMP",00,"`
	done

	# Pad the rest of the key value with zeroes
	REMAIN=$(( $HEX_PADDING - 1 - ${#HEX_OUT} / 3 ))
	for (( i = 0 ; i < $REMAIN; i++ ))
	do
		HEX_OUT=$HEX_OUT`echo -n "00,"`
	done
	HEX_OUT=$HEX_OUT"00"

	echo $HEX_OUT
}

DOCUMENT_FONT=`gsettings get org.gnome.desktop.interface font-name | sed 's/^.\(.*\).$/\1/'`
DOCUMENT_FONT_NAME=`echo $DOCUMENT_FONT | sed "s/ [^ ]*$//"`
DOCUMENT_FONT_SIZE=`echo $DOCUMENT_FONT | sed "s/^.*[^ ] //"`

OUTPUT="[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]\n"
OUTPUT=$OUTPUT""\"MenuFont\""=hex:"`make_hex "$DOCUMENT_FONT_NAME" $DOCUMENT_FONT_SIZE 92`"\n"

OUTPUT=$OUTPUT"[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]\n"
OUTPUT=$OUTPUT""\"MessageFont\""=hex:"`make_hex "$DOCUMENT_FONT_NAME" $DOCUMENT_FONT_SIZE 92`"\n"

OUTPUT=$OUTPUT"[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]\n"
OUTPUT=$OUTPUT""\"CaptionFont\""=hex:"`make_hex "$DOCUMENT_FONT_NAME" $DOCUMENT_FONT_SIZE 92`"\n"

OUTPUT=$OUTPUT"[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]\n"
OUTPUT=$OUTPUT""\"IconFont\""=hex:"`make_hex "$DOCUMENT_FONT_NAME" $DOCUMENT_FONT_SIZE 92`"\n"

OUTPUT=$OUTPUT"[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]\n"
OUTPUT=$OUTPUT""\"SmCaptionFont\""=hex:"`make_hex "$DOCUMENT_FONT_NAME" $DOCUMENT_FONT_SIZE 92`"\n"

OUTPUT=$OUTPUT"[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]\n"
OUTPUT=$OUTPUT""\"StatusFont\""=hex:"`make_hex "$DOCUMENT_FONT_NAME" $DOCUMENT_FONT_SIZE 92`"\n"

OUTPUT=$OUTPUT"[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontSubstitutes]\n"
OUTPUT=$OUTPUT"\"MS Shell Dlg\"=\""$DOCUMENT_FONT_NAME"\"\n"
OUTPUT=$OUTPUT"\"MS Shell Dlg 2\"=\""$DOCUMENT_FONT_NAME"\"\n"

echo -e $OUTPUT




