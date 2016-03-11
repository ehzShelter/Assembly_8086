                   .model small
    .stack 100h
    .data
        
        letter db ?   
        err db 'INVALID INPUT$'
      
    .code
    
        main proc
          
            mov ax,@data
            mov ds,ax
            
  INPUT:   mov ah,01            ;take input
           int 21h
           mov letter,al
           
           cmp letter,41h       
           jl ERROR               ;less than 'A'
           cmp letter,5Ah
           jle to_lower           ;less than or equal 'Z'
           cmp letter,61h
           jl ERROR               ;less than 'a'
           cmp letter,7Ah
           jle to_upper           ;less than or equal 'z'
           
           jmp ERROR 
  
  ERROR:    
           mov ah,02            ;print newline
           mov dl,09h
           int 21h
           
           mov ah,09            ;print error msg
           lea dx,err
           int 21h
           
           mov ah,02
           mov dl,0Ah
           int 21h
           mov dl,0Dh
           int 21h
           
           jmp INPUT    
           
  to_upper: sub letter,32
            jmp OUTPUT
           
  to_lower: add letter,32
            jmp OUTPUT
  
  OUTPUT:   
            
          mov ah,02            ;print newline
          mov dl,09h
          int 21h
      
          mov dl,letter
          int 21h 
          mov dl,0Ah
          int 21h
          mov dl,0Dh
          int 21h 
          jmp INPUT 
  EXIT:     
          
          mov ah,4ch
          int 21h
    
        main endp
        end main