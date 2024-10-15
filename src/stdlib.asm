;; Mov an int to eax before call, the value will be returned in ebx
itoa:

;; Mov a numeric string to ebx before call, the value will be returned in eax
atoi:
    push ebx
    mov eax, 0

    atoiConvertLoop:
        movzx ecx, byte [ebx]
        test ecx, ecx
        je atoiDone
        
        cmp ecx, 48
        jl atoiError
        
        cmp ecx, 57
        jg atoiError
        
        sub ecx, 48
        imul eax, eax, 10
        add eax, ecx
        
        inc ebx
        jmp atoiConvertLoop

    atoiError:
        mov eax, -1

    atoiDone:
        pop ebx
        ret

system:
