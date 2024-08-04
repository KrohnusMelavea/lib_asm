@echo off

cd C:\SE\Personal\lib_asm\
nasm -f win64 -g tests\count_u32_digits_test.asm -o Build\count_u32_digits_test.obj
golink /entry:EntryPoint /console kernel32.dll Build\count_u32_digits_test.obj /fo:bin\count_u32_digits_test.exe

if "%1" == "" ( 
    goto main_start
)
if "%1" == "-e" (
    bin\count_u32_digits_test.exe
)
goto main_end

:main_start
bin\count_u32_digits_test.exe
pause
:main_end