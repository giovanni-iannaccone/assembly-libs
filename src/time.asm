;; The current time will be returned in eax
currentTime:
    mov eax, 13
    int 0x80
    ret