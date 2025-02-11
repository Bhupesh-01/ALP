%macro print 2
mov rax,1     ; Standard output
mov rdi,1     ; Input write
mov rsi,%1    ; Display message address
mov rdx,%2    ; Message length
syscall       ; Interrupt for kernel in 64-bit
%endmacro

%macro read 2
mov rax,0    
mov rdi,0     
mov rsi,%1  
mov rdx,%2    
syscall       
%endmacro


section .data
        m1 db 10,13,"enter a string: "
        l1 equ $-m1
        m2 db 10,13,"entered string: "
        l2 equ $-m2
        m3 db 10,13,"length is: "
        l3 equ $-m3

section .bss
        buffer resb 50
        size equ $-buffer
        count resb 1
        dispnum resb 2

section .text
        global start
        start:
              print m1,l1
              read buffer,size
              mov byte[count],al
              print m2,l2
              print buffer,[count]
              call display

;exit
      mov rax,60
      mov rbx,0
      syscall
display:
      mov rdi,dispnum
      mov bl,byte[count]
      mov rcx,2
      dec rbx

dispup1:
          rol bl,4
          mov dl,bl
          and dl,0fh
          add dl,30h
          cmp dl,39h
          jbe dispskip1
          add dl,07h
     dispskip1:
               mov [rdi],dl
               inc rdi
               loop dispup1


             print m3,l3
             print dispnum,2
ret
