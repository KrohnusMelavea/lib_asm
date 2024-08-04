@echo off

cd C:\SE\Personal\lib_asm\
nasm -f win64 -g tests\heap_alloc_test.asm -o Build\heap_alloc_test.obj
golink /entry:EntryPoint /console kernel32.dll Build\heap_alloc_test.obj /fo:bin\heap_alloc_test.exe

if "%1" == "" ( 
    goto main_start
)
if "%1" == "-e" (
    bin\heap_alloc_test.exe
)
goto main_end

:main_start
bin\heap_alloc_test.exe
pause
:main_end