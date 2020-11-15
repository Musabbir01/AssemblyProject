.model small
.stack 100h
.data
A db 1 dup(?)
B db 1 dup(?)
msg1 db "Number:$"
msg2 db "1:Addition",0dh,0ah,"2:Subtraction",0dh,0ah,"3:Divition",0dh,0ah,"4:Multiplication",0dh,0ah, '$'
msg3 db "Result:$" 
msg4 db "Power:$"
msg5 db "Number:$"
msg6 db "1-Calculator",0dh,0ah,"2-FindPower",0dh,0ah,"3-Factorial",0dh,0ah,"0-Exit",0dh,0ah,'$'
.code        

main proc
    
    mov ax,data
    mov ds,ax
    mov ah,9
    lea dx,msg6
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,'1'
    je calculate
    cmp al,'2'
    je FindPower
    cmp al,'3'
    je Factorial
    cmp al,'0'
    je Final
    
    Factorial:
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov ax,data
    mov ds,ax
    mov di,0
    mov si,0
    mov bh,0
    mov bl,10D 
           
   
    mov ah,9
    lea dx,msg1
    int 21h
    inputF:
    
    
    mov ah,1
    int 21h
    cmp al,0dh
    jne NumF
    
    jmp Fact
    
    NumF:
    sub al,30h
    mov cl,al
    mov al,bh
    mul bl
    add al,cl
    mov bh,al
    
    jmp inputF
    
    
    Fact:
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    and cx,0
    and ax,0
    mov al,bh
    mov cl,bh
    sub cl,1
    f:
    cmp cl,1
    jne DoFactorial
    je endF
    
    DoFactorial:
    mul cl
    dec cl
    jmp f
    
    
    endF:
    mov bh,al
    and ax,0
    mov al,bh
    mov cl,10D
    
    mov bx,0000H
    
    storeF:
    div cl
    mov [0000H+bx],ah
    add bx,2h
    mov ah,0
    cmp al,0
    jne storeF
    
    mov ah,2                            
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov ah,9
    lea dx,msg3
    int 21h
    
    printF:
    mov ah,2
    sub bx,2h
    mov dl,[0000H+bx]
    add dl,30h
    int 21h
    cmp bx,0
    jne printF
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    jmp main
    
    FindPower:
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ax,data
    mov ds,ax
    mov di,0
    mov si,0
    mov bh,0
    mov bl,10D 
           
   
    mov ah,9
    lea dx,msg5
    int 21h
    inputP:
    
    
    mov ah,1
    int 21h
    cmp al,0dh
    jne number1P
    
    jmp PowerP
    
    number1P:
    sub al,30h
    mov cl,al
    mov al,bh
    mul bl
    add al,cl
    mov bh,al
    
    jmp inputP
    
    
    PowerP:
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    and cx,0
    and ax,0
    mov ah,9
    lea dx,msg4
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov cl,al
    and ax,0
    mov al,bh
    mov dh,bh
    cp:
    cmp cl,1
    je endPo
    mul dh
    dec cl
    jmp cp
    
    endPo:
    mov bh,al
    and ax,0
    mov al,bh
    mov cl,10D
    
    mov bx,0000H
    
    storeP:
    div cl
    mov [0000H+bx],ah
    add bx,2h
    mov ah,0
    cmp al,0
    jne storeP
    
    mov ah,2                            
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
   
    
    printP:
    sub bx,2h
    mov dl,[0000H+bx]
    add dl,30h
    int 21h
    cmp bx,0
    jne printP 
    
    
     mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
   jmp main
    

    
    
    
    calculate:
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov di,0
    mov si,0
    mov bh,0
    mov bl,10D 
            
    mov ah,9
    lea dx,msg1
    int 21h
    input:
    
    mov ah,1
    int 21h
    cmp al,0dh
    jne number1
    
    jmp store1
    
    number1:
    sub al,30h
    mov cl,al
    mov al,bh
    mul bl
    add al,cl
    mov bh,al
    
    jmp input
    
    store1:
    mov A[di],bh
    and ax,0
    mov bh,0
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov ah,9
    lea dx,msg1
    int 21h
    jmp input2
          
          
    input2:
    mov ah,1
    int 21h
    cmp al,0dh
    jne number2
    jmp store2
    
    
    
     number2:
    sub al,30h
    mov cl,al
    mov al,bh
    mul bl
    add al,cl
    mov bh,al
    
    jmp input2
    
    store2:
    mov B[si],bh
     mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'1'
    je Addition
    cmp al,'2'
    je Subtraction 
    cmp al,'3'
    je divition   
    cmp al,'4'
    je Multiplication
    
    
   
    Addition:
    mov ch,A[di]
    mov bh,B[si]
    add bh,ch
    jmp end
    
    Subtraction: 
    mov ch,A[di]
    mov bh,B[si]
    sub ch,bh
    mov bh,ch
    jmp end
    
    divition:
    and ax,0
    mov al,A[di]
    and bx,0
    mov cl,B[si]
    mov dx,0
    div cl
    mov bh,al
    
    jmp end
    
    Multiplication:
    
    and ax,0
    mov al,A[di]
    and bx,0
    mov cl,B[si]
    mov dx,0
    mul cl
    mov bh,al
    jmp end

   
    end:
    and ax,0
    mov al,bh
    mov cl,10D
    
    mov bx,0000H
    
    store:
    div cl
    mov [0000H+bx],ah
    add bx,2h
    mov ah,0
    cmp al,0
    jne store
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
   
    print:
    sub bx,2h
    mov dl,[0000H+bx]
    add dl,30h
    int 21h
    cmp bx,0
    jne print
    
     mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    
   jmp main
    
    Final:
    mov ah,4ch
    int 21h
    main endp
  
  
end main