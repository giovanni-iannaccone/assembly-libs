accept:
    ret

;; Mov a pointer to the list of arguments in ecx before call, 0 to use standard arguments
bind:
    ret


close:
    mov ebx, esi
    mov eax, 6
    int 0x80
    ret

listen:
    ret

read:
    ret

;; Mov a pointer to the list of arguments in ecx before call, 0 to use standard arguments
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

write:
    ret