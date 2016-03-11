                          .model small
            .stack 100h
            .data   
               num db ?  
            .code
            
                main proc  
                    
                  mov ax,@data
                  mov ds,ax  
                  mov ah,1            ;input
                  
                  int 21h    
                  mov num,al
                  mov bl,num
                  sub bl,17
                                      ;output
                  mov ah,2
                  mov dl,'1'
                  int 21h
                  mov dl,bl
                  int 21h                    

               main endp
               end main