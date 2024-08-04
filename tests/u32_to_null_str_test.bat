@echo off

cd C:\SE\Personal\lib_asm\
nasm -f win64 -g tests\u32_to_null_str_test.asm -o Build\u32_to_null_str_test.obj
golink /entry:EntryPoint /console kernel32.dll Build\u32_to_null_str_test.obj /fo:bin\u32_to_null_str_test.exe

if "%1" == "" ( 
    goto main_start
)
if "%1" == "-e" (
    bin\u32_to_null_str_test.exe
)
goto main_end

:main_start
bin\u32_to_null_str_test.exe
pause
:main_end