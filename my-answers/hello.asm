global _start

; Section for global variables.
section .data

; db directive is used to create byte data.
; to start a new line we output a special character with code 10.
message: db 'Hello, world!', 10 

; Section to hold instructions.
section .text

; Entry point: it marks the first instruction to be executed.
; Should been declared global; see the line 1.
_start:
	; The mov instruction is used to write a value into either register or memory. 
	mov	rax, 1	; System call number should be stored in rax.
	mov	rdi, 1	; Argument #1 in rdi: where to write (descriptor)?
	mov	rsi, message ; Argument #2 in rsi: where does the string start?
	mov	rdx, 14	; Argument #3 in rdx: how many bytes to write?
	syscall		; Invokes a System call.


























 













































