; This program output rax value in hexadecimal format

section .data ; Section for global variables.

codes:
	db	'0123456789ABCDEF'

section .text ; Section to hold instructions.
global _start

_start:
	; Number 1122... in hexadecimal format
	mov rax, 0x1122334455667788 ; Accumulator
	mov rdi, 1 ; Destination index in string manipulation commands
	mov rdx, 1 ; Stores data during I/O operations
	mov rcx, 64 ; Used for cycles (e.g., in loop).

	; Each 4 bits should be output as one hexadecimal digit.
	; Use shift and bitwise AND to isolate them.
	; The result is the offset in 'codes' array.

.loop:
	push rax ; Insert in the top of the stack
	sub rcx, 4 ; Subtract
	
	sar rax, cl ; Shift arithmetic right
	; cl is a register, smallest part of rcx
	; rax -- eax -- ax -- ah + al
	; rcx -- ecx -- cx -- ch + cl 
	and rax, 0xf

	lea rsi, [codes + rax] ; Load effective address
	mov rax, 1 ; Accumulator

	; Syscall leaves rcx and r11 changed
	push rcx ; Push onto stack
	syscall  
	pop rcx ; Pop off of stack

	pop rax ; Pop off of stack
	; test can be used for the fastest 'is it a zero?' check
	; see docs for 'test' command
	test rcx, rcx ; Logical compare
	jnz .loop ; jump if not zero
	mov rax, 60 ; invoke 'exit' system call
	xor rdi, rdi
	syscall


