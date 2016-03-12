    .model small
    .stack 100h
    .data
            
       intro db 'Welcome to the cold cove !! $'
       askAge db 'Enter your age: $'
       underAge db 'Ooops !! 18+ only allows$'
       validAge db 'Permission granted $'
    
    
    .code 
    
        main proc
            
            mov ax,@data
            mov ds,ax
            
            mov ah,09
            lea dx,intro
            int 21h
             
            mov ah,02
            mov dl,0Ah
            int 21h
            mov dl,0Dh
            int 21h
            
            mov ah,09
            lea dx,askAge
            int 21h
            
            mov ah,01
            int 21h
            mov ch,al
            int 21h
            mov cl,al
            
            cmp ch,31h
            jg VALID 
            je check_2
            jmp INVALID
            
              
   VALID:   
            mov ah,02
            mov dl,09h
            int 21h
            mov ah,09
            lea dx,validAge    
            int 21h
            jmp EXIT  
           
    
   INVALID: 
   
            mov ah,02
            mov dl,09h
            int 21h
            mov ah,09
            lea dx,underAge
            int 21h 
            jmp EXIT
    
    
   check_2: 
            
            cmp cl,38h
            jge VALID
            jmp INVALID
           
   EXIT:
            mov ah,4ch
            int 21h
            
       main endp
       end main