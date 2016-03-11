                 ;input A-I and display their corresponding ascii value
                .model small
                .stack 100h
                .data 
                
                   
                   asc db '4'
                   inval db 'INVALID INPUT$'
                   x db ?
                    
              .code 
                    main proc
              
                    mov ax,@data
                    mov ds,ax
                    
         INPUT:     mov ah,01           ;input char
                    int 21h
                    mov x,al
                    ;sub x,16
                    cmp x,'x'
                    je CHECK        
                    cmp x,'A'
                    jge OUTPUT01
                    ;jl INVALID
                                  
         
         OUTPUT01:  
         
                    cmp x,'I'
                    jg INVALID
                    
                    sub x,16
                    mov ah,02
                     
                    mov dl,asc
                    int 21h
                    mov dl,x
                    int 21h
                    
                    mov dl,0Ah
                    int 21h
                    mov dl,0Dh
                    int 21h
                    
                    jmp INPUT
                 
                  
                                    
          INVALID:     mov ah,09            ;print string
                       lea dx,inval
                       int 21h
                       mov ah,02
                       mov dl,0Ah
                       int 21h
                       mov dl,0Dh
                       int 21h
                       
                       
                       
                       jmp INPUT    
                  
                  
           CHECK:   ;mov ah,01
                    int 21h
                    mov x,al
                    cmp x,'x'
                    je EXIT
                    jne INPUT       
                  
                  
            EXIT:       mov ah,4ch
                        int 21h
                        
                        
                        main endp
                        end main         