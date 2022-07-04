SET startDir=%~dp0

SET as="%startDir%/tools/Assembler 64tass/64tass"

SET textasm="%startDir%/text_menus/textformatter/MenuTextFormatter.py"

python %textasm% text_menus/textformatter/Vanilla.png text_menus/textformatter/FixedLayout.txt text_menus/textformatter/Font.png text_menus/textformatter/Font.txt text_menus/textformatter/TextEntries.txt text_menus/textformatter/output/MenuText

%as% -f -o "fe5trans.sfc" -l "labels.txt" "buildfile.asm" 1>"log.txt" 2>&1

cd "%startDir%/ups"

ups diff -b "%startDir%/base_rom/fe5.sfc" -m "%startDir%/fe5trans.sfc" -o "%startDir%/ups/fe5trans.ups"

pause