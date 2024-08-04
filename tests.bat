@echo off

cd C:\SE\Personal\lib_asm\

call tests\null_str_to_u32_test.bat -b
call tests\count_u32_digits_test.bat -b
call tests\null_str_eq_null_str_test -b
call tests\u32_to_null_str_test.bat -b
call tests\heap_alloc_test.bat -b

echo:
echo:
echo:
echo:
echo:

call bin\null_str_to_u32_test.exe
call bin\count_u32_digits_test.exe
call bin\null_str_eq_null_str_test.exe
call bin\u32_to_null_str_test.exe
call bin\heap_alloc_test.exe