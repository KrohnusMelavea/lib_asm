; External Symbols
extern GetStdHandle     ; https://learn.microsoft.com/en-us/windows/console/getstdhandle

; Includes
%include 'src/print_str.asm'
%include 'src/null_str_to_u32.asm' 

; Exported Symbols
global EntryPoint

; Constant Data Segment
NULL                EQU 0
NEWLINE             EQU 10
STD_OUTPUT_HANDLE   EQU -11

; Initialized Data Segment
section .data
    null_str_to_u32_test0a                       db  "1", NULL
    null_str_to_u32_test0_failure_message        db  "null_str_to_u32('1') failed", NEWLINE, NULL
    null_str_to_u32_test0_failure_message_length equ $-null_str_to_u32_test0_failure_message
    null_str_to_u32_test1a                       db  "12", NULL
    null_str_to_u32_test1_failure_message        db  "null_str_to_u32('12') failed", NEWLINE, NULL
    null_str_to_u32_test1_failure_message_length equ $-null_str_to_u32_test1_failure_message
    null_str_to_u32_test2a                       db  "123", NULL
    null_str_to_u32_test2_failure_message        db  "null_str_to_u32('123') failed", NEWLINE, NULL
    null_str_to_u32_test2_failure_message_length equ $-null_str_to_u32_test2_failure_message
    null_str_to_u32_test3a                       db  "1234", NULL
    null_str_to_u32_test3_failure_message        db  "null_str_to_u32('1234') failed", NEWLINE, NULL
    null_str_to_u32_test3_failure_message_length equ $-null_str_to_u32_test3_failure_message
    null_str_to_u32_test4a                       db  "12345", NULL
    null_str_to_u32_test4_failure_message        db  "null_str_to_u32('12345') failed", NEWLINE, NULL
    null_str_to_u32_test4_failure_message_length equ $-null_str_to_u32_test4_failure_message
    null_str_to_u32_test5a                       db  "123456", NULL
    null_str_to_u32_test5_failure_message        db  "null_str_to_u32('123456') failed", NEWLINE, NULL
    null_str_to_u32_test5_failure_message_length equ $-null_str_to_u32_test5_failure_message
    null_str_to_u32_test6a                       db  "1234567", NULL
    null_str_to_u32_test6_failure_message        db  "null_str_to_u32('1234567') failed", NEWLINE, NULL
    null_str_to_u32_test6_failure_message_length equ $-null_str_to_u32_test6_failure_message
    null_str_to_u32_test7a                       db  "12345678", NULL
    null_str_to_u32_test7_failure_message        db  "null_str_to_u32('12345678') failed", NEWLINE, NULL
    null_str_to_u32_test7_failure_message_length equ $-null_str_to_u32_test7_failure_message
    null_str_to_u32_test8a                       db  "123456789", NULL
    null_str_to_u32_test8_failure_message        db  "null_str_to_u32('123456789') failed", NEWLINE, NULL
    null_str_to_u32_test8_failure_message_length equ $-null_str_to_u32_test8_failure_message
    null_str_to_u32_test9a                       db  "1234567890", NULL
    null_str_to_u32_test9_failure_message        db  "null_str_to_u32('1234567890') failed", NEWLINE, NULL
    null_str_to_u32_test9_failure_message_length equ $-null_str_to_u32_test9_failure_message
    null_str_to_u32_success_message        db  "null_str_to_u32 completed tests", NEWLINE, NULL
    null_str_to_u32_success_message_length equ $-null_str_to_u32_success_message

; Uninitialized Data Segment
section .bss
alignb 8
    process_handle      resq 1
    byte_write_count    resq 1

; Instruction Segment
section .text
EntryPoint:
    sub rsp, 8

    sub rsp, 32
    mov ecx, STD_OUTPUT_HANDLE  ; nStdHandle
    call GetStdHandle
    mov qword [rel process_handle], rax
    add rsp, 32

    xor ebx, ebx
    call null_str_to_u32_test0
    call null_str_to_u32_test1
    call null_str_to_u32_test2
    call null_str_to_u32_test3
    call null_str_to_u32_test4
    call null_str_to_u32_test5
    call null_str_to_u32_test6
    call null_str_to_u32_test7
    call null_str_to_u32_test8
    call null_str_to_u32_test9
    test ebx, ebx
    jne .print_null_str_to_u32_success_message_end
.print_null_str_to_u32_success_message_start:
    lea rcx, [rel null_str_to_u32_success_message]
    mov rdx, null_str_to_u32_success_message_length
    call print_str
.print_null_str_to_u32_success_message_end:
    
    xor eax, eax
    ret

; null_str_to_u32("1") = 1
null_str_to_u32_test0:
    lea rcx, [rel null_str_to_u32_test0a]
    call null_str_to_u32
    cmp eax, 1
    jne .print_null_str_to_u32_test0_failure_message

    ret

.print_null_str_to_u32_test0_failure_message:
    lea rcx, [rel null_str_to_u32_test0_failure_message]
    mov rdx, null_str_to_u32_test0_failure_message_length
    call print_str
    inc ebx

    ret

; null_str_to_u32("12") = 12
null_str_to_u32_test1:
    lea rcx, [rel null_str_to_u32_test1a]
    call null_str_to_u32
    cmp eax, 12
    jne .print_null_str_to_u32_test1_failure_message

    ret

.print_null_str_to_u32_test1_failure_message:
    lea rcx, [rel null_str_to_u32_test1_failure_message]
    mov rdx, null_str_to_u32_test1_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("123") = 123
null_str_to_u32_test2:
    lea rcx, [rel null_str_to_u32_test2a]
    call null_str_to_u32
    cmp eax, 123
    jne .print_null_str_to_u32_test2_failure_message

    ret

.print_null_str_to_u32_test2_failure_message:
    lea rcx, [rel null_str_to_u32_test2_failure_message]
    mov rdx, null_str_to_u32_test2_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("1234") = 1234
null_str_to_u32_test3:
    lea rcx, [rel null_str_to_u32_test3a]
    call null_str_to_u32
    cmp eax, 1234
    jne .print_null_str_to_u32_test3_failure_message

    ret

.print_null_str_to_u32_test3_failure_message:
    lea rcx, [rel null_str_to_u32_test3_failure_message]
    mov rdx, null_str_to_u32_test3_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("12345") = 12345
null_str_to_u32_test4:
    lea rcx, [rel null_str_to_u32_test4a]
    call null_str_to_u32
    cmp eax, 12345
    jne .print_null_str_to_u32_test4_failure_message

    ret

.print_null_str_to_u32_test4_failure_message:
    lea rcx, [rel null_str_to_u32_test4_failure_message]
    mov rdx, null_str_to_u32_test4_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("123456") = 123456
null_str_to_u32_test5:
    lea rcx, [rel null_str_to_u32_test5a]
    call null_str_to_u32
    cmp eax, 123456
    jne .print_null_str_to_u32_test5_failure_message

    ret

.print_null_str_to_u32_test5_failure_message:
    lea rcx, [rel null_str_to_u32_test5_failure_message]
    mov rdx, null_str_to_u32_test5_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("1234567") = 1234567
null_str_to_u32_test6:
    lea rcx, [rel null_str_to_u32_test6a]
    call null_str_to_u32
    cmp eax, 1234567
    jne .print_null_str_to_u32_test6_failure_message

    ret

.print_null_str_to_u32_test6_failure_message:
    lea rcx, [rel null_str_to_u32_test6_failure_message]
    mov rdx, null_str_to_u32_test6_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("12345678") = 12345678
null_str_to_u32_test7:
    lea rcx, [rel null_str_to_u32_test7a]
    call null_str_to_u32
    cmp eax, 12345678
    jne .print_null_str_to_u32_test7_failure_message

    ret

.print_null_str_to_u32_test7_failure_message:
    lea rcx, [rel null_str_to_u32_test7_failure_message]
    mov rdx, null_str_to_u32_test7_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("123456789") = 123456789
null_str_to_u32_test8:
    lea rcx, [rel null_str_to_u32_test8a]
    call null_str_to_u32
    cmp eax, 123456789
    jne .print_null_str_to_u32_test8_failure_message

    ret

.print_null_str_to_u32_test8_failure_message:
    lea rcx, [rel null_str_to_u32_test8_failure_message]
    mov rdx, null_str_to_u32_test8_failure_message_length
    call print_str
    inc ebx
    
    ret

; null_str_to_u32("1234567890") = 1234567890
null_str_to_u32_test9:
    lea rcx, [rel null_str_to_u32_test9a]
    call null_str_to_u32
    cmp eax, 1234567890
    jne .print_null_str_to_u32_test9_failure_message

    ret

.print_null_str_to_u32_test9_failure_message:
    lea rcx, [rel null_str_to_u32_test9_failure_message]
    mov rdx, null_str_to_u32_test9_failure_message_length
    call print_str
    inc ebx
    
    ret