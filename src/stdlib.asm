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

;; Mov an int to eax before call, the value will be returned in the var pointed by ebx
itoa:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ecx

    mov esi, ebx
    mov edi, esi

    mov ecx, 0

    cmp eax, 0
    jge .convert_number

    neg eax
    mov byte [edi], '-'
    inc edi

    .convert_number:
        mov edx, 0
        mov esi, 10

    .divideLoop:
        inc ecx
        xor edx, edx
        div esi
        add edx, 48
        push edx
        test eax, eax
        jnz .divideLoop

    .writeDigits:
        pop eax
        mov [edi], al
        inc edi
        loop .writeDigits

        mov byte [edi], 0

        pop ecx
        pop edi
        pop esi
        mov esp, ebp
        pop ebp
        ret
    
;; Mov the arguments to ecx and the command to ebx before call
system:
    push eax
    mov eax, 11

    int 0x80

    pop eax
    ret