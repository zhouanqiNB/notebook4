	.file	"t.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z6dec2dwv
	.type	_Z6dec2dwv, @function
_Z6dec2dwv:
.LFB1617:
	.cfi_startproc
	endbr64
	lea	rsi, a[rip]
	mov	rdx, rsi
.L2:
	mov	ecx, DWORD PTR [rdx]
	add	rdx, 4
	lea	eax, -16843009[rcx]
	not	ecx
	and	eax, ecx
	and	eax, -2139062144
	je	.L2
	mov	ecx, eax
	shr	ecx, 16
	test	eax, 32896
	cmove	eax, ecx
	lea	rcx, 2[rdx]
	cmove	rdx, rcx
	mov	edi, eax
	add	dil, al
	sbb	rdx, 3
	sub	rdx, rsi
	je	.L1
	mov	eax, DWORD PTR number[rip]
	lea	ecx, [rax+rax*4]
	movsx	eax, BYTE PTR a[rip]
	lea	eax, -48[rax+rcx*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 1
	je	.L1
	movsx	ecx, BYTE PTR a[rip+1]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 2
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+2]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 3
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+3]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 4
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+4]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 5
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+5]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 6
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+6]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 7
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+7]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 8
	jbe	.L1
	movsx	ecx, BYTE PTR a[rip+8]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rcx+rax*2]
	mov	DWORD PTR number[rip], eax
	cmp	rdx, 10
	jne	.L1
	movsx	edx, BYTE PTR a[rip+9]
	lea	eax, [rax+rax*4]
	lea	eax, -48[rdx+rax*2]
	mov	DWORD PTR number[rip], eax
.L1:
	ret
	.cfi_endproc
.LFE1617:
	.size	_Z6dec2dwv, .-_Z6dec2dwv
	.p2align 4
	.globl	_Z6dw2hexv
	.type	_Z6dw2hexv, @function
_Z6dw2hexv:
.LFB1618:
	.cfi_startproc
	endbr64
	mov	eax, DWORD PTR number[rip]
	mov	edx, eax
	sar	edx, 28
	add	edx, 48
	mov	BYTE PTR b[rip], dl
	mov	edx, eax
	sar	edx, 24
	cmp	eax, 167772159
	jle	.L15
	add	edx, 55
	mov	BYTE PTR b[rip+1], dl
	mov	edx, eax
	sar	edx, 20
.L16:
	add	edx, 55
	mov	BYTE PTR b[rip+2], dl
	mov	edx, eax
	sar	edx, 16
.L18:
	add	edx, 55
	mov	BYTE PTR b[rip+3], dl
	mov	edx, eax
	sar	edx, 12
.L20:
	add	edx, 55
	movzx	ecx, ah
	mov	BYTE PTR b[rip+4], dl
.L22:
	add	ecx, 55
	mov	edx, eax
	mov	BYTE PTR b[rip+5], cl
	sar	edx, 4
.L24:
	add	edx, 55
	mov	BYTE PTR b[rip+6], dl
	mov	edx, eax
.L26:
	lea	eax, 55[rdx]
	mov	BYTE PTR b[rip+7], al
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	mov	ecx, eax
	add	edx, 48
	sar	ecx, 20
	mov	BYTE PTR b[rip+1], dl
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L16
	add	ecx, 48
	mov	BYTE PTR b[rip+2], cl
	mov	ecx, eax
	sar	ecx, 16
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L18
	add	ecx, 48
	mov	BYTE PTR b[rip+3], cl
	mov	ecx, eax
	sar	ecx, 12
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L20
	mov	edx, eax
	add	ecx, 48
	sar	edx, 8
	mov	BYTE PTR b[rip+4], cl
	mov	ecx, edx
	cmp	edx, 9
	jg	.L22
	mov	ecx, eax
	add	edx, 48
	sar	ecx, 4
	mov	BYTE PTR b[rip+5], dl
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L24
	add	ecx, 48
	mov	edx, eax
	mov	BYTE PTR b[rip+6], cl
	cmp	eax, 9
	jg	.L26
	add	eax, 48
	mov	BYTE PTR b[rip+7], al
	ret
	.cfi_endproc
.LFE1618:
	.size	_Z6dw2hexv, .-_Z6dw2hexv
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1619:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	xor	eax, eax
	lea	rsi, a[rip]
	mov	QWORD PTR a[rip], 0
	lea	rdi, _ZSt3cin[rip]
	mov	WORD PTR a[rip+8], ax
	mov	BYTE PTR a[rip+10], 0
	mov	QWORD PTR b[rip], 0
	mov	BYTE PTR b[rip+8], 0
	mov	DWORD PTR number[rip], 0
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_@PLT
	call	_Z6dec2dwv
	mov	eax, DWORD PTR number[rip]
	mov	edx, eax
	sar	edx, 28
	add	edx, 48
	mov	BYTE PTR b[rip], dl
	mov	edx, eax
	sar	edx, 24
	cmp	eax, 167772159
	jle	.L29
	add	edx, 55
	mov	BYTE PTR b[rip+1], dl
	mov	edx, eax
	sar	edx, 20
.L30:
	add	edx, 55
	mov	BYTE PTR b[rip+2], dl
	mov	edx, eax
	sar	edx, 16
.L32:
	add	edx, 55
	mov	BYTE PTR b[rip+3], dl
	mov	edx, eax
	sar	edx, 12
.L34:
	add	edx, 55
	movzx	ecx, ah
	mov	BYTE PTR b[rip+4], dl
.L36:
	add	ecx, 55
	mov	edx, eax
	mov	BYTE PTR b[rip+5], cl
	sar	edx, 4
.L38:
	add	edx, 55
	mov	BYTE PTR b[rip+6], dl
	mov	edx, eax
.L40:
	lea	eax, 55[rdx]
.L41:
	mov	BYTE PTR b[rip+7], al
	lea	rsi, b[rip]
	mov	rdx, rsi
.L42:
	mov	ecx, DWORD PTR [rdx]
	add	rdx, 4
	lea	eax, -16843009[rcx]
	not	ecx
	and	eax, ecx
	and	eax, -2139062144
	je	.L42
	mov	ecx, eax
	shr	ecx, 16
	test	eax, 32896
	cmove	eax, ecx
	lea	rcx, 2[rdx]
	cmove	rdx, rcx
	mov	edi, eax
	add	dil, al
	lea	rdi, _ZSt4cout[rip]
	sbb	rdx, 3
	sub	rdx, rsi
	lea	rsi, b[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	xor	eax, eax
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore_state
	mov	ecx, eax
	add	edx, 48
	sar	ecx, 20
	mov	BYTE PTR b[rip+1], dl
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L30
	add	ecx, 48
	mov	BYTE PTR b[rip+2], cl
	mov	ecx, eax
	sar	ecx, 16
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L32
	add	ecx, 48
	mov	BYTE PTR b[rip+3], cl
	mov	ecx, eax
	sar	ecx, 12
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L34
	mov	edx, eax
	add	ecx, 48
	sar	edx, 8
	mov	BYTE PTR b[rip+4], cl
	mov	ecx, edx
	cmp	edx, 9
	jg	.L36
	mov	ecx, eax
	add	edx, 48
	sar	ecx, 4
	mov	BYTE PTR b[rip+5], dl
	mov	edx, ecx
	cmp	ecx, 9
	jg	.L38
	add	ecx, 48
	mov	edx, eax
	mov	BYTE PTR b[rip+6], cl
	cmp	eax, 9
	jg	.L40
	add	eax, 48
	jmp	.L41
	.cfi_endproc
.LFE1619:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_a, @function
_GLOBAL__sub_I_a:
.LFB2108:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rdi, _ZStL8__ioinit[rip]
	call	_ZNSt8ios_base4InitC1Ev@PLT
	mov	rdi, QWORD PTR _ZNSt8ios_base4InitD1Ev@GOTPCREL[rip]
	add	rsp, 8
	.cfi_def_cfa_offset 8
	lea	rdx, __dso_handle[rip]
	lea	rsi, _ZStL8__ioinit[rip]
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2108:
	.size	_GLOBAL__sub_I_a, .-_GLOBAL__sub_I_a
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_a
	.globl	number
	.bss
	.align 4
	.type	number, @object
	.size	number, 4
number:
	.zero	4
	.globl	b
	.align 8
	.type	b, @object
	.size	b, 9
b:
	.zero	9
	.globl	a
	.align 8
	.type	a, @object
	.size	a, 11
a:
	.zero	11
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
