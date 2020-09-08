#!/bin/bash

DADOS=$(yad --center --title="Create Menu Shortcuts"			\
	--width=400 --heigth=400                                    \
	--form                                                      \
	--field="Name: : " ""                                       \
	--field="Comment: : " ""                                    \
	--field="Type: : " "Application"                            \
	--field="Categories::CBE" 'AudioVideo!Audio!Video!Development!Education!Game!Graphics!Network!Office!Science!Settings!System!Utility' \
	--field="Version: : " ""                                    \
	--field="Executable: ":SFL " "                        		\
	--field="Icon: ":FL " "                              		\
	--field="Terminal:":CB false!true                           \
	--button gtk-add --buttons-layout="center"                  \
);


if [ "$(echo $DADOS | cut -d'|' -f1)" != '' ]
then

	FILE="$HOME/.local/share/applications/"$(echo $DADOS | cut -d'|' -f1)".desktop"

	echo [Desktop Entry] >> "$FILE"
	echo Name=$(echo $DADOS | cut -d'|' -f1) >> "$FILE"
	echo Comment=$(echo $DADOS | cut -d'|' -f2) >> "$FILE"
	echo Type=$(echo $DADOS | cut -d'|' -f3) >> "$FILE"
	echo Categories=$(echo $DADOS | cut -d'|' -f4) >> "$FILE"
	echo Version=$(echo $DADOS | cut -d'|' -f5) >> "$FILE"
	echo Exec=$(echo $DADOS | cut -d'|' -f6) | sed 's! !\\ !g' >> "$FILE"
	echo Icon=$(echo $DADOS | cut -d'|' -f7) | sed 's! !\\ !g' >> "$FILE"
	echo Terminal=$(echo $DADOS | cut -d'|' -f8) >> "$FILE"

fi
