                            ;swap between two varible with intermediate register
        .model small
        .stack 100h
        .data
            a db ?
            b db ?
        .code 
        
            main proc
               
             mov a,'1'
             mov b,'2'
             
             ;before swap
             mov ah,02
             mov dl,a           ;1
             int 21h
             mov dl,b           ;2
             int 21h 
             
             xchg dl,a        ;swap
             mov b,dl
             
             ;tab
             mov ah,02
             mov dl,09h
             int 21h 
             
             ;after swap      
             mov dl,a 
             int 21h            ;2
             mov dl,b
             int 21h            ;1
             
           main endp   
           end main
        