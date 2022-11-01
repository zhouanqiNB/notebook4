; ZZZAQ 11.1
; test data: 10 9 8 7 6 5 4 3 2 1

.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
str_tip BYTE "Input numbers to be sorted: ", 0
input_buf BYTE 50 DUP(0) 	; char buffer, at most 50 chars
numbers DWORD 0,0,0,0,0,0,0,0,0,0
output_buf BYTE 50 DUP(0) 	; char buffer, at most 50 chars

tmp_buf BYTE 50 DUP(32)

.code

; use former code to convert char[] to int
; ========================= string2dws ============================
string2dws PROC
	mov eax,0
	mov ebx,0
	mov ecx,10 	; used as multiplier
    mov edx,0
	mov esi,0 	; used as i in loop, i++
	mov edi,0 	; used as offset for mem addr

LOOPOUT:
    mov eax,0
; ============================
LOOPINNER:
	; input_buf='10 9 8 7 6 5 4 3 2 1'
	; ebx stores current char->number
	; esi marks index of current char

    ; see if ebx=='\n', if it is, func end
	; see if ebx==' ', if it is, go to next loop
	; otherwise ebx is a number char, minus '0'

	movsx ebx,BYTE PTR input_buf[esi] 	; ebx = '1'
	
    ; this end if ' ' or '\n'
    cmp ebx,0
    jz FUNCEND
    cmp ebx,32
	jz LOOPINNEREND
	
    sub ebx,48							; ebx = 1

	; eax = eax * 10 + ebx
	mul ecx
	add eax,ebx

    inc esi
	jmp LOOPINNER
; ===========================

LOOPINNEREND:   ; meet ' '
    ; this number end, store and compute next one
	mov [numbers + edi],eax
    add edi,4
    inc esi
    jmp LOOPOUT

FUNCEND:        ; meet '\0'
    mov [numbers + edi],eax
    ret

string2dws ENDP
; ========================= string2dws ============================


; ========================= dws2string ============================
dws2string PROC

    mov ecx,0  ; as index of numbers
	mov ebx,10 ; as dividend
	mov esi,0

LOOPNUMBER:
    ; this number
	mov eax,[numbers+ecx]
    mov [tmp_buf],32
    mov [tmp_buf+1],32
    mov [tmp_buf+2],32
    mov [tmp_buf+3],32
    mov edi,0       ; index for tmp_buf
; one number begin =======================================
LOOPCHAR:
	; eax /= 10, dx = eax % 10
	mov edx,0
	div bx

	add dx,48 	; 1 -> '1'(49)

	; dl means lower 8 bits of dx
	mov BYTE PTR tmp_buf[edi], dl
    inc edi

    cmp eax,0
	jnz LOOPCHAR

; one number end =======================================
    ; this number end, copy tmp_buf to output_buf
    ; if this is ' '/32, don't copy
    mov al,[tmp_buf+3]
    cmp al,32
    jz L1
	mov BYTE PTR output_buf[esi], al
    inc esi
L1:
    mov al,[tmp_buf+2]
    cmp al,32
    jz L2
	mov BYTE PTR output_buf[esi], al
    inc esi
L2:
    mov al,[tmp_buf+1]
    cmp al,32
    jz L3
	mov BYTE PTR output_buf[esi], al
    inc esi
L3:
    mov al,[tmp_buf]
	mov BYTE PTR output_buf[esi], al
    inc esi

    ; this number end, add a ' '
    mov dl,32
	mov BYTE PTR output_buf[esi], dl
    inc esi

    add ecx,4
    cmp ecx,40
    jl LOOPNUMBER

; end all ===============================================
    ; all number end add '\0'
    mov dl,0
    mov BYTE PTR output_buf[esi], dl
	ret
dws2string ENDP
; ========================= dws2string ============================


; ========================= main ============================
main PROC

	invoke StdOut, addr str_tip			; get input
	invoke StdIn, addr input_buf, 50

    ; from input get the array
    invoke string2dws

; start sorting #####################################
	mov ecx,0 	; i
LOOPI:
    mov esi,0   ; j
; =============================
LOOPJ:
    mov eax,0
	mov ebx,0
	mov edx,0

    ; get number to be compared
    ; eax means the offset

    ; eax = j * 4
    mov eax,esi
    mov edx,4
    mul edx
    mov edx, [numbers + eax]
    
    ; eax = (j + 1) * 4
    add eax,4
    mov ebx, [numbers + eax]

	cmp edx,ebx
	jl LLESS
    jmp LMORE

LMORE:
    ; swap
    mov [numbers + eax],edx
    sub eax,4
    mov [numbers + eax],ebx

LLESS:
    inc esi     ; j++
    mov ebx,9
    sub ebx,ecx
    cmp esi,ebx ; j < 9-i
    jl LOOPJ
; =============================

    inc ecx     ; i++
    cmp ecx,9   ; i < 9
    jl LOOPI

; end sorting #####################################

    ; from int array get string output
    invoke dws2string

	invoke StdOut, addr output_buf
	invoke ExitProcess, 0

main ENDP
; ========================= main ============================

END main