;; Mov an int to eax before call, the value will be returned in ebx
itoa:

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

system:
