%include 'string.asm'

;; Mov the array address to eax before call and the length to ebx
arrayIntPrint:
    push ecx
    push edx

    xor ecx, ecx
    mov edx, eax

    .loop:
        cmp ecx, ebx
        je .done
        
        mov eax, [edx + ecx * 4]
        call intPrint
        inc ecx
        jmp .loop

    .done:
        pop edx
        pop ecx
        ret

;; Mov an int to eax before call
intPrint:
    push eax
    push ecx
    push edx
    push esi
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
    
    .printLoop:
        dec ecx
        mov eax, esp
        call stringPrint
        pop eax
        cmp ecx, 0
        jnz .printLoop
    
        pop esi
        pop edx
        pop ecx
        pop eax
        ret

;; Mov an int to eax before call
intPuts:
    call intPrint

    push eax
    mov eax, 0xA
    push eax
    
    mov eax, esp
    call intPrint
    
    pop eax
    pop eax
    ret

;; Mov the var where the input will be put to eax before call
scan:
    push eax
    push ebx
    push ecx
    push edx 

    mov edx, 8
    mov ecx, eax
    mov ebx, 0
    mov eax, 3
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

;; Mov a string to eax before call
stringPrint:
    push edx
    push ecx
    push ebx
    push eax
    call strlen
 
    mov edx, eax
    pop eax
 
    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 0x80
 
    pop ebx
    pop ecx
    pop edx
    ret

;; Mov a string to eax before call
stringPuts:
    call stringPrint
    
    push eax
    mov eax, 0xA
    push eax
    
    mov eax, esp
    call print
    
    pop eax
    pop eax
    ret