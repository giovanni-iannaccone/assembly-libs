;; Mov a string to eax before call
strlen:
    push ebx
    mov ebx, eax
    
    nextchar:
        cmp byte [eax], 0
        jz finished
        inc eax
        jmp nextchar

    finished:
        sub eax, ebx
        pop ebx
        ret