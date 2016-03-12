;take three digit input to find the min

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
          
          mov ah,01
          int 21h
          mov num1,al
          int 21h
          mov num2,al
          int 21h
          mov num3,al  
          
          mov ah,02
          mov dl,09h
          int 21h
          
          mov cl,num2
          cmp num1,cl
          jl inter_num1
          jmp inter_num2
          
          
     inter_num1:
               
          mov cl,num3
          cmp num1,cl
          jl min_num1
          jmp min_num3
          
     inter_num2:
     
          mov cl,num3
          cmp num2,cl
          jl min_num2
          jmp min_num3
          
          
     min_num1: 
            
          mov dl,num1
          int 21h
          jmp EXIT
          
     min_num2:
            
          mov dl,num2
          int 21h
          jmp EXIT
          
    min_num3:
            
          mov dl,num3
          int 21h
          jmp EXIT
          
    EXIT:   
    
          mov ah,4ch
          int 21h     
       
        main endp
        end main
    
    