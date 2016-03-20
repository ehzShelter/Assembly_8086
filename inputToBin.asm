    .model small
    .stack 100h
    .data
         
    
    .code
    
        main proc
                  
            mov cl,30h          ;use as counter
                  
            mov ah,01           ;take input
            int 21h
            mov bh,al
            
            mov ah,02
            mov dl,09h
            int 21h             ;print tab
            
            cmp bh,41h          ;check letter/number
            jge convertNum
            jmp printBin
            
            
     
    convertNum:
            
            sub bh,55
            jmp printBin
            
            
    printBin:
            
            cmp cl,38h
            je EXIT
            rol bh,1 
            jc LABEL01
            jnc LABEL0  
            
   skipPrint:
   
            inc cl
            jmp printBin
            
            
   LABEL01:
            cmp cl,33h
            jle skipPrint
            
            ;mov ah,02
            mov dl,'1'
            int 21h
            
            inc cl
            jmp printBin
            
    
   LABEL0:          
            
            cmp cl,33h
            jle skipPrint
            
            ;mov ah,02
            mov dl,'0'
            int 21h
            
            inc cl
            jmp printBin
                     
   EXIT:
            
            mov ah,4ch
            int 21h
            
            
     main endp
     end main