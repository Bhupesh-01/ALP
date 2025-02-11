section .data ;This section is used to declare initialized data or constants.
  word1 db 10,13,"Enter 5 64 bit numbers",10 ; stores whole space ;db 'define byte'
  len1 equ $-word1  ; current address($) means stores occupaid space of word1
 word2 db 10,13,"Entered 5 64 bit numbers",10  ;(10,13)newline and carriage return characters
 len2 equ $-word2

section .bss ; This section is for uninitialized data
   arr resd 200 ;An array reserved for storing user input, enough to hold 200 bytes.
   counter resb 1   ;A single byte to keep track of how many numbers the user has entered.
                    ; Reserve 1 byte for a counter
                    
section .text  ;This section contains the code (instructions).
   global start  ;Indicates that the 'start' label is the entry point of the program.
   start:

;display
mov rax,1
mov rdi,1
mov rsi,word1
mov rdx, len1
syscall 


;accept
mov byte[counter],05
mov rbx,00
  loop1:
        mov rax,0
        mov rdi,0
        mov rsi,arr
        add rsi,rbx
        mov rdx,17
        syscall
        add rbx,17
        dec byte[counter]
        jnz loop1

;display
mov rax,1
mov rdi,1
mov rsi,word2
mov rdx, len2
syscall


;Output Loop: This loop prints each of the 5 entered numbers by adjusting 
;the position in the arr array and using a system call to write to the terminal.
mov byte[counter],05
mov rbx,00
  loop2:
        mov rax,1
        mov rdi,1
        mov rsi,arr
        add rsi,rbx
        mov rdx,17
        syscall
        add rbx,17
        dec byte[counter]
        jnz loop2


;This code terminates the program using the exit system call.
mov rax, 60
mov rdi,0
syscall

