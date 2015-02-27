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
	.file	"pr#oject1.c"
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
getDifficulty:												@ ARM-to-C TRANSLATION by Eric Song
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}									
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L14										@ (printf("Please enter a difficulty, 1: easy, 2: medium, 3: hard\n");
	bl	puts											@ )
	mov	r0, r0	@ nop										@ char c
.L12:
	bl	getchar											
	mov	r3, r0											@ ( c = getChar()
	strb	r3, [fp, #-5]										@ )
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2							@ (
	cmp	r3, #10											@ while c != \n )
	bne	.L12											
	bl	getchar											
	mov	r3, r0											@ (difficulty = getChar
	strb	r3, [fp, #-6]										@ )
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2							@ (
	cmp	r3, #49											@ if difficulty != 1)
	beq	.L13											
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2							@ (
	cmp	r3, #50											@ if difficulty != 2)
	beq	.L13										
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2							@ (
	cmp	r3, #51											@ if difficulty != 3)
	beq	.L13											
	ldr	r0, .L14+4										@ (printf("Error reading difficulty.\n");
	bl	puts											@ )
	mov	r0, #1				
	bl	exit											@ exit(1)
.L13:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2							@ (
	sub	r3, r3, #48										
	mov	r0, r3											@ return (difficulty - 0))
	sub	sp, fp, #4										@ restore space
	ldmfd	sp!, {fp, pc}										@ restore old frame pointer
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
	str	fp, [sp, #-4]!										@ save old frame pointer in stack
	add	fp, sp, #0										@ create new frame pointer to be used as reference				
	sub	sp, sp, #20										@ reserve space for local variables and copies of parameters
	str	r0, [fp, #-16]      									@ copy parameter lives into stack
	str	r1, [fp, #-20]										@ copy parameter difficulty into stack
	ldr	r3, [fp, #-16]										@ (
	ldr	r2, [fp, #-20]										
	mul	r3, r2, r3										@ myScore = lives*difficulty
	str	r3, [fp, #-8]										@ )
	ldr	r3, [fp, #-8]										@ (
	mov	r0, r3											@ return myScore)
	add	sp, fp, #0										@ restore space
	ldmfd	sp!, {fp}										@ restore old frame pointer
	bx	lr											@ branch to return address stored in lr
	.size	score, .-score
	.align	2
	.global	wordBank
	.type	wordBank, %function
wordBank:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!										@ save old frame pointer in stack
	add	fp, sp, #0										@ create new frame pointer to be used as reference
	sub	sp, sp, #12										@ reserve space for local variables and copies of parameters
	str	r0, [fp, #-8]										@ copy parameter difficulty in stack
	ldr	r3, [fp, #-8]										@ (
	cmp	r3, #1											@ if difficulty == 1)
	bne	.L18											
	ldr	r3, .L21										@ r3 = "giraffe"
	b	.L19
.L18:
	ldr	r3, [fp, #-8]										@ (
	cmp	r3, #2											@ if difficulty == 2)
	bne	.L20											
	ldr	r3, .L21+4										@ r3 = "embezzled"
	b	.L19
.L20:
	ldr	r3, .L21+8										@ else r3 = "quizzicality"
.L19:
	mov	r0, r3											@ return r3
	add	sp, fp, #0										@ restore space
	ldmfd	sp!, {fp}										@ restore old frame pointer
	bx	lr											@ branch to return address stored in lr
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
validWord:													@ ARM-to-C TRANSLATION by BRANDON BLOCH
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!										@ save old frame pointer on stack
	add	fp, sp, #0											@ create new fp to be used as a reference
	sub	sp, sp, #20											@ (reserve space for local vars and copies of params)
	str	r0, [fp, #-16]										@ (copy param guess to stack)
	str	r1, [fp, #-20]										@ (copy param correctWord to stack)
	mov	r3, #0												@ (i = 0;
	str	r3, [fp, #-8]										@ )
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
	cmp	r2, r3												@ (if (guess[i] != correctWord[i])
	beq	.L25
	mov	r3, #0												@ (return 0;)
	b	.L26												@ )
.L25:														@ (else
	ldr	r3, [fp, #-8]										@ (
	add	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0												@ if (correctWord[i+1] == '\0'
	bne	.L27
	ldr	r3, [fp, #-8]										@ &&
	add	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0												@ guess[i+1] == '\0')
	bne	.L27
	mov	r3, #1												@ (return 1;)
	b	.L26												@ )
.L27:														@ (else
	ldr	r3, [fp, #-8]
	add	r3, r3, #1											@ (i++
	str	r3, [fp, #-8]										@ )
.L24:
	ldr	r3, [fp, #-8]										@ (while
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0												@ (correctWord[i] != '\0')
	bne	.L28												@ )
	mov	r3, #0												@ (return 0;)
.L26:
	mov	r0, r3
	add	sp, fp, #0											@ restore space
	ldmfd	sp!, {fp}										@ restore old frame pointer
	bx	lr													@ branch to return address stored in lr
	.size	validWord, .-validWord
	.align	2
	.global	validChar
	.type	validChar, %function
validChar:													@ ARM-to-C TRANSLATION by Christina Masci
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!										@ save old frame pointer on stack
	add	fp, sp, #0											@ create new fp to be used as a reference
	sub	sp, sp, #28											@ (reserve space for local variables and copies of parameters)
	mov	r3, r0												
	str	r1, [fp, #-28]										@ (copy  parameter correctWord to stack)
	strb	r3, [fp, #-21]									@ (copy  parameter guess to stack)
	mov	r3, #0												@ (i = 0
	str	r3, [fp, #-8]										@ )
	b	.L30
.L35:
	ldr	r2, .L40											@ (if (lettersAlreadyGuessed[i] == guess)
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L31												@ )
	mov	r3, #0												@ (return 0
	b	.L32
.L31:
	ldr	r2, .L40											@ else { (if (lettersAlreadyGuessed[i] == '\0')
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33																							
	ldr	r2, .L40											@ lettersAlreadyGuessed[i] = guess;
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #0]
	b	.L34												@ break; )
.L33:
	ldr	r3, [fp, #-8]										@ (i++
	add	r3, r3, #1
	str	r3, [fp, #-8]										@ )
.L30:
	ldr	r3, [fp, #-8]										@ (while (i < 27)
	cmp	r3, #26
	ble	.L35												@ )
.L34:
	mov	r3, #0												@ (j = 0
	str	r3, [fp, #-16]										@ )
	b	.L36
.L39:
	ldr	r3, [fp, #-16]										@ (if (guess == correctWord[j])
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L37
	mov	r3, #1												@ (result = 1
	str	r3, [fp, #-12]										@ )
	b	.L38												@ )
.L37:
	mov	r3, #0												@ else { (result = 0
	str	r3, [fp, #-12]										@ )
	ldr	r3, [fp, #-16]										@ (j++
	add	r3, r3, #1											
	str	r3, [fp, #-16]										@ )								
.L36:
	ldr	r3, [fp, #-16]										@ (while (correctWord[j] != '\0')
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L39												@ )
.L38:
	ldr	r3, [fp, #-12]										@ (return result
.L32:
	mov	r0, r3												@ ))
	add	sp, fp, #0											@ restore space
	ldmfd	sp!, {fp}										@ restore old frame pointer
	bx	lr													@ branch to return address stored in lr
.L41:
	.align	2
.L40:
	.word	lettersAlreadyGuessed
	.size	validChar, .-validChar
	.align	2
	.global	wordComplete
	.type	wordComplete, %function
wordComplete:												@ARM-to-C TRANSLATION by Eric Song
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!										@ save old frame pointer on stack
	add	fp, sp, #0										@ create new frame pointer to be used as refrence
	sub	sp, sp, #28										@ reserve space for local variables and copies of parameters
	str	r0, [fp, #-24]										@ copy parameter word into stack
	mov	r3, #0											@ (int i = 0
	str	r3, [fp, #-8]										@ )
	b	.L43
.L49:
	mov	r3, #0											@ (int goodGuess = 0
	str	r3, [fp, #-12]										@ )
	mov	r3, #0											@ (int j = 0
	str	r3, [fp, #-16]										@ )
	b	.L44											
.L46:
	ldr	r3, [fp, #-8]										@ (
	ldr	r2, [fp, #-24]										
	add	r3, r2, r3						
	ldrb	r2, [r3, #0]	@ zero_extendqisi2							@ word[i]
	ldr	r1, .L50
	ldr	r3, [fp, #-16]										@ (
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2							
	cmp	r2, r3											@ if word[i] == lettersAlreadyGuessed[j] )
	bne	.L45											
	mov	r3, #1											@ (goodGuess = 1
	str	r3, [fp, #-12]										@ )
.L45:
	ldr	r3, [fp, #-16]										@ (
	add	r3, r3, #1										@ j++
	str	r3, [fp, #-16]										@ )
.L44:
	ldr	r2, .L50
	ldr	r3, [fp, #-16]										@ (
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2							
	cmp	r3, #0											@ if lettersAlreadyGuessed[j] != 0 )
	bne	.L46											
	ldr	r3, [fp, #-12]										@ (
	cmp	r3, #0											@ if goodGuess != 0 (or is false) )
	bne	.L47											
	mov	r3, #0											@ return 0
	b	.L48											
.L47:
	ldr	r3, [fp, #-8]										@ (
	add	r3, r3, #1										@ i++
	str	r3, [fp, #-8]										@ )
.L43:
	ldr	r3, [fp, #-8]										@ (
	ldr	r2, [fp, #-24]										
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0											@ while word[i] != 0 )
	bne	.L49											
	mov	r3, #1											@ i++
.L48:
	mov	r0, r3											@ return 1
	add	sp, fp, #0										@ restore space
	ldmfd	sp!, {fp}										@ restore old frame pointer
	bx	lr											@ branch to return address stored in lr
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
displayWordSoFar:											@ ARM-to-C TRANSLATION by BRANDON BLOCH
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24											@ (reserve space for local vars and copies of params)
	str	r0, [fp, #-24]										@ (copy param currentWord to stack)
	ldr	r3, .L60											@ (printf("           ");
	mov	r0, r3
	bl	printf												@ )
	mov	r3, #0												@ (int i = 0;
	str	r3, [fp, #-8]										@ )
	b	.L53
.L59:
	mov	r3, #0												@ (int j = 0;
	str	r3, [fp, #-12]										@ )
	mov	r3, #0												@ (int match = 0;
	str	r3, [fp, #-16]										@ )
	b	.L54
.L56:
	ldr	r3, [fp, #-8]										@ (if
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r1, .L60+4
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3												@ (correctWord[i] == lettersAlreadyGuessed[j])
	bne	.L55
	mov	r3, #1												@ (match = 1;
	str	r3, [fp, #-16]										@ ))
.L55:
	ldr	r3, [fp, #-12]										@ (
	add	r3, r3, #1											@ j++;
	str	r3, [fp, #-12]										@ )
.L54:
	ldr	r2, .L60+4											@ (while
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0												@ (lettersAlreadyGuessed[j] != '\0')
	bne	.L56												@ )
	ldr	r3, [fp, #-16]										@ (if
	cmp	r3, #0												@ (match)
	beq	.L57
	ldr	r3, [fp, #-8]										@ (printChar = correctWord[i];
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]									@ )
	b	.L58
.L57:														@ (else
	mov	r3, #45												@ (printChar = '-';
	strb	r3, [fp, #-17]									@ ))
.L58:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2				@ (printf("%c", printChar);
	mov	r0, r3
	bl	putchar												@ )
	ldr	r3, [fp, #-8]										@ (
	add	r3, r3, #1											@ i++;
	str	r3, [fp, #-8]										@ )
.L53:
	ldr	r3, [fp, #-8]										@ (while
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0												@ (correctWord[i] != '\0')
	bne	.L59												@ )
	mov	r0, #10												@ (printf("\n");
	bl	putchar												@ )
	sub	sp, fp, #4											@ restore space
	ldmfd	sp!, {fp, pc}									@ restore old frame pointer
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
					@ARM-to-C translation Nicholas Sheahan
	stmfd	sp!, {fp, lr}		@batch save machine state on stack
	add	fp, sp, #4		@setup frame pointer
	sub	sp, sp, #280		@create stack space
	bl	welcomeMessage		@call welcomeMessage
	bl	newGameOrExit		@call newGameOrExit
	str	r0, [fp, #-12]		
	ldr	r3, [fp, #-12]		@int gameStatus = newGameOrExit()
	cmp	r3, #0			@if (gameStatus == 0)
	bne	.L87			@not equal goto L87
	mov	r0, #1			@otherwise load 1 into r0
	bl	exit			@exit(1)
.L87:
	bl	getDifficulty		@call getDifficulty
	str	r0, [fp, #-16]		@int difficulty = getDifficulty()
	mov	r3, #6			
	str	r3, [fp, #-8]		@int numLives = 6
	ldr	r0, [fp, #-16]		
	bl	wordBank		@char *word = wordBank(difficulty)
	str	r0, [fp, #-20]
	b	.L88			@goto L88 unconditionally
.L93:
	ldr	r0, [fp, #-8]		@put numLives in r0
	bl	hngDrawMan		@hngDrawMan(numLives)
	ldr	r0, [fp, #-20]		@put word in r0
	bl	displayWordSoFar	@displayWordSoFar(word);
	ldr	r3, .L96		@.L96 holds "Please make a guess"
	mov	r0, r3			@move into r0 for printf
	bl	printf			@call printf with argument .L96
	mov	r0, r0	@ nop		@Strange behaviour, why enter a nop?
.L89:
	bl	getchar			@call getchar()
	mov	r3, r0			@store return in r3
	strb	r3, [fp, #-21]		@c = getchar()
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #10			@compares c with '\n'
	bne	.L89			@if not equal go back to .L89
	ldr	r2, .L96+4		
	sub	r3, fp, #284		@char guess[256];
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf		@scanf("%s", guess);
	sub	r3, fp, #284
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	isValidGuess		@isValidGuess(guess, word);
	str	r0, [fp, #-28]		@store result in int guessStatus
	ldr	r0, .L96+8		
	bl	puts			@printf("\n\n")
	ldr	r3, [fp, #-28]		@load r3 with int guessStatus
	cmp	r3, #0			@if (guessStatus == 0)
	bne	.L90			@not equal go to .L90
	ldr	r3, [fp, #-8]		@load numLives;
	sub	r3, r3, #1		@numLives--;
	str	r3, [fp, #-8]		
	ldr	r0, .L96+12
	bl	puts			@printf("Oops, take another guess);
	b	.L88			@goto .L88
.L90:
	ldr	r3, [fp, #-28]		@load guessStatus into r3
	cmp	r3, #1			@if (guessStatus == 1)
	bne	.L91			@if not goto .L91
	ldr	r0, .L96+16		@else load "Good Guess"
	bl	puts			@printf("Good Guess")
	b	.L88			@branch to .L88
.L91:
	ldr	r0, .L96+20		
	bl	puts			@printf("Good guess, you knew the word");
	bl	guessAllLetters		@call guessAllLetters()
	b	.L92			@branch .L92
.L88:
	ldr	r3, [fp, #-8]		@put numLives in r3
	cmp	r3, #0			@while (numLives > 0
	ble	.L92			@goto L92 if less than
	ldr	r0, [fp, #-20]		@put word in r0
	bl	wordComplete		@ && !wordComplete(word))
	mov	r3, r0			
	cmp	r3, #0			@if wordComplete(word) is 0 goto L93
	beq	.L93
.L92:
	ldr	r0, [fp, #-8]
	bl	hngDrawMan		@hngDrawMan(numLives)
	ldr	r0, [fp, #-20]		
	bl	displayWordSoFar	@displayWordSoFar(word)
	ldr	r0, [fp, #-20]		
	bl	wordComplete		@wordComplete(word)
	mov	r3, r0			@put return into r3
	cmp	r3, #0			@compare wordComplete return with 0
	beq	.L94			@if equal goto .L94
	ldr	r0, .L96+24
	bl	puts			@printf("You lost, try again);
	b	.L95
.L94:
	ldr	r0, .L96+28
	bl	puts			@printf("You won!\n");
.L95:
	mov	r3, #0			@0 into r3
	mov	r0, r3			@0 into r0
	sub	sp, fp, #4		
	ldmfd	sp!, {fp, pc}		@return 0
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
