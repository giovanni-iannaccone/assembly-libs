%include 'string.asm'
%include 'stdlib.asm'

;; Mov an int to eax before call
intPrint:
    push eax
    push ebx

    call itoa
    mov eax, ebx
    call stringPrint
    pop ebx
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