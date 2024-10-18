%include 'string.asm'

;; Mov 0 to edx to set automatic permissions, 1 to edx to specify permissions in ecx
;; Mov filename to ebx before call. The file descriptor is returned in eax
create:
    cmp edx, 1
    je .createNew
    
    .setPermissions:
        push ecx
        mov ecx, 0777o

    .createNew:
        mov eax, 8
        int 0x80

    pop ecx
    ret

;; Mov the file descriptor to ebx and the contents to write to ecx before call
write:
    mov eax, ecx
    call strlen

    mov edx, eax
    mov eax, 4
    int 0x80
    ret
