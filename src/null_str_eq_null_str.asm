; Constant Data Segment
NULL equ 0

; u08 null_str_eq_null_str(char*, char*) uses registers rax, rcx, rdx, r8b, r9b
null_str_eq_null_str:
.null_str_eq_null_str_loop_start:
    mov r8b, byte [rcx]
    mov r9b, byte [rdx]

    cmp r8b, r9b
    jne .null_str_eq_null_str_not_equal

    test r9b, r9b
    je .null_str_eq_null_str_loop_equal

    inc rcx
    inc rdx

    jmp .null_str_eq_null_str_loop_start

.null_str_eq_null_str_not_equal:
    mov al, 0
    ret
.null_str_eq_null_str_loop_equal:
    mov al, 1
    ret