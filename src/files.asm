%include 'string.asm'

O_RDONLY    equ 0
O_WRONLY    equ 1
O_RDWR      equ 2

;; Mov the file descriptor to ebx before call
close:
    mov eax, 6
    int 0x80
    ret

;; Mov 0 to edx to set automatic permissions, 1 to edx to specify permissions in ecx
;; Mov filename to ebx before call. The file descriptor is returned in eax
create:
    cmp edx, 1
    je .createNew
    
    .setAutomaticPermissions:
        push ecx
        mov ecx, 0777o

    .createNew:
        mov eax, 8
        int 0x80

    pop ecx
    ret

;; Mov the filename to ebx before call
delete:
    mov eax, 10
    int 0x80
    ret

;; Mov the access mode to ecx and the file name to ebx before call. The file descriptor is returned in eax
open:
    mov eax, 5
    int 0x80
    ret

;; Mov the number of bytes to read to edx the variable where to put the contents to ecx and the file descriptor to ebx
read:
    mov eax, 3
    int 0x80
    ret

;; Mov the file descriptor to ebx and the contents to write to ecx before call
write:
    push edx
    mov eax, ecx
    call strlen

    mov edx, eax
    mov eax, 4
    int 0x80

    pop edx
    ret