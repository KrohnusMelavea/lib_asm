; External Symbols
extern GetStdHandle     ; https://learn.microsoft.com/en-us/windows/console/getstdhandle

; Includes
%include 'src/memeq.asm'

; Exported Symbols
global EntryPoint

; Instruction Segment
section .text
EntryPoint:
    sub rsp, 8

    sub rsp, 256
    
    add rsp, 256

    add rsp, 8

    xor eax, eax
    ret