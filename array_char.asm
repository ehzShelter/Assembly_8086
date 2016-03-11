                    ;store input char in array and print in reverse way using [DI]         
         
         .model small
         .stack 100h
         .data
         
            arr db ?,?,?,?,?
            
         .code
         
             main proc
                
                    mov ax,@data
                    mov ds,ax
                    
          INPUT:    mov ah,01           ;input
                    int 21h
                    mov arr[DI],al
                    inc DI
                    
                    cmp DI,5            ;check
                    je TAB           
                    jmp INPUT         
                    
                    
          TAB:      mov ah,02
                    mov dl,09h          ;print tab
                    int 21h
                    jmp OUTPUT         
                    
          OUTPUT:   dec DI
                    mov ah,02
                    mov dl,arr[DI]
                    int 21h
                    
                    cmp DI,0           ;check
                    je END
                    jmp OUTPUT

           END:     mov ah,4ch
                    int 21h
                
           main endp
           end main