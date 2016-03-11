                    ;input char and check for vowel. Print 1 for vowel 0 otherwise

        .model small
        .stack 100h
        .data 
            
            char db ?
            vow db 30h
        .code
            main proc
                mov ax,@data
                mov ds,ax   
                
      INPUT:    
                
                mov vow,30h
                
                mov ah,01
                int 21h
                mov char,al
                
                cmp char,'a'
                je VOWEL
                cmp char,'e'
                je VOWEL
                cmp char,'i'
                je VOWEL
                cmp char,'o'
                je VOWEL
                cmp char,'u'
                je VOWEL
                jmp OUTPUT
                
        VOWEL:  
                add vow,1
                
         
         OUTPUT:    
                
                mov ah,02      ;print char
                mov dl,vow
                int 21h
                mov dl,09h
                int 21h
                jmp INPUT
          
         EXIT:  
                mov ah,4ch
                int 21h     

            main endp
            end main
    