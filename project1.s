	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"project1.c"
	.global	lettersAlreadyGuessed
	.bss
	.align	2
	.type	lettersAlreadyGuessed, %object
	.size	lettersAlreadyGuessed, 26
lettersAlreadyGuessed:
	.space	26
	.section	.rodata
	.align	2
.LC0:
	.ascii	"*****************************\000"
	.align	2
.LC1:
	.ascii	"*          Hangman          *\000"
	.align	2
.LC2:
	.ascii	"*     A group 7 project     *\000"
	.align	2
.LC3:
	.ascii	"*                           *\000"
	.text
	.align	2
	.global	welcomeMessage
	.type	welcomeMessage, %function
welcomeMessage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r0, .L2
	bl	puts
	ldr	r0, .L2+4
	bl	puts
	ldr	r0, .L2+8
	bl	puts
	ldr	r0, .L2+12
	bl	puts
	ldr	r0, .L2
	bl	puts
	ldmfd	sp!, {fp, pc}
.L3:
	.align	2
.L2:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	welcomeMessage, .-welcomeMessage
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Would you like to start a new game? (y/n): \000"
	.align	2
.LC5:
	.ascii	"Sorry, I didn't understand you.\000"
	.text
	.align	2
	.global	newGameOrExit
	.type	newGameOrExit, %function
newGameOrExit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L9
	bl	puts
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #121
	beq	.L5
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #110
	beq	.L5
	ldr	r0, .L9+4
	bl	puts
	mov	r0, r0	@ nop
.L6:
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L6
	bl	newGameOrExit
	mov	r3, r0
	b	.L7
.L5:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #121
	bne	.L8
	mov	r3, #1
	b	.L7
.L8:
	mov	r3, #0
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L10:
	.align	2
.L9:
	.word	.LC4
	.word	.LC5
	.size	newGameOrExit, .-newGameOrExit
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Please enter a difficulty, 1: easy, 2: medium, 3: h"
	.ascii	"ard\000"
	.align	2
.LC7:
	.ascii	"Error reading difficulty.\000"
	.text
	.align	2
	.global	getDifficulty
	.type	getDifficulty, %function
getDifficulty:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L14
	bl	puts
	mov	r0, r0	@ nop
.L12:
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L12
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L13
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #50
	beq	.L13
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #51
	beq	.L13
	ldr	r0, .L14+4
	bl	puts
	mov	r0, #1
	bl	exit
.L13:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	sub	r3, r3, #48
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L15:
	.align	2
.L14:
	.word	.LC6
	.word	.LC7
	.size	getDifficulty, .-getDifficulty
	.align	2
	.global	score
	.type	score, %function
score:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	score, .-score
	.align	2
	.global	wordBank
	.type	wordBank, %function
wordBank:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L18
	ldr	r3, .L21
	b	.L19
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	bne	.L20
	ldr	r3, .L21+4
	b	.L19
.L20:
	ldr	r3, .L21+8
.L19:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L22:
	.align	2
.L21:
	.word	easy.2243
	.word	norm.2244
	.word	hard.2245
	.size	wordBank, .-wordBank
	.align	2
	.global	validWord
	.type	validWord, %function
validWord:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L28:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L25
	mov	r3, #0
	b	.L26
.L25:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L27
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L27
	mov	r3, #1
	b	.L26
.L27:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L28
	mov	r3, #0
.L26:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	validWord, .-validWord
	.align	2
	.global	validChar
	.type	validChar, %function
validChar:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, r0
	str	r1, [fp, #-28]
	strb	r3, [fp, #-21]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L30
.L35:
	ldr	r2, .L40
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L31
	mov	r3, #0
	b	.L32
.L31:
	ldr	r2, .L40
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
	ldr	r2, .L40
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #0]
	b	.L34
.L33:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #26
	ble	.L35
.L34:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L36
.L39:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L37
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L38
.L37:
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L36:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L39
.L38:
	ldr	r3, [fp, #-12]
.L32:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L41:
	.align	2
.L40:
	.word	lettersAlreadyGuessed
	.size	validChar, .-validChar
	.align	2
	.global	wordComplete
	.type	wordComplete, %function
wordComplete:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L43
.L49:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L44
.L46:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r1, .L50
	ldr	r3, [fp, #-16]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L45
	mov	r3, #1
	str	r3, [fp, #-12]
.L45:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L44:
	ldr	r2, .L50
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L46
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L47
	mov	r3, #0
	b	.L48
.L47:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L43:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L49
	mov	r3, #1
.L48:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L51:
	.align	2
.L50:
	.word	lettersAlreadyGuessed
	.size	wordComplete, .-wordComplete
	.section	.rodata
	.align	2
.LC8:
	.ascii	"           \000"
	.text
	.align	2
	.global	displayWordSoFar
	.type	displayWordSoFar, %function
displayWordSoFar:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, .L60
	mov	r0, r3
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L53
.L59:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L54
.L56:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r1, .L60+4
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L55
	mov	r3, #1
	str	r3, [fp, #-16]
.L55:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L54:
	ldr	r2, .L60+4
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L56
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	b	.L58
.L57:
	mov	r3, #45
	strb	r3, [fp, #-17]
.L58:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L53:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L59
	mov	r0, #10
	bl	putchar
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L61:
	.align	2
.L60:
	.word	.LC8
	.word	lettersAlreadyGuessed
	.size	displayWordSoFar, .-displayWordSoFar
	.align	2
	.global	guessAllLetters
	.type	guessAllLetters, %function
guessAllLetters:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #97
	str	r3, [fp, #-8]
	b	.L63
.L64:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #97
	ldr	r2, [fp, #-8]
	uxtb	r1, r2
	ldr	r2, .L65
	strb	r1, [r2, r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L63:
	ldr	r3, [fp, #-8]
	cmp	r3, #122
	ble	.L64
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L66:
	.align	2
.L65:
	.word	lettersAlreadyGuessed
	.size	guessAllLetters, .-guessAllLetters
	.section	.rodata
	.align	2
.LC9:
	.ascii	"You have %d %s left!\012\000"
	.align	2
.LC10:
	.ascii	"life\000"
	.align	2
.LC11:
	.ascii	"lives\000"
	.align	2
.LC12:
	.ascii	"          ---|          \000"
	.align	2
.LC13:
	.ascii	"          |  %c         \012\000"
	.align	2
.LC14:
	.ascii	"          | %c%c%c\012\000"
	.align	2
.LC15:
	.ascii	"          | %c %c\012\000"
	.align	2
.LC16:
	.ascii	"          |-------\000"
	.text
	.align	2
	.global	hngDrawMan
	.type	hngDrawMan, %function
hngDrawMan:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #6
	bgt	.L79
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L79
.L69:
	mov	r3, #32
	strb	r3, [fp, #-5]
	mov	r3, #32
	strb	r3, [fp, #-6]
	mov	r3, #32
	strb	r3, [fp, #-7]
	mov	r3, #32
	strb	r3, [fp, #-8]
	mov	r3, #32
	strb	r3, [fp, #-9]
	mov	r3, #32
	strb	r3, [fp, #-10]
	ldr	r3, [fp, #-16]
	cmp	r3, #5
	bgt	.L71
	mov	r3, #48
	strb	r3, [fp, #-5]
.L71:
	ldr	r3, [fp, #-16]
	cmp	r3, #4
	bgt	.L72
	mov	r3, #124
	strb	r3, [fp, #-10]
.L72:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	bgt	.L73
	mov	r3, #47
	strb	r3, [fp, #-6]
.L73:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	bgt	.L74
	mov	r3, #92
	strb	r3, [fp, #-7]
.L74:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bgt	.L75
	mov	r3, #47
	strb	r3, [fp, #-8]
.L75:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L76
	mov	r3, #92
	strb	r3, [fp, #-9]
.L76:
	ldr	r2, .L80
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L77
	ldr	r3, .L80+4
	b	.L78
.L77:
	ldr	r3, .L80+8
.L78:
	mov	r0, r2
	ldr	r1, [fp, #-16]
	mov	r2, r3
	bl	printf
	ldr	r0, .L80+12
	bl	puts
	ldr	r2, .L80+16
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	printf
	ldr	r0, .L80+20
	ldrb	r1, [fp, #-6]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	bl	printf
	ldr	r1, .L80+24
	ldrb	r2, [fp, #-8]	@ zero_extendqisi2
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	printf
	ldr	r0, .L80+28
	bl	puts
	b	.L67
.L79:
	mov	r0, r0	@ nop
.L67:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L81:
	.align	2
.L80:
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.size	hngDrawMan, .-hngDrawMan
	.align	2
	.global	isValidGuess
	.type	isValidGuess, %function
isValidGuess:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L83
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	validWord
	mov	r3, r0
	cmp	r3, #0
	beq	.L84
	ldr	r3, [fp, #-16]
	b	.L85
.L83:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	validChar
	mov	r3, r0
	cmp	r3, #0
	beq	.L84
	ldr	r3, [fp, #-12]
	b	.L85
.L84:
	ldr	r3, [fp, #-8]
.L85:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	isValidGuess, .-isValidGuess
	.section	.rodata
	.align	2
.LC17:
	.ascii	"\012Please make a guess: \000"
	.align	2
.LC18:
	.ascii	"%s\000"
	.align	2
.LC19:
	.ascii	"\012\000"
	.align	2
.LC20:
	.ascii	"Oops, take another guess!\000"
	.align	2
.LC21:
	.ascii	"Good guess!\000"
	.align	2
.LC22:
	.ascii	"Good guess! You knew the word!\000"
	.align	2
.LC23:
	.ascii	"You won!\000"
	.align	2
.LC24:
	.ascii	"You Lost, try again.\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 280
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #280
	bl	welcomeMessage
	bl	newGameOrExit
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L87
	mov	r0, #1
	bl	exit
.L87:
	bl	getDifficulty
	str	r0, [fp, #-16]
	mov	r3, #6
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	wordBank
	str	r0, [fp, #-20]
	b	.L88
.L93:
	ldr	r0, [fp, #-8]
	bl	hngDrawMan
	ldr	r0, [fp, #-20]
	bl	displayWordSoFar
	ldr	r3, .L96
	mov	r0, r3
	bl	printf
	mov	r0, r0	@ nop
.L89:
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L89
	ldr	r2, .L96+4
	sub	r3, fp, #284
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	sub	r3, fp, #284
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	isValidGuess
	str	r0, [fp, #-28]
	ldr	r0, .L96+8
	bl	puts
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L90
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r0, .L96+12
	bl	puts
	b	.L88
.L90:
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L91
	ldr	r0, .L96+16
	bl	puts
	b	.L88
.L91:
	ldr	r0, .L96+20
	bl	puts
	bl	guessAllLetters
	b	.L92
.L88:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L92
	ldr	r0, [fp, #-20]
	bl	wordComplete
	mov	r3, r0
	cmp	r3, #0
	beq	.L93
.L92:
	ldr	r0, [fp, #-8]
	bl	hngDrawMan
	ldr	r0, [fp, #-20]
	bl	displayWordSoFar
	ldr	r0, [fp, #-20]
	bl	wordComplete
	mov	r3, r0
	cmp	r3, #0
	beq	.L94
	ldr	r0, .L96+24
	bl	puts
	b	.L95
.L94:
	ldr	r0, .L96+28
	bl	puts
.L95:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L97:
	.align	2
.L96:
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.size	main, .-main
	.data
	.align	2
	.type	easy.2243, %object
	.size	easy.2243, 8
easy.2243:
	.ascii	"giraffe\000"
	.align	2
	.type	norm.2244, %object
	.size	norm.2244, 10
norm.2244:
	.ascii	"embezzled\000"
	.align	2
	.type	hard.2245, %object
	.size	hard.2245, 13
hard.2245:
	.ascii	"quizzicality\000"
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
