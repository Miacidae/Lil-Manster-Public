#!/bin/bash

path=`readlink -f "${BASH_SOURCE:-$0}"`

startDir=`dirname $path`

echo $startDir

textasm="$startDir/text_menus/textformatter/MenuTextFormatter.py"

python $textasm text_menus/textformatter/Vanilla.png text_menus/textformatter/FixedLayout.txt text_menus/textformatter/Font.png text_menus/textformatter/Font.txt text_menus/textformatter/TextEntries.txt text_menus/textformatter/output/MenuText

64tass -f -o "fe5trans.sfc" -l "labels.txt" "buildfile.asm" 1>"log.txt" 2>&1

if [ $? -ne 0 ]; then
    echo 2>&1 "64tass failed, check log.txt"
    exit 1
fi

read -p "Done"
