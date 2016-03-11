              ;reverse print by indexing register and using loop        
        
        .model small
        .stack 100h
        .data
        
        .code 
            main proc
                
        INPUT:  mov ah,01       ;input char
                int 21h
                
                mov bx[DI],al
                inc DI
                
                cmp DI,5        ;check 5 input
                je TAB
                jmp INPUT
                
        TAB:    mov ah,02       ;print tab
                mov dl,09h
                int 21h        
                jmp OUTPUT

        OUTPUT:  
                ;for reverse print
                dec DI
                mov dl,bx[DI]
                int 21h
                cmp DI,0
                
                ;for normal print
                ;mov dl,bx[SI]
                ;int 21h
                ;inc SI 
                ;cmp SI,DI 

                je END
                jmp OUTPUT 

        END:    mov ah,4ch
                int 21h         

           main endp
           end main
                