section .data
    text1 db "What is your name ? ", 0
    text1_len equ $ - text1
    text2 db "Hello, ", 0
    text2_len equ $ - text2
    newline db 10, 0

section .bss   
    name resb 16

section .text  
    global _start

_start:
    call _printText1
    call _getName
    call _printText2
    call _printName 
    
    ; Quitter le programme
    mov rax, 60         ; Syscall pour quitter
    mov rdi, 0          ; Code de sortie 0
    syscall

_printText1:
    ; Afficher le premier message
    mov rax, 1          ; Syscall write
    mov rdi, 1          ; Descripteur de fichier (stdout)
    mov rsi, text1      ; Adresse du message
    mov rdx, text1_len  ; Longueur du message
    syscall
    ret

_getName:
    ; Lire le nom de l'utilisateur
    mov rax, 0          ; Syscall read
    mov rdi, 0          ; Descripteur de fichier (stdin)
    mov rsi, name       ; Adresse du buffer
    mov rdx, 16         ; Taille maximale du nom
    syscall
    ret

_printText2:
    ; Afficher "Hello, "
    mov rax, 1          ; Syscall write
    mov rdi, 1          ; Descripteur de fichier (stdout)
    mov rsi, text2      ; Adresse du message
    mov rdx, text2_len  ; Longueur du message
    syscall
    ret

_printName:
    ; Afficher le nom
    mov rax, 1          ; Syscall write
    mov rdi, 1          ; Descripteur de fichier (stdout)
    mov rsi, name       ; Adresse du nom
    mov rdx, 16         ; Longueur maximale
    syscall
    ret
