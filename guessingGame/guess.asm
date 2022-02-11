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



; Declarations of Data 
section .data


section .bss



