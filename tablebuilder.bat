SET c2a=%~dp0tools\c2a.py

cd %~dp0tables\ARENA
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\BATTLE
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\CHAPTERS
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\DIALOGUE
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\ITEMS
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\MAP
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\SYSTEM
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\TERRAIN
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

cd ..\UNITS
for %%t in (*.csv) do (
    python "%c2a%" "%%t" "%%~nt.casm"
)

pause