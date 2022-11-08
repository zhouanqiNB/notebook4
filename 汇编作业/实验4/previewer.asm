; ZZZAQ 11.8

.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
str_tip BYTE "Please input a PE file: ", 0

idh BYTE "IMAGE_DOS_HEADER", 0dh, 0ah, 0
idh1 BYTE "    e_magic: ", 0
idh2 BYTE "    e_lfanew: ", 0

inh BYTE "IMAGE_NT_HEADER", 0dh, 0ah, 0
inh1 BYTE "    Signature: ", 0

ifh BYTE "IMAGE_FILE_HEADER", 0dh, 0ah, 0
ifh1 BYTE "    NumberOfSections: ", 0
ifh2 BYTE "    TimeDateStamp: ", 0
ifh3 BYTE "    Characteristics: ", 0

ioh BYTE "IMAGE_OPTIONAL_HEADER", 0dh, 0ah, 0
ioh1 BYTE "    addressOfEntryPoint: ", 0
ioh2 BYTE "    ImageBase: ", 0
ioh3 BYTE "    SectionAlignment: ", 0
ioh4 BYTE "    FileAlignment: ", 0

endl BYTE 0dh, 0ah, 0

input_buf BYTE 50 DUP(0) 	; get file name
hfile DWORD 0
file_content DWORD 4000 DUP(0) 	; get file
hex_buf BYTE 4000 DUP(0)	; get file hex

.code

; ========================= main ============================
main PROC

	invoke StdOut, addr str_tip			; get input
	invoke StdIn, addr input_buf, 50

    invoke CreateFile,  addr input_buf,\
                        GENERIC_READ,\
                        FILE_SHARE_READ,\
                        0,\
                        OPEN_EXISTING,\
                        FILE_ATTRIBUTE_ARCHIVE,\
                        0
    mov hfile,eax ; return value is stored in `ecx`

    invoke SetFilePointer,hfile,0,0,FILE_BEGIN  ; hfile points to the beginning of <>
    invoke ReadFile,hfile,addr file_content,4000,0,0    ; read file into file_content

    ; ============================
    invoke StdOut, addr idh
    
    invoke StdOut, addr idh1
    mov ecx,DWORD PTR [file_content]
    invoke dw2hex,ecx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf+4]
    invoke StdOut, addr endl
    
    invoke StdOut, addr idh2
    mov ecx,DWORD PTR [file_content+3ch]
    invoke dw2hex,ecx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl

    ; ============================
    invoke StdOut, addr inh

    invoke StdOut, addr inh1
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl

    ; ============================
    invoke StdOut, addr ifh

    invoke StdOut, addr ifh1
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,6h
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf+4]
    invoke StdOut, addr endl

    invoke StdOut, addr ifh2
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,8h
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl

    invoke StdOut, addr ifh3
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,16h
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf+4]
    invoke StdOut, addr endl

    ; ============================
    invoke StdOut, addr ioh

    invoke StdOut, addr ioh1
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,28h
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl

    invoke StdOut, addr ioh2
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,34h
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl

    invoke StdOut, addr ioh3
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,38h
    mov ecx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ecx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl

    invoke StdOut, addr ioh4
    mov ecx,DWORD PTR [file_content+3ch]    ; ecx=PE_begin_offset
    add ecx,3ch
    mov ebx,DWORD PTR [file_content+ecx]
    invoke dw2hex,ebx,addr [hex_buf]                 ; convert file into hex
    invoke StdOut, addr [hex_buf]
    invoke StdOut, addr endl


    invoke CloseHandle,hfile                    ; close file

	invoke ExitProcess, 0

main ENDP
; ========================= main ============================

END main