; Includes
%include 'c:/se/personal/lib_asm/src/count_u32_digits.asm'

; Constant Data Segment
NULL equ 0

; u08 u32_to_null_str(u32, char*) uses registers rax, rcx, rdx, r8, r9, r10, r11
u32_to_null_str:
    call count_u32_digits
    mov r8b, al                 ; r8b = number of digits
    mov r9, rdx                 ; r9 = char*
    mov eax, ecx                ; eax = u32 dividend
    mov r11d, 10                ; r11w = u08 divisor
    
    add r9b, r8b
    mov byte [r9], NULL
    dec r9

.u32_to_null_str_loop_start:
    xor edx, edx
    div r11d

    mov r10b, '0'
    add r10b, dl
    mov byte [r9], r10b
    
    dec r9

    test eax, eax
    jne .u32_to_null_str_loop_start

    mov al, r8b
    ret