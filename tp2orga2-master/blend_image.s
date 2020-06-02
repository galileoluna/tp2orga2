section .data
 ;
section .text
    global enmascarar_asm    

enmascarar_asm:
    push ebp     
	mov ebp, esp
	push ebx
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    xor edx, edx
    mov eax, dword[ebp+20]
    add ebx, 4
    div ebx
    mov ecx, eax
    _mmxLoop:
        mov eax, ecx
        mov ebx, 4
        mul ebx
        sub eax, 4
        mov ebx,[ebp+8]
        add ebx, eax
        movd mm0 ,[ebx]
        mov ebx, [ebp+12]
        add ebx, eax
        movd mm1,[ebx]
        mov ebx, [ebp+16]
        add ebx, eax
        movd mm2,[ebx]
        pand mm1, mm2 
        pandn mm2, mm0
        por mm1, mm2  
        mov ebx, [ebp+8] 
        add ebx, eax
        movd [ebx], mm1
        loop _mmxLoop
    
	emms
	pop ebx
    mov esp, ebp 
    pop ebp 
        
ret
