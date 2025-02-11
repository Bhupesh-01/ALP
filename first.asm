;to declare 
section .data
txt db 10,"hello bhupesh"
txt_len equ $-txt

section .text
global start
start:

; to display
mov rax,1
mov rdi,1
mov rsi,txt
mov rdx,txt_len
syscall


;to exit
mov rax,60
syscall


;nasm -f elf64 first.asm
;ld -o first first.o
;./first