@echo off

cd C:\SE\Personal\lib_asm\
nasm -f win64 -g tests\memeq_test.asm -o Build\memeq_test.obj
golink /entry:EntryPoint /console kernel32.dll Build\memeq_test.obj /fo:bin\memeq_test.exe

if "%1" == "" ( 
    goto main_start
)
if "%1" == "-e" (
    bin\memeq_test.exe
)
goto main_end

:main_start
bin\memeq_test.exe
pause
:main_end