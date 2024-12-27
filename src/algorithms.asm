;; Mov the array address to eax, array's size to ebx, target to ecx, it's position will be returned in edx
search:
    xor edx, edx

    .loop:
        cmp edx, ebx
        je .notFound
    
        cmp [eax + edx * 4], ecx
        je .found

        inc edx
        jmp .loop

    .found:
        ret

    .notFound:
        mov edx, -1
        ret

;; Mov the array address to eax, array's size to ebx, 0 to ecx for increasing order 1 for decreasing
sort:
    push ebx
    push ecx
    push edx
    push esi

    xor ecx, ecx
    .outerLoop:
        mov esi, ecx
        inc esi

        .innerLoop:
            cmp esi, ebx
            jge .nextElement

            mov edx, [eax + ecx * 4]
            cmp edx, [eax + esi * 4]
            jle .noSwap

            mov edi, [eax + ecx * 4]
            mov edx, [eax + esi * 4]
            mov [eax + ecx * 4], edx
            mov [eax + esi * 4], edi

        .noSwap:
            inc esi
            jmp .innerLoop

        .nextElement:
            inc ecx
            cmp ecx, ebx
            jl .outerLoop

    pop esi
    pop edx
    pop ecx
    pop ebx
    ret