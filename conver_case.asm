    .model small
    .stack 100h
    .data  
    
        lower db 'Lower: $'
        upper db 'Upper: $'
        inval db 'INVALID INPUT $'
    
    .code
    
        main proc 
            
            mov ax,@data
            mov ds,ax
                   
            mov ah,01
            int 21h
            mov cl,al
            
            cmp cl,'A'
            jl ERROR
            cmp cl,'Z'
            jle to_lower       
            cmp cl,'a'
            jl ERROR
            cmp cl,'z'
            jle to_upper
            
            jmp ERROR
            
               
               
  to_lower: 
                                      ;convert to lower
            OR cl,20h
            jmp lower_label
            
  to_upper: 
  
            
            XOR cl,20h              ;convert to upper
            jmp upper_label
            
            
  lower_label:  
              
             mov ah,02
             mov dl,09h
             int 21h
             lea dx,lower
             jmp OUTPUT  
             
  upper_label:   
             
             mov ah,02
             mov dl,09h
             int 21h   
             lea dx,upper
             jmp OUTPUT
        
            
  OUTPUT:   
            
            mov ah,09
            int 21h
            
            mov ah,02
            mov dl,cl
            int 21h 
            
            jmp EXIT 
            
  ERROR:                             ;show error msg on invalid input
            mov ah,2
            mov dl,09h
            int 21h
            
            mov ah,09
            lea dx,inval
            int 21h 
            
            
  EXIT:                             ;terminate
            mov ah,4ch
            int 21h
               
        main endp
        end main