; ZZZAQ 10.18

.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
str_tip BYTE "Input an unsigned decimal number!", 0
input_buf BYTE 11 DUP(0) 	; string 8*10 bits, every 8bits as ascii code
input_integer DWORD 0 		; integer 32 bits
str_hex BYTE 9 DUP(0) 		; string 8*8 bits

.code

;========================= dec2dw ============================
dec2dw PROC
	mov eax,0
	mov ebx,0
	mov ecx,10 	; used as multiplier
	mov esi,0 	; used as i in loop, i++

LOOP1:
	; input_buf='1234'
	; ebx stores current number
	; esi marks index of current number
	; see if ebx=='\0', if it is, stop
	; otherwise ebx is a number char, minus '0'

	movsx ebx,BYTE PTR input_buf[esi] 	; ebx = '1'
	cmp ebx,0
	jz LOOPEND
	sub ebx,48							; ebx = 1

	; eax = eax * 10 + ebx
	mul ecx
	add eax,ebx

	inc esi
	cmp	esi,10 ; biggest number is '4294967295'
	jnz LOOP1

LOOPEND:
	mov input_integer,eax
	ret

dec2dw ENDP
;========================= dec2dw ============================

;========================= my_dw2hex ============================
my_dw2hex PROC
	mov ebx,16
	mov esi,7	; used as i in loop, i--
	mov eax,input_integer

LOOP2:
	; eax /= 16, dx = eax % 16
	mov edx,0
	div bx

	cmp dx,10
	jl LESSTHAN10

	add dx,55 	; 10 -> 'A'(65)
	jmp IFEND

LESSTHAN10:
	add dx,48 	; 1 -> '1'(49)
	jmp IFEND

IFEND:
	; dl means lower 8 bits of dx
	; need this because 1 byte = 8 bits
	mov BYTE PTR str_hex[esi], dl

	sub esi,1
	cmp esi,-1
	jnz LOOP2

	ret

my_dw2hex ENDP
;========================= my_dw2hex ============================

;========================= main ============================
main PROC

	invoke StdOut, addr str_tip			; get input
	invoke StdIn, addr input_buf, 10	; length = 10 because 4294967295

	invoke dec2dw
	invoke my_dw2hex

	invoke StdOut, addr str_hex
	invoke ExitProcess, 0

main ENDP
;========================= main ============================

END main