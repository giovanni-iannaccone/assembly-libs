;; Mov start to edx, stop to ecx, step to ebx and function to eax before call

;; for (int i = edx; i == ecx; i += ebx)
forLoopE:
    push edx
    call eax
    pop edx
    
    add edx, ebx
    
    cmp edx, ecx
    je forLoop
    
    ret

;; for (int i = edx; i > ecx; i -= ebx)
forLoopG:
    push edx
    call eax
    pop edx
    
    sub edx, ebx
    
    cmp edx, ecx
    jg forLoop
    
    ret

;; for (int i = edx; i >= ecx; i -= ebx)
forLoopGE:
    push edx
    call eax
    pop edx
    
    sub edx, ebx
    
    cmp edx, ecx
    jge forLoop
    
    ret

;; for (int i = edx; i < ecx; i += ebx)
forLoopL:
    push edx
    call eax
    pop edx
    
    add edx, ebx
    
    cmp edx, ecx
    jl forLoop
    
    ret

;; for (int i = edx; i <= ecx; i += ebx)
forLoopLE:
    push edx
    call eax
    pop edx
    
    add edx, ebx
    
    cmp edx, ecx
    jle forLoop
    
    ret

;; for (int i = edx; i != ecx; i += ebx)
forLoopNE:
    push edx
    call eax
    pop edx
    
    add edx, ebx
    
    cmp edx, ecx
    jne forLoop
    
    ret