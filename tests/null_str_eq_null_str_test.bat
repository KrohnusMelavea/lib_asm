@echo off

cd C:\SE\Personal\lib_asm\
nasm -f win64 -g tests\null_str_eq_null_str_test.asm -o Build\null_str_eq_null_str_test.obj
golink /entry:EntryPoint /console kernel32.dll Build\null_str_eq_null_str_test.obj /fo:bin\null_str_eq_null_str_test.exe

if "%1" == "" ( 
    goto main_start
)
if "%1" == "-e" (
    bin\null_str_eq_null_str_test.exe
)
goto main_end

:main_start
bin\null_str_eq_null_str_test.exe
pause
:main_end