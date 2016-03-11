               ;swap string with intermediate register       
        .model small
        .stack 100h
        .data
            txt01 dw 'Programmer$' 
            txt02 dw 'Hacker$'
         .code
         
             main proc 
                
                mov ax,@data
                mov ds,ax
                
                lea cx,txt01    ;load address of txt01 in cx
                lea bx,txt02    ;load address of txt02 in bx
                
                ;before swap
                
                mov ah,09       ;string print
                mov dx,cx       ;'Programmer'
                int 21h
                
                mov dx,bx       ;'Hacker'
                int 21h   
                
                ;swap
                xchg bx,cx       
                                              
                ;after swap
                mov dx,cx       ;'Hacker'
                int 21h
                mov dx,bx       ;'Programmer'
                int 21h
                
                mov ah,4ch      ;terminate
                int 21h
            main endp
            end main
            