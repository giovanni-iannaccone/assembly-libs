;; Mov a pointer to the list of arguments in ecx before call ( address lenght, address and file descriptor )
;; Mov 0 to ecx and the file descriptor to ebx to use standard arguments instead. 
;; The file descriptor of the new socket is returned in eax
accept:
    cmp ecx, 0
    jnz .start

    .default:
        push byte 0
        push byte 0
        push ebx
        mov ecx, esp

    .start:
        mov ebx, 5
        mov eax, 102
        int 0x80
        ret

;; Mov a pointer to the list of arguments in ecx before call ( ip address, port and addr family )
;; Mov 0 to ecx to use standard arguments instead
bind:
    mov edi, eax
    cmp ecx, 0
    jnz .start

    .default:
        push dword 0x00000000
        push word 0x1f40
        push word 2
        mov ecx, esp
        push byte 16
        push ecx
        push edi
        mov ec esp

    .start:
        mov ebx, 2
        mov eax, 102
        int 0x80
        ret

;; Mov the file descriptor to the stack before call
close:
    mov ebx, esi
    mov eax, 6
    int 0x80
    ret

;; Mov a pointer to the list of arguments in ecx before call ( max queue lenght and file descriptor )
listen:
    mov ebx, 4
    mov eax, 102
    int 0x80
    ret

;; Mov a pointer to the list of arguments in ecx before call ( ip protocol, connection-based protocol and addr family )
;; Mov 0 to ecx to use standard arguments instead
socket:
    cmp ecx, 0
    jnz .start

    .default:
        push byte 6
        push byte 1
        push byte 2
        mov ecx, esp

    .start:
        mov ebx, 1
        mov eax, 102
        int 0x80
        ret

;; Send and receive calls are not implemented as they are equal to the file write and read. 
;; Pass the socket file descriptor to the subroutines in files.asm