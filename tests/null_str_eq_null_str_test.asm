; External Symbols
extern GetStdHandle     ; https://learn.microsoft.com/en-us/windows/console/getstdhandle

; Includes
%include 'src/print_str.asm'
%include 'src/null_str_eq_null_str.asm' 

; Exported Symbols
global EntryPoint

; Constant Data Segment
NULL                EQU 0
NEWLINE             EQU 10
STD_OUTPUT_HANDLE   EQU -11

; Initialized Data Segment
section .data
    null_str_eq_null_str_test0a                       db  "a", NULL
    null_str_eq_null_str_test0b                       db  "a", NULL
    null_str_eq_null_str_test0_failure_message        db  "null_str_eq_null_str('a', 'a') failed", NEWLINE, NULL
    null_str_eq_null_str_test0_failure_message_length equ $-null_str_eq_null_str_test0_failure_message
    null_str_eq_null_str_test1a                       db  "a", NULL
    null_str_eq_null_str_test1b                       db  "b", NULL
    null_str_eq_null_str_test1_failure_message        db  "null_str_eq_null_str('a', 'b') failed", NEWLINE, NULL
    null_str_eq_null_str_test1_failure_message_length equ $-null_str_eq_null_str_test1_failure_message
    null_str_eq_null_str_test2a                       db  "aaaaaaaaaa", NULL
    null_str_eq_null_str_test2b                       db  "aaaaaaaaaa", NULL
    null_str_eq_null_str_test2_failure_message        db  "null_str_eq_null_str('aaaaaaaaaa', 'aaaaaaaaaa') failed", NEWLINE, NULL
    null_str_eq_null_str_test2_failure_message_length equ $-null_str_eq_null_str_test2_failure_message
    null_str_eq_null_str_test3a                       db  "aaaaaaaaaa", NULL
    null_str_eq_null_str_test3b                       db  "bbbbbbbbbb", NULL
    null_str_eq_null_str_test3_failure_message        db  "null_str_eq_null_str('aaaaaaaaaa', 'bbbbbbbbbb') failed", NEWLINE, NULL
    null_str_eq_null_str_test3_failure_message_length equ $-null_str_eq_null_str_test3_failure_message
    null_str_eq_null_str_test4a                       db  "a", NULL
    null_str_eq_null_str_test4b                       db  "aaaaaaaaaa", NULL
    null_str_eq_null_str_test4_failure_message        db  "null_str_eq_null_str('a', 'aaaaaaaaaa') failed", NEWLINE, NULL
    null_str_eq_null_str_test4_failure_message_length equ $-null_str_eq_null_str_test4_failure_message
    null_str_eq_null_str_test5a                       db  "aaaaaaaaaa", NULL
    null_str_eq_null_str_test5b                       db  "a", NULL
    null_str_eq_null_str_test5_failure_message        db  "null_str_eq_null_str('aaaaaaaaaa', 'a') failed", NEWLINE, NULL
    null_str_eq_null_str_test5_failure_message_length equ $-null_str_eq_null_str_test5_failure_message
    null_str_eq_null_str_success_message        db  "null_str_eq_null_str completed tests", NEWLINE, NULL
    null_str_eq_null_str_success_message_length equ $-null_str_eq_null_str_success_message

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
    call null_str_eq_null_str_test0
    call null_str_eq_null_str_test1
    call null_str_eq_null_str_test2
    call null_str_eq_null_str_test3
    call null_str_eq_null_str_test4
    call null_str_eq_null_str_test5
    test ebx, ebx
    jne .print_null_str_eq_null_str_success_end
.print_null_str_eq_null_str_success_start:
    lea rcx, [rel null_str_eq_null_str_success_message]
    mov rdx, null_str_eq_null_str_success_message_length
    call print_str
.print_null_str_eq_null_str_success_end:

    xor eax, eax
    ret

; null_str_eq_null_str("a", "a") = 1
null_str_eq_null_str_test0:
    lea rcx, [rel null_str_eq_null_str_test0a]
    lea rdx, [rel null_str_eq_null_str_test0b]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_null_str_eq_null_str_test0_failure_message

    ret

.print_null_str_eq_null_str_test0_failure_message:
    lea rcx, [rel null_str_eq_null_str_test0_failure_message]
    mov rdx, null_str_eq_null_str_test0_failure_message_length
    call print_str
    inc ebx

    ret

; null_str_eq_null_str("a", "b") = 0
null_str_eq_null_str_test1:
    lea rcx, [rel null_str_eq_null_str_test1a]
    lea rdx, [rel null_str_eq_null_str_test1b]
    call null_str_eq_null_str
    cmp al, 0
    jne .print_null_str_eq_null_str_test1_failure_message

    ret

.print_null_str_eq_null_str_test1_failure_message:
    lea rcx, [rel null_str_eq_null_str_test1_failure_message]
    mov rdx, null_str_eq_null_str_test1_failure_message_length
    call print_str
    inc ebx

    ret

; null_str_eq_null_str("aaaaaaaaaa", "aaaaaaaaaa") = 1
null_str_eq_null_str_test2:
    lea rcx, [rel null_str_eq_null_str_test2a]
    lea rdx, [rel null_str_eq_null_str_test2b]
    call null_str_eq_null_str
    cmp al, 1
    jne .print_null_str_eq_null_str_test2_failure_message

    ret

.print_null_str_eq_null_str_test2_failure_message:
    lea rcx, [rel null_str_eq_null_str_test2_failure_message]
    mov rdx, null_str_eq_null_str_test2_failure_message_length
    call print_str
    inc ebx

    ret

; null_str_eq_null_str("aaaaaaaaaa", "bbbbbbbbbb") = 0
null_str_eq_null_str_test3:
    lea rcx, [rel null_str_eq_null_str_test3a]
    lea rdx, [rel null_str_eq_null_str_test3b]
    call null_str_eq_null_str
    cmp al, 0
    jne .print_null_str_eq_null_str_test3_failure_message

    ret

.print_null_str_eq_null_str_test3_failure_message:
    lea rcx, [rel null_str_eq_null_str_test3_failure_message]
    mov rdx, null_str_eq_null_str_test3_failure_message_length
    call print_str
    inc ebx

    ret

; null_str_eq_null_str("a", "aaaaaaaaaa") = 0
null_str_eq_null_str_test4:
    lea rcx, [rel null_str_eq_null_str_test4a]
    lea rdx, [rel null_str_eq_null_str_test4b]
    call null_str_eq_null_str
    cmp al, 0
    jne .print_null_str_eq_null_str_test4_failure_message

    ret

.print_null_str_eq_null_str_test4_failure_message:
    lea rcx, [rel null_str_eq_null_str_test4_failure_message]
    mov rdx, null_str_eq_null_str_test4_failure_message_length
    call print_str
    inc ebx

    ret

; null_str_eq_null_str("aaaaaaaaaa", "a") = 0
null_str_eq_null_str_test5:
    lea rcx, [rel null_str_eq_null_str_test5a]
    lea rdx, [rel null_str_eq_null_str_test5b]
    call null_str_eq_null_str
    cmp al, 0
    jne .print_null_str_eq_null_str_test5_failure_message

    ret

.print_null_str_eq_null_str_test5_failure_message:
    lea rcx, [rel null_str_eq_null_str_test5_failure_message]
    mov rdx, null_str_eq_null_str_test5_failure_message_length
    call print_str
    inc ebx

    ret