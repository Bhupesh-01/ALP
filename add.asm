section .data
n1 db 1
n2 db 4

msg db 10,"Addition is:"
msg_len equ $-msg

section .bss
sum resb 1

section .text
global start
start:

mov al,[n1]
mov bl,[n2]
add al,bl
mov byte[sum],al

mov rax,1
mov rdi,1
mov rsi ,msg
mov rdx ,msg_len
syscall

add byte[sum], 30h

mov rax,1
mov rdi,1
mov rsi ,sum
mov rdx ,1
syscall

mov rax ,60
syscall
