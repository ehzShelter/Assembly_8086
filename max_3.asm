;take three digit as input and find the max

    .model small
    .stack 100h
    .data
       
       num1 db ?
       num2 db ?
       num3 db ?
       
    
    .code
    
        main proc
            
            mov ax,@data
            mov ds,ax
            
            mov ah,01           ;take input
            int 21h
            mov num1,al
            int 21h
            mov num2,al
            int 21h
            mov num3,al
                
            cmp num1,al          ;compare num1 with num3
            jg inter_max_1
            jmp inter_max_3
           
           
           
   inter_max_1: 
                
            mov cl,num2          ;compare num1 with num2
            cmp num1,cl 
            jg max_1
            jmp max_2
            
   inter_max_3:
   
            mov cl,num2          ;compare num3 with num2
            cmp num3,cl
            jg max_3
            jmp max_2
                
    
   max_1:  
            mov ah,02            ;if num1 is max
            mov dl,09h
            int 21h
            mov dl,num1 
            int 21h
            jmp EXIT
            
            
   max_2:
            mov ah,02            ;if num2 is max
            mov dl,09h
            int 21h
            mov dl,num2
            int 21h
            jmp EXIT  
            
   max_3:
            mov ah,02            ;if num3 is max
            mov dl,09h
            int 21h
            mov dl,num3
            int 21h
            jmp EXIT
        
            
   EXIT:                          ;terminate
            mov ah,4ch
            int 21h
            
            
         main endp
         end main
            
            
   
                    