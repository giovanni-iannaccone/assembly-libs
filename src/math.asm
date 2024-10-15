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

    done:
        pop edx
        pop ecx
        ret

sqrt:
