; void memset(void* memory, u64 size, u08 fill) uses registers rcx, rdx, r8b
memset:
    xor rax, rax

.memset_loop_start:
    cmp rax, rdx
    je .memset_loop_end

    mov [rcx], r8b
    
    inc rcx
    jmp memset_loop_start
.memset_loop_end:

    ret
