;; Mov the number in eax before call
abs:
    push ebx

    mov ebx, eax
    neg eax
    cmovl eax, ebx
    
    pop ebx
    ret

;; Mov the number in eax before call
factorial:
    push edx
    push ecx

    mov edx, eax
    mov ecx, 1

    .loop:
        imul eax, ecx
        inc ecx
        cmp ecx, edx
        jne loop
    
    .done:
        pop ecx
        pop edx
        ret

;; Move the base in eax and the exponent in ebx before call
pow:
    push ecx
    push edx
    mov ecx, 1
    mov edx, eax

    .loop:
        imul eax, edx
        inc ecx
        cmp ecx, ebx
        jne .loop

    .done:
        pop edx
        pop ecx
        ret