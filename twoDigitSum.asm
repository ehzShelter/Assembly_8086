                        .model small
      .stack 100h
      .data
      
        txt1 db 'Enter two numbers: $'
        txt2 db 'The sum of $'
        txt3 db ' and $'
        txt4 db ' is : $'
        num1 db ?
        num2 db ?
        
      .code 
      
      main proc
      
        mov ax,@data            ;prepare data segment
        mov ds,ax
        
        mov ah,09               ;print string                                             
        lea dx,txt1
        int 21h                             
        
        mov ah,01               ;char input
        int 21h
        mov num1,al
        int 21h
        mov num2,al
        
        mov cl,num1
        add cl,num2 
        mov bl,'0'
        
        cmp cl,'9'
        jg twoDigit
        jmp OUTPUT  
   
   
   
   twoDigit:    
   
        sub cl,3Ah
        mov bl,'1'
        jmp OUTPUT
        
        
   OUTPUT: 
        
        mov ah,02           ;print newline
        mov dl,0Ah
        int 21h
        mov dl,0Dh
        int 21h
        
        mov ah,09           ;string output
        lea dx,txt2
        int 21h
        
        mov ah,02
        mov dl,num1
        int 21h
        
        mov ah,09
        lea dx,txt3         ;and
        int 21h
        
        mov ah,02
        mov dl,num2
        int 21h   
        
        mov ah,09h          ;is
        lea dx,txt4
        int 21h
        
        mov ah,02
        mov dl,bl
        int 21h
        mov dl,cl
        int 21h
        
        jmp EXIT
        
   EXIT:    
   
        mov ah,4ch
        int 21h
        
        
    main endp
    end main
        
        
   
     
        
                    
     
    