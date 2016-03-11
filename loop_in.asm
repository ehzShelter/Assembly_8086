                              ;take input char and increment by 1 in a loop     
        .model small
        .stack 100h
        .data
            a db ?
            text db 'THE END $'
        .code
        
            main proc
                
              mov ax,@data
              mov ds,ax
              
     LOOP:    mov ah,01
              int 21h
              mov a,al
              inc a             ;increment by 1

              mov ah,02         ;output
              mov dl,a
              int 21h

              
              mov ah,01         ;input
              int 21h
              cmp al, 0Dh
              je LOOP
              jmp END
       
    END:      mov ah,09         ;string output
              lea dx,text
              int 21h

              mov ah,4ch 
              int 21h        
                
          main endp
          end main