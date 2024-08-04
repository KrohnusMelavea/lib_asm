; Attempt doing 10 comps and writing them all to an 8bit int, then checking position of most significant bit

; u08 count_u32_digits(u32) uses registers rax, rcx
count_u32_digits:
    cmp ecx, 10
    jb .count_u32_digits_1_digit
    cmp ecx, 100
    jb .count_u32_digits_2_digits
    cmp ecx, 1000
    jb .count_u32_digits_3_digits
    cmp ecx, 10000
    jb .count_u32_digits_4_digits
    cmp ecx, 100000
    jb .count_u32_digits_5_digits
    cmp ecx, 1000000
    jb .count_u32_digits_6_digits
    cmp ecx, 10000000
    jb .count_u32_digits_7_digits
    cmp ecx, 100000000
    jb .count_u32_digits_8_digits
    cmp ecx, 1000000000
    jb .count_u32_digits_9_digits
    
    mov al, 10
    ret

.count_u32_digits_1_digit:
    mov al, 1
    ret
.count_u32_digits_2_digits:
    mov al, 2
    ret
.count_u32_digits_3_digits:
    mov al, 3
    ret
.count_u32_digits_4_digits:
    mov al, 4
    ret
.count_u32_digits_5_digits:
    mov al, 5
    ret
.count_u32_digits_6_digits:
    mov al, 6
    ret
.count_u32_digits_7_digits:
    mov al, 7
    ret
.count_u32_digits_8_digits:
    mov al, 8
    ret
.count_u32_digits_9_digits:
    mov al, 9
    ret