;take ascii code (hexa) as input and show corresponding letter (A-Z) as output [uppercase only]

    .model small
    .stack 100h
    .data
    
    .code
    
    
        main proc
            
          mov ah,01         ;input
          int 21h
          mov ch,al         ;first digit in ch
          int 21h           ;second digit in cl
          mov cl,al
                            ;compare with '4'
          cmp ch,34h
          je firstSet
          cmp ch,35h        ;compare with '5'
          je secondSet
          
          jmp EXIT
          
          
   firstSet:
   
          cmp cl,39h        ;compare within '9'
          jg firstSet_letter
          add cl,10h
          jmp OUTPUT
          
  firstSet_letter:
                           
           add cl,9h
           jmp OUTPUT
          
          
          
   secondSet:   
   
          cmp cl,39h
          jg secondSet_letter
          add cl, 20h
          jmp OUTPUT
          
          
   secondSet_letter:
   
          add cl,19h
          jmp OUTPUT       
   
   OUTPUT:  
                            ;show output
          mov ah,02
          mov dl,09h
          int 21h
          mov dl,cl
          int 21h
          
          
           
          
            
            
            
   EXIT:    
          mov ah,4ch
          int 21h        
            
            
      
            
            
        main endp
        end main