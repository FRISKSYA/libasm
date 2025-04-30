; sample.s - Hello, World!
section .data
	message db "Hello, World!", 10 ; = \n
	message_len equ $ - message ; cal len of str

section .text
	global _start

_start:
	; write(1, message, message_len)
	mov rax, 1 ; = write
	mov rdi, 1 ; = fd : 1
	mov rsi, message ; str
	mov rdx, message_len ; len of str
	syscall ; excute

	; exit(0)
	mov rax, 60 ; = exit
	mov rdi, 0 ; exit status
	syscall ; excute