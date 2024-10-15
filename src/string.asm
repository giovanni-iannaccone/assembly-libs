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
    
;; Mov the src to ebx and the dst to eax before call
strcpy:
    push ebx
    push eax

    mov esi, ebx
    mov edi, eax

copy_loop:
    lodsb
    stosb
    test al, al
    jnz copy_loop

    pop eax
    pop ebx
    mov eax, edi
    sub eax, 1
    ret