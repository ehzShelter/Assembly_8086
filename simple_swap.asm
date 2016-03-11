                         ;swap between two register
        .model small
        .stack 100h
        .data
        
        .code 
        
            main proc 
                
               mov cl,'X'
               mov ch,'Y'
               
               xchg cl,ch       ;swap
                 
               mov ah,02
               mov dl,cl        ;'X'
               int 21h
               mov dl,ch
               int 21h          ;'Y'
               
           main endp   
           end main
                
                
            
        