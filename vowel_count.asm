            ;input char array. Count the number of vowels
        .model small
        .stack 100h
        .data 
            vow db 30h
            txt db 'Vowels: $'
        .code
            main proc

                mov ax,@data
                mov ds,ax   
                
      INPUT:    
                
                mov ah,01
                int 21h
                mov cl,al
        
                cmp cl,'a'
                je VOWEL
                cmp cl,'e'
                je VOWEL
                cmp cl,'i'
                je VOWEL
                cmp cl,'o'
                je VOWEL
                cmp cl,'u'
                je VOWEL
                
                cmp cl,'X'          ;stop input when X is entered  
                je OUTPUT         
                jmp INPUT
                
        VOWEL:  
                add vow,1
                jmp INPUT

        OUTPUT:    
                
                mov ah,02           ;print output
                mov dl,09h
                int 21h
                mov ah,09
                lea dx,txt
                int 21h
                mov ah,02
                mov dl,vow
                int 21h
          
         EXIT:  
                mov ah,4ch
                int 21h     
                
            main endp
            end main
                
                
                
                   
         
        