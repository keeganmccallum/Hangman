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
	ldr	r0, .L8
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
	ldr	r0, .L8+4
	bl	puts
	bl	newGameOrExit
	mov	r3, r0
	b	.L6
.L5:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #121
	bne	.L7
	mov	r3, #1
	b	.L6
.L7:
	mov	r3, #0
.L6:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L9:
	.align	2
.L8:
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
	ldr	r0, .L13
	bl	puts
	mov	r0, r0	@ nop
.L11:
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L11
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L12
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #50
	beq	.L12
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #51
	beq	.L12
	ldr	r0, .L13+4
	bl	puts
	mov	r0, #1
	bl	exit
.L12:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	sub	r3, r3, #48
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L14:
	.align	2
.L13:
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
	bne	.L17
	ldr	r3, .L20
	b	.L18
.L17:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	bne	.L19
	ldr	r3, .L20+4
	b	.L18
.L19:
	ldr	r3, .L20+8
.L18:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L21:
	.align	2
.L20:
	.word	easy.2239
	.word	norm.2240
	.word	hard.2241
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
	b	.L23
.L27:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L24
	mov	r3, #0
	b	.L25
.L24:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L26
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L26
	mov	r3, #1
	b	.L25
.L26:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L27
	b	.L22
.L25:
.L22:
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
	b	.L29
.L34:
	ldr	r2, .L39
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L30
	mov	r3, #0
	b	.L31
.L30:
	ldr	r2, .L39
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L32
	ldr	r2, .L39
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #0]
	b	.L33
.L32:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L29:
	ldr	r3, [fp, #-8]
	cmp	r3, #26
	ble	.L34
.L33:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L35
.L38:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L36
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L37
.L36:
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L35:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L38
.L37:
	ldr	r3, [fp, #-12]
.L31:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L40:
	.align	2
.L39:
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
	b	.L42
.L48:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L43
.L45:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r1, .L49
	ldr	r3, [fp, #-16]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L44
	mov	r3, #1
	str	r3, [fp, #-12]
.L44:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L43:
	ldr	r2, .L49
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L45
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L46
	mov	r3, #0
	b	.L47
.L46:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L42:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L48
	mov	r3, #1
.L47:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L50:
	.align	2
.L49:
	.word	lettersAlreadyGuessed
	.size	wordComplete, .-wordComplete
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
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L52
.L58:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L53
.L55:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r1, .L59
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L54
	mov	r3, #1
	str	r3, [fp, #-16]
.L54:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L53:
	ldr	r2, .L59
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L55
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	b	.L57
.L56:
	mov	r3, #45
	strb	r3, [fp, #-17]
.L57:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L52:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L58
	mov	r0, #10
	bl	putchar
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L60:
	.align	2
.L59:
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
	b	.L62
.L63:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #97
	ldr	r2, [fp, #-8]
	uxtb	r1, r2
	ldr	r2, .L64
	strb	r1, [r2, r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L62:
	ldr	r3, [fp, #-8]
	cmp	r3, #122
	ble	.L63
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L65:
	.align	2
.L64:
	.word	lettersAlreadyGuessed
	.size	guessAllLetters, .-guessAllLetters
	.section	.rodata
	.align	2
.LC8:
	.ascii	"You have %d %s left!\012\000"
	.align	2
.LC9:
	.ascii	"life\000"
	.align	2
.LC10:
	.ascii	"lives\000"
	.align	2
.LC11:
	.ascii	"          ---|          \000"
	.align	2
.LC12:
	.ascii	"          |  %c         \012\000"
	.align	2
.LC13:
	.ascii	"          | %c%c%c\012\000"
	.align	2
.LC14:
	.ascii	"          | %c %c\012\000"
	.align	2
.LC15:
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
	bgt	.L78
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L78
.L68:
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
	bgt	.L70
	mov	r3, #48
	strb	r3, [fp, #-5]
.L70:
	ldr	r3, [fp, #-16]
	cmp	r3, #4
	bgt	.L71
	mov	r3, #124
	strb	r3, [fp, #-10]
.L71:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	bgt	.L72
	mov	r3, #47
	strb	r3, [fp, #-6]
.L72:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	bgt	.L73
	mov	r3, #92
	strb	r3, [fp, #-7]
.L73:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bgt	.L74
	mov	r3, #47
	strb	r3, [fp, #-8]
.L74:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L75
	mov	r3, #92
	strb	r3, [fp, #-9]
.L75:
	ldr	r2, .L79
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L76
	ldr	r3, .L79+4
	b	.L77
.L76:
	ldr	r3, .L79+8
.L77:
	mov	r0, r2
	ldr	r1, [fp, #-16]
	mov	r2, r3
	bl	printf
	ldr	r0, .L79+12
	bl	puts
	ldr	r2, .L79+16
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	printf
	ldr	r0, .L79+20
	ldrb	r1, [fp, #-6]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	bl	printf
	ldr	r1, .L79+24
	ldrb	r2, [fp, #-8]	@ zero_extendqisi2
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	printf
	ldr	r0, .L79+28
	bl	puts
	b	.L66
.L78:
	mov	r0, r0	@ nop
.L66:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L80:
	.align	2
.L79:
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
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
	beq	.L82
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	validWord
	mov	r3, r0
	cmp	r3, #0
	beq	.L83
	ldr	r3, [fp, #-16]
	b	.L84
.L82:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	validChar
	mov	r3, r0
	cmp	r3, #0
	beq	.L83
	ldr	r3, [fp, #-12]
	b	.L84
.L83:
	ldr	r3, [fp, #-8]
.L84:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	isValidGuess, .-isValidGuess
	.section	.rodata
	.align	2
.LC16:
	.ascii	"Please make a guess: \000"
	.align	2
.LC17:
	.ascii	"%s\000"
	.align	2
.LC18:
	.ascii	"\012\000"
	.align	2
.LC19:
	.ascii	"Oops, take another guess!\000"
	.align	2
.LC20:
	.ascii	"Good guess!\000"
	.align	2
.LC21:
	.ascii	"Good guess! You knew the word!\000"
	.align	2
.LC22:
	.ascii	"You won!\000"
	.align	2
.LC23:
	.ascii	"You Lost, try again.\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 296
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #300
	mov	r3, sp
	mov	r8, r3
	bl	welcomeMessage
	bl	newGameOrExit
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L86
	mov	r0, #1
	bl	exit
.L86:
	bl	getDifficulty
	str	r0, [fp, #-44]
	mov	r3, #6
	str	r3, [fp, #-32]
	mov	r3, #26
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r1, [fp, #-48]
	mov	r2, r1
	mov	r3, #0
	mov	r1, r2, lsr #29
	mov	r7, r3, asl #3
	orr	r7, r1, r7
	mov	r6, r2, asl #3
	ldr	r1, [fp, #-48]
	mov	r2, r1
	mov	r3, #0
	mov	r1, r2, lsr #29
	mov	r5, r3, asl #3
	orr	r5, r1, r5
	mov	r4, r2, asl #3
	ldr	r3, [fp, #-48]
	add	r3, r3, #7
	add	r3, r3, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L87
.L88:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L87:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	blt	.L88
	ldr	r0, [fp, #-44]
	bl	wordBank
	str	r0, [fp, #-60]
	b	.L89
.L94:
	ldr	r0, [fp, #-32]
	bl	hngDrawMan
	ldr	r3, .L97
	mov	r0, r3
	bl	printf
	ldr	r0, [fp, #-60]
	bl	displayWordSoFar
	mov	r0, r0	@ nop
.L90:
	bl	getchar
	mov	r3, r0
	strb	r3, [fp, #-61]
	ldrb	r3, [fp, #-61]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L90
	ldr	r2, .L97+4
	sub	r3, fp, #324
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	sub	r3, fp, #324
	mov	r0, r3
	ldr	r1, [fp, #-60]
	bl	isValidGuess
	str	r0, [fp, #-68]
	ldr	r0, .L97+8
	bl	puts
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bne	.L91
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r0, .L97+12
	bl	puts
	b	.L89
.L91:
	ldr	r3, [fp, #-68]
	cmp	r3, #1
	bne	.L92
	ldr	r0, .L97+16
	bl	puts
	b	.L89
.L92:
	ldr	r0, .L97+20
	bl	puts
	bl	guessAllLetters
	b	.L93
.L89:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	ble	.L93
	ldr	r0, [fp, #-60]
	bl	wordComplete
	mov	r3, r0
	cmp	r3, #0
	beq	.L94
.L93:
	ldr	r0, [fp, #-32]
	bl	hngDrawMan
	ldr	r0, [fp, #-60]
	bl	displayWordSoFar
	ldr	r0, [fp, #-60]
	bl	wordComplete
	mov	r3, r0
	cmp	r3, #0
	beq	.L95
	ldr	r0, .L97+24
	bl	puts
	b	.L96
.L95:
	ldr	r0, .L97+28
	bl	puts
.L96:
	mov	r3, #0
	mov	sp, r8
	mov	r0, r3
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, pc}
.L98:
	.align	2
.L97:
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.size	main, .-main
	.data
	.align	2
	.type	easy.2239, %object
	.size	easy.2239, 8
easy.2239:
	.ascii	"giraffe\000"
	.align	2
	.type	norm.2240, %object
	.size	norm.2240, 10
norm.2240:
	.ascii	"embezzled\000"
	.align	2
	.type	hard.2241, %object
	.size	hard.2241, 13
hard.2241:
	.ascii	"quizzicality\000"
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
