                         ;add two numbers(input) and show two digits 
        .model small
        .stack 100h
        .data
           
           num1 db ?
           num2 db ?
           res db ? 
        
        .code
               main proc
               
                mov ax,@data        ;prepare data segment
                mov ds,ax
                
       INPUT:   mov ah,01           ;input char
                int 21h
                mov num1,al
                int 21h 
                mov num2,al
                
                mov cl,num1         ;adding and converting to decimal
                add cl,num2 
                sub cl,30h
                mov res,cl
                
                cmp res,39h         ;if result is greater than 
                jg twoDigit
                
                mov ah,02           ;output char
                mov dl,09h          ;tab
                int 21h
                mov dl,res
                int 21h
                jmp EXIT
            
     twoDigit:                     ;if result is of two digit
                 mov ah,02         ;output char
                 mov dl,09h
                 int 21h
                 mov dl,'1'    
                 int 21h
                 sub res,10        ;show first digit in decimal
                 mov dl,res
                 int 21h        
        
     EXIT:       mov ah,4ch        ;return 0
                 int 21h 
         
         main endp
         end main        
                                    
        