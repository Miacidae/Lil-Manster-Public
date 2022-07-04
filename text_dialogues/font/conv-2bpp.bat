

set toolsf="..\..\tools\"


%toolsf%SuperFamiconv\superfamiconv tiles --in-image "%~nx1" -B 2 --no-discard --no-flip --in-palette "%~n1.pal.bin" --out-data "%~n1-2bpp.bin"

pause