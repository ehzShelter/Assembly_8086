    .model small
    .stack 100h
    .data
    
    
    .code
    
        main proc   
            
   INPUT:    
            mov ah,01
            int 21h
            mov bl,al          
            XOR bl,20h
            mov ah,02
            mov dl,09h
            int 21h
            
            mov dl,bl
            int 21h
             
            mov dl,0Ah
            int 21h
            mov dl,0Dh
            int 21h
            
            cmp bl,'0' 
            je EXIT
            jmp INPUT 
            
    EXIT:   
            mov ah,4ch
            int 21h
            
             
        main endp
        end main