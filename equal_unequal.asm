              ;compare two input char and display Equal/Unequal (in a loop)
        .model small
        .stack 100h
        .data
        
            x db ?
            ;y db ?
            eq db 'Equal $'
            uneq db 'Unequal $'
            
        .code
            
            main proc
             
                mov ax,@data
                mov ds,ax
                
        LOOP:   mov ah,01       ;input char
                int 21h
                mov x,al
                int 21h
                ;mov y,al
                
                cmp x,al        ;compare char
                
                mov ah,02       ;output char
                mov dl,09h      ;tab
                int 21h        
                
                je  EQUAL       ;if equal
                jmp UNEQUAL     ;if not equal
                
       newline: mov ah,02       ;newline
                mov dl,0Ah
                int 21h
                mov dl,0Dh
                int 21h
                
                jmp LOOP         
          
       EQUAL:   mov ah,09       ;string output
                lea dx,eq
                int 21h
                jmp newline
       UNEQUAL: 
                mov ah,09
                lea dx,uneq
                int 21h
                jmp newline
                   
                
            main endp
            end main