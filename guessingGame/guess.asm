;=======================================================;
; File: guess.asm                                       ;
; Description:                                          ;
; Author/s:                                             ;
; Antonio, Matt Jeanne                                  ;
; Casillan, Jan Nicole                                  ;
; Manicar, Juan Paolo                                   ;
; Olivar, Joseph Fernan                                 ;
; Palillo, Josiah Mark                                  ;
; Tolentino, Joshua                                     ;
;=======================================================;
; To compile executable (linux ubuntu):                 ;
;                                                       ;
;                                                       ;
;=======================================================;

; 
section .text

        global _start 


_start:



;30
_modup:
_moddown:
_modend:

;100 2 ppl Jan & Joseph
_loop:
        ; Writing the prompt

    mov eax, [tries]          ; copy eax to memory address of tries
    mov ebx, 1                ; Optimization warning: May change. Do not use if tries > 9. Use standard __itoa instead.
    mov ecx, 10               ; Optimized
    call __itoa_knowndigits   ; call function __itoa_knowndigits
    
    mov ecx, eax              ; copy eax to ecx
    mov edx, ebx              ; copy ebx to edx
    
    call __write              ; call function __write
    mov ebx, 1                ; file descriptor (stdout)
    call __syscall            ; call function __syscall
    
    call __write              ; call function __write
    mov ebx, 1                ; file descriptor (stdout)
    mov ecx, promptMsg        ; message to write/prompt
    mov edx, promptMsg_len    ; length of the prompt message
    call __syscall            ; call function __syscall
    
    ; Read input

    call __read
    mov ebx, 0                ; file descriptor (stdin)
    mov ecx, inputNum         ; set inputNum to ecx
    mov edx, inputNum_len     ; copies length of inputNum_len to edx
    call __syscall            ; call __syscall function

    ; Conversion to integer

    mov ecx, eax              ; copy eax to ecx
    sub ecx, 1                ; Get rid of extra newline
    
    cmp ecx, 1                ; compares if the length of the number less than 1? (invalid) 
    jl _reenter               ; if the above condition is met, it'll jump to _reenter

    mov ebx, ecx              ; copy ecx to ebx

    mov eax, 0                ; Initalize eax
    jmp _loopconvert_nomul

_loopconvert_nomul:	

_reenter:
        ; Displaying the message

    call __write               ; call __write function
    mov ebx, 1                 ; file descriptor (stdout)
    mov ecx, reenterMsg        ; display/write the message 
    mov edx, reenterMsg_len    ; set length of the message 
    call __syscall             ; call __syscall function

        ; Repeat enter

    jmp _loop

;100 2ppl Josa & Ichu
_toohigh:
_toolow:	
_again:
_lose:
_convertok:
_exit:
	

;108 2ppl JP & Matt
__itoa_init:
__itoa: ; Accept eax (i), return eax (a), ebx (l)
__itoa_loop:
__itoa_knowndigits: ; Accept eax (i), ebx (d), ecx (m), return eax (a), ebx (l)
__itoa_loopend:
__itoa_loop2:

__syscall:

	int 0x80        ; Interupt kernel
	ret

__read:

	mov eax, 3      ; syscall for reading
	ret

__write:
	
	mov eax, 4      ; syscall for writing
	ret


; Declarations of Data 
section .data

        maxrand equ 100
	tries dd 6

	promptMsg db " tries left. Input number between 1-100: "
	promptMsg_len equ $-promptMsg

        reenterMsg db "? REENTER", 0xa, "Invalid unsigned integer. Please re-enter your input.", 0xa
	reenterMsg_len equ $-reenterMsg

section .bss

        inputNum resb 1024
	inputNum_len equ 1024

