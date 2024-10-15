;; Mov the number in eax before call
factorial:
    push edx
    push ecx

    mov edx, eax
    mov ecx, 1

    factorialLoop:
        imul eax, ecx
        inc ecx
        cmp ecx, edx
        jne factorialLoop
    
    factorialDone:
        pop ecx
        pop edx
        ret

;; Move the base in eax and the exponent in ebx before call
pow:
    push ecx
    push edx
    mov ecx, 1
    mov edx, eax

    powLoop:
        imul eax, edx
        inc ecx
        cmp ecx, ebx
        jne powLoop

    powDone:
        pop edx
        pop ecx
        ret

;; Move the number in eax before call
sqrt:
