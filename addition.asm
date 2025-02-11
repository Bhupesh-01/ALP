section .data
n1 db 7
n2 db 5

msg db 10,"Addition is:"
msg_len equ $-msg

section .bss
sum resb 1

section .text
global start
start:

mov al,10

add al,5
mov byte[sum],al

mov rax,1
mov rdi,1
mov rsi ,msg
mov rdx ,msg_len
syscall

add byte[sum], 37h

mov rax,1
mov rdi,1
mov rsi ,sum
mov rdx ,1
syscall

mov rax ,60
syscall
