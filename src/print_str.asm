; External Symbols
extern WriteFile        ; https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-writefile

; Constant Data Segment
NULL equ 0

; void print_str(char*, u64) uses registers rcx, rdx, r8, r9
print_str:
    mov r8, rdx                                             ; nNumberOfBytesToWrite     2
    mov rdx, rcx                                            ; lpBuffer                  1
    mov rcx, qword [rel process_handle]                     ; hFile                     0
    lea r9, [rel byte_write_count]                          ; lpNumberOfBytesWritten    3
    mov qword [rsp - 8], NULL                               ; lpOverlapped              4
    sub rsp, 32 + 8 + 8
    call WriteFile
    add rsp, 32 + 8 + 8
    ret