                      .model small
            .stack 100h
            .data 
                
                ;a db ?
                inp db 'INPUT: $'    
                level0 db 'You have reached level 0 $'
                level01 db 'You have reached level 1 $'
                level02 db 'You have reached level 2 $'
                level03 db 'You have reached level 3 $'
                level04 db 'You have reached level 4 $'
                level05 db 'You have reached level 5 $'
                level06 db 'RESTRICTED $'
                inval db 'INVALID INPUT $'

            .code   
            
                    main proc

                    mov ax,@data
                    mov ds,ax
                    
            INPUT:   mov ah,09            ;print string
                    lea dx,inp
                    int 21h
                    
                    mov ah,01            ;input char
                    int 21h
                         
                    cmp al,'0'           ;if 0
                    je ZERO
                    cmp al,'1'           ;if 1
                    je ONE
                    cmp al,'2'           ;if 2
                    je TWO
                    cmp al,'3'           ;if 3
                    je THREE
                    cmp al,'4'           ;if 4
                    je FOUR
                    cmp al,'5'           ;if 5
                    je FIVE
                    cmp al,'6'            ;if 6
                    je SIX
                    
                    jne INVALID           ;not 0-6

            ZERO:  
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level0
                  int 21h
                  jmp EXIT
                   
            ONE:    
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level01
                  int 21h
                  jmp EXIT
                  
                  
            TWO:        
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level02
                  int 21h
                  jmp EXIT
                  
                  
           THREE:        
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level03
                  int 21h
                  jmp EXIT 
                  
          FOUR:        
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level04
                  int 21h
                  jmp EXIT 
                  
         FIVE:        
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level05
         
                  int 21h
                  jmp EXIT 
                  
         SIX:        
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,level06
                  int 21h
                  jmp EXIT
                  
         INVALID: 
                  mov ah,02            ;tab
                  mov dl,09h
                  int 21h
                  
                  mov ah,09
                  lea dx,inval
                  int 21h
                  jmp EXIT           
                  
         EXIT:    mov ah,4ch
                  int 21h
                                    
            main endp
            end main                                           