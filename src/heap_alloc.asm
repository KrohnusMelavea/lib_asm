; External Symbols
extern HeapFree     ; https://learn.microsoft.com/en-us/windows/win32/api/heapapi/nf-heapapi-heapfree
extern HeapAlloc    ; https://learn.microsoft.com/en-us/windows/win32/api/heapapi/nf-heapapi-heapalloc

; void* heap_alloc(u64) uses registers rax, rcx, rdx, r8
heap_alloc:
    mov r8, rcx                                 ; dwBytes
    mov rcx, qword [rel process_heap_handle]    ; hHeap
    xor rdx, rdx                                ; dwFlags
    sub rsp, 32
    call HeapAlloc  ; uses registers rax, rcx, rdx, r8
    add rsp, 32

    ret

; bool heap_free(void*) uses registers rax, rcx, rdx, r8
heap_free:
    mov r8, rcx                                 ; lpMem
    mov rcx, qword [rel process_heap_handle]    ; hHeap
    xor rdx, rdx                                ; dwFlags
    sub rsp, 32
    call HeapFree
    add rsp, 32

    ret