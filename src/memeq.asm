
; bool memeq(void* lhs, void* rhs, u64 size) uses registers rax, rcx, rdx, r8, r9b, r10b
memeq:
    xor rax, rax

.memeq_loop_start:
    cmp rax, r8
    je .memeq_equal

    mov r9b, [rcx + rax]
    mov r10b, [rdx + rax]
    cmp r9b, r10b
    jne .memeq_not_equal

    inc rax

.memeq_not_equal:
    xor rax, rax
    ret
.memeq_equal:
    mov rax, 1
    ret