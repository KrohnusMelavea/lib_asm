; External Symbols
extern GetStdHandle     ; https://learn.microsoft.com/en-us/windows/console/getstdhandle

; Includes
%include 'src/print_str.asm'
%include 'src/u32_to_null_str.asm'
%include 'src/null_str_eq_null_str.asm'

; Exported Symbols
global EntryPoint

; Constant Data Segment
NULL                EQU 0
NEWLINE             EQU 10
STD_OUTPUT_HANDLE   EQU -11

; Initialized Data Segment
section .data
    u32_to_null_str_test0a                       db  "1", NULL
    u32_to_null_str_test0_failure_message        db  "u32_to_null_str(1) failed", NEWLINE, NULL
    u32_to_null_str_test0_failure_message_length equ $-u32_to_null_str_test0_failure_message
    u32_to_null_str_test1a                       db  "12", NULL
    u32_to_null_str_test1_failure_message        db  "u32_to_null_str(12) failed", NEWLINE, NULL
    u32_to_null_str_test1_failure_message_length equ $-u32_to_null_str_test1_failure_message
    u32_to_null_str_test2a                       db  "123", NULL
    u32_to_null_str_test2_failure_message        db  "u32_to_null_str(123) failed", NEWLINE, NULL
    u32_to_null_str_test2_failure_message_length equ $-u32_to_null_str_test2_failure_message
    u32_to_null_str_test3a                       db  "1234", NULL
    u32_to_null_str_test3_failure_message        db  "u32_to_null_str(1234) failed", NEWLINE, NULL
    u32_to_null_str_test3_failure_message_length equ $-u32_to_null_str_test3_failure_message
    u32_to_null_str_test4a                       db  "12345", NULL
    u32_to_null_str_test4_failure_message        db  "u32_to_null_str(12345) failed", NEWLINE, NULL
    u32_to_null_str_test4_failure_message_length equ $-u32_to_null_str_test4_failure_message
    u32_to_null_str_test5a                       db  "123456", NULL
    u32_to_null_str_test5_failure_message        db  "u32_to_null_str(123456) failed", NEWLINE, NULL
    u32_to_null_str_test5_failure_message_length equ $-u32_to_null_str_test5_failure_message
    u32_to_null_str_test6a                       db  "1234567", NULL
    u32_to_null_str_test6_failure_message        db  "u32_to_null_str(1234567) failed", NEWLINE, NULL
    u32_to_null_str_test6_failure_message_length equ $-u32_to_null_str_test6_failure_message
    u32_to_null_str_test7a                       db  "12345678", NULL
    u32_to_null_str_test7_failure_message        db  "u32_to_null_str(12345678) failed", NEWLINE, NULL
    u32_to_null_str_test7_failure_message_length equ $-u32_to_null_str_test7_failure_message
    u32_to_null_str_test8a                       db  "123456789", NULL
    u32_to_null_str_test8_failure_message        db  "u32_to_null_str(123456789) failed", NEWLINE, NULL
    u32_to_null_str_test8_failure_message_length equ $-u32_to_null_str_test8_failure_message
    u32_to_null_str_test9a                       db  "1234567890", NULL
    u32_to_null_str_test9_failure_message        db  "u32_to_null_str(1234567890) failed", NEWLINE, NULL
    u32_to_null_str_test9_failure_message_length equ $-u32_to_null_str_test9_failure_message
    u32_to_null_str_success_message        db  "u32_to_null_str completed tests", NEWLINE, NULL
    u32_to_null_str_success_message_length equ $-u32_to_null_str_success_message

; Uninitialized Data Segment
section .bss
alignb 8
    process_handle      resq 1
    heap_handle         resq 1
    byte_write_count    resq 1

; Instruction Segment
section .text
EntryPoint:
    sub rsp, 8

    mov ecx, STD_OUTPUT_HANDLE  ; nStdHandle
    sub rsp, 32
    call GetStdHandle
    add rsp, 32
    mov qword [rel process_handle], rax

    xor ebx, ebx
    call u32_to_null_str_test0
    call u32_to_null_str_test1
    call u32_to_null_str_test2
    call u32_to_null_str_test3
    call u32_to_null_str_test4
    call u32_to_null_str_test5
    call u32_to_null_str_test6
    call u32_to_null_str_test7
    call u32_to_null_str_test8
    call u32_to_null_str_test9
    test ebx, ebx
    jne .print_u32_to_null_str_success_message_end
.print_u32_to_null_str_success_message_start:
    lea rcx, [rel u32_to_null_str_success_message]
    mov rdx, u32_to_null_str_success_message_length
    call print_str
.print_u32_to_null_str_success_message_end:

    xor eax, eax
    ret

; u32_to_null_str(1) == 1 && char* = "1"
u32_to_null_str_test0:
    sub rsp, 256
    mov ecx, 1
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test0_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test0a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test0_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test0_failure_message:
    lea rcx, [rel u32_to_null_str_test0_failure_message]
    mov rdx, u32_to_null_str_test0_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(12) == 2 && char* = "12"
u32_to_null_str_test1:
    sub rsp, 256
    mov ecx, 12
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 2
    jne .print_u32_to_null_str_test1_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test1a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test1_failure_message
    
    add rsp, 256
    ret
.print_u32_to_null_str_test1_failure_message:
    lea rcx, [rel u32_to_null_str_test1_failure_message]
    mov rdx, u32_to_null_str_test1_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(123) == 3 && char* = "123"
u32_to_null_str_test2:
    sub rsp, 256
    mov ecx, 123
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 3
    jne .print_u32_to_null_str_test2_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test2a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test2_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test2_failure_message:
    lea rcx, [rel u32_to_null_str_test2_failure_message]
    mov rdx, u32_to_null_str_test2_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(1234) == 4 && char* = "1234"
u32_to_null_str_test3:
    sub rsp, 256
    mov ecx, 1234
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 4
    jne .print_u32_to_null_str_test3_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test3a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test3_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test3_failure_message:
    lea rcx, [rel u32_to_null_str_test3_failure_message]
    mov rdx, u32_to_null_str_test3_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(12345) == 5 && char* = "12345"
u32_to_null_str_test4:
    sub rsp, 256
    mov ecx, 12345
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 5
    jne .print_u32_to_null_str_test4_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test4a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test4_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test4_failure_message:
    lea rcx, [rel u32_to_null_str_test4_failure_message]
    mov rdx, u32_to_null_str_test4_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(123456) == 6 && char* = "123456"
u32_to_null_str_test5:
    sub rsp, 256
    mov ecx, 123456
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 6
    jne .print_u32_to_null_str_test5_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test5a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test5_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test5_failure_message:
    lea rcx, [rel u32_to_null_str_test5_failure_message]
    mov rdx, u32_to_null_str_test5_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(1234567) == 7 && char* = "1234567"
u32_to_null_str_test6:
    sub rsp, 256
    mov ecx, 1234567
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 7
    jne .print_u32_to_null_str_test6_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test6a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test6_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test6_failure_message:
    lea rcx, [rel u32_to_null_str_test6_failure_message]
    mov rdx, u32_to_null_str_test6_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(12345678) == 8 && char* = "12345678"
u32_to_null_str_test7:
    sub rsp, 256
    mov ecx, 12345678
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 8
    jne .print_u32_to_null_str_test7_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test7a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test7_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test7_failure_message:
    lea rcx, [rel u32_to_null_str_test7_failure_message]
    mov rdx, u32_to_null_str_test7_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(123456789) == 9 && char* = "123456789"
u32_to_null_str_test8:
    sub rsp, 256
    mov ecx, 123456789
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 9
    jne .print_u32_to_null_str_test8_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test8a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test8_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test8_failure_message:
    lea rcx, [rel u32_to_null_str_test8_failure_message]
    mov rdx, u32_to_null_str_test8_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret

; u32_to_null_str(1234567890) == 10 && char* = "1234567890"
u32_to_null_str_test9:
    sub rsp, 256
    mov ecx, 1234567890
    mov rdx, rsp
    call u32_to_null_str
    cmp al, 10
    jne .print_u32_to_null_str_test9_failure_message
    mov rcx, rsp
    lea rdx, [rel u32_to_null_str_test9a]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_u32_to_null_str_test9_failure_message

    add rsp, 256
    ret
.print_u32_to_null_str_test9_failure_message:
    lea rcx, [rel u32_to_null_str_test9_failure_message]
    mov rdx, u32_to_null_str_test9_failure_message_length
    call print_str
    inc ebx

    add rsp, 256
    ret