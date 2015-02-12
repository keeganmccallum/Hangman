	.file	"project1.c"
	.globl	lettersAlreadyGuessed
	.bss
	.align 16
	.type	lettersAlreadyGuessed, @object
	.size	lettersAlreadyGuessed, 26
lettersAlreadyGuessed:
	.zero	26
	.section	.rodata
.LC0:
	.string	"*****************************"
.LC1:
	.string	"*          Hangman          *"
.LC2:
	.string	"*     A group 7 project     *"
.LC3:
	.string	"*                           *"
	.text
	.globl	welcomeMessage
	.type	welcomeMessage, @function
welcomeMessage:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC0, %edi
	call	puts
	movl	$.LC1, %edi
	call	puts
	movl	$.LC2, %edi
	call	puts
	movl	$.LC3, %edi
	call	puts
	movl	$.LC0, %edi
	call	puts
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	welcomeMessage, .-welcomeMessage
	.section	.rodata
	.align 8
.LC4:
	.string	"Would you like to start a new game? (y/n): "
	.align 8
.LC5:
	.string	"Error processing input, exiting..."
	.align 8
.LC6:
	.string	"Sorry, I didn't understand you."
	.text
	.globl	newGameOrExit
	.type	newGameOrExit, @function
newGameOrExit:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$.LC4, %edi
	call	puts
	call	getchar
	movb	%al, -1(%rbp)
	cmpb	$-1, -1(%rbp)
	jne	.L3
	movl	$.LC5, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L3:
	cmpb	$121, -1(%rbp)
	je	.L4
	cmpb	$110, -1(%rbp)
	je	.L4
	movl	$.LC6, %edi
	call	puts
	movl	$0, %eax
	call	newGameOrExit
	jmp	.L5
.L4:
	cmpb	$121, -1(%rbp)
	jne	.L6
	movl	$1, %eax
	jmp	.L5
.L6:
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	newGameOrExit, .-newGameOrExit
	.section	.rodata
	.align 8
.LC7:
	.string	"Please enter a difficulty, 1: easy, 2: medium, 3: hard"
.LC8:
	.string	"Error reading difficulty."
	.text
	.globl	getDifficulty
	.type	getDifficulty, @function
getDifficulty:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$.LC7, %edi
	call	puts
	nop
.L9:
	call	getchar
	movb	%al, -2(%rbp)
	cmpb	$10, -2(%rbp)
	je	.L8
	cmpb	$-1, -2(%rbp)
	jne	.L9
.L8:
	call	getchar
	movb	%al, -1(%rbp)
	cmpb	$49, -1(%rbp)
	je	.L10
	cmpb	$50, -1(%rbp)
	je	.L10
	cmpb	$51, -1(%rbp)
	je	.L10
	movl	$.LC8, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L10:
	movsbl	-1(%rbp), %eax
	subl	$48, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	getDifficulty, .-getDifficulty
	.globl	score
	.type	score, @function
score:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	score, .-score
	.globl	wordBank
	.type	wordBank, @function
wordBank:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L13
	movl	$easy.2560, %eax
	jmp	.L14
.L13:
	cmpl	$2, -4(%rbp)
	jne	.L15
	movl	$norm.2561, %eax
	jmp	.L14
.L15:
	movl	$hard.2562, %eax
.L14:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	wordBank, .-wordBank
	.globl	validWord
	.type	validWord, @function
validWord:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L17
.L21:
	movl	-4(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L18
	movl	$0, %eax
	jmp	.L19
.L18:
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L20
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L20
	movl	$1, %eax
	jmp	.L19
.L20:
	addl	$1, -4(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cltq
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L21
	jmp	.L16
.L19:
.L16:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	validWord, .-validWord
	.globl	validChar
	.type	validChar, @function
validChar:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movq	%rsi, -32(%rbp)
	movb	%al, -20(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L23
.L28:
	movl	-12(%rbp), %eax
	cltq
	movzbl	lettersAlreadyGuessed(%rax), %eax
	cmpb	-20(%rbp), %al
	jne	.L24
	movl	$0, %eax
	jmp	.L25
.L24:
	movl	-12(%rbp), %eax
	cltq
	movzbl	lettersAlreadyGuessed(%rax), %eax
	testb	%al, %al
	jne	.L26
	movl	-12(%rbp), %eax
	cltq
	movzbl	-20(%rbp), %edx
	movb	%dl, lettersAlreadyGuessed(%rax)
	jmp	.L27
.L26:
	addl	$1, -12(%rbp)
.L23:
	cmpl	$26, -12(%rbp)
	jle	.L28
.L27:
	movl	$0, -4(%rbp)
	jmp	.L29
.L32:
	movl	-4(%rbp), %eax
	cltq
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	-20(%rbp), %al
	jne	.L30
	movl	$1, -8(%rbp)
	jmp	.L31
.L30:
	movl	$0, -8(%rbp)
	addl	$1, -4(%rbp)
.L29:
	movl	-4(%rbp), %eax
	cltq
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L32
.L31:
	movl	-8(%rbp), %eax
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	validChar, .-validChar
	.globl	wordComplete
	.type	wordComplete, @function
wordComplete:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L34
.L40:
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L35
.L37:
	movl	-12(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movzbl	lettersAlreadyGuessed(%rax), %eax
	cmpb	%al, %dl
	jne	.L36
	movl	$1, -8(%rbp)
.L36:
	addl	$1, -4(%rbp)
.L35:
	movl	-4(%rbp), %eax
	cltq
	movzbl	lettersAlreadyGuessed(%rax), %eax
	testb	%al, %al
	jne	.L37
	cmpl	$0, -8(%rbp)
	jne	.L38
	movl	$0, %eax
	jmp	.L39
.L38:
	addl	$1, -12(%rbp)
.L34:
	movl	-12(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L40
	movl	$1, %eax
.L39:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	wordComplete, .-wordComplete
	.globl	displayWordSoFar
	.type	displayWordSoFar, @function
displayWordSoFar:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L42
.L48:
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L43
.L45:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	movzbl	lettersAlreadyGuessed(%rax), %eax
	cmpb	%al, %dl
	jne	.L44
	movl	$1, -8(%rbp)
.L44:
	addl	$1, -12(%rbp)
.L43:
	movl	-12(%rbp), %eax
	cltq
	movzbl	lettersAlreadyGuessed(%rax), %eax
	testb	%al, %al
	jne	.L45
	cmpl	$0, -8(%rbp)
	je	.L46
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	jmp	.L47
.L46:
	movb	$45, -1(%rbp)
.L47:
	movsbl	-1(%rbp), %eax
	movl	%eax, %edi
	call	putchar
	addl	$1, -16(%rbp)
.L42:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L48
	movl	$10, %edi
	call	putchar
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	displayWordSoFar, .-displayWordSoFar
	.globl	guessAllLetters
	.type	guessAllLetters, @function
guessAllLetters:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$97, -4(%rbp)
	jmp	.L50
.L51:
	movl	-4(%rbp), %eax
	leal	-97(%rax), %ecx
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	movslq	%ecx, %rax
	movb	%dl, lettersAlreadyGuessed(%rax)
	addl	$1, -4(%rbp)
.L50:
	cmpl	$122, -4(%rbp)
	jle	.L51
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	guessAllLetters, .-guessAllLetters
	.section	.rodata
.LC9:
	.string	"life"
.LC10:
	.string	"lives"
.LC11:
	.string	"You have %d %s left!\n"
.LC12:
	.string	"          ---|          "
.LC13:
	.string	"          |  %c         \n"
.LC14:
	.string	"          | %c%c%c\n"
.LC15:
	.string	"          | %c %c\n"
.LC16:
	.string	"          |-------"
	.text
	.globl	hngDrawMan
	.type	hngDrawMan, @function
hngDrawMan:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	cmpl	$6, -20(%rbp)
	jg	.L64
	cmpl	$0, -20(%rbp)
	js	.L64
.L54:
	movb	$32, -6(%rbp)
	movb	$32, -5(%rbp)
	movb	$32, -4(%rbp)
	movb	$32, -3(%rbp)
	movb	$32, -2(%rbp)
	movb	$32, -1(%rbp)
	cmpl	$5, -20(%rbp)
	jg	.L56
	movb	$48, -6(%rbp)
.L56:
	cmpl	$4, -20(%rbp)
	jg	.L57
	movb	$124, -1(%rbp)
.L57:
	cmpl	$3, -20(%rbp)
	jg	.L58
	movb	$47, -5(%rbp)
.L58:
	cmpl	$2, -20(%rbp)
	jg	.L59
	movb	$92, -4(%rbp)
.L59:
	cmpl	$1, -20(%rbp)
	jg	.L60
	movb	$47, -3(%rbp)
.L60:
	cmpl	$0, -20(%rbp)
	jne	.L61
	movb	$92, -2(%rbp)
.L61:
	cmpl	$1, -20(%rbp)
	jne	.L62
	movl	$.LC9, %eax
	jmp	.L63
.L62:
	movl	$.LC10, %eax
.L63:
	movl	$.LC11, %ecx
	movl	-20(%rbp), %esi
	movq	%rax, %rdx
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC12, %edi
	call	puts
	movsbl	-6(%rbp), %edx
	movl	$.LC13, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movsbl	-4(%rbp), %ecx
	movsbl	-1(%rbp), %edx
	movsbl	-5(%rbp), %esi
	movl	$.LC14, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movsbl	-2(%rbp), %edx
	movsbl	-3(%rbp), %ecx
	movl	$.LC15, %eax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$.LC16, %edi
	call	puts
	jmp	.L52
.L64:
	nop
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	hngDrawMan, .-hngDrawMan
	.globl	isValidGuess
	.type	isValidGuess, @function
isValidGuess:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -16(%rbp)
	movl	$1, -12(%rbp)
	movl	$2, -8(%rbp)
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L66
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	validWord
	testl	%eax, %eax
	je	.L67
	movl	-8(%rbp), %eax
	jmp	.L68
.L66:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %eax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	validChar
	testl	%eax, %eax
	je	.L67
	movl	-12(%rbp), %eax
	jmp	.L68
.L67:
	movl	-16(%rbp), %eax
.L68:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	isValidGuess, .-isValidGuess
	.section	.rodata
.LC17:
	.string	"Please make a guess: "
.LC18:
	.string	"%s"
.LC19:
	.string	"\n"
.LC20:
	.string	"Oops, take another guess!"
.LC21:
	.string	"Good guess!"
	.align 8
.LC22:
	.string	"Good guess! You knew the word!"
.LC23:
	.string	"You won!"
.LC24:
	.string	"You Lost, try again."
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$304, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
	call	welcomeMessage
	movl	$0, %eax
	call	newGameOrExit
	movl	%eax, -288(%rbp)
	cmpl	$0, -288(%rbp)
	jne	.L70
	movl	$1, %edi
	call	exit
.L70:
	movl	$0, %eax
	call	getDifficulty
	movl	%eax, -284(%rbp)
	movl	$6, -292(%rbp)
	movl	-284(%rbp), %eax
	movl	%eax, %edi
	call	wordBank
	movq	%rax, -304(%rbp)
	jmp	.L71
.L77:
	movl	-292(%rbp), %eax
	movl	%eax, %edi
	call	hngDrawMan
	movl	$.LC17, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	displayWordSoFar
	nop
.L73:
	call	getchar
	movb	%al, -273(%rbp)
	cmpb	$10, -273(%rbp)
	je	.L72
	cmpb	$-1, -273(%rbp)
	jne	.L73
.L72:
	movl	$.LC18, %eax
	leaq	-272(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movq	-304(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	isValidGuess
	movl	%eax, -280(%rbp)
	movl	$.LC19, %edi
	call	puts
	cmpl	$0, -280(%rbp)
	jne	.L74
	subl	$1, -292(%rbp)
	movl	$.LC20, %edi
	call	puts
	jmp	.L71
.L74:
	cmpl	$1, -280(%rbp)
	jne	.L75
	movl	$.LC21, %edi
	call	puts
	jmp	.L71
.L75:
	movl	$.LC22, %edi
	call	puts
	movl	$0, %eax
	call	guessAllLetters
	jmp	.L76
.L71:
	cmpl	$0, -292(%rbp)
	jle	.L76
	movq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	wordComplete
	testl	%eax, %eax
	je	.L77
.L76:
	movl	-292(%rbp), %eax
	movl	%eax, %edi
	call	hngDrawMan
	movq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	displayWordSoFar
	movq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	wordComplete
	testl	%eax, %eax
	je	.L78
	movl	$.LC23, %edi
	call	puts
	jmp	.L79
.L78:
	movl	$.LC24, %edi
	call	puts
.L79:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L80
	call	__stack_chk_fail
.L80:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.data
	.type	easy.2560, @object
	.size	easy.2560, 8
easy.2560:
	.string	"giraffe"
	.type	norm.2561, @object
	.size	norm.2561, 10
norm.2561:
	.string	"embezzled"
	.type	hard.2562, @object
	.size	hard.2562, 13
hard.2562:
	.string	"quizzicality"
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
