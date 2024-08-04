; External Symbols
extern GetStdHandle     ; https://learn.microsoft.com/en-us/windows/console/getstdhandle
extern GetProcessHeap   ; https://learn.microsoft.com/en-us/windows/win32/api/heapapi/nf-heapapi-getprocessheap

; Includes
%include 'src/print_str.asm'
%include 'src/heap_alloc.asm'

; Exported Symbols
global EntryPoint

; Constant Data Segment
NULL                EQU 0
NEWLINE             EQU 10
STD_OUTPUT_HANDLE   EQU -11

; Initialized Data Segment
section .data
    ; 1 Byte
    heap_alloc_test0_failure_message         db  "heap_alloc(1) failed test", NEWLINE, NULL
    heap_alloc_test0_failure_message_length  equ $-heap_alloc_test0_failure_message
    heap_free_test0_failure_message          db  "heap_free(heap_alloc(1)) failed test", NEWLINE, NULL
    heap_free_test0_failure_message_length   equ $-heap_free_test0_failure_message
    ; 2 Bytes
    heap_alloc_test1_failure_message         db  "heap_alloc(2) failed test", NEWLINE, NULL
    heap_alloc_test1_failure_message_length  equ $-heap_alloc_test1_failure_message
    heap_free_test1_failure_message          db  "heap_free(heap_alloc(2)) failed test", NEWLINE, NULL
    heap_free_test1_failure_message_length   equ $-heap_free_test1_failure_message
    ; 4 Bytes
    heap_alloc_test2_failure_message         db  "heap_alloc(4) failed test", NEWLINE, NULL
    heap_alloc_test2_failure_message_length  equ $-heap_alloc_test2_failure_message
    heap_free_test2_failure_message          db  "heap_free(heap_alloc(4)) failed test", NEWLINE, NULL
    heap_free_test2_failure_message_length   equ $-heap_free_test2_failure_message
    ; 8 Bytes
    heap_alloc_test3_failure_message         db  "heap_alloc(8) failed test", NEWLINE, NULL
    heap_alloc_test3_failure_message_length  equ $-heap_alloc_test3_failure_message
    heap_free_test3_failure_message          db  "heap_free(heap_alloc(8)) failed test", NEWLINE, NULL
    heap_free_test3_failure_message_length   equ $-heap_free_test3_failure_message
    ; 16 Bytes
    heap_alloc_test4_failure_message         db  "heap_alloc(16) failed test", NEWLINE, NULL
    heap_alloc_test4_failure_message_length  equ $-heap_alloc_test4_failure_message
    heap_free_test4_failure_message          db  "heap_free(heap_alloc(16)) failed test", NEWLINE, NULL
    heap_free_test4_failure_message_length   equ $-heap_free_test4_failure_message
    ; 32 Bytes
    heap_alloc_test5_failure_message         db  "heap_alloc(32) failed test", NEWLINE, NULL
    heap_alloc_test5_failure_message_length  equ $-heap_alloc_test5_failure_message
    heap_free_test5_failure_message          db  "heap_free(heap_alloc(32)) failed test", NEWLINE, NULL
    heap_free_test5_failure_message_length   equ $-heap_free_test5_failure_message
    ; 64 Bytes
    heap_alloc_test6_failure_message         db  "heap_alloc(64) failed test", NEWLINE, NULL
    heap_alloc_test6_failure_message_length  equ $-heap_alloc_test6_failure_message
    heap_free_test6_failure_message          db  "heap_free(heap_alloc(64)) failed test", NEWLINE, NULL
    heap_free_test6_failure_message_length   equ $-heap_free_test6_failure_message
    ; 128 Bytes
    heap_alloc_test7_failure_message         db  "heap_alloc(128) failed test", NEWLINE, NULL
    heap_alloc_test7_failure_message_length  equ $-heap_alloc_test7_failure_message
    heap_free_test7_failure_message          db  "heap_free(heap_alloc(128)) failed test", NEWLINE, NULL
    heap_free_test7_failure_message_length   equ $-heap_free_test7_failure_message
    ; 256 Bytes
    heap_alloc_test8_failure_message         db  "heap_alloc(256) failed test", NEWLINE, NULL
    heap_alloc_test8_failure_message_length  equ $-heap_alloc_test8_failure_message
    heap_free_test8_failure_message          db  "heap_free(heap_alloc(256)) failed test", NEWLINE, NULL
    heap_free_test8_failure_message_length   equ $-heap_free_test8_failure_message
    ; 512 Bytes
    heap_alloc_test9_failure_message         db  "heap_alloc(512) failed test", NEWLINE, NULL
    heap_alloc_test9_failure_message_length  equ $-heap_alloc_test9_failure_message
    heap_free_test9_failure_message          db  "heap_free(heap_alloc(512)) failed test", NEWLINE, NULL
    heap_free_test9_failure_message_length   equ $-heap_free_test9_failure_message
    ; 1 Kilobyte
    heap_alloc_test10_failure_message        db  "heap_alloc(1024) failed test", NEWLINE, NULL
    heap_alloc_test10_failure_message_length equ $-heap_alloc_test10_failure_message
    heap_free_test10_failure_message         db  "heap_free(heap_alloc(1024)) failed test", NEWLINE, NULL
    heap_free_test10_failure_message_length  equ $-heap_free_test10_failure_message
    ; 2 Kilobytes
    heap_alloc_test11_failure_message        db  "heap_alloc(2048) failed test", NEWLINE, NULL
    heap_alloc_test11_failure_message_length equ $-heap_alloc_test11_failure_message
    heap_free_test11_failure_message         db  "heap_free(heap_alloc(2048)) failed test", NEWLINE, NULL
    heap_free_test11_failure_message_length  equ $-heap_free_test11_failure_message
    ; 4 Kilobytes
    heap_alloc_test12_failure_message        db  "heap_alloc(4096) failed test", NEWLINE, NULL
    heap_alloc_test12_failure_message_length equ $-heap_alloc_test12_failure_message
    heap_free_test12_failure_message         db  "heap_free(heap_alloc(4096)) failed test", NEWLINE, NULL
    heap_free_test12_failure_message_length  equ $-heap_free_test12_failure_message
    ; 8 Kilobytes
    heap_alloc_test13_failure_message        db  "heap_alloc(8192) failed test", NEWLINE, NULL
    heap_alloc_test13_failure_message_length equ $-heap_alloc_test13_failure_message
    heap_free_test13_failure_message         db  "heap_free(heap_alloc(40981926)) failed test", NEWLINE, NULL
    heap_free_test13_failure_message_length  equ $-heap_free_test13_failure_message
    ; 16 Kilobytes
    heap_alloc_test14_failure_message        db  "heap_alloc(16384) failed test", NEWLINE, NULL
    heap_alloc_test14_failure_message_length equ $-heap_alloc_test14_failure_message
    heap_free_test14_failure_message         db  "heap_free(heap_alloc(16384)) failed test", NEWLINE, NULL
    heap_free_test14_failure_message_length  equ $-heap_free_test14_failure_message
    ; 32 Kilobytes
    heap_alloc_test15_failure_message        db  "heap_alloc(32768) failed test", NEWLINE, NULL
    heap_alloc_test15_failure_message_length equ $-heap_alloc_test15_failure_message
    heap_free_test15_failure_message         db  "heap_free(heap_alloc(32768)) failed test", NEWLINE, NULL
    heap_free_test15_failure_message_length  equ $-heap_free_test15_failure_message
    ; 64 Kilobytes
    heap_alloc_test16_failure_message        db  "heap_alloc(65536) failed test", NEWLINE, NULL
    heap_alloc_test16_failure_message_length equ $-heap_alloc_test16_failure_message
    heap_free_test16_failure_message         db  "heap_free(heap_alloc(65536)) failed test", NEWLINE, NULL
    heap_free_test16_failure_message_length  equ $-heap_free_test16_failure_message
    ; 128 Kilobytes
    heap_alloc_test17_failure_message        db  "heap_alloc(131072) failed test", NEWLINE, NULL
    heap_alloc_test17_failure_message_length equ $-heap_alloc_test17_failure_message
    heap_free_test17_failure_message         db  "heap_free(heap_alloc(131072)) failed test", NEWLINE, NULL
    heap_free_test17_failure_message_length  equ $-heap_free_test17_failure_message
    ; 256 Kilobytes
    heap_alloc_test18_failure_message        db  "heap_alloc(262144) failed test", NEWLINE, NULL
    heap_alloc_test18_failure_message_length equ $-heap_alloc_test18_failure_message
    heap_free_test18_failure_message         db  "heap_free(heap_alloc(262144)) failed test", NEWLINE, NULL
    heap_free_test18_failure_message_length  equ $-heap_free_test18_failure_message
    ; 512 Kilobytes
    heap_alloc_test19_failure_message        db  "heap_alloc(524288) failed test", NEWLINE, NULL
    heap_alloc_test19_failure_message_length equ $-heap_alloc_test19_failure_message
    heap_free_test19_failure_message         db  "heap_free(heap_alloc(524288)) failed test", NEWLINE, NULL
    heap_free_test19_failure_message_length  equ $-heap_free_test19_failure_message
    ; 1 Megabyte
    heap_alloc_test20_failure_message        db  "heap_alloc(1048576) failed test", NEWLINE, NULL
    heap_alloc_test20_failure_message_length equ $-heap_alloc_test20_failure_message
    heap_free_test20_failure_message         db  "heap_free(heap_alloc(1048576)) failed test", NEWLINE, NULL
    heap_free_test20_failure_message_length  equ $-heap_free_test20_failure_message
    ; 2 Megabytes
    heap_alloc_test21_failure_message        db  "heap_alloc(2097152) failed test", NEWLINE, NULL
    heap_alloc_test21_failure_message_length equ $-heap_alloc_test21_failure_message
    heap_free_test21_failure_message         db  "heap_free(heap_alloc(2097152)) failed test", NEWLINE, NULL
    heap_free_test21_failure_message_length  equ $-heap_free_test21_failure_message
    ; 4 Megabytes
    heap_alloc_test22_failure_message        db  "heap_alloc(4194304) failed test", NEWLINE, NULL
    heap_alloc_test22_failure_message_length equ $-heap_alloc_test22_failure_message
    heap_free_test22_failure_message         db  "heap_free(heap_alloc(4194304)) failed test", NEWLINE, NULL
    heap_free_test22_failure_message_length  equ $-heap_free_test22_failure_message
    ; 8 Megabytes
    heap_alloc_test23_failure_message        db  "heap_alloc(8388608) failed test", NEWLINE, NULL
    heap_alloc_test23_failure_message_length equ $-heap_alloc_test23_failure_message
    heap_free_test23_failure_message         db  "heap_free(heap_alloc(8388608)) failed test", NEWLINE, NULL
    heap_free_test23_failure_message_length  equ $-heap_free_test23_failure_message
    ; 16 Megabytes
    heap_alloc_test24_failure_message        db  "heap_alloc(16777216) failed test", NEWLINE, NULL
    heap_alloc_test24_failure_message_length equ $-heap_alloc_test24_failure_message
    heap_free_test24_failure_message         db  "heap_free(heap_alloc(16777216)) failed test", NEWLINE, NULL
    heap_free_test24_failure_message_length  equ $-heap_free_test24_failure_message
    ; 32 Megabytes
    heap_alloc_test25_failure_message        db  "heap_alloc(33554432) failed test", NEWLINE, NULL
    heap_alloc_test25_failure_message_length equ $-heap_alloc_test25_failure_message
    heap_free_test25_failure_message         db  "heap_free(heap_alloc(33554432)) failed test", NEWLINE, NULL
    heap_free_test25_failure_message_length  equ $-heap_free_test25_failure_message

    heap_alloc_success_message        db  "heap_alloc completed tests", NEWLINE, NULL
    heap_alloc_success_message_length equ $-heap_alloc_success_message

; Uninitialized Data Segment
section .bss
alignb 8
    process_handle      resq 1
    byte_write_count    resq 1
    process_heap_handle resq 1

; Instruction Segment
section .text
EntryPoint:
    sub rsp, 8

    mov ecx, STD_OUTPUT_HANDLE  ; nStdHandle
    sub rsp, 32
    call GetStdHandle
    add rsp, 32
    mov qword [rel process_handle], rax

    sub rsp, 32
    call GetProcessHeap
    add rsp, 32
    mov qword [rel process_heap_handle], rax

    xor r12, r12
    call heap_test0
    add r12, rax
    call heap_test1
    add r12, rax
    call heap_test2
    add r12, rax
    call heap_test3
    add r12, rax
    call heap_test4
    add r12, rax
    call heap_test5
    add r12, rax
    call heap_test6
    add r12, rax
    call heap_test7
    add r12, rax
    call heap_test8
    add r12, rax
    call heap_test9
    add r12, rax
    call heap_test10
    add r12, rax
    call heap_test11
    add r12, rax
    call heap_test12
    add r12, rax
    call heap_test13
    add r12, rax
    call heap_test14
    add r12, rax
    call heap_test15
    add r12, rax
    call heap_test16
    add r12, rax
    call heap_test17
    add r12, rax
    call heap_test18
    add r12, rax
    call heap_test19
    add r12, rax
    call heap_test20
    add r12, rax
    call heap_test21
    add r12, rax
    call heap_test22
    add r12, rax
    call heap_test23
    add r12, rax
    call heap_test24
    add r12, rax
    call heap_test25
    add r12, rax
    test r12, r12
    jne .heap_alloc_failure

    lea rcx, [rel heap_alloc_success_message]
    mov rdx, heap_alloc_success_message_length
    call print_str

.heap_alloc_failure:

    xor eax, eax
    ret


; bool heap_test0() uses registers rax, rcx, rdx, r8
heap_test0:
    mov rcx, 1
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test0_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test0_failure_message

    xor al, al
    ret

.print_heap_alloc_test0_failure_message:
    lea rcx, [rel heap_alloc_test0_failure_message]
    mov rdx, heap_alloc_test0_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test0_failure_message:
    lea rcx, [rel heap_free_test0_failure_message]
    mov rdx, heap_free_test0_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test1() uses registers rax, rcx, rdx, r8
heap_test1:
    mov rcx, 2
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test1_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test1_failure_message

    xor al, al
    ret

.print_heap_alloc_test1_failure_message:
    lea rcx, [rel heap_alloc_test1_failure_message]
    mov rdx, heap_alloc_test1_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test1_failure_message:
    lea rcx, [rel heap_free_test1_failure_message]
    mov rdx, heap_free_test1_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test2() uses registers rax, rcx, rdx, r8
heap_test2:
    mov rcx, 4
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test2_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test2_failure_message

    xor al, al
    ret

.print_heap_alloc_test2_failure_message:
    lea rcx, [rel heap_alloc_test2_failure_message]
    mov rdx, heap_alloc_test2_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test2_failure_message:
    lea rcx, [rel heap_free_test2_failure_message]
    mov rdx, heap_free_test2_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test3() uses registers rax, rcx, rdx, r8
heap_test3:
    mov rcx, 8
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test3_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test3_failure_message

    xor al, al
    ret

.print_heap_alloc_test3_failure_message:
    lea rcx, [rel heap_alloc_test3_failure_message]
    mov rdx, heap_alloc_test3_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test3_failure_message:
    lea rcx, [rel heap_free_test3_failure_message]
    mov rdx, heap_free_test3_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test4() uses registers rax, rcx, rdx, r8
heap_test4:
    mov rcx, 16
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test4_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test4_failure_message

    xor al, al
    ret

.print_heap_alloc_test4_failure_message:
    lea rcx, [rel heap_alloc_test4_failure_message]
    mov rdx, heap_alloc_test4_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test4_failure_message:
    lea rcx, [rel heap_free_test4_failure_message]
    mov rdx, heap_free_test4_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test5() uses registers rax, rcx, rdx, r8
heap_test5:
    mov rcx, 32
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test5_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test5_failure_message

    xor al, al
    ret

.print_heap_alloc_test5_failure_message:
    lea rcx, [rel heap_alloc_test5_failure_message]
    mov rdx, heap_alloc_test5_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test5_failure_message:
    lea rcx, [rel heap_free_test5_failure_message]
    mov rdx, heap_free_test5_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test6() uses registers rax, rcx, rdx, r8
heap_test6:
    mov rcx, 64
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test6_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test6_failure_message

    xor al, al
    ret

.print_heap_alloc_test6_failure_message:
    lea rcx, [rel heap_alloc_test6_failure_message]
    mov rdx, heap_alloc_test6_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test6_failure_message:
    lea rcx, [rel heap_free_test6_failure_message]
    mov rdx, heap_free_test6_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test7() uses registers rax, rcx, rdx, r8
heap_test7:
    mov rcx, 128
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test7_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test7_failure_message

    xor al, al
    ret

.print_heap_alloc_test7_failure_message:
    lea rcx, [rel heap_alloc_test7_failure_message]
    mov rdx, heap_alloc_test7_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test7_failure_message:
    lea rcx, [rel heap_free_test7_failure_message]
    mov rdx, heap_free_test7_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test8() uses registers rax, rcx, rdx, r8
heap_test8:
    mov rcx, 256
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test8_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test8_failure_message

    xor al, al
    ret

.print_heap_alloc_test8_failure_message:
    lea rcx, [rel heap_alloc_test8_failure_message]
    mov rdx, heap_alloc_test8_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test8_failure_message:
    lea rcx, [rel heap_free_test8_failure_message]
    mov rdx, heap_free_test8_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test9() uses registers rax, rcx, rdx, r8
heap_test9:
    mov rcx, 512
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test9_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test9_failure_message

    xor al, al
    ret

.print_heap_alloc_test9_failure_message:
    lea rcx, [rel heap_alloc_test9_failure_message]
    mov rdx, heap_alloc_test9_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test9_failure_message:
    lea rcx, [rel heap_free_test9_failure_message]
    mov rdx, heap_free_test9_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test10() uses registers rax, rcx, rdx, r8
heap_test10:
    mov rcx, 1024
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test10_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test10_failure_message

    xor al, al
    ret

.print_heap_alloc_test10_failure_message:
    lea rcx, [rel heap_alloc_test10_failure_message]
    mov rdx, heap_alloc_test10_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test10_failure_message:
    lea rcx, [rel heap_free_test10_failure_message]
    mov rdx, heap_free_test10_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test11() uses registers rax, rcx, rdx, r8
heap_test11:
    mov rcx, 2048
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test11_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test11_failure_message

    xor al, al
    ret

.print_heap_alloc_test11_failure_message:
    lea rcx, [rel heap_alloc_test11_failure_message]
    mov rdx, heap_alloc_test11_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test11_failure_message:
    lea rcx, [rel heap_free_test11_failure_message]
    mov rdx, heap_free_test11_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test12() uses registers rax, rcx, rdx, r8
heap_test12:
    mov rcx, 4096
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test12_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test12_failure_message

    xor al, al
    ret

.print_heap_alloc_test12_failure_message:
    lea rcx, [rel heap_alloc_test12_failure_message]
    mov rdx, heap_alloc_test12_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test12_failure_message:
    lea rcx, [rel heap_free_test12_failure_message]
    mov rdx, heap_free_test12_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test13() uses registers rax, rcx, rdx, r8
heap_test13:
    mov rcx, 8192
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test13_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test13_failure_message

    xor al, al
    ret

.print_heap_alloc_test13_failure_message:
    lea rcx, [rel heap_alloc_test13_failure_message]
    mov rdx, heap_alloc_test13_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test13_failure_message:
    lea rcx, [rel heap_free_test13_failure_message]
    mov rdx, heap_free_test13_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test14() uses registers rax, rcx, rdx, r8
heap_test14:
    mov rcx, 16384
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test14_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test14_failure_message

    xor al, al
    ret

.print_heap_alloc_test14_failure_message:
    lea rcx, [rel heap_alloc_test14_failure_message]
    mov rdx, heap_alloc_test14_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test14_failure_message:
    lea rcx, [rel heap_free_test14_failure_message]
    mov rdx, heap_free_test14_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test15() uses registers rax, rcx, rdx, r8
heap_test15:
    mov rcx, 32768
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test15_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test15_failure_message

    xor al, al
    ret

.print_heap_alloc_test15_failure_message:
    lea rcx, [rel heap_alloc_test15_failure_message]
    mov rdx, heap_alloc_test15_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test15_failure_message:
    lea rcx, [rel heap_free_test15_failure_message]
    mov rdx, heap_free_test15_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test16() uses registers rax, rcx, rdx, r8
heap_test16:
    mov rcx, 65536
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test16_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test16_failure_message

    xor al, al
    ret

.print_heap_alloc_test16_failure_message:
    lea rcx, [rel heap_alloc_test16_failure_message]
    mov rdx, heap_alloc_test16_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test16_failure_message:
    lea rcx, [rel heap_free_test16_failure_message]
    mov rdx, heap_free_test16_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test17() uses registers rax, rcx, rdx, r8
heap_test17:
    mov rcx, 131072
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test17_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test17_failure_message

    xor al, al
    ret

.print_heap_alloc_test17_failure_message:
    lea rcx, [rel heap_alloc_test17_failure_message]
    mov rdx, heap_alloc_test17_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test17_failure_message:
    lea rcx, [rel heap_free_test17_failure_message]
    mov rdx, heap_free_test17_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test18() uses registers rax, rcx, rdx, r8
heap_test18:
    mov rcx, 262144
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test18_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test18_failure_message

    xor al, al
    ret

.print_heap_alloc_test18_failure_message:
    lea rcx, [rel heap_alloc_test18_failure_message]
    mov rdx, heap_alloc_test18_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test18_failure_message:
    lea rcx, [rel heap_free_test18_failure_message]
    mov rdx, heap_free_test18_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test19() uses registers rax, rcx, rdx, r8
heap_test19:
    mov rcx, 524288
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test19_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test19_failure_message

    xor al, al
    ret

.print_heap_alloc_test19_failure_message:
    lea rcx, [rel heap_alloc_test19_failure_message]
    mov rdx, heap_alloc_test19_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test19_failure_message:
    lea rcx, [rel heap_free_test19_failure_message]
    mov rdx, heap_free_test19_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test20() uses registers rax, rcx, rdx, r8
heap_test20:
    mov rcx, 1048576
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test20_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test20_failure_message

    xor al, al
    ret

.print_heap_alloc_test20_failure_message:
    lea rcx, [rel heap_alloc_test20_failure_message]
    mov rdx, heap_alloc_test20_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test20_failure_message:
    lea rcx, [rel heap_free_test20_failure_message]
    mov rdx, heap_free_test20_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test21() uses registers rax, rcx, rdx, r8
heap_test21:
    mov rcx, 2097152
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test21_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test21_failure_message

    xor al, al
    ret

.print_heap_alloc_test21_failure_message:
    lea rcx, [rel heap_alloc_test21_failure_message]
    mov rdx, heap_alloc_test21_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test21_failure_message:
    lea rcx, [rel heap_free_test21_failure_message]
    mov rdx, heap_free_test21_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test22() uses registers rax, rcx, rdx, r8
heap_test22:
    mov rcx, 4194304
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test22_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test22_failure_message

    xor al, al
    ret

.print_heap_alloc_test22_failure_message:
    lea rcx, [rel heap_alloc_test22_failure_message]
    mov rdx, heap_alloc_test22_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test22_failure_message:
    lea rcx, [rel heap_free_test22_failure_message]
    mov rdx, heap_free_test22_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test23() uses registers rax, rcx, rdx, r8
heap_test23:
    mov rcx, 8388608
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test23_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test23_failure_message

    xor al, al
    ret

.print_heap_alloc_test23_failure_message:
    lea rcx, [rel heap_alloc_test23_failure_message]
    mov rdx, heap_alloc_test23_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test23_failure_message:
    lea rcx, [rel heap_free_test23_failure_message]
    mov rdx, heap_free_test23_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test24() uses registers rax, rcx, rdx, r8
heap_test24:
    mov rcx, 16777216
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test24_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test24_failure_message

    xor al, al
    ret

.print_heap_alloc_test24_failure_message:
    lea rcx, [rel heap_alloc_test24_failure_message]
    mov rdx, heap_alloc_test24_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test24_failure_message:
    lea rcx, [rel heap_free_test24_failure_message]
    mov rdx, heap_free_test24_failure_message_length
    call print_str

    mov al, 1
    ret

; bool heap_test25() uses registers rax, rcx, rdx, r8
heap_test25:
    mov rcx, 33554432
    call heap_alloc
    test rax, rax
    je .print_heap_alloc_test25_failure_message

    mov rcx, rax
    call heap_free
    test rax, rax
    je .print_heap_free_test25_failure_message

    xor al, al
    ret

.print_heap_alloc_test25_failure_message:
    lea rcx, [rel heap_alloc_test25_failure_message]
    mov rdx, heap_alloc_test25_failure_message_length
    call print_str

    mov al, 1
    ret

.print_heap_free_test25_failure_message:
    lea rcx, [rel heap_free_test25_failure_message]
    mov rdx, heap_free_test25_failure_message_length
    call print_str

    mov al, 1
    ret