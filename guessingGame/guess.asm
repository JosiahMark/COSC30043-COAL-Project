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
_loopconvert_nomul:	
_reenter:

;100 2ppl Josa & Ichu
_toohigh:

    call __write
    mov ebx, 1 ; Stdout
    mov ecx, toohigh   ; copies the contents of toohigh onto the ecx
    mov edx, toohigh_len  ; copies the length of toohigh onto the edx
    call __syscall  

    jmp _again ;gives the execution control to _again

_toolow:
    
    call __write ;
    mov ebx, 1 ; Stdout
    mov ecx, toolow  ; copies contents of toolow to the ecx
    mov edx, toolow_len ; copies the length of toolow to the edx
    call __syscall 

_again:

    cmp dword [tries], 1  ; compares the number of tries remaining if it is equal to 1
    jle _lose ;jumps to _lose if the compared variables are equal 

    sub dword [tries], 1;subtracts 1 from the total value of tries
    
    jmp _loop ; gives the execution control to _loop
_lose:
  

	call __write
	mov ebx, 1 ; Stdout
	mov ecx, youlose ;copies the contents of youlose into the ecx
	mov edx, youlose_len ;copies the length from youlose_len into the edx
	call __syscall

	mov eax, [randint] ; stores the return value of randint into the eax
	call __itoa

	mov ecx, eax  ;stores the content of eax to ecx
	mov edx, ebx  ;stores the content of edx to ebx
	call __write
	mov ebx, 1 ; Stdout
	call __syscall

	call __write
	mov ebx, 1 ; Stdout
	mov ecx, youlose2  ;copies the content of youlose2 into the ecx
	mov edx, youlose2_len ;copies the length from youlose2_len into the edx 
	call __syscall

	mov ebx, 2 ; Exit code 

	jmp _exit

_convertok:
_exit:
	

;108 2ppl JP & Matt
__itoa_init:
__itoa: ; Accept eax (i), return eax (a), ebx (l)
__itoa_loop:
__itoa_knowndigits: ; Accept eax (i), ebx (d), ecx (m), return eax (a), ebx (l)
__itoa_loopend:
__itoa_loop2:



; Declarations of Data 
section .data


section .bss



