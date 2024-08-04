; External Symbols
extern GetStdHandle     ; https://learn.microsoft.com/en-us/windows/console/getstdhandle

; Includes
%include 'src/count_u32_digits.asm'
%include 'src/print_str.asm'

; Exported Symbols
global EntryPoint

; Constant Data Segment
NULL                EQU 0
NEWLINE             EQU 10
STD_OUTPUT_HANDLE   EQU -11

; Initialized Data Segment
section .data
    count_u32_digits_test0_failure_message        db  "count_u32_digits(0..9) failed test", NEWLINE, NULL
    count_u32_digits_test0_failure_message_length equ $-count_u32_digits_test0_failure_message
    count_u32_digits_test1_failure_message        db  "count_u32_digits(19..99) failed test", NEWLINE, NULL
    count_u32_digits_test1_failure_message_length equ $-count_u32_digits_test1_failure_message
    count_u32_digits_test2_failure_message        db  "count_u32_digits(100..999) failed test", NEWLINE, NULL
    count_u32_digits_test2_failure_message_length equ $-count_u32_digits_test2_failure_message
    count_u32_digits_test3_failure_message        db  "count_u32_digits(1000..9999) failed test", NEWLINE, NULL
    count_u32_digits_test3_failure_message_length equ $-count_u32_digits_test3_failure_message
    count_u32_digits_test4_failure_message        db  "count_u32_digits(10000..99999) failed test", NEWLINE, NULL
    count_u32_digits_test4_failure_message_length equ $-count_u32_digits_test4_failure_message
    count_u32_digits_test5_failure_message        db  "count_u32_digits(100000..999999) failed test", NEWLINE, NULL
    count_u32_digits_test5_failure_message_length equ $-count_u32_digits_test5_failure_message
    count_u32_digits_test6_failure_message        db  "count_u32_digits(1000000..9999999) failed test", NEWLINE, NULL
    count_u32_digits_test6_failure_message_length equ $-count_u32_digits_test6_failure_message
    count_u32_digits_test7_failure_message        db  "count_u32_digits(10000000..99999999) failed test", NEWLINE, NULL
    count_u32_digits_test7_failure_message_length equ $-count_u32_digits_test7_failure_message
    count_u32_digits_test8_failure_message        db  "count_u32_digits(100000000..999999999) failed test", NEWLINE, NULL
    count_u32_digits_test8_failure_message_length equ $-count_u32_digits_test8_failure_message
    count_u32_digits_test9_failure_message        db  "count_u32_digits(1000000000..9999999999) failed test", NEWLINE, NULL
    count_u32_digits_test9_failure_message_length equ $-count_u32_digits_test9_failure_message
    count_u32_digits_success_message        db  "count_u32_digits completed tests", NEWLINE, NULL
    count_u32_digits_success_message_length equ $-count_u32_digits_success_message

; Uninitialized Data Segment
section .bss
alignb 8
    process_handle      resq 1
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
    call count_u32_digits_test0
    call count_u32_digits_test1
    call count_u32_digits_test2
    call count_u32_digits_test3
    call count_u32_digits_test4
    call count_u32_digits_test5
    call count_u32_digits_test6
    call count_u32_digits_test7
    call count_u32_digits_test8
    call count_u32_digits_test9
    test ebx, ebx
    jne .count_u32_digits_failure

    lea rcx, [rel count_u32_digits_success_message]
    mov rdx, count_u32_digits_success_message_length
    call print_str

.count_u32_digits_failure:

    add rsp, 8

    xor eax, eax
    ret

; count_u32_digits(0..9) = 1
count_u32_digits_test0:
    ; count_u32_digits(0)
    mov ecx, 0
    call count_u32_digits
    cmp al, 1
    jne .print_count_u32_digits_test0_failure_message

    ; count_u32_digits(9)
    mov ecx, 9
    call count_u32_digits
    cmp al, 1
    jne .print_count_u32_digits_test0_failure_message

    ret

.print_count_u32_digits_test0_failure_message:
    lea rcx, [rel count_u32_digits_test0_failure_message]
    mov rdx, count_u32_digits_test0_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(10..99) = 2
count_u32_digits_test1:
    ; count_u32_digits(10)
    mov ecx, 10
    call count_u32_digits
    cmp al, 2
    jne .print_count_u32_digits_test1_failure_message

    ; count_u32_digits(99)
    mov ecx, 99
    call count_u32_digits
    cmp al, 2
    jne .print_count_u32_digits_test1_failure_message

    ret

.print_count_u32_digits_test1_failure_message:
    lea rcx, [rel count_u32_digits_test1_failure_message]
    mov rdx, count_u32_digits_test1_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(100..999) = 3
count_u32_digits_test2:
    ; count_u32_digits(100)
    mov ecx, 100
    call count_u32_digits
    cmp al, 3
    jne .print_count_u32_digits_test2_failure_message

    ; count_u32_digits(999)
    mov ecx, 999
    call count_u32_digits
    cmp al, 3
    jne .print_count_u32_digits_test2_failure_message

    ret

.print_count_u32_digits_test2_failure_message:
    lea rcx, [rel count_u32_digits_test2_failure_message]
    mov rdx, count_u32_digits_test2_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(1000..9999) = 4
count_u32_digits_test3:
    ; count_u32_digits(1000)
    mov ecx, 1000
    call count_u32_digits
    cmp al, 4
    jne .print_count_u32_digits_test3_failure_message

    ; count_u32_digits(9999)
    mov ecx, 9999
    call count_u32_digits
    cmp al, 4
    jne .print_count_u32_digits_test3_failure_message

    ret

.print_count_u32_digits_test3_failure_message:
    lea rcx, [rel count_u32_digits_test3_failure_message]
    mov rdx, count_u32_digits_test3_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(10000..99999) = 5
count_u32_digits_test4:
    ; count_u32_digits(10000)
    mov ecx, 10000
    call count_u32_digits
    cmp al, 5
    jne .print_count_u32_digits_test4_failure_message

    ; count_u32_digits(99999)
    mov ecx, 99999
    call count_u32_digits
    cmp al, 5
    jne .print_count_u32_digits_test4_failure_message

    ret

.print_count_u32_digits_test4_failure_message:
    lea rcx, [rel count_u32_digits_test4_failure_message]
    mov rdx, count_u32_digits_test4_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(100000..999999) = 6
count_u32_digits_test5:
    ; count_u32_digits(100000)
    mov ecx, 100000
    call count_u32_digits
    cmp al, 6
    jne .print_count_u32_digits_test5_failure_message

    ; count_u32_digits(999999)
    mov ecx, 999999
    call count_u32_digits
    cmp al, 6
    jne .print_count_u32_digits_test5_failure_message

    ret

.print_count_u32_digits_test5_failure_message:
    lea rcx, [rel count_u32_digits_test5_failure_message]
    mov rdx, count_u32_digits_test5_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(1000000..9999999) = 7
count_u32_digits_test6:
    ; count_u32_digits(1000000)
    mov ecx, 1000000
    call count_u32_digits
    cmp al, 7
    jne .print_count_u32_digits_test6_failure_message

    ; count_u32_digits(9999999)
    mov ecx, 9999999
    call count_u32_digits
    cmp al, 7
    jne .print_count_u32_digits_test6_failure_message

    ret

.print_count_u32_digits_test6_failure_message:
    lea rcx, [rel count_u32_digits_test6_failure_message]
    mov rdx, count_u32_digits_test6_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(10000000..99999999) = 8
count_u32_digits_test7:
    ; count_u32_digits(10000000)
    mov ecx, 10000000
    call count_u32_digits
    cmp al, 8
    jne .print_count_u32_digits_test7_failure_message

    ; count_u32_digits(99999999)
    mov ecx, 99999999
    call count_u32_digits
    cmp al, 8
    jne .print_count_u32_digits_test7_failure_message

    ret

.print_count_u32_digits_test7_failure_message:
    lea rcx, [rel count_u32_digits_test7_failure_message]
    mov rdx, count_u32_digits_test7_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(100000000..999999999) = 9
count_u32_digits_test8:
    ; count_u32_digits(100000000)
    mov ecx, 100000000
    call count_u32_digits
    cmp al, 9
    jne .print_count_u32_digits_test8_failure_message

    ; count_u32_digits(999999999)
    mov ecx, 999999999
    call count_u32_digits
    cmp al, 9
    jne .print_count_u32_digits_test8_failure_message

    ret

.print_count_u32_digits_test8_failure_message:
    lea rcx, [rel count_u32_digits_test8_failure_message]
    mov rdx, count_u32_digits_test8_failure_message_length
    call print_str
    inc ebx
    ret

; count_u32_digits(1000000000..4294967295) = 10
count_u32_digits_test9:
    ; count_u32_digits(1000000000)
    mov ecx, 1000000000
    call count_u32_digits
    cmp al, 10
    jne .print_count_u32_digits_test9_failure_message

    ; count_u32_digits(4294967295)
    mov ecx, 4294967295
    call count_u32_digits
    cmp al, 10
    jne .print_count_u32_digits_test9_failure_message

    ret

.print_count_u32_digits_test9_failure_message:
    lea rcx, [rel count_u32_digits_test9_failure_message]
    mov rdx, count_u32_digits_test9_failure_message_length
    call print_str
    inc ebx
    ret