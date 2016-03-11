                   ;inter conversion between capital and small letters (show 0 if invalid letter)
    .model small
    .stack 100h
    .data
         
         input db ? 
        
    .code
    
        main proc 
                 
            mov ax,@data
            mov ds,ax
            
       INP:     
 
            mov ah,01           ;input
            int 21h
            mov input,al
            
            cmp input,'A'       ;check if letter is capital
            jl INVALID
            cmp input,'Z'
            jle BIG 
            cmp input,'a'
            jl INVALID
            cmp input,'z'
            jle SMALL
            jg INVALID 
         
        SMALL:
        
            sub input,32
            jmp OUTPUT    
           
        BIG:    
        
            add input,32
            jmp OUTPUT 

        INVALID:
        
             mov input,'0'
             jmp OUTPUT
                 
        OUTPUT: 
        
            mov ah,02          ;print char 
            mov dl,input
            int 21h
            mov dl,09h        ;newline
            int 21h
            
            jmp INP           ;loop for input            
            
        EXIT:   
        
            mov ah,4ch
            int 21h

        main endp
        end main
            
            
            