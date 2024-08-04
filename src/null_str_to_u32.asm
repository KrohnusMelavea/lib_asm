; Constant Data Segment
NULL equ 0

; u32 null_str_to_u32(char*) uses registers rax, rcx, r8, r9
null_str_to_u32:
    xor eax, eax
    mov r8d, 10
    mov byte al, [rcx]
    sub al, '0'
    inc rcx

.null_str_to_u32_loop_start:
    mov byte r9b, [rcx]

    test r9b, r9b
    je .null_str_to_u32_loop_end

    sub r9b, '0'
    
    mul r8d
    add eax, r9d

    inc rcx
    jmp .null_str_to_u32_loop_start
.null_str_to_u32_loop_end:
    ret