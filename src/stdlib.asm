;; Mov a numeric string to ebx before call, the value will be returned in eax
atoi:
    push ebx
    mov eax, 0

    .convertLoop:
        movzx ecx, byte [ebx]
        test ecx, ecx
        je .done
        
        cmp ecx, 48
        jl .error
        
        cmp ecx, 57
        jg .error
        
        sub ecx, 48
        imul eax, eax, 10
        add eax, ecx
        
        inc ebx
        jmp .convertLoop

    .error:
        mov eax, -1

    .done:
        pop ebx
        ret

;; Mov an int to eax before call, the value will be returned in ebx
itoa:
    mov ebp, esp
    mov ecx, 0
 
    .divideLoop:
        inc ecx
        mov edx, 0
        mov esi, 10
        idiv esi
        add edx, 48
        push edx
        cmp eax, 0
        jnz .divideLoop
    
    .done:
        mov ebx, esp
        mov esp, ebp
        ret
    
;; Mov the arguments to ecx and the command to ebx before call
system:
    push eax
    mov eax, 11

    int 0x80

    pop eax
    ret