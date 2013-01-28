	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.code	16
	.file	"main.c"
	.text
	.align	2
	.global	LZ77UnCompWRAM
	.code	16
	.thumb_func
	.type	LZ77UnCompWRAM, %function
LZ77UnCompWRAM:
	mov	r2, r0
	mov	r3, r1
@ 3 "lz77.h" 1
	mov r0, r2
mov r1, r3
swi 0x11

@ 0 "" 2
	.code	16
	@ sp needed for prologue
	bx	lr
	.size	LZ77UnCompWRAM, .-LZ77UnCompWRAM
	.align	2
	.global	LZ77UnCompVRAM
	.code	16
	.thumb_func
	.type	LZ77UnCompVRAM, %function
LZ77UnCompVRAM:
	mov	r2, r0
	mov	r3, r1
@ 13 "lz77.h" 1
	mov r0, r2
mov r1, r3
swi 0x12

@ 0 "" 2
	.code	16
	@ sp needed for prologue
	bx	lr
	.size	LZ77UnCompVRAM, .-LZ77UnCompVRAM
	.align	2
	.global	initializeSprites
	.code	16
	.thumb_func
	.type	initializeSprites, %function
initializeSprites:
	push	{r4, lr}
	ldr	r3, .L10
	mov	r2, #128
	lsl	r2, r2, #3
	add	r4, r3, r2
	mov	r0, #160
	mov	r1, #240
	mov	r2, #0
.L6:
	strh	r0, [r3]
	strh	r1, [r3, #2]
	strh	r2, [r3, #4]
	add	r3, r3, #8
	cmp	r4, r3
	bne	.L6
	@ sp needed for prologue
	pop	{r4}
	pop	{r0}
	bx	r0
.L11:
	.align	2
.L10:
	.word	sprites
	.size	initializeSprites, .-initializeSprites
	.align	2
	.global	CopyOAM
	.code	16
	.thumb_func
	.type	CopyOAM, %function
CopyOAM:
	push	{r4, lr}
	mov	r2, #224
	ldr	r1, .L16
	ldr	r0, .L16+4
	lsl	r2, r2, #19
.L13:
	ldr	r4, .L16+8
	add	r3, r1, r2
	add	r3, r3, r4
	ldrh	r3, [r3]
	strh	r3, [r2]
	add	r2, r2, #2
	cmp	r2, r0
	bne	.L13
	@ sp needed for prologue
	pop	{r4}
	pop	{r0}
	bx	r0
.L17:
	.align	2
.L16:
	.word	sprites
	.word	117441536
	.word	-117440512
	.size	CopyOAM, .-CopyOAM
	.global	__aeabi_uidivmod
	.align	2
	.global	initializeBackground
	.code	16
	.thumb_func
	.type	initializeBackground, %function
initializeBackground:
	push	{r4, r5, r6, r7, lr}
	ldr	r1, .L30
	ldr	r0, .L30+4
	ldr	r4, .L30+8
	sub	sp, sp, #4
.L19:
	ldr	r5, .L30+12
	add	r2, r0, r1
	add	r3, r2, r5
	sub	r5, r5, #1
	ldrb	r3, [r3]
	add	r2, r2, r5
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r1]
	add	r1, r1, #2
	cmp	r1, r4
	bne	.L19
	mov	r3, #160
	ldr	r2, .L30
	lsl	r3, r3, #19
@ 13 "lz77.h" 1
	mov r0, r2
mov r1, r3
swi 0x12

@ 0 "" 2
	.code	16
	ldr	r0, .L30+16
	ldr	r4, .L30+20
	mov	r1, r2
.L20:
	ldr	r5, .L30+12
	add	r2, r0, r1
	add	r3, r2, r5
	sub	r5, r5, #1
	ldrb	r3, [r3]
	add	r2, r2, r5
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r1]
	add	r1, r1, #2
	cmp	r1, r4
	bne	.L20
	mov	r3, #192
	ldr	r2, .L30
	lsl	r3, r3, #19
@ 13 "lz77.h" 1
	mov r0, r2
mov r1, r3
swi 0x12

@ 0 "" 2
	.code	16
	ldr	r0, .L30+24
	ldr	r4, .L30+28
	mov	r1, r2
.L21:
	ldr	r5, .L30+12
	add	r2, r0, r1
	add	r3, r2, r5
	sub	r5, r5, #1
	ldrb	r3, [r3]
	add	r2, r2, r5
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r1]
	add	r1, r1, #2
	cmp	r1, r4
	bne	.L21
	ldr	r2, .L30+32
	ldr	r3, .L30
@ 13 "lz77.h" 1
	mov r0, r3
mov r1, r2
swi 0x12

@ 0 "" 2
	.code	16
	mov	r4, #1
	mov	r5, #1
	mov	r7, #1
	ldr	r6, .L30+36
	b	.L24
.L29:
	add	r3, r5, #1
	lsl	r3, r3, #16
	lsr	r5, r3, #16
.L24:
	ldr	r1, .L30+40
	sub	r2, r4, r7
	lsl	r2, r2, #1
	add	r2, r2, r1
	ldr	r1, .L30+44
	lsl	r3, r5, #1
	add	r3, r3, r1
	ldrh	r3, [r3]
	mov	r0, r5
	strh	r3, [r2]
	mov	r1, #30
	bl	__aeabi_uidivmod
	lsl	r1, r1, #16
	cmp	r1, #0
	bne	.L22
	cmp	r4, #0
	beq	.L22
	add	r3, r4, #2
	lsl	r3, r3, #16
	lsr	r4, r3, #16
.L22:
	add	r3, r4, #1
	lsl	r3, r3, #16
	lsr	r4, r3, #16
	cmp	r4, r6
	bls	.L29
	add	sp, sp, #4
	@ sp needed for prologue
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L31:
	.align	2
.L30:
	.word	33771520
	.word	palette_Data
	.word	33771640
	.word	-33771519
	.word	background_Tiles
	.word	33774880
	.word	background_Map
	.word	33772416
	.word	33767424
	.word	650
	.word	100679680
	.word	33767422
	.size	initializeBackground, .-initializeBackground
	.align	2
	.global	initializeConfig
	.code	16
	.thumb_func
	.type	initializeConfig, %function
initializeConfig:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	sub	sp, sp, #128
	add	r3, sp, #96
	mov	r7, r0
	ldr	r1, .L46
	mov	r0, r3
	mov	r2, #30
	add	r6, sp, #64
	mov	r8, r3
	add	r5, sp, #32
	bl	memcpy
	ldr	r1, .L46+4
	mov	r2, #30
	mov	r0, r6
	bl	memcpy
	ldr	r1, .L46+8
	mov	r2, #30
	mov	r0, r5
	bl	memcpy
	ldr	r1, .L46+12
	mov	r0, sp
	mov	r2, #30
	mov	r4, sp
	bl	memcpy
	cmp	r7, #0
	bne	.L33
	ldr	r0, .L46+16
	ldr	r3, [sp, #96]
	mov	r2, r0
	stmia	r2!, {r3}
	ldr	r3, [sp, #100]
	str	r3, [r0, #4]
	ldr	r3, [sp, #104]
	str	r3, [r2, #4]
	ldr	r3, [sp, #108]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #112]
	add	r2, r1, #4
	str	r3, [r2, #4]
	ldr	r3, [sp, #116]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #120]
	mov	r2, #28
	str	r3, [r1, #8]
	mov	r1, #2
.L34:
	mov	r4, r8
	ldrb	r3, [r4, r2]
	strb	r3, [r0, r2]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	sub	r3, r1, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	cmp	r1, #0
	bne	.L34
.L41:
	add	sp, sp, #128
	@ sp needed for prologue
	pop	{r2}
	mov	r8, r2
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L33:
	cmp	r7, #1
	bne	.L36
	ldr	r0, .L46+16
	ldr	r3, [r6]
	mov	r2, r0
	stmia	r2!, {r3}
	ldr	r3, [sp, #68]
	str	r3, [r0, #4]
	ldr	r3, [sp, #72]
	str	r3, [r2, #4]
	ldr	r3, [sp, #76]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #80]
	add	r2, r1, #4
	str	r3, [r2, #4]
	ldr	r3, [sp, #84]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #88]
	mov	r2, #28
	str	r3, [r1, #8]
	mov	r1, #2
.L37:
	ldrb	r3, [r6, r2]
	strb	r3, [r0, r2]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	sub	r3, r1, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	cmp	r1, #0
	bne	.L37
	b	.L41
.L36:
	cmp	r7, #2
	bne	.L38
	ldr	r0, .L46+16
	ldr	r3, [r5]
	mov	r2, r0
	stmia	r2!, {r3}
	ldr	r3, [sp, #36]
	str	r3, [r0, #4]
	ldr	r3, [sp, #40]
	str	r3, [r2, #4]
	ldr	r3, [sp, #44]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #48]
	add	r2, r1, #4
	str	r3, [r2, #4]
	ldr	r3, [sp, #52]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #56]
	mov	r2, #28
	str	r3, [r1, #8]
	mov	r1, #2
.L39:
	ldrb	r3, [r5, r2]
	strb	r3, [r0, r2]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	sub	r3, r1, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	cmp	r1, #0
	bne	.L39
	b	.L41
.L38:
	cmp	r7, #3
	bne	.L41
	ldr	r0, .L46+16
	ldr	r3, [sp]
	mov	r2, r0
	stmia	r2!, {r3}
	ldr	r3, [sp, #4]
	str	r3, [r0, #4]
	ldr	r3, [sp, #8]
	str	r3, [r2, #4]
	ldr	r3, [sp, #12]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #16]
	add	r2, r1, #4
	str	r3, [r2, #4]
	ldr	r3, [sp, #20]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #24]
	mov	r2, #28
	str	r3, [r1, #8]
	mov	r1, #2
.L40:
	ldrb	r3, [r4, r2]
	strb	r3, [r0, r2]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	sub	r3, r1, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	cmp	r1, #0
	bne	.L40
	b	.L41
.L47:
	.align	2
.L46:
	.word	C.1.1391
	.word	C.2.1392
	.word	C.3.1393
	.word	C.4.1394
	.word	tileConfiguration
	.size	initializeConfig, .-initializeConfig
	.align	2
	.global	getTilePos
	.code	16
	.thumb_func
	.type	getTilePos, %function
getTilePos:
	push	{r4, r5, lr}
	mov	r5, #0
	mov	r2, #0
	ldr	r1, .L55
	mov	r4, #127
	b	.L51
.L50:
	add	r2, r2, #1
	cmp	r2, #30
	beq	.L54
.L51:
	ldrb	r3, [r1, r2]
	and	r3, r3, r4
	cmp	r0, r3
	bne	.L50
	lsl	r3, r2, #16
	add	r2, r2, #1
	lsr	r5, r3, #16
	cmp	r2, #30
	bne	.L51
.L54:
	mov	r0, r5
	@ sp needed for prologue
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L56:
	.align	2
.L55:
	.word	tileConfiguration
	.size	getTilePos, .-getTilePos
	.align	2
	.global	getPosX
	.code	16
	.thumb_func
	.type	getPosX, %function
getPosX:
	push	{lr}
	sub	sp, sp, #4
	cmp	r0, #5
	bls	.L59
	sub	r0, r0, #6
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	mov	r1, #6
	bl	__aeabi_uidivmod
	lsl	r1, r1, #16
	lsr	r0, r1, #16
.L59:
	add	sp, sp, #4
	@ sp needed for prologue
	pop	{r1}
	bx	r1
	.size	getPosX, .-getPosX
	.global	__aeabi_uidiv
	.align	2
	.global	getPosY
	.code	16
	.thumb_func
	.type	getPosY, %function
getPosY:
	push	{lr}
	sub	sp, sp, #4
	cmp	r0, #5
	bls	.L65
	sub	r0, r0, #6
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	mov	r1, #6
	bl	__aeabi_uidiv
	add	r0, r0, #1
	lsl	r0, r0, #16
	lsr	r0, r0, #16
.L63:
	add	sp, sp, #4
	@ sp needed for prologue
	pop	{r1}
	bx	r1
.L65:
	mov	r0, #0
	b	.L63
	.size	getPosY, .-getPosY
	.align	2
	.global	initializeTiles
	.code	16
	.thumb_func
	.type	initializeTiles, %function
initializeTiles:
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L80
	mov	r3, #43
	strh	r3, [r2]
	ldr	r3, .L80+4
	strh	r3, [r2, #2]
	mov	r3, #128
	lsl	r3, r3, #1
	strh	r3, [r2, #4]
	ldr	r2, .L80+8
	ldr	r3, .L80+12
	strh	r3, [r2]
	ldr	r3, .L80+16
	add	r2, r2, #2
	strh	r3, [r2]
	add	r2, r2, #2
	sub	r3, r3, #34
	strh	r3, [r2]
	ldr	r3, .L80+20
	add	r2, r2, #2
	strh	r3, [r2]
	ldr	r2, .L80+24
	ldr	r3, .L80+28
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	ldr	r2, .L80+32
	ldr	r3, .L80+36
	strh	r3, [r2]
	ldr	r3, .L80+40
	add	r2, r2, #2
	strh	r3, [r2]
	ldr	r3, .L80+44
	add	r2, r2, #2
	strh	r3, [r2]
	ldr	r3, .L80+48
	mov	r2, #0
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	add	r3, r3, #2
	strh	r2, [r3]
	cmp	r0, #0
	bne	.L67
	ldr	r0, .L80+52
	ldr	r4, .L80+56
	ldr	r5, .L80+60
	ldr	r6, .L80+64
.L68:
	ldr	r1, .L80+68
	add	r2, r4, r0
	ldr	r7, .L80+72
	add	r3, r2, r1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r0]
	ldr	r3, .L80+76
	add	r2, r5, r0
	add	r7, r7, #1
	add	r1, r0, r3
	add	r3, r2, r7
	sub	r7, r7, #1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	add	r0, r0, #2
	strh	r3, [r1]
	cmp	r0, r6
	bne	.L68
.L69:
	ldr	r2, .L80+80
	ldr	r3, .L80+52
@ 13 "lz77.h" 1
	mov r0, r3
mov r1, r2
swi 0x12

@ 0 "" 2
	.code	16
	ldr	r2, .L80+84
	ldr	r3, .L80+88
@ 13 "lz77.h" 1
	mov r0, r3
mov r1, r2
swi 0x12

@ 0 "" 2
	.code	16
	@ sp needed for prologue
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L67:
	cmp	r0, #1
	bne	.L70
	ldr	r0, .L80+52
	ldr	r5, .L80+60
	ldr	r4, .L80+92
	ldr	r6, .L80+96
.L71:
	ldr	r1, .L80+68
	add	r2, r4, r0
	ldr	r7, .L80+72
	add	r3, r2, r1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r0]
	ldr	r3, .L80+76
	add	r2, r5, r0
	add	r7, r7, #1
	add	r1, r0, r3
	add	r3, r2, r7
	sub	r7, r7, #1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	add	r0, r0, #2
	strh	r3, [r1]
	cmp	r0, r6
	bne	.L71
	b	.L69
.L70:
	cmp	r0, #2
	bne	.L72
	ldr	r0, .L80+52
	ldr	r5, .L80+60
	ldr	r4, .L80+100
	ldr	r6, .L80+104
.L73:
	ldr	r1, .L80+68
	add	r2, r4, r0
	ldr	r7, .L80+72
	add	r3, r2, r1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r0]
	ldr	r3, .L80+76
	add	r2, r5, r0
	add	r7, r7, #1
	add	r1, r0, r3
	add	r3, r2, r7
	sub	r7, r7, #1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	add	r0, r0, #2
	strh	r3, [r1]
	cmp	r0, r6
	bne	.L73
	b	.L69
.L72:
	cmp	r0, #3
	bne	.L69
	ldr	r0, .L80+52
	ldr	r5, .L80+60
	ldr	r4, .L80+108
	ldr	r6, .L80+112
.L74:
	ldr	r1, .L80+68
	add	r2, r4, r0
	ldr	r7, .L80+72
	add	r3, r2, r1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r0]
	ldr	r3, .L80+76
	add	r2, r5, r0
	add	r7, r7, #1
	add	r1, r0, r3
	add	r3, r2, r7
	sub	r7, r7, #1
	ldrb	r3, [r3]
	add	r2, r2, r7
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	add	r0, r0, #2
	strh	r3, [r1]
	cmp	r0, r6
	bne	.L74
	b	.L69
.L81:
	.align	2
.L80:
	.word	sprites
	.word	-32697
	.word	83886592
	.word	65512
	.word	37165
	.word	6577
	.word	40403
	.word	83886600
	.word	83886604
	.word	11862
	.word	16089
	.word	4255
	.word	83886610
	.word	33771520
	.word	tileset00_data
	.word	pointer_data
	.word	33774108
	.word	-33771519
	.word	-33771520
	.word	-4096
	.word	100728832
	.word	100737024
	.word	33767424
	.word	tileset01_data
	.word	33773860
	.word	tileset02_data
	.word	33773668
	.word	tileset03_data
	.word	33773588
	.size	initializeTiles, .-initializeTiles
	.align	2
	.global	setTileGFX
	.code	16
	.thumb_func
	.type	setTileGFX, %function
setTileGFX:
	push	{r4, r5, r6, r7, lr}
	mov	r7, fp
	mov	r6, sl
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
	ldr	r1, .L93
	ldr	r2, .L93+4
	sub	sp, sp, #12
	mov	r0, #0
	mov	r4, #128
	mov	r9, r0
	mov	r3, #127
	lsl	r0, r4, #3
	ldr	r7, .L93+8
	ldr	r6, .L93+12
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r5, #1
	mov	sl, r3
	mov	fp, r0
.L83:
	mov	r1, #0
	mov	r2, #0
	b	.L86
.L85:
	add	r2, r2, #1
	cmp	r2, #30
	beq	.L92
.L86:
	lsl	r3, r2, #16
	lsr	r0, r3, #16
	ldrb	r3, [r6, r2]
	mov	r4, sl
	and	r3, r3, r4
	cmp	r3, r5
	bne	.L85
	add	r2, r2, #1
	mov	r1, r0
	cmp	r2, #30
	bne	.L86
.L92:
	cmp	r1, #5
	bls	.L87
	sub	r4, r1, #6
	lsl	r4, r4, #16
	lsr	r4, r4, #16
	mov	r0, r4
	mov	r1, #6
	bl	__aeabi_uidivmod
	lsl	r1, r1, #16
	lsr	r1, r1, #16
	mov	r8, r1
	mov	r0, r4
	mov	r1, #6
	bl	__aeabi_uidiv
	add	r0, r0, #1
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	lsl	r3, r0, #1
	add	r3, r3, r0
	lsl	r1, r3, #1
	ldr	r3, [sp, #4]
	add	r3, r3, r8
	ldrb	r3, [r3, r1]
	sub	r2, r7, #2
	strh	r3, [r2]
.L89:
	ldr	r3, [sp]
	add	r3, r3, r8
	ldrb	r3, [r3, r1]
	ldr	r0, .L93+16
	orr	r3, r3, r0
	strh	r3, [r7]
	mov	r1, fp
	mov	r3, r9
	orr	r3, r3, r1
	strh	r3, [r7, #2]
	mov	r3, r9
	add	r3, r3, #16
	lsl	r3, r3, #16
	ldr	r2, .L93+20
	lsr	r3, r3, #16
	add	r7, r7, #8
	mov	r9, r3
	add	r5, r5, #1
	cmp	r2, r7
	bne	.L83
	add	sp, sp, #12
	@ sp needed for prologue
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	sl, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L87:
	ldr	r4, [sp, #4]
	ldrb	r3, [r4, r1]
	sub	r2, r7, #2
	mov	r8, r1
	strh	r3, [r2]
	mov	r1, #0
	b	.L89
.L94:
	.align	2
.L93:
	.word	coordsY
	.word	coordsX
	.word	sprites+10
	.word	tileConfiguration
	.word	-32768
	.word	sprites+138
	.size	setTileGFX, .-setTileGFX
	.align	2
	.global	getKeyInput
	.code	16
	.thumb_func
	.type	getKeyInput, %function
getKeyInput:
	push	{r4, r5, r6, r7, lr}
	ldr	r6, .L112
	ldrh	r3, [r6]
	cmp	r3, #0
	beq	.LCB919
	b	.L111	@long jump
.LCB919:
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	lsl	r2, r3, #27
	bmi	.L97
	ldr	r1, .L112+8
	ldrb	r2, [r1]
	cmp	r2, #4
	bhi	.L97
	mov	r3, #1
	strh	r3, [r6]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r5, r3, #24
	ldr	r3, .L112+12
	ldrb	r3, [r3]
	strb	r5, [r1]
	cmp	r3, #0
	beq	.LCB941
	b	.L98	@long jump
.LCB941:
	ldr	r4, .L112+16
	ldr	r0, .L112+20
.L99:
	ldrb	r2, [r0]
	lsl	r3, r2, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r5
	ldrb	r3, [r4, r3]
	ldr	r1, .L112+24
	sub	r3, r3, #1
	strh	r3, [r1]
.L97:
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	lsl	r2, r3, #26
	bmi	.L100
	ldr	r1, .L112+8
	ldrb	r2, [r1]
	cmp	r2, #0
	beq	.L100
	mov	r3, #1
	strh	r3, [r6]
	sub	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r5, r3, #24
	ldr	r3, .L112+12
	ldrb	r3, [r3]
	strb	r5, [r1]
	cmp	r3, #0
	beq	.LCB978
	b	.L101	@long jump
.LCB978:
	ldr	r4, .L112+16
	ldr	r0, .L112+20
.L102:
	ldrb	r2, [r0]
	lsl	r3, r2, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r5
	ldrb	r3, [r4, r3]
	ldr	r1, .L112+24
	sub	r3, r3, #1
	strh	r3, [r1]
.L100:
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	lsl	r2, r3, #24
	bmi	.L103
	ldr	r1, .L112+20
	ldrb	r2, [r1]
	cmp	r2, #3
	bhi	.L103
	mov	r3, #1
	strh	r3, [r6]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, .L112+12
	ldrb	r3, [r3]
	strb	r2, [r1]
	cmp	r3, #0
	beq	.LCB1015
	b	.L104	@long jump
.LCB1015:
	lsl	r3, r2, #1
	add	r3, r3, r2
	ldr	r0, .L112+8
	ldr	r4, .L112+28
	lsl	r5, r3, #1
.L105:
	ldrb	r2, [r0]
	add	r3, r4, r5
	ldrb	r3, [r3, r2]
	ldr	r1, .L112+32
	sub	r3, r3, #1
	strh	r3, [r1]
.L103:
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	lsl	r2, r3, #25
	bmi	.L106
	ldr	r1, .L112+20
	ldrb	r2, [r1]
	cmp	r2, #0
	beq	.L106
	mov	r3, #1
	strh	r3, [r6]
	sub	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, .L112+12
	ldrb	r3, [r3]
	strb	r2, [r1]
	cmp	r3, #0
	beq	.LCB1052
	b	.L107	@long jump
.LCB1052:
	lsl	r3, r2, #1
	add	r3, r3, r2
	ldr	r0, .L112+8
	ldr	r4, .L112+28
	lsl	r5, r3, #1
.L108:
	ldrb	r2, [r0]
	add	r3, r4, r5
	ldrb	r3, [r3, r2]
	ldr	r1, .L112+32
	sub	r3, r3, #1
	strh	r3, [r1]
.L106:
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	mov	r7, #1
	tst	r3, r7
	bne	.L109
	ldrh	r3, [r6]
	cmp	r3, #0
	bne	.L109
	ldr	r3, .L112+36
	mov	ip, r3
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L109
	ldr	r6, .L112+40
	ldrh	r0, [r6]
	cmp	r0, #0
	beq	.L110
	ldr	r3, .L112+20
	ldrb	r2, [r3]
	lsl	r3, r2, #1
	add	r3, r3, r2
	ldr	r2, .L112+8
	ldrb	r2, [r2]
	lsl	r3, r3, #1
	ldr	r1, .L112+44
	add	r3, r3, r2
	ldrb	r5, [r1, r3]
	cmp	r5, #0
	bne	.L109
	ldr	r0, .L112+12
	ldrb	r2, [r0]
	ldr	r4, .L112+48
	strb	r2, [r1, r3]
	lsl	r2, r2, #3
	add	r2, r4, r2
	ldrh	r1, [r2, #4]
	ldr	r3, .L112+52
	and	r1, r1, r3
	mov	r3, #128
	lsl	r3, r3, #3
	orr	r1, r1, r3
	mov	r3, #128
	strh	r1, [r2, #4]
	lsl	r3, r3, #1
	mov	r2, ip
	strb	r5, [r0]
	strh	r5, [r6]
	strh	r3, [r4, #4]
	strh	r7, [r2]
	ldr	r3, .L112+56
	ldr	r2, .L112+60
	strh	r2, [r3]
.L109:
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	lsl	r2, r3, #31
	bpl	.L111
	ldr	r2, .L112+36
	mov	r3, #0
	strh	r3, [r2]
.L111:
	@ sp needed for prologue
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L98:
	ldr	r0, .L112+20
	ldrb	r2, [r0]
	lsl	r3, r2, #1
	add	r3, r3, r2
	ldr	r4, .L112+16
	lsl	r3, r3, #1
	add	r3, r3, r5
	ldr	r1, .L112+64
	ldrb	r3, [r4, r3]
	strh	r3, [r1]
	b	.L99
.L101:
	ldr	r0, .L112+20
	ldrb	r2, [r0]
	lsl	r3, r2, #1
	add	r3, r3, r2
	ldr	r4, .L112+16
	lsl	r3, r3, #1
	add	r3, r3, r5
	ldr	r1, .L112+64
	ldrb	r3, [r4, r3]
	strh	r3, [r1]
	b	.L102
.L104:
	lsl	r3, r2, #1
	ldr	r0, .L112+8
	add	r3, r3, r2
	ldr	r4, .L112+28
	lsl	r5, r3, #1
	ldrb	r2, [r0]
	add	r3, r4, r5
	ldr	r1, .L112+68
	ldrb	r3, [r3, r2]
	strh	r3, [r1]
	b	.L105
.L107:
	lsl	r3, r2, #1
	ldr	r0, .L112+8
	add	r3, r3, r2
	ldr	r4, .L112+28
	lsl	r5, r3, #1
	ldrb	r2, [r0]
	add	r3, r4, r5
	ldr	r1, .L112+68
	ldrb	r3, [r3, r2]
	strh	r3, [r1]
	b	.L108
.L110:
	ldr	r3, .L112+20
	ldrb	r2, [r3]
	lsl	r3, r2, #1
	add	r3, r3, r2
	ldr	r2, .L112+8
	ldrb	r2, [r2]
	lsl	r3, r3, #1
	ldr	r1, .L112+44
	add	r4, r3, r2
	ldrb	r2, [r1, r4]
	cmp	r2, #0
	beq	.L109
	ldr	r3, .L112+12
	strb	r0, [r1, r4]
	strb	r2, [r3]
	ldr	r1, .L112+48
	mov	r3, #144
	lsl	r3, r3, #4
	strh	r7, [r6]
	strh	r3, [r1, #4]
	lsl	r3, r2, #3
	add	r1, r1, r3
	ldrh	r3, [r1, #4]
	ldr	r2, .L112+52
	and	r3, r3, r2
	strh	r3, [r1, #4]
	mov	r3, ip
	strh	r7, [r3]
	ldr	r2, .L112+72
	ldr	r3, .L112+56
	strh	r2, [r3]
	ldr	r3, .L112+16
	ldr	r2, .L112+64
	ldrb	r3, [r3, r4]
	strh	r3, [r2]
	ldr	r3, .L112+28
	ldr	r2, .L112+68
	ldrb	r3, [r3, r4]
	strh	r3, [r2]
	b	.L109
.L113:
	.align	2
.L112:
	.word	MOVEFLAG
	.word	67109168
	.word	DATAX
	.word	CURRENTTILE
	.word	coordsX
	.word	DATAY
	.word	CURX
	.word	coordsY
	.word	CURY
	.word	ABUTTON
	.word	CARRYFLAG
	.word	tileConfiguration
	.word	sprites
	.word	1023
	.word	83886608
	.word	4255
	.word	DESTX
	.word	DESTY
	.word	-32501
	.size	getKeyInput, .-getKeyInput
	.align	2
	.global	getPxTileX
	.code	16
	.thumb_func
	.type	getPxTileX, %function
getPxTileX:
	ldr	r3, .L116
	ldrb	r3, [r3]
	ldr	r2, .L116+4
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldrb	r0, [r2, #2]
	@ sp needed for prologue
	bx	lr
.L117:
	.align	2
.L116:
	.word	CURRENTTILE
	.word	sprites
	.size	getPxTileX, .-getPxTileX
	.align	2
	.global	getPxTileY
	.code	16
	.thumb_func
	.type	getPxTileY, %function
getPxTileY:
	ldr	r3, .L120
	ldrb	r3, [r3]
	ldr	r2, .L120+4
	lsl	r3, r3, #3
	ldrh	r0, [r3, r2]
	mov	r3, #127
	and	r0, r0, r3
	@ sp needed for prologue
	bx	lr
.L121:
	.align	2
.L120:
	.word	CURRENTTILE
	.word	sprites
	.size	getPxTileY, .-getPxTileY
	.align	2
	.global	getCurTileX
	.code	16
	.thumb_func
	.type	getCurTileX, %function
getCurTileX:
	ldr	r3, .L124
	@ sp needed for prologue
	ldrb	r0, [r3, #2]
	bx	lr
.L125:
	.align	2
.L124:
	.word	sprites
	.size	getCurTileX, .-getCurTileX
	.align	2
	.global	getCurTileY
	.code	16
	.thumb_func
	.type	getCurTileY, %function
getCurTileY:
	ldr	r3, .L128
	ldrh	r0, [r3]
	mov	r3, #127
	and	r0, r0, r3
	@ sp needed for prologue
	bx	lr
.L129:
	.align	2
.L128:
	.word	sprites
	.size	getCurTileY, .-getCurTileY
	.align	2
	.global	step
	.code	16
	.thumb_func
	.type	step, %function
step:
	push	{r4, r5, r6, r7, lr}
	mov	r7, fp
	mov	r6, sl
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
	ldr	r3, .L148
	ldrb	r7, [r3]
	ldr	r0, .L148+4
	lsl	r4, r7, #3
	add	r2, r0, r4
	ldrh	r5, [r2, #2]
	mov	r1, #255
	mov	r3, r5
	and	r3, r3, r1
	mov	r8, r3
	ldrh	r3, [r0, r4]
	mov	sl, r2
	mov	r2, #127
	and	r3, r3, r2
	mov	r9, r3
	ldrh	r3, [r0, #2]
	and	r3, r3, r1
	mov	ip, r3
	ldrh	r3, [r0]
	and	r3, r3, r2
	mov	fp, r3
	ldr	r3, .L148+8
	ldrh	r6, [r3]
	cmp	r6, r8
	bls	.L131
	cmp	r7, #0
	bne	.L142
.L131:
	ldr	r3, .L148+12
	ldrh	r5, [r3]
	cmp	r5, ip
	bls	.L132
	ldrh	r3, [r0, #2]
	add	r3, r3, #1
	strh	r3, [r0, #2]
.L132:
	cmp	r6, r8
	bcs	.L133
	cmp	r7, #0
	bne	.L143
.L133:
	cmp	r5, ip
	bcs	.L134
	ldrh	r3, [r0, #2]
	sub	r3, r3, #1
	strh	r3, [r0, #2]
.L134:
	ldr	r3, .L148+16
	ldrh	r2, [r3]
	cmp	r2, r9
	bls	.L135
	cmp	r7, #0
	bne	.L144
.L135:
	ldr	r3, .L148+20
	ldrh	r1, [r3]
	cmp	r1, fp
	bls	.L136
	ldrh	r3, [r0]
	add	r3, r3, #1
	strh	r3, [r0]
.L136:
	cmp	r2, r9
	bcs	.L137
	cmp	r7, #0
	bne	.L145
.L137:
	cmp	r1, fp
	bcs	.L138
	ldrh	r3, [r0]
	sub	r3, r3, #1
	strh	r3, [r0]
.L138:
	cmp	r6, r8
	beq	.L146
.L139:
	cmp	r5, ip
	beq	.L147
.L141:
	@ sp needed for prologue
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	sl, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L145:
	ldrh	r3, [r0, r4]
	sub	r3, r3, #1
	strh	r3, [r0, r4]
	b	.L137
.L144:
	ldrh	r3, [r0, r4]
	add	r3, r3, #1
	strh	r3, [r0, r4]
	b	.L135
.L143:
	add	r2, r0, r4
	ldrh	r3, [r2, #2]
	sub	r3, r3, #1
	strh	r3, [r2, #2]
	b	.L133
.L142:
	add	r3, r5, #1
	mov	r2, sl
	strh	r3, [r2, #2]
	b	.L131
.L147:
	cmp	r1, fp
	bne	.L141
	ldr	r2, .L148+24
	mov	r3, #0
	strh	r3, [r2]
	b	.L141
.L146:
	cmp	r2, r9
	bne	.L139
	ldr	r2, .L148+24
	mov	r3, #0
	strh	r3, [r2]
	b	.L139
.L149:
	.align	2
.L148:
	.word	CURRENTTILE
	.word	sprites
	.word	DESTX
	.word	CURX
	.word	DESTY
	.word	CURY
	.word	MOVEFLAG
	.size	step, .-step
	.align	2
	.global	Win
	.code	16
	.thumb_func
	.type	Win, %function
Win:
	push	{r4, r5, lr}
	ldr	r4, .L156
	ldr	r0, .L156+4
	mov	r5, #1
	mov	r1, #0
.L153:
	ldrb	r2, [r4, r1]
	ldrb	r3, [r0, r1]
	cmp	r2, r3
	beq	.L152
	mov	r5, #0
.L152:
	add	r1, r1, #1
	cmp	r1, #30
	bne	.L153
	mov	r0, r5
	@ sp needed for prologue
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L157:
	.align	2
.L156:
	.word	tileConfiguration
	.word	win.1635
	.size	Win, .-Win
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
	push	{r4, r5, r6, r7, lr}
	mov	r7, fp
	mov	r6, sl
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
	ldr	r3, .L214
	mov	r2, #0
	strh	r2, [r3]
	ldr	r3, .L214+4
	ldr	r0, .L214+8
	ldr	r1, .L214+12
	ldr	r4, .L214+16
	sub	sp, sp, #76
	strh	r2, [r3]
	ldr	r6, .L214+20
	mov	r3, #72
	str	r0, [sp, #24]
	strh	r2, [r1]
	strb	r2, [r0]
	strh	r3, [r4]
	str	r1, [sp, #20]
	mov	r3, #44
	ldr	r1, .L214+24
	strh	r3, [r6]
	mov	r3, #71
	strh	r3, [r1]
	ldr	r3, .L214+28
	str	r3, [sp, #4]
	str	r4, [sp, #16]
	ldr	r4, [sp, #4]
	mov	r3, #43
	strh	r3, [r4]
	ldr	r3, .L214+32
	mov	r2, #1
	str	r1, [sp, #8]
	str	r6, [sp, #12]
	strb	r2, [r3]
	ldr	r3, .L214+36
	strb	r2, [r3]
	ldr	r2, .L214+40
	ldr	r3, .L214+44
	strh	r2, [r3]
	mov	r3, #128
	ldr	r2, .L214+48
	lsl	r3, r3, #19
	strh	r2, [r3]
	ldr	r1, .L214+52
	ldr	r0, .L214+56
	ldr	r4, .L214+60
.L159:
	ldr	r5, .L214+64
	add	r2, r0, r1
	ldr	r6, .L214+68
	add	r3, r2, r5
	ldrb	r3, [r3]
	add	r2, r2, r6
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r1]
	add	r1, r1, #2
	cmp	r1, r4
	bne	.L159
	mov	r3, #160
	ldr	r2, .L214+52
	lsl	r3, r3, #19
@ 13 "lz77.h" 1
	mov r0, r2
mov r1, r3
swi 0x12

@ 0 "" 2
	.code	16
	ldr	r0, .L214+72
	ldr	r4, .L214+76
	mov	r1, r2
.L160:
	ldr	r5, .L214+64
	add	r2, r0, r1
	ldr	r6, .L214+68
	add	r3, r2, r5
	ldrb	r3, [r3]
	add	r2, r2, r6
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r1]
	add	r1, r1, #2
	cmp	r1, r4
	bne	.L160
	mov	r3, #192
	ldr	r2, .L214+52
	lsl	r3, r3, #19
@ 13 "lz77.h" 1
	mov r0, r2
mov r1, r3
swi 0x12

@ 0 "" 2
	.code	16
	ldr	r0, .L214+80
	ldr	r4, .L214+84
	mov	r1, r2
.L161:
	ldr	r5, .L214+64
	add	r2, r0, r1
	ldr	r6, .L214+68
	add	r3, r2, r5
	ldrb	r3, [r3]
	add	r2, r2, r6
	ldrb	r2, [r2]
	lsl	r3, r3, #8
	add	r3, r3, r2
	strh	r3, [r1]
	add	r1, r1, #2
	cmp	r1, r4
	bne	.L161
	ldr	r2, .L214+88
	ldr	r3, .L214+52
@ 13 "lz77.h" 1
	mov r0, r3
mov r1, r2
swi 0x12

@ 0 "" 2
	.code	16
	mov	r4, #1
	mov	r5, #1
	mov	r6, #1
	ldr	r7, .L214+92
	b	.L164
.L208:
	add	r3, r5, #1
	lsl	r3, r3, #16
	lsr	r5, r3, #16
.L164:
	ldr	r1, .L214+96
	lsl	r3, r5, #1
	ldr	r0, .L214+100
	add	r3, r3, r1
	sub	r2, r4, r6
	ldrh	r3, [r3]
	lsl	r2, r2, #1
	add	r2, r2, r0
	strh	r3, [r2]
	mov	r0, r5
	mov	r1, #30
	bl	__aeabi_uidivmod
	lsl	r1, r1, #16
	cmp	r1, #0
	bne	.L162
	cmp	r4, #0
	beq	.L162
	add	r3, r4, #2
	lsl	r3, r3, #16
	lsr	r4, r3, #16
.L162:
	add	r3, r4, #1
	lsl	r3, r3, #16
	lsr	r4, r3, #16
	cmp	r4, r7
	bls	.L208
	ldr	r5, .L214+104
	mov	r2, #128
	lsl	r2, r2, #3
	add	r4, r5, r2
	mov	r3, r5
	mov	r0, #160
	mov	r1, #240
	mov	r2, #0
.L165:
	strh	r0, [r3]
	strh	r1, [r3, #2]
	strh	r2, [r3, #4]
	add	r3, r3, #8
	cmp	r4, r3
	bne	.L165
	add	r4, sp, #40
	ldr	r1, .L214+108
	mov	r2, #30
	mov	r0, r4
	bl	memcpy
	ldr	r3, .L214+112
	str	r3, [sp, #28]
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #40]
	stmia	r2!, {r3}
	ldr	r3, [sp, #44]
	ldr	r6, [sp, #28]
	str	r3, [r6, #4]
	ldr	r3, [sp, #48]
	str	r3, [r2, #4]
	ldr	r3, [sp, #52]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #56]
	add	r2, r1, #4
	str	r3, [r2, #4]
	ldr	r3, [sp, #60]
	add	r1, r2, #4
	str	r3, [r1, #4]
	ldr	r3, [sp, #64]
	mov	r2, #28
	str	r3, [r1, #8]
	mov	r1, #2
.L166:
	ldrb	r3, [r4, r2]
	ldr	r0, [sp, #28]
	strb	r3, [r0, r2]
	add	r3, r2, #1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	sub	r3, r1, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	cmp	r1, #0
	bne	.L166
	mov	r0, #3
	bl	initializeTiles
	ldr	r2, .L214+116
	ldr	r3, .L214+120
	mov	r1, #0
	mov	r0, #128
	mov	r9, r1
	mov	r4, #127
	lsl	r1, r0, #3
	ldr	r7, .L214+124
	str	r2, [sp, #36]
	str	r3, [sp, #32]
	mov	r6, #1
	mov	sl, r4
	mov	fp, r1
.L167:
	mov	r1, #0
	mov	r2, #0
	b	.L170
.L215:
	.align	2
.L214:
	.word	CARRYFLAG
	.word	STEPS
	.word	CURRENTTILE
	.word	MOVEFLAG
	.word	DESTX
	.word	DESTY
	.word	CURX
	.word	CURY
	.word	DATAX
	.word	DATAY
	.word	2051
	.word	67108872
	.word	4417
	.word	33771520
	.word	palette_Data
	.word	33771640
	.word	-33771519
	.word	-33771520
	.word	background_Tiles
	.word	33774880
	.word	background_Map
	.word	33772416
	.word	33767424
	.word	650
	.word	33767422
	.word	100679680
	.word	sprites
	.word	C.4.1394
	.word	tileConfiguration
	.word	coordsY
	.word	coordsX
	.word	sprites+10
.L169:
	add	r2, r2, #1
	cmp	r2, #30
	beq	.L209
.L170:
	ldr	r4, [sp, #28]
	lsl	r3, r2, #16
	lsr	r0, r3, #16
	ldrb	r3, [r4, r2]
	mov	r4, sl
	and	r3, r3, r4
	cmp	r6, r3
	bne	.L169
	add	r2, r2, #1
	mov	r1, r0
	cmp	r2, #30
	bne	.L170
.L209:
	cmp	r1, #5
	bhi	.LCB1865
	b	.L171	@long jump
.LCB1865:
	sub	r4, r1, #6
	lsl	r4, r4, #16
	lsr	r4, r4, #16
	mov	r0, r4
	mov	r1, #6
	bl	__aeabi_uidivmod
	lsl	r1, r1, #16
	lsr	r1, r1, #16
	mov	r8, r1
	mov	r0, r4
	mov	r1, #6
	bl	__aeabi_uidiv
	add	r0, r0, #1
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	lsl	r3, r0, #1
	add	r3, r3, r0
	lsl	r1, r3, #1
	ldr	r3, [sp, #36]
	add	r3, r3, r8
	ldrb	r3, [r3, r1]
	sub	r2, r7, #2
	strh	r3, [r2]
.L191:
	ldr	r3, [sp, #32]
	add	r3, r3, r8
	ldrb	r3, [r3, r1]
	ldr	r0, .L216
	orr	r3, r3, r0
	strh	r3, [r7]
	mov	r1, fp
	mov	r3, r9
	orr	r3, r3, r1
	strh	r3, [r7, #2]
	mov	r3, r9
	add	r3, r3, #16
	lsl	r3, r3, #16
	ldr	r2, .L216+4
	lsr	r3, r3, #16
	add	r7, r7, #8
	mov	r9, r3
	add	r6, r6, #1
	cmp	r2, r7
	beq	.LCB1910
	b	.L167	@long jump
.LCB1910:
	ldr	r4, .L216+8
	mov	r0, #1
	mov	r1, #0
.L206:
	cmp	r1, #29
	bhi	.LCB1919
	b	.L188	@long jump
.LCB1919:
	cmp	r0, #0
	beq	.LCB1921
	b	.L210	@long jump
.LCB1921:
	ldr	r1, [sp, #20]
	ldrh	r3, [r1]
	cmp	r3, #0
	beq	.L211
.L184:
	ldr	r3, [sp, #24]
	ldrb	r3, [r3]
	lsl	r0, r3, #3
	add	r1, r5, r0
	ldrh	r2, [r1, #2]
	mov	r6, #255
	and	r6, r6, r2
	mov	ip, r3
	ldrh	r3, [r5, r0]
	mov	sl, r6
	mov	r6, #127
	and	r6, r6, r3
	ldrh	r3, [r5, #2]
	mov	fp, r6
	mov	r6, #255
	and	r6, r6, r3
	ldrh	r3, [r5]
	mov	r8, r6
	mov	r6, #127
	and	r6, r6, r3
	ldr	r3, [sp, #16]
	ldrh	r7, [r3]
	mov	r9, r6
	cmp	sl, r7
	bcs	.L173
	mov	r6, ip
	cmp	r6, #0
	beq	.L173
	add	r3, r2, #1
	strh	r3, [r1, #2]
.L173:
	ldr	r1, [sp, #8]
	ldrh	r6, [r1]
	cmp	r8, r6
	bcs	.L174
	ldrh	r3, [r5, #2]
	add	r3, r3, #1
	strh	r3, [r5, #2]
.L174:
	cmp	sl, r7
	bls	.L175
	mov	r2, ip
	cmp	r2, #0
	beq	.L175
	add	r2, r5, r0
	ldrh	r3, [r2, #2]
	sub	r3, r3, #1
	strh	r3, [r2, #2]
.L175:
	cmp	r8, r6
	bls	.L176
	ldrh	r3, [r5, #2]
	sub	r3, r3, #1
	strh	r3, [r5, #2]
.L176:
	ldr	r3, [sp, #12]
	ldrh	r1, [r3]
	cmp	fp, r1
	bcs	.L177
	mov	r2, ip
	cmp	r2, #0
	beq	.L177
	ldrh	r3, [r5, r0]
	add	r3, r3, #1
	strh	r3, [r5, r0]
.L177:
	ldr	r3, [sp, #4]
	ldrh	r2, [r3]
	cmp	r9, r2
	bcs	.L178
	ldrh	r3, [r5]
	add	r3, r3, #1
	strh	r3, [r5]
.L178:
	cmp	fp, r1
	bls	.L179
	mov	r3, ip
	cmp	r3, #0
	beq	.L179
	ldrh	r3, [r5, r0]
	sub	r3, r3, #1
	strh	r3, [r5, r0]
.L179:
	cmp	r9, r2
	bls	.L180
	ldrh	r3, [r5]
	sub	r3, r3, #1
	strh	r3, [r5]
.L180:
	cmp	sl, r7
	beq	.L212
.L181:
	cmp	r8, r6
	beq	.L213
.L193:
	ldr	r6, .L216+12
	ldrh	r3, [r6]
	cmp	r3, #160
	bne	.L193
	mov	r2, #224
	lsl	r2, r2, #19
.L183:
	ldr	r0, .L216+16
	add	r3, r5, r2
	add	r3, r3, r0
	ldrh	r3, [r3]
	strh	r3, [r2]
	add	r2, r2, #2
	cmp	r2, r4
	bne	.L183
	ldr	r1, [sp, #20]
	ldrh	r3, [r1]
	cmp	r3, #0
	bne	.L184
.L211:
	bl	getKeyInput
.L185:
	ldr	r2, .L216+12
	ldrh	r3, [r2]
	cmp	r3, #160
	bne	.L185
	mov	r2, #224
	lsl	r2, r2, #19
.L186:
	ldr	r6, .L216+16
	add	r3, r5, r2
	add	r3, r3, r6
	ldrh	r3, [r3]
	strh	r3, [r2]
	add	r2, r2, #2
	cmp	r2, r4
	bne	.L186
	mov	r0, #1
	mov	r1, #0
.L188:
	ldr	r3, .L216+20
	ldr	r6, [sp, #28]
	ldrb	r3, [r3, r1]
	ldrb	r2, [r6, r1]
	cmp	r2, r3
	beq	.L187
	mov	r0, #0
.L187:
	add	r3, r1, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	b	.L206
.L213:
	cmp	r9, r2
	bne	.L193
	ldr	r2, [sp, #20]
	mov	r3, #0
	strh	r3, [r2]
	b	.L193
.L212:
	cmp	fp, r1
	bne	.L181
	ldr	r0, [sp, #20]
	mov	r1, #0
	strh	r1, [r0]
	b	.L181
.L171:
	ldr	r4, [sp, #36]
	ldrb	r3, [r4, r1]
	sub	r2, r7, #2
	mov	r8, r1
	strh	r3, [r2]
	mov	r1, #0
	b	.L191
.L210:
	mov	r3, #160
	strh	r3, [r5]
	mov	r3, #240
	strh	r3, [r5, #2]
	mov	r3, #0
	mov	r2, #224
	strh	r3, [r5, #4]
	ldr	r1, .L216+8
	lsl	r2, r2, #19
.L190:
	ldr	r0, .L216+16
	add	r3, r5, r2
	add	r3, r3, r0
	ldrh	r3, [r3]
	strh	r3, [r2]
	add	r2, r2, #2
	cmp	r2, r1
	bne	.L190
	add	sp, sp, #76
	mov	r0, #1
	@ sp needed for prologue
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	sl, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L217:
	.align	2
.L216:
	.word	-32768
	.word	sprites+138
	.word	117441536
	.word	67108870
	.word	-117440512
	.word	win.1635
	.size	main, .-main
	.global	palette_Data
	.type	palette_Data, %object
	.size	palette_Data, 120
palette_Data:
	.byte	16
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	0
	.byte	0
	.byte	2
	.byte	16
	.byte	2
	.byte	0
	.byte	0
	.byte	64
	.byte	16
	.byte	64
	.byte	0
	.byte	66
	.byte	24
	.byte	99
	.byte	0
	.byte	120
	.byte	-29
	.byte	52
	.byte	123
	.byte	0
	.byte	0
	.byte	-124
	.byte	-112
	.byte	0
	.byte	-55
	.byte	4
	.byte	114
	.byte	13
	.byte	54
	.byte	34
	.byte	0
	.byte	0
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-64
	.byte	-16
	.byte	1
	.byte	112
	.byte	1
	.byte	-1
	.byte	123
	.byte	-108
	.byte	82
	.byte	16
	.byte	66
	.byte	0
	.byte	31
	.byte	0
	.byte	-32
	.byte	-125
	.byte	-1
	.byte	-125
	.byte	0
	.byte	124
	.byte	0
	.byte	31
	.byte	124
	.byte	-32
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	0
	.global	background_Tiles
	.type	background_Tiles, %object
	.size	background_Tiles, 1680
background_Tiles:
	.byte	16
	.byte	-64
	.byte	14
	.byte	0
	.byte	34
	.byte	-69
	.byte	-69
	.byte	64
	.byte	1
	.byte	-53
	.byte	-52
	.byte	-52
	.byte	-128
	.byte	3
	.byte	-35
	.byte	-78
	.byte	0
	.byte	3
	.byte	-19
	.byte	32
	.byte	3
	.byte	64
	.byte	30
	.byte	-52
	.byte	-52
	.byte	112
	.byte	1
	.byte	-35
	.byte	7
	.byte	-35
	.byte	-35
	.byte	-35
	.byte	-18
	.byte	-18
	.byte	48
	.byte	1
	.byte	-16
	.byte	31
	.byte	-112
	.byte	31
	.byte	63
	.byte	-35
	.byte	-35
	.byte	-16
	.byte	31
	.byte	112
	.byte	31
	.byte	16
	.byte	7
	.byte	96
	.byte	103
	.byte	-16
	.byte	3
	.byte	32
	.byte	3
	.byte	-21
	.byte	80
	.byte	103
	.byte	16
	.byte	1
	.byte	16
	.byte	59
	.byte	-36
	.byte	0
	.byte	51
	.byte	-36
	.byte	0
	.byte	11
	.byte	64
	.byte	3
	.byte	96
	.byte	14
	.byte	-48
	.byte	31
	.byte	80
	.byte	91
	.byte	-32
	.byte	-18
	.byte	-18
	.byte	-50
	.byte	0
	.byte	-14
	.byte	48
	.byte	38
	.byte	-16
	.byte	31
	.byte	16
	.byte	11
	.byte	0
	.byte	89
	.byte	-34
	.byte	12
	.byte	0
	.byte	33
	.byte	-34
	.byte	0
	.byte	-51
	.byte	-52
	.byte	-18
	.byte	-34
	.byte	-52
	.byte	-69
	.byte	-18
	.byte	-34
	.byte	23
	.byte	-68
	.byte	-69
	.byte	-52
	.byte	0
	.byte	3
	.byte	-51
	.byte	-64
	.byte	3
	.byte	16
	.byte	51
	.byte	80
	.byte	-61
	.byte	-99
	.byte	-16
	.byte	1
	.byte	-69
	.byte	-69
	.byte	-16
	.byte	95
	.byte	97
	.byte	27
	.byte	0
	.byte	-126
	.byte	14
	.byte	0
	.byte	96
	.byte	-54
	.byte	-16
	.byte	31
	.byte	48
	.byte	13
	.byte	-50
	.byte	-52
	.byte	0
	.byte	-98
	.byte	-34
	.byte	-16
	.byte	31
	.byte	-35
	.byte	85
	.byte	-51
	.byte	0
	.byte	10
	.byte	-51
	.byte	0
	.byte	-98
	.byte	-51
	.byte	0
	.byte	-98
	.byte	-51
	.byte	0
	.byte	-64
	.byte	5
	.byte	-64
	.byte	-36
	.byte	-18
	.byte	14
	.byte	-36
	.byte	0
	.byte	3
	.byte	-19
	.byte	64
	.byte	7
	.byte	-80
	.byte	16
	.byte	15
	.byte	14
	.byte	0
	.byte	3
	.byte	32
	.byte	-36
	.byte	-51
	.byte	-32
	.byte	-18
	.byte	-20
	.byte	0
	.byte	-34
	.byte	12
	.byte	-18
	.byte	-36
	.byte	-32
	.byte	13
	.byte	-18
	.byte	-50
	.byte	-107
	.byte	0
	.byte	7
	.byte	-18
	.byte	-51
	.byte	0
	.byte	113
	.byte	0
	.byte	17
	.byte	21
	.byte	14
	.byte	49
	.byte	27
	.byte	30
	.byte	-32
	.byte	-36
	.byte	-32
	.byte	0
	.byte	-25
	.byte	0
	.byte	91
	.byte	16
	.byte	72
	.byte	16
	.byte	84
	.byte	-20
	.byte	23
	.byte	-18
	.byte	-18
	.byte	-48
	.byte	0
	.byte	23
	.byte	0
	.byte	0
	.byte	-99
	.byte	16
	.byte	1
	.byte	-48
	.byte	-17
	.byte	-27
	.byte	-48
	.byte	3
	.byte	-16
	.byte	-15
	.byte	-48
	.byte	-1
	.byte	-64
	.byte	-51
	.byte	0
	.byte	-106
	.byte	-34
	.byte	0
	.byte	-98
	.byte	125
	.byte	-32
	.byte	48
	.byte	7
	.byte	16
	.byte	15
	.byte	0
	.byte	-9
	.byte	65
	.byte	-103
	.byte	0
	.byte	-98
	.byte	-32
	.byte	0
	.byte	-98
	.byte	85
	.byte	-34
	.byte	0
	.byte	-98
	.byte	-52
	.byte	0
	.byte	-122
	.byte	-64
	.byte	0
	.byte	-98
	.byte	-51
	.byte	0
	.byte	26
	.byte	119
	.byte	-48
	.byte	0
	.byte	-98
	.byte	33
	.byte	27
	.byte	0
	.byte	-98
	.byte	-51
	.byte	16
	.byte	-74
	.byte	0
	.byte	-98
	.byte	32
	.byte	-13
	.byte	-6
	.byte	0
	.byte	-98
	.byte	32
	.byte	-1
	.byte	0
	.byte	-98
	.byte	32
	.byte	7
	.byte	49
	.byte	-25
	.byte	-48
	.byte	0
	.byte	3
	.byte	14
	.byte	-92
	.byte	1
	.byte	-9
	.byte	-34
	.byte	-63
	.byte	11
	.byte	-34
	.byte	-64
	.byte	32
	.byte	100
	.byte	-34
	.byte	-32
	.byte	0
	.byte	-18
	.byte	-48
	.byte	13
	.byte	-18
	.byte	14
	.byte	-51
	.byte	-48
	.byte	-18
	.byte	95
	.byte	-64
	.byte	0
	.byte	-21
	.byte	-64
	.byte	1
	.byte	11
	.byte	16
	.byte	7
	.byte	32
	.byte	15
	.byte	33
	.byte	87
	.byte	0
	.byte	84
	.byte	-93
	.byte	16
	.byte	124
	.byte	-19
	.byte	0
	.byte	85
	.byte	14
	.byte	-50
	.byte	-32
	.byte	32
	.byte	7
	.byte	80
	.byte	15
	.byte	-57
	.byte	32
	.byte	63
	.byte	17
	.byte	16
	.byte	14
	.byte	-35
	.byte	-48
	.byte	0
	.byte	78
	.byte	-80
	.byte	-53
	.byte	16
	.byte	15
	.byte	-86
	.byte	48
	.byte	94
	.byte	-52
	.byte	0
	.byte	94
	.byte	-52
	.byte	0
	.byte	78
	.byte	-19
	.byte	0
	.byte	94
	.byte	14
	.byte	-2
	.byte	0
	.byte	94
	.byte	0
	.byte	7
	.byte	48
	.byte	15
	.byte	16
	.byte	-93
	.byte	16
	.byte	-77
	.byte	16
	.byte	-61
	.byte	0
	.byte	78
	.byte	-51
	.byte	-3
	.byte	0
	.byte	94
	.byte	32
	.byte	7
	.byte	80
	.byte	15
	.byte	48
	.byte	-73
	.byte	16
	.byte	-65
	.byte	98
	.byte	-77
	.byte	13
	.byte	0
	.byte	3
	.byte	87
	.byte	-34
	.byte	64
	.byte	3
	.byte	-64
	.byte	0
	.byte	-73
	.byte	-64
	.byte	0
	.byte	96
	.byte	98
	.byte	-57
	.byte	17
	.byte	20
	.byte	-37
	.byte	16
	.byte	-106
	.byte	16
	.byte	7
	.byte	-52
	.byte	16
	.byte	-123
	.byte	0
	.byte	4
	.byte	0
	.byte	-126
	.byte	69
	.byte	16
	.byte	40
	.byte	125
	.byte	13
	.byte	0
	.byte	117
	.byte	16
	.byte	3
	.byte	16
	.byte	-61
	.byte	-15
	.byte	-111
	.byte	51
	.byte	108
	.byte	-53
	.byte	3
	.byte	40
	.byte	127
	.byte	-53
	.byte	2
	.byte	105
	.byte	-16
	.byte	28
	.byte	51
	.byte	-117
	.byte	98
	.byte	-121
	.byte	16
	.byte	-9
	.byte	16
	.byte	-1
	.byte	96
	.byte	1
	.byte	116
	.byte	13
	.byte	35
	.byte	20
	.byte	0
	.byte	3
	.byte	0
	.byte	7
	.byte	-64
	.byte	0
	.byte	-9
	.byte	-64
	.byte	-36
	.byte	-42
	.byte	0
	.byte	-98
	.byte	-110
	.byte	-57
	.byte	14
	.byte	0
	.byte	-98
	.byte	13
	.byte	16
	.byte	40
	.byte	0
	.byte	-98
	.byte	-52
	.byte	-2
	.byte	0
	.byte	-98
	.byte	18
	.byte	114
	.byte	33
	.byte	-85
	.byte	80
	.byte	3
	.byte	17
	.byte	-57
	.byte	34
	.byte	-65
	.byte	33
	.byte	-65
	.byte	14
	.byte	-5
	.byte	2
	.byte	122
	.byte	81
	.byte	-81
	.byte	18
	.byte	-53
	.byte	32
	.byte	-9
	.byte	81
	.byte	11
	.byte	-34
	.byte	0
	.byte	-61
	.byte	17
	.byte	-81
	.byte	47
	.byte	-48
	.byte	-35
	.byte	0
	.byte	7
	.byte	-64
	.byte	0
	.byte	80
	.byte	-112
	.byte	-118
	.byte	16
	.byte	11
	.byte	16
	.byte	96
	.byte	87
	.byte	14
	.byte	1
	.byte	-128
	.byte	-35
	.byte	1
	.byte	20
	.byte	12
	.byte	0
	.byte	80
	.byte	16
	.byte	-9
	.byte	96
	.byte	-87
	.byte	-128
	.byte	0
	.byte	11
	.byte	-53
	.byte	-19
	.byte	-34
	.byte	-35
	.byte	-53
	.byte	-19
	.byte	-35
	.byte	5
	.byte	-52
	.byte	-53
	.byte	-19
	.byte	-51
	.byte	-68
	.byte	0
	.byte	3
	.byte	-69
	.byte	-48
	.byte	3
	.byte	-30
	.byte	16
	.byte	-25
	.byte	-13
	.byte	-61
	.byte	112
	.byte	1
	.byte	-36
	.byte	-18
	.byte	-20
	.byte	0
	.byte	-109
	.byte	13
	.byte	-11
	.byte	-45
	.byte	95
	.byte	1
	.byte	-77
	.byte	32
	.byte	15
	.byte	17
	.byte	-117
	.byte	14
	.byte	66
	.byte	83
	.byte	-48
	.byte	16
	.byte	7
	.byte	-34
	.byte	16
	.byte	15
	.byte	-112
	.byte	-93
	.byte	-36
	.byte	82
	.byte	87
	.byte	0
	.byte	-93
	.byte	16
	.byte	7
	.byte	16
	.byte	15
	.byte	13
	.byte	87
	.byte	-64
	.byte	1
	.byte	30
	.byte	-50
	.byte	16
	.byte	37
	.byte	12
	.byte	0
	.byte	-97
	.byte	-16
	.byte	-109
	.byte	-112
	.byte	3
	.byte	-69
	.byte	0
	.byte	126
	.byte	-51
	.byte	0
	.byte	126
	.byte	-61
	.byte	63
	.byte	1
	.byte	-109
	.byte	14
	.byte	0
	.byte	-36
	.byte	1
	.byte	-20
	.byte	-11
	.byte	82
	.byte	71
	.byte	0
	.byte	94
	.byte	98
	.byte	87
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	28
	.byte	-36
	.byte	67
	.byte	31
	.byte	96
	.byte	3
	.byte	12
	.byte	-44
	.byte	47
	.byte	80
	.byte	-89
	.byte	4
	.byte	75
	.byte	0
	.byte	-36
	.byte	27
	.byte	-19
	.byte	-18
	.byte	-35
	.byte	1
	.byte	78
	.byte	20
	.byte	15
	.byte	14
	.byte	67
	.byte	35
	.byte	96
	.byte	-54
	.byte	71
	.byte	0
	.byte	4
	.byte	16
	.byte	13
	.byte	-35
	.byte	-19
	.byte	33
	.byte	83
	.byte	-112
	.byte	-45
	.byte	-128
	.byte	-22
	.byte	-39
	.byte	0
	.byte	21
	.byte	32
	.byte	94
	.byte	-52
	.byte	-93
	.byte	35
	.byte	98
	.byte	-73
	.byte	0
	.byte	0
	.byte	0
	.byte	94
	.byte	-105
	.byte	2
	.byte	19
	.byte	-18
	.byte	13
	.byte	0
	.byte	94
	.byte	-36
	.byte	51
	.byte	35
	.byte	3
	.byte	-26
	.byte	66
	.byte	19
	.byte	-66
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	94
	.byte	98
	.byte	23
	.byte	80
	.byte	-45
	.byte	66
	.byte	19
	.byte	17
	.byte	111
	.byte	0
	.byte	-42
	.byte	96
	.byte	-57
	.byte	0
	.byte	120
	.byte	-36
	.byte	3
	.byte	123
	.byte	-36
	.byte	0
	.byte	95
	.byte	0
	.byte	-81
	.byte	-64
	.byte	57
	.byte	12
	.byte	-20
	.byte	34
	.byte	115
	.byte	-94
	.byte	25
	.byte	3
	.byte	-15
	.byte	0
	.byte	12
	.byte	16
	.byte	-79
	.byte	-64
	.byte	81
	.byte	115
	.byte	-90
	.byte	41
	.byte	-34
	.byte	-32
	.byte	-48
	.byte	0
	.byte	-48
	.byte	-32
	.byte	53
	.byte	13
	.byte	-35
	.byte	16
	.byte	21
	.byte	0
	.byte	-81
	.byte	-18
	.byte	2
	.byte	93
	.byte	14
	.byte	84
	.byte	-15
	.byte	-22
	.byte	1
	.byte	86
	.byte	0
	.byte	120
	.byte	0
	.byte	94
	.byte	-32
	.byte	0
	.byte	94
	.byte	12
	.byte	0
	.byte	94
	.byte	-19
	.byte	-3
	.byte	0
	.byte	94
	.byte	16
	.byte	118
	.byte	18
	.byte	-45
	.byte	114
	.byte	120
	.byte	0
	.byte	64
	.byte	0
	.byte	94
	.byte	13
	.byte	81
	.byte	115
	.byte	-59
	.byte	16
	.byte	-73
	.byte	98
	.byte	-29
	.byte	-34
	.byte	-32
	.byte	-51
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	94
	.byte	-106
	.byte	0
	.byte	-93
	.byte	-19
	.byte	-32
	.byte	16
	.byte	-89
	.byte	-36
	.byte	2
	.byte	26
	.byte	4
	.byte	-113
	.byte	-48
	.byte	-6
	.byte	0
	.byte	72
	.byte	16
	.byte	3
	.byte	96
	.byte	-53
	.byte	4
	.byte	55
	.byte	1
	.byte	15
	.byte	-48
	.byte	2
	.byte	-38
	.byte	-48
	.byte	-114
	.byte	0
	.byte	85
	.byte	-48
	.byte	-64
	.byte	-35
	.byte	1
	.byte	19
	.byte	101
	.byte	28
	.byte	34
	.byte	63
	.byte	13
	.byte	-127
	.byte	1
	.byte	107
	.byte	-48
	.byte	-32
	.byte	14
	.byte	-34
	.byte	-48
	.byte	-32
	.byte	16
	.byte	7
	.byte	3
	.byte	-36
	.byte	12
	.byte	-34
	.byte	-32
	.byte	13
	.byte	-19
	.byte	112
	.byte	31
	.byte	0
	.byte	94
	.byte	110
	.byte	13
	.byte	16
	.byte	-89
	.byte	34
	.byte	121
	.byte	-34
	.byte	32
	.byte	-104
	.byte	3
	.byte	-73
	.byte	-124
	.byte	17
	.byte	14
	.byte	-81
	.byte	4
	.byte	78
	.byte	-48
	.byte	4
	.byte	-121
	.byte	-48
	.byte	1
	.byte	107
	.byte	32
	.byte	7
	.byte	38
	.byte	26
	.byte	96
	.byte	-53
	.byte	-82
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	86
	.byte	-51
	.byte	0
	.byte	94
	.byte	32
	.byte	7
	.byte	0
	.byte	94
	.byte	-51
	.byte	-5
	.byte	0
	.byte	94
	.byte	96
	.byte	-53
	.byte	50
	.byte	-17
	.byte	20
	.byte	-109
	.byte	18
	.byte	51
	.byte	-64
	.byte	2
	.byte	51
	.byte	16
	.byte	64
	.byte	-26
	.byte	16
	.byte	7
	.byte	16
	.byte	15
	.byte	23
	.byte	66
	.byte	-18
	.byte	13
	.byte	1
	.byte	64
	.byte	22
	.byte	66
	.byte	-34
	.byte	-81
	.byte	0
	.byte	-127
	.byte	-64
	.byte	4
	.byte	11
	.byte	-52
	.byte	1
	.byte	57
	.byte	20
	.byte	-1
	.byte	2
	.byte	78
	.byte	37
	.byte	-49
	.byte	-1
	.byte	-108
	.byte	-81
	.byte	36
	.byte	-109
	.byte	2
	.byte	91
	.byte	17
	.byte	113
	.byte	3
	.byte	52
	.byte	16
	.byte	-97
	.byte	21
	.byte	-126
	.byte	0
	.byte	66
	.byte	69
	.byte	14
	.byte	1
	.byte	-91
	.byte	-64
	.byte	-19
	.byte	-51
	.byte	0
	.byte	94
	.byte	-34
	.byte	32
	.byte	7
	.byte	-69
	.byte	16
	.byte	15
	.byte	-50
	.byte	2
	.byte	50
	.byte	-124
	.byte	111
	.byte	0
	.byte	94
	.byte	-52
	.byte	0
	.byte	94
	.byte	0
	.byte	3
	.byte	-33
	.byte	34
	.byte	91
	.byte	0
	.byte	-25
	.byte	-64
	.byte	16
	.byte	60
	.byte	102
	.byte	11
	.byte	16
	.byte	7
	.byte	17
	.byte	-117
	.byte	0
	.byte	94
	.byte	-2
	.byte	32
	.byte	7
	.byte	16
	.byte	15
	.byte	24
	.byte	3
	.byte	-126
	.byte	-1
	.byte	20
	.byte	107
	.byte	0
	.byte	3
	.byte	16
	.byte	-65
	.byte	-64
	.byte	-11
	.byte	32
	.byte	-57
	.byte	16
	.byte	92
	.byte	81
	.byte	11
	.byte	5
	.byte	-89
	.byte	14
	.byte	0
	.byte	55
	.byte	-48
	.byte	16
	.byte	-65
	.byte	30
	.byte	-50
	.byte	-32
	.byte	14
	.byte	2
	.byte	-125
	.byte	22
	.byte	34
	.byte	114
	.byte	53
	.byte	18
	.byte	33
	.byte	-35
	.byte	-65
	.byte	0
	.byte	92
	.byte	-52
	.byte	6
	.byte	-108
	.byte	0
	.byte	-95
	.byte	6
	.byte	43
	.byte	33
	.byte	96
	.byte	-124
	.byte	-5
	.byte	6
	.byte	73
	.byte	111
	.byte	14
	.byte	20
	.byte	-79
	.byte	0
	.byte	29
	.byte	-64
	.byte	0
	.byte	29
	.byte	16
	.byte	7
	.byte	49
	.byte	-108
	.byte	81
	.byte	-116
	.byte	-103
	.byte	0
	.byte	43
	.byte	-48
	.byte	-35
	.byte	0
	.byte	94
	.byte	0
	.byte	-61
	.byte	-51
	.byte	-19
	.byte	0
	.byte	3
	.byte	-5
	.byte	98
	.byte	-1
	.byte	80
	.byte	-65
	.byte	16
	.byte	-69
	.byte	22
	.byte	-13
	.byte	0
	.byte	16
	.byte	-51
	.byte	0
	.byte	94
	.byte	69
	.byte	31
	.byte	-3
	.byte	32
	.byte	-81
	.byte	19
	.byte	-77
	.byte	115
	.byte	3
	.byte	70
	.byte	31
	.byte	22
	.byte	-58
	.byte	0
	.byte	-89
	.byte	-32
	.byte	1
	.byte	91
	.byte	127
	.byte	-48
	.byte	0
	.byte	92
	.byte	98
	.byte	24
	.byte	16
	.byte	116
	.byte	16
	.byte	80
	.byte	16
	.byte	-127
	.byte	22
	.byte	-33
	.byte	2
	.byte	-113
	.byte	-51
	.byte	-90
	.byte	39
	.byte	17
	.byte	78
	.byte	-64
	.byte	0
	.byte	0
	.byte	109
	.byte	96
	.byte	-81
	.byte	-36
	.byte	1
	.byte	-125
	.byte	-1
	.byte	-112
	.byte	33
	.byte	16
	.byte	-73
	.byte	20
	.byte	107
	.byte	16
	.byte	-89
	.byte	96
	.byte	94
	.byte	-88
	.byte	-81
	.byte	0
	.byte	94
	.byte	23
	.byte	0
	.byte	-9
	.byte	38
	.byte	-33
	.byte	0
	.byte	94
	.byte	-91
	.byte	-25
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	94
	.byte	2
	.byte	-1
	.byte	2
	.byte	39
	.byte	26
	.byte	14
	.byte	13
	.byte	-19
	.byte	0
	.byte	3
	.byte	0
	.byte	7
	.byte	-48
	.byte	6
	.byte	44
	.byte	-48
	.byte	-79
	.byte	0
	.byte	-73
	.byte	13
	.byte	23
	.byte	-85
	.byte	32
	.byte	-53
	.byte	-34
	.byte	12
	.byte	14
	.byte	2
	.byte	15
	.byte	117
	.byte	13
	.byte	0
	.byte	7
	.byte	0
	.byte	44
	.byte	0
	.byte	98
	.byte	-48
	.byte	0
	.byte	118
	.byte	-48
	.byte	3
	.byte	-106
	.byte	-11
	.byte	3
	.byte	93
	.byte	66
	.byte	-33
	.byte	23
	.byte	89
	.byte	32
	.byte	-94
	.byte	-32
	.byte	2
	.byte	26
	.byte	-32
	.byte	16
	.byte	7
	.byte	-22
	.byte	18
	.byte	26
	.byte	83
	.byte	-48
	.byte	0
	.byte	94
	.byte	-34
	.byte	0
	.byte	94
	.byte	-32
	.byte	0
	.byte	94
	.byte	-34
	.byte	-18
	.byte	0
	.byte	94
	.byte	2
	.byte	-57
	.byte	0
	.byte	64
	.byte	13
	.byte	23
	.byte	-85
	.byte	48
	.byte	-53
	.byte	0
	.byte	94
	.byte	14
	.byte	-85
	.byte	0
	.byte	94
	.byte	14
	.byte	0
	.byte	94
	.byte	-64
	.byte	64
	.byte	94
	.byte	-64
	.byte	0
	.byte	58
	.byte	101
	.byte	-93
	.byte	-85
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	86
	.byte	-51
	.byte	0
	.byte	94
	.byte	32
	.byte	7
	.byte	-70
	.byte	0
	.byte	94
	.byte	-51
	.byte	0
	.byte	35
	.byte	-120
	.byte	95
	.byte	19
	.byte	-81
	.byte	14
	.byte	0
	.byte	-73
	.byte	-32
	.byte	-91
	.byte	3
	.byte	11
	.byte	-48
	.byte	1
	.byte	-121
	.byte	0
	.byte	-32
	.byte	48
	.byte	7
	.byte	-48
	.byte	40
	.byte	63
	.byte	-64
	.byte	18
	.byte	23
	.byte	3
	.byte	93
	.byte	-50
	.byte	-51
	.byte	-32
	.byte	-32
	.byte	-34
	.byte	-34
	.byte	-65
	.byte	1
	.byte	-68
	.byte	-32
	.byte	0
	.byte	16
	.byte	16
	.byte	7
	.byte	17
	.byte	20
	.byte	86
	.byte	-120
	.byte	66
	.byte	-34
	.byte	96
	.byte	-61
	.byte	126
	.byte	0
	.byte	0
	.byte	15
	.byte	16
	.byte	-25
	.byte	85
	.byte	93
	.byte	0
	.byte	94
	.byte	4
	.byte	-76
	.byte	1
	.byte	78
	.byte	-48
	.byte	-97
	.byte	5
	.byte	51
	.byte	0
	.byte	-32
	.byte	1
	.byte	110
	.byte	0
	.byte	7
	.byte	0
	.byte	-49
	.byte	65
	.byte	103
	.byte	1
	.byte	-40
	.byte	43
	.byte	-50
	.byte	14
	.byte	0
	.byte	94
	.byte	-64
	.byte	0
	.byte	86
	.byte	-48
	.byte	19
	.byte	8
	.byte	0
	.byte	7
	.byte	-1
	.byte	17
	.byte	-46
	.byte	33
	.byte	-26
	.byte	16
	.byte	-85
	.byte	16
	.byte	-77
	.byte	-16
	.byte	-61
	.byte	88
	.byte	95
	.byte	116
	.byte	111
	.byte	-39
	.byte	43
	.byte	-21
	.byte	8
	.byte	95
	.byte	105
	.byte	-21
	.byte	69
	.byte	26
	.byte	14
	.byte	0
	.byte	19
	.byte	-34
	.byte	2
	.byte	-8
	.byte	22
	.byte	-41
	.byte	-17
	.byte	33
	.byte	39
	.byte	-96
	.byte	30
	.byte	0
	.byte	-24
	.byte	-64
	.byte	0
	.byte	28
	.byte	20
	.byte	114
	.byte	4
	.byte	122
	.byte	56
	.byte	31
	.byte	-2
	.byte	-110
	.byte	89
	.byte	-55
	.byte	43
	.byte	0
	.byte	33
	.byte	17
	.byte	5
	.byte	96
	.byte	66
	.byte	0
	.byte	94
	.byte	0
	.byte	19
	.byte	-34
	.byte	127
	.byte	-64
	.byte	0
	.byte	94
	.byte	0
	.byte	-94
	.byte	22
	.byte	-60
	.byte	-72
	.byte	27
	.byte	0
	.byte	94
	.byte	4
	.byte	-121
	.byte	2
	.byte	63
	.byte	-1
	.byte	0
	.byte	-65
	.byte	0
	.byte	94
	.byte	16
	.byte	-65
	.byte	105
	.byte	-53
	.byte	-7
	.byte	43
	.byte	0
	.byte	78
	.byte	1
	.byte	-37
	.byte	42
	.byte	-41
	.byte	-5
	.byte	21
	.byte	61
	.byte	20
	.byte	-43
	.byte	-122
	.byte	-109
	.byte	16
	.byte	-118
	.byte	-107
	.byte	26
	.byte	-51
	.byte	4
	.byte	-2
	.byte	22
	.byte	-57
	.byte	-18
	.byte	-109
	.byte	3
	.byte	-87
	.byte	-53
	.byte	-24
	.byte	-21
	.byte	-34
	.byte	26
	.byte	54
	.byte	18
	.byte	109
	.byte	0
	.byte	-81
	.byte	-18
	.byte	-1
	.byte	16
	.byte	-53
	.byte	22
	.byte	-109
	.byte	-93
	.byte	3
	.byte	16
	.byte	-89
	.byte	22
	.byte	3
	.byte	64
	.byte	94
	.byte	38
	.byte	-57
	.byte	-109
	.byte	3
	.byte	-1
	.byte	38
	.byte	-65
	.byte	-13
	.byte	3
	.byte	99
	.byte	3
	.byte	19
	.byte	-93
	.byte	-13
	.byte	3
	.byte	115
	.byte	3
	.byte	19
	.byte	-93
	.byte	-13
	.byte	3
	.byte	-24
	.byte	115
	.byte	3
	.byte	-5
	.byte	-109
	.byte	16
	.byte	3
	.byte	-52
	.byte	0
	.byte	3
	.byte	-51
	.byte	-52
	.byte	-51
	.byte	-59
	.byte	13
	.byte	65
	.byte	-8
	.byte	83
	.byte	-51
	.byte	-69
	.byte	-52
	.byte	9
	.byte	11
	.byte	-36
	.byte	9
	.byte	19
	.byte	23
	.byte	-35
	.byte	-18
	.byte	-34
	.byte	21
	.byte	67
	.byte	-51
	.byte	-13
	.byte	67
	.byte	115
	.byte	67
	.byte	19
	.byte	-29
	.byte	-1
	.byte	-13
	.byte	67
	.byte	115
	.byte	67
	.byte	19
	.byte	-29
	.byte	-13
	.byte	67
	.byte	-110
	.byte	127
	.byte	-120
	.byte	127
	.byte	73
	.byte	107
	.byte	-89
	.byte	-86
	.byte	-1
	.byte	-128
	.byte	1
	.byte	89
	.byte	-117
	.byte	-112
	.byte	19
	.byte	-94
	.byte	28
	.byte	21
	.byte	97
	.byte	-16
	.byte	54
	.byte	-16
	.byte	1
	.byte	-128
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.global	background_Map
	.type	background_Map, %object
	.size	background_Map, 448
background_Map:
	.byte	16
	.byte	-80
	.byte	4
	.byte	0
	.byte	17
	.byte	0
	.byte	0
	.byte	1
	.byte	32
	.byte	1
	.byte	2
	.byte	0
	.byte	3
	.byte	-16
	.byte	1
	.byte	-56
	.byte	-16
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	48
	.byte	49
	.byte	0
	.byte	4
	.byte	4
	.byte	0
	.byte	0
	.byte	5
	.byte	0
	.byte	6
	.byte	0
	.byte	7
	.byte	0
	.byte	8
	.byte	56
	.byte	0
	.byte	9
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	0
	.byte	1
	.byte	8
	.byte	4
	.byte	10
	.byte	8
	.byte	0
	.byte	11
	.byte	0
	.byte	12
	.byte	0
	.byte	58
	.byte	4
	.byte	0
	.byte	13
	.byte	0
	.byte	0
	.byte	14
	.byte	0
	.byte	15
	.byte	0
	.byte	16
	.byte	0
	.byte	17
	.byte	-32
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	0
	.byte	1
	.byte	16
	.byte	4
	.byte	18
	.byte	0
	.byte	19
	.byte	32
	.byte	0
	.byte	20
	.byte	32
	.byte	59
	.byte	21
	.byte	0
	.byte	22
	.byte	0
	.byte	23
	.byte	-32
	.byte	-16
	.byte	59
	.byte	-16
	.byte	1
	.byte	96
	.byte	59
	.byte	24
	.byte	0
	.byte	25
	.byte	0
	.byte	26
	.byte	-126
	.byte	32
	.byte	59
	.byte	27
	.byte	0
	.byte	28
	.byte	0
	.byte	29
	.byte	96
	.byte	59
	.byte	30
	.byte	50
	.byte	0
	.byte	31
	.byte	-16
	.byte	1
	.byte	32
	.byte	1
	.byte	30
	.byte	4
	.byte	80
	.byte	59
	.byte	32
	.byte	8
	.byte	0
	.byte	33
	.byte	0
	.byte	34
	.byte	32
	.byte	59
	.byte	35
	.byte	0
	.byte	36
	.byte	35
	.byte	0
	.byte	37
	.byte	96
	.byte	59
	.byte	38
	.byte	0
	.byte	39
	.byte	-16
	.byte	1
	.byte	32
	.byte	1
	.byte	65
	.byte	38
	.byte	96
	.byte	59
	.byte	37
	.byte	4
	.byte	36
	.byte	4
	.byte	35
	.byte	0
	.byte	58
	.byte	1
	.byte	4
	.byte	0
	.byte	40
	.byte	0
	.byte	41
	.byte	0
	.byte	42
	.byte	96
	.byte	59
	.byte	112
	.byte	43
	.byte	-16
	.byte	-91
	.byte	80
	.byte	25
	.byte	96
	.byte	59
	.byte	44
	.byte	0
	.byte	41
	.byte	4
	.byte	65
	.byte	45
	.byte	32
	.byte	119
	.byte	46
	.byte	0
	.byte	47
	.byte	0
	.byte	48
	.byte	-16
	.byte	59
	.byte	-63
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	49
	.byte	0
	.byte	50
	.byte	0
	.byte	51
	.byte	32
	.byte	59
	.byte	7
	.byte	52
	.byte	0
	.byte	53
	.byte	0
	.byte	54
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	4
	.byte	55
	.byte	0
	.byte	56
	.byte	0
	.byte	57
	.byte	32
	.byte	59
	.byte	58
	.byte	0
	.byte	28
	.byte	59
	.byte	0
	.byte	60
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	61
	.byte	0
	.byte	16
	.byte	62
	.byte	0
	.byte	63
	.byte	32
	.byte	59
	.byte	64
	.byte	0
	.byte	65
	.byte	0
	.byte	112
	.byte	66
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	67
	.byte	0
	.byte	68
	.byte	0
	.byte	65
	.byte	69
	.byte	32
	.byte	59
	.byte	70
	.byte	0
	.byte	71
	.byte	0
	.byte	72
	.byte	-16
	.byte	59
	.byte	-63
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	73
	.byte	0
	.byte	74
	.byte	0
	.byte	75
	.byte	32
	.byte	59
	.byte	7
	.byte	76
	.byte	0
	.byte	77
	.byte	0
	.byte	78
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	4
	.byte	79
	.byte	0
	.byte	80
	.byte	0
	.byte	81
	.byte	32
	.byte	59
	.byte	82
	.byte	0
	.byte	28
	.byte	83
	.byte	0
	.byte	84
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	85
	.byte	0
	.byte	16
	.byte	86
	.byte	0
	.byte	87
	.byte	32
	.byte	59
	.byte	88
	.byte	0
	.byte	89
	.byte	0
	.byte	112
	.byte	90
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	91
	.byte	0
	.byte	92
	.byte	0
	.byte	65
	.byte	93
	.byte	32
	.byte	59
	.byte	94
	.byte	0
	.byte	95
	.byte	0
	.byte	96
	.byte	-16
	.byte	59
	.byte	-63
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	97
	.byte	0
	.byte	98
	.byte	0
	.byte	99
	.byte	32
	.byte	59
	.byte	7
	.byte	100
	.byte	0
	.byte	101
	.byte	0
	.byte	102
	.byte	-16
	.byte	59
	.byte	-16
	.byte	59
	.byte	96
	.byte	59
	.byte	4
	.byte	103
	.byte	0
	.byte	104
	.byte	0
	.byte	105
	.byte	32
	.byte	59
	.byte	106
	.byte	0
	.byte	0
	.byte	107
	.byte	0
	.byte	108
	.byte	0
	.byte	109
	.byte	0
	.byte	39
	.byte	8
	.byte	-78
	.byte	16
	.byte	1
	.byte	110
	.byte	64
	.byte	7
	.byte	-16
	.byte	1
	.byte	110
	.byte	4
	.byte	48
	.byte	7
	.byte	109
	.byte	2
	.byte	4
	.byte	111
	.byte	0
	.byte	112
	.byte	0
	.byte	113
	.byte	32
	.byte	59
	.byte	114
	.byte	35
	.byte	0
	.byte	115
	.byte	0
	.byte	1
	.byte	116
	.byte	0
	.byte	117
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-108
	.byte	0
	.byte	15
	.byte	116
	.byte	4
	.byte	16
	.byte	47
	.byte	114
	.byte	19
	.byte	-6
	.byte	8
	.byte	1
	.byte	-32
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	8
	.byte	0
	.byte	12
	.global	tiles_palette
	.type	tiles_palette, %object
	.size	tiles_palette, 32
tiles_palette:
	.byte	-24
	.byte	-1
	.byte	45
	.byte	-111
	.byte	11
	.byte	-111
	.byte	-79
	.byte	25
	.byte	-45
	.byte	-99
	.byte	-45
	.byte	-99
	.byte	86
	.byte	46
	.byte	-39
	.byte	62
	.byte	-97
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.global	pointer_data
	.type	pointer_data, %object
	.size	pointer_data, 84
pointer_data:
	.byte	16
	.byte	0
	.byte	2
	.byte	0
	.byte	35
	.byte	-120
	.byte	-120
	.byte	64
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	-16
	.byte	3
	.byte	0
	.byte	15
	.byte	-11
	.byte	112
	.byte	30
	.byte	-16
	.byte	1
	.byte	-16
	.byte	31
	.byte	-16
	.byte	31
	.byte	8
	.byte	48
	.byte	3
	.byte	-128
	.byte	-16
	.byte	3
	.byte	-1
	.byte	32
	.byte	15
	.byte	-16
	.byte	115
	.byte	-80
	.byte	3
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	112
	.byte	8
	.byte	-16
	.byte	115
	.byte	-1
	.byte	-16
	.byte	127
	.byte	-16
	.byte	3
	.byte	-16
	.byte	127
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	111
	.byte	-32
	.byte	127
	.byte	-1
	.byte	-15
	.byte	63
	.byte	-15
	.byte	95
	.byte	-16
	.byte	31
	.byte	-16
	.byte	31
	.byte	-16
	.byte	27
	.byte	-95
	.byte	127
	.byte	-16
	.byte	1
	.byte	48
	.byte	1
	.byte	0
	.byte	0
	.global	tileset00_data
	.type	tileset00_data, %object
	.size	tileset00_data, 2588
tileset00_data:
	.byte	16
	.byte	96
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	17
	.byte	17
	.byte	0
	.byte	98
	.byte	102
	.byte	102
	.byte	4
	.byte	32
	.byte	102
	.byte	102
	.byte	102
	.byte	97
	.byte	-32
	.byte	3
	.byte	54
	.byte	51
	.byte	3
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	34
	.byte	34
	.byte	0
	.byte	32
	.byte	-16
	.byte	1
	.byte	0
	.byte	102
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	17
	.byte	17
	.byte	1
	.byte	9
	.byte	0
	.byte	102
	.byte	102
	.byte	38
	.byte	64
	.byte	3
	.byte	102
	.byte	2
	.byte	0
	.byte	70
	.byte	64
	.byte	38
	.byte	0
	.byte	25
	.byte	35
	.byte	102
	.byte	54
	.byte	115
	.byte	36
	.byte	51
	.byte	7
	.byte	51
	.byte	103
	.byte	36
	.byte	0
	.byte	0
	.byte	-16
	.byte	1
	.byte	-112
	.byte	5
	.byte	16
	.byte	99
	.byte	-11
	.byte	-16
	.byte	3
	.byte	112
	.byte	7
	.byte	16
	.byte	99
	.byte	-64
	.byte	2
	.byte	115
	.byte	0
	.byte	119
	.byte	103
	.byte	0
	.byte	6
	.byte	-72
	.byte	0
	.byte	127
	.byte	103
	.byte	16
	.byte	3
	.byte	32
	.byte	103
	.byte	48
	.byte	7
	.byte	119
	.byte	36
	.byte	55
	.byte	0
	.byte	51
	.byte	115
	.byte	36
	.byte	70
	.byte	51
	.byte	51
	.byte	36
	.byte	102
	.byte	3
	.byte	52
	.byte	51
	.byte	36
	.byte	100
	.byte	70
	.byte	51
	.byte	-16
	.byte	127
	.byte	-16
	.byte	127
	.byte	-64
	.byte	-16
	.byte	119
	.byte	0
	.byte	-9
	.byte	32
	.byte	102
	.byte	54
	.byte	67
	.byte	0
	.byte	34
	.byte	60
	.byte	34
	.byte	34
	.byte	64
	.byte	99
	.byte	64
	.byte	107
	.byte	16
	.byte	115
	.byte	16
	.byte	123
	.byte	51
	.byte	67
	.byte	33
	.byte	68
	.byte	36
	.byte	0
	.byte	28
	.byte	2
	.byte	0
	.byte	0
	.byte	102
	.byte	0
	.byte	99
	.byte	16
	.byte	102
	.byte	102
	.byte	52
	.byte	16
	.byte	3
	.byte	35
	.byte	102
	.byte	102
	.byte	70
	.byte	-95
	.byte	0
	.byte	3
	.byte	102
	.byte	0
	.byte	15
	.byte	102
	.byte	36
	.byte	68
	.byte	68
	.byte	80
	.byte	33
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-56
	.byte	-80
	.byte	3
	.byte	1
	.byte	-2
	.byte	17
	.byte	16
	.byte	-63
	.byte	-5
	.byte	49
	.byte	51
	.byte	102
	.byte	17
	.byte	102
	.byte	113
	.byte	55
	.byte	2
	.byte	15
	.byte	70
	.byte	51
	.byte	102
	.byte	0
	.byte	30
	.byte	82
	.byte	17
	.byte	-15
	.byte	-6
	.byte	54
	.byte	0
	.byte	33
	.byte	51
	.byte	119
	.byte	1
	.byte	-29
	.byte	68
	.byte	-76
	.byte	49
	.byte	-1
	.byte	22
	.byte	17
	.byte	-5
	.byte	16
	.byte	39
	.byte	22
	.byte	16
	.byte	3
	.byte	51
	.byte	99
	.byte	2
	.byte	102
	.byte	22
	.byte	119
	.byte	55
	.byte	99
	.byte	22
	.byte	1
	.byte	127
	.byte	22
	.byte	-16
	.byte	-16
	.byte	113
	.byte	-63
	.byte	127
	.byte	0
	.byte	99
	.byte	32
	.byte	103
	.byte	102
	.byte	52
	.byte	99
	.byte	16
	.byte	-43
	.byte	1
	.byte	-76
	.byte	48
	.byte	3
	.byte	70
	.byte	32
	.byte	3
	.byte	97
	.byte	1
	.byte	92
	.byte	102
	.byte	1
	.byte	-29
	.byte	-103
	.byte	16
	.byte	3
	.byte	54
	.byte	115
	.byte	2
	.byte	111
	.byte	16
	.byte	3
	.byte	71
	.byte	100
	.byte	32
	.byte	18
	.byte	-78
	.byte	0
	.byte	14
	.byte	102
	.byte	0
	.byte	25
	.byte	1
	.byte	114
	.byte	51
	.byte	19
	.byte	96
	.byte	3
	.byte	52
	.byte	-31
	.byte	48
	.byte	3
	.byte	1
	.byte	-1
	.byte	32
	.byte	3
	.byte	52
	.byte	51
	.byte	51
	.byte	1
	.byte	-16
	.byte	113
	.byte	-112
	.byte	-47
	.byte	-1
	.byte	68
	.byte	116
	.byte	-14
	.byte	-9
	.byte	102
	.byte	102
	.byte	16
	.byte	65
	.byte	49
	.byte	68
	.byte	68
	.byte	19
	.byte	27
	.byte	32
	.byte	-5
	.byte	100
	.byte	102
	.byte	70
	.byte	0
	.byte	34
	.byte	79
	.byte	52
	.byte	16
	.byte	3
	.byte	70
	.byte	68
	.byte	1
	.byte	20
	.byte	1
	.byte	-12
	.byte	1
	.byte	-33
	.byte	0
	.byte	-5
	.byte	58
	.byte	17
	.byte	17
	.byte	16
	.byte	99
	.byte	3
	.byte	7
	.byte	16
	.byte	3
	.byte	19
	.byte	16
	.byte	3
	.byte	115
	.byte	1
	.byte	119
	.byte	55
	.byte	19
	.byte	103
	.byte	102
	.byte	70
	.byte	19
	.byte	1
	.byte	-1
	.byte	127
	.byte	1
	.byte	1
	.byte	90
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-6
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-32
	.byte	1
	.byte	16
	.byte	-93
	.byte	0
	.byte	-1
	.byte	17
	.byte	-45
	.byte	-9
	.byte	17
	.byte	15
	.byte	54
	.byte	115
	.byte	119
	.byte	16
	.byte	3
	.byte	95
	.byte	18
	.byte	31
	.byte	-46
	.byte	0
	.byte	2
	.byte	30
	.byte	60
	.byte	102
	.byte	119
	.byte	1
	.byte	-28
	.byte	3
	.byte	99
	.byte	67
	.byte	-1
	.byte	-111
	.byte	-1
	.byte	54
	.byte	19
	.byte	-128
	.byte	4
	.byte	24
	.byte	19
	.byte	54
	.byte	51
	.byte	67
	.byte	20
	.byte	51
	.byte	51
	.byte	61
	.byte	100
	.byte	20
	.byte	-16
	.byte	114
	.byte	-62
	.byte	127
	.byte	16
	.byte	99
	.byte	96
	.byte	3
	.byte	115
	.byte	2
	.byte	123
	.byte	-112
	.byte	16
	.byte	3
	.byte	51
	.byte	103
	.byte	64
	.byte	3
	.byte	115
	.byte	102
	.byte	68
	.byte	51
	.byte	104
	.byte	51
	.byte	3
	.byte	99
	.byte	2
	.byte	-111
	.byte	52
	.byte	32
	.byte	3
	.byte	100
	.byte	70
	.byte	68
	.byte	-24
	.byte	33
	.byte	127
	.byte	65
	.byte	-113
	.byte	3
	.byte	-22
	.byte	100
	.byte	32
	.byte	103
	.byte	51
	.byte	67
	.byte	102
	.byte	-81
	.byte	112
	.byte	3
	.byte	100
	.byte	32
	.byte	3
	.byte	1
	.byte	16
	.byte	3
	.byte	-16
	.byte	113
	.byte	-80
	.byte	3
	.byte	16
	.byte	99
	.byte	-127
	.byte	0
	.byte	111
	.byte	51
	.byte	49
	.byte	119
	.byte	55
	.byte	51
	.byte	113
	.byte	3
	.byte	-52
	.byte	-47
	.byte	80
	.byte	3
	.byte	1
	.byte	-1
	.byte	51
	.byte	81
	.byte	-1
	.byte	119
	.byte	119
	.byte	119
	.byte	83
	.byte	-9
	.byte	120
	.byte	115
	.byte	1
	.byte	-33
	.byte	4
	.byte	117
	.byte	17
	.byte	-1
	.byte	17
	.byte	24
	.byte	0
	.byte	0
	.byte	68
	.byte	27
	.byte	102
	.byte	102
	.byte	1
	.byte	2
	.byte	62
	.byte	16
	.byte	3
	.byte	20
	.byte	16
	.byte	3
	.byte	2
	.byte	-83
	.byte	-33
	.byte	32
	.byte	3
	.byte	2
	.byte	62
	.byte	1
	.byte	21
	.byte	90
	.byte	-16
	.byte	114
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-7
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-14
	.byte	0
	.byte	17
	.byte	0
	.byte	3
	.byte	-1
	.byte	-69
	.byte	97
	.byte	-1
	.byte	49
	.byte	1
	.byte	-42
	.byte	35
	.byte	-1
	.byte	3
	.byte	60
	.byte	16
	.byte	5
	.byte	72
	.byte	18
	.byte	32
	.byte	-13
	.byte	-12
	.byte	0
	.byte	53
	.byte	-5
	.byte	53
	.byte	-1
	.byte	5
	.byte	3
	.byte	102
	.byte	17
	.byte	81
	.byte	3
	.byte	17
	.byte	11
	.byte	127
	.byte	6
	.byte	84
	.byte	3
	.byte	20
	.byte	7
	.byte	-16
	.byte	112
	.byte	-60
	.byte	127
	.byte	5
	.byte	-84
	.byte	96
	.byte	3
	.byte	3
	.byte	-80
	.byte	-107
	.byte	0
	.byte	119
	.byte	115
	.byte	113
	.byte	6
	.byte	56
	.byte	113
	.byte	5
	.byte	-33
	.byte	113
	.byte	37
	.byte	-33
	.byte	-73
	.byte	-74
	.byte	0
	.byte	55
	.byte	6
	.byte	116
	.byte	5
	.byte	-33
	.byte	51
	.byte	18
	.byte	123
	.byte	18
	.byte	23
	.byte	80
	.byte	103
	.byte	-98
	.byte	-16
	.byte	3
	.byte	102
	.byte	17
	.byte	16
	.byte	3
	.byte	-16
	.byte	113
	.byte	-80
	.byte	3
	.byte	16
	.byte	99
	.byte	113
	.byte	-74
	.byte	4
	.byte	91
	.byte	49
	.byte	16
	.byte	3
	.byte	4
	.byte	106
	.byte	113
	.byte	4
	.byte	11
	.byte	16
	.byte	3
	.byte	16
	.byte	31
	.byte	17
	.byte	65
	.byte	68
	.byte	21
	.byte	29
	.byte	34
	.byte	123
	.byte	82
	.byte	-125
	.byte	4
	.byte	80
	.byte	16
	.byte	123
	.byte	-11
	.byte	4
	.byte	87
	.byte	38
	.byte	-7
	.byte	17
	.byte	-34
	.byte	4
	.byte	-21
	.byte	1
	.byte	64
	.byte	3
	.byte	6
	.byte	32
	.byte	-13
	.byte	65
	.byte	51
	.byte	16
	.byte	3
	.byte	99
	.byte	22
	.byte	17
	.byte	49
	.byte	99
	.byte	1
	.byte	88
	.byte	-1
	.byte	7
	.byte	28
	.byte	-16
	.byte	115
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-63
	.byte	-16
	.byte	1
	.byte	-11
	.byte	-1
	.byte	1
	.byte	16
	.byte	102
	.byte	54
	.byte	23
	.byte	7
	.byte	-21
	.byte	89
	.byte	103
	.byte	64
	.byte	3
	.byte	115
	.byte	5
	.byte	15
	.byte	7
	.byte	19
	.byte	102
	.byte	51
	.byte	1
	.byte	-9
	.byte	71
	.byte	54
	.byte	33
	.byte	-1
	.byte	113
	.byte	119
	.byte	51
	.byte	5
	.byte	0
	.byte	35
	.byte	111
	.byte	21
	.byte	113
	.byte	-16
	.byte	21
	.byte	119
	.byte	21
	.byte	127
	.byte	7
	.byte	126
	.byte	37
	.byte	-1
	.byte	51
	.byte	119
	.byte	23
	.byte	0
	.byte	-63
	.byte	7
	.byte	-21
	.byte	5
	.byte	11
	.byte	68
	.byte	20
	.byte	70
	.byte	68
	.byte	100
	.byte	35
	.byte	7
	.byte	-66
	.byte	19
	.byte	15
	.byte	100
	.byte	3
	.byte	19
	.byte	-16
	.byte	113
	.byte	-58
	.byte	127
	.byte	21
	.byte	107
	.byte	8
	.byte	73
	.byte	16
	.byte	-77
	.byte	7
	.byte	-22
	.byte	16
	.byte	8
	.byte	80
	.byte	4
	.byte	3
	.byte	119
	.byte	49
	.byte	7
	.byte	-41
	.byte	80
	.byte	3
	.byte	-18
	.byte	37
	.byte	-13
	.byte	-121
	.byte	123
	.byte	1
	.byte	-1
	.byte	115
	.byte	4
	.byte	2
	.byte	6
	.byte	-95
	.byte	20
	.byte	7
	.byte	102
	.byte	-51
	.byte	3
	.byte	126
	.byte	112
	.byte	111
	.byte	102
	.byte	70
	.byte	48
	.byte	123
	.byte	67
	.byte	-125
	.byte	1
	.byte	0
	.byte	127
	.byte	-42
	.byte	-15
	.byte	127
	.byte	-29
	.byte	-1
	.byte	71
	.byte	36
	.byte	115
	.byte	97
	.byte	8
	.byte	60
	.byte	0
	.byte	3
	.byte	51
	.byte	94
	.byte	97
	.byte	8
	.byte	114
	.byte	97
	.byte	16
	.byte	-113
	.byte	0
	.byte	16
	.byte	-123
	.byte	-1
	.byte	35
	.byte	1
	.byte	119
	.byte	-3
	.byte	24
	.byte	-13
	.byte	0
	.byte	4
	.byte	8
	.byte	-41
	.byte	8
	.byte	98
	.byte	51
	.byte	-1
	.byte	114
	.byte	-9
	.byte	68
	.byte	112
	.byte	-121
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-58
	.byte	-16
	.byte	1
	.byte	-79
	.byte	-1
	.byte	119
	.byte	119
	.byte	23
	.byte	82
	.byte	-9
	.byte	2
	.byte	-1
	.byte	68
	.byte	-17
	.byte	21
	.byte	7
	.byte	7
	.byte	-113
	.byte	19
	.byte	-1
	.byte	115
	.byte	-127
	.byte	-1
	.byte	22
	.byte	-14
	.byte	25
	.byte	-13
	.byte	5
	.byte	-111
	.byte	-20
	.byte	9
	.byte	105
	.byte	5
	.byte	47
	.byte	8
	.byte	-17
	.byte	52
	.byte	97
	.byte	-1
	.byte	3
	.byte	111
	.byte	52
	.byte	51
	.byte	48
	.byte	103
	.byte	20
	.byte	23
	.byte	123
	.byte	5
	.byte	-78
	.byte	19
	.byte	67
	.byte	51
	.byte	51
	.byte	-75
	.byte	5
	.byte	-1
	.byte	51
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	103
	.byte	-112
	.byte	3
	.byte	113
	.byte	48
	.byte	3
	.byte	125
	.byte	71
	.byte	0
	.byte	7
	.byte	5
	.byte	-113
	.byte	5
	.byte	-13
	.byte	55
	.byte	123
	.byte	36
	.byte	-127
	.byte	70
	.byte	5
	.byte	108
	.byte	-46
	.byte	2
	.byte	99
	.byte	26
	.byte	119
	.byte	100
	.byte	0
	.byte	-123
	.byte	67
	.byte	67
	.byte	22
	.byte	-128
	.byte	51
	.byte	5
	.byte	119
	.byte	20
	.byte	52
	.byte	51
	.byte	71
	.byte	16
	.byte	119
	.byte	20
	.byte	9
	.byte	-13
	.byte	-57
	.byte	2
	.byte	3
	.byte	96
	.byte	3
	.byte	1
	.byte	68
	.byte	52
	.byte	-9
	.byte	-1
	.byte	-29
	.byte	-1
	.byte	0
	.byte	85
	.byte	-1
	.byte	-128
	.byte	-5
	.byte	115
	.byte	-1
	.byte	71
	.byte	-1
	.byte	7
	.byte	-6
	.byte	0
	.byte	-125
	.byte	23
	.byte	-13
	.byte	6
	.byte	127
	.byte	1
	.byte	15
	.byte	-1
	.byte	10
	.byte	87
	.byte	1
	.byte	-4
	.byte	18
	.byte	-126
	.byte	67
	.byte	-1
	.byte	71
	.byte	-1
	.byte	6
	.byte	62
	.byte	112
	.byte	123
	.byte	0
	.byte	-121
	.byte	127
	.byte	65
	.byte	8
	.byte	123
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	67
	.byte	-1
	.byte	52
	.byte	71
	.byte	19
	.byte	65
	.byte	-77
	.byte	5
	.byte	85
	.byte	49
	.byte	32
	.byte	3
	.byte	23
	.byte	11
	.byte	119
	.byte	119
	.byte	85
	.byte	7
	.byte	51
	.byte	-1
	.byte	122
	.byte	71
	.byte	53
	.byte	116
	.byte	21
	.byte	120
	.byte	75
	.byte	127
	.byte	7
	.byte	-106
	.byte	103
	.byte	11
	.byte	99
	.byte	119
	.byte	-41
	.byte	27
	.byte	-1
	.byte	2
	.byte	62
	.byte	0
	.byte	9
	.byte	-91
	.byte	17
	.byte	4
	.byte	14
	.byte	-93
	.byte	3
	.byte	23
	.byte	19
	.byte	-29
	.byte	-16
	.byte	114
	.byte	-47
	.byte	127
	.byte	10
	.byte	56
	.byte	70
	.byte	68
	.byte	68
	.byte	21
	.byte	-5
	.byte	35
	.byte	-1
	.byte	0
	.byte	119
	.byte	51
	.byte	119
	.byte	16
	.byte	103
	.byte	51
	.byte	71
	.byte	16
	.byte	12
	.byte	71
	.byte	51
	.byte	55
	.byte	49
	.byte	0
	.byte	118
	.byte	7
	.byte	-1
	.byte	115
	.byte	68
	.byte	5
	.byte	102
	.byte	52
	.byte	115
	.byte	51
	.byte	103
	.byte	9
	.byte	-51
	.byte	115
	.byte	11
	.byte	-39
	.byte	-1
	.byte	16
	.byte	3
	.byte	19
	.byte	126
	.byte	17
	.byte	-123
	.byte	40
	.byte	7
	.byte	-125
	.byte	-13
	.byte	3
	.byte	-1
	.byte	87
	.byte	127
	.byte	19
	.byte	-1
	.byte	-32
	.byte	20
	.byte	3
	.byte	-16
	.byte	113
	.byte	-25
	.byte	-1
	.byte	119
	.byte	49
	.byte	115
	.byte	119
	.byte	102
	.byte	127
	.byte	113
	.byte	-123
	.byte	-5
	.byte	-111
	.byte	-1
	.byte	23
	.byte	-21
	.byte	97
	.byte	-1
	.byte	66
	.byte	3
	.byte	2
	.byte	87
	.byte	12
	.byte	127
	.byte	-1
	.byte	55
	.byte	-1
	.byte	80
	.byte	103
	.byte	16
	.byte	-5
	.byte	23
	.byte	-5
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-1
	.byte	3
	.byte	-1
	.byte	19
	.byte	-123
	.byte	35
	.byte	111
	.byte	70
	.byte	51
	.byte	67
	.byte	113
	.byte	5
	.byte	-64
	.byte	113
	.byte	5
	.byte	86
	.byte	-57
	.byte	33
	.byte	-105
	.byte	97
	.byte	-1
	.byte	119
	.byte	119
	.byte	67
	.byte	117
	.byte	6
	.byte	38
	.byte	3
	.byte	59
	.byte	15
	.byte	-63
	.byte	4
	.byte	39
	.byte	14
	.byte	62
	.byte	71
	.byte	51
	.byte	99
	.byte	1
	.byte	70
	.byte	6
	.byte	-13
	.byte	-2
	.byte	16
	.byte	3
	.byte	9
	.byte	-91
	.byte	119
	.byte	-117
	.byte	28
	.byte	24
	.byte	-16
	.byte	114
	.byte	-11
	.byte	-1
	.byte	38
	.byte	3
	.byte	100
	.byte	-44
	.byte	64
	.byte	7
	.byte	39
	.byte	-125
	.byte	70
	.byte	7
	.byte	-121
	.byte	118
	.byte	16
	.byte	3
	.byte	102
	.byte	100
	.byte	-25
	.byte	35
	.byte	119
	.byte	-105
	.byte	123
	.byte	13
	.byte	-1
	.byte	119
	.byte	103
	.byte	21
	.byte	-121
	.byte	37
	.byte	-113
	.byte	71
	.byte	111
	.byte	-5
	.byte	14
	.byte	-117
	.byte	32
	.byte	3
	.byte	9
	.byte	-58
	.byte	108
	.byte	15
	.byte	13
	.byte	-1
	.byte	19
	.byte	-16
	.byte	113
	.byte	-45
	.byte	-1
	.byte	-9
	.byte	48
	.byte	-21
	.byte	-13
	.byte	-1
	.byte	-85
	.byte	-1
	.byte	89
	.byte	1
	.byte	68
	.byte	2
	.byte	-86
	.byte	42
	.byte	-113
	.byte	4
	.byte	91
	.byte	-41
	.byte	42
	.byte	0
	.byte	13
	.byte	-1
	.byte	22
	.byte	12
	.byte	-70
	.byte	22
	.byte	10
	.byte	-107
	.byte	55
	.byte	-5
	.byte	64
	.byte	-9
	.byte	-65
	.byte	11
	.byte	80
	.byte	22
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	77
	.byte	-1
	.byte	54
	.byte	51
	.byte	115
	.byte	6
	.byte	-9
	.byte	108
	.byte	103
	.byte	-96
	.byte	3
	.byte	13
	.byte	109
	.byte	17
	.byte	15
	.byte	-31
	.byte	46
	.byte	32
	.byte	17
	.byte	119
	.byte	127
	.byte	119
	.byte	101
	.byte	-124
	.byte	56
	.byte	3
	.byte	49
	.byte	12
	.byte	45
	.byte	3
	.byte	51
	.byte	-1
	.byte	61
	.byte	-1
	.byte	-73
	.byte	3
	.byte	-17
	.byte	11
	.byte	27
	.byte	-13
	.byte	-1
	.byte	-31
	.byte	-1
	.byte	54
	.byte	13
	.byte	-13
	.byte	-80
	.byte	3
	.byte	-97
	.byte	-113
	.byte	-119
	.byte	-1
	.byte	-29
	.byte	36
	.byte	119
	.byte	56
	.byte	7
	.byte	-113
	.byte	-109
	.byte	103
	.byte	100
	.byte	20
	.byte	14
	.byte	26
	.byte	51
	.byte	123
	.byte	-17
	.byte	71
	.byte	-1
	.byte	75
	.byte	-117
	.byte	7
	.byte	-1
	.byte	70
	.byte	-15
	.byte	127
	.byte	-19
	.byte	-1
	.byte	-80
	.byte	111
	.byte	80
	.byte	123
	.byte	119
	.byte	16
	.byte	8
	.byte	8
	.byte	31
	.byte	28
	.byte	48
	.byte	107
	.byte	67
	.byte	38
	.byte	-13
	.byte	-80
	.byte	-117
	.byte	71
	.byte	-1
	.byte	48
	.byte	70
	.byte	52
	.byte	38
	.byte	103
	.byte	93
	.byte	-1
	.byte	51
	.byte	119
	.byte	51
	.byte	19
	.byte	71
	.byte	119
	.byte	14
	.byte	-109
	.byte	65
	.byte	68
	.byte	52
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-9
	.byte	-1
	.byte	74
	.byte	-1
	.byte	-36
	.byte	-61
	.byte	-1
	.byte	13
	.byte	-112
	.byte	70
	.byte	5
	.byte	-21
	.byte	5
	.byte	-122
	.byte	2
	.byte	-18
	.byte	103
	.byte	70
	.byte	-3
	.byte	7
	.byte	-78
	.byte	16
	.byte	7
	.byte	16
	.byte	11
	.byte	57
	.byte	-1
	.byte	3
	.byte	102
	.byte	13
	.byte	21
	.byte	17
	.byte	7
	.byte	-54
	.byte	-33
	.byte	7
	.byte	-1
	.byte	24
	.byte	3
	.byte	115
	.byte	32
	.byte	3
	.byte	13
	.byte	-70
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-109
	.byte	-1
	.byte	105
	.byte	70
	.byte	16
	.byte	3
	.byte	11
	.byte	-125
	.byte	52
	.byte	61
	.byte	-117
	.byte	52
	.byte	51
	.byte	0
	.byte	114
	.byte	-32
	.byte	16
	.byte	118
	.byte	32
	.byte	3
	.byte	12
	.byte	14
	.byte	102
	.byte	51
	.byte	71
	.byte	100
	.byte	102
	.byte	-4
	.byte	1
	.byte	-114
	.byte	97
	.byte	-113
	.byte	95
	.byte	-21
	.byte	7
	.byte	-5
	.byte	48
	.byte	3
	.byte	19
	.byte	-9
	.byte	102
	.byte	52
	.byte	61
	.byte	19
	.byte	67
	.byte	1
	.byte	-5
	.byte	-3
	.byte	-1
	.byte	-16
	.byte	1
	.byte	8
	.byte	99
	.byte	115
	.byte	72
	.byte	115
	.byte	-30
	.byte	56
	.byte	123
	.byte	8
	.byte	68
	.byte	24
	.byte	123
	.byte	16
	.byte	49
	.byte	67
	.byte	39
	.byte	-1
	.byte	55
	.byte	31
	.byte	51
	.byte	115
	.byte	55
	.byte	-112
	.byte	-13
	.byte	6
	.byte	-3
	.byte	0
	.byte	-125
	.byte	12
	.byte	-126
	.byte	77
	.byte	-1
	.byte	-127
	.byte	46
	.byte	103
	.byte	67
	.byte	102
	.byte	1
	.byte	52
	.byte	67
	.byte	68
	.byte	8
	.byte	-121
	.byte	103
	.byte	100
	.byte	8
	.byte	-1
	.byte	48
	.byte	3
	.byte	65
	.byte	51
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	113
	.byte	-1
	.byte	55
	.byte	124
	.byte	19
	.byte	-98
	.byte	-5
	.byte	25
	.byte	119
	.byte	41
	.byte	-1
	.byte	15
	.byte	123
	.byte	49
	.byte	-1
	.byte	119
	.byte	119
	.byte	93
	.byte	71
	.byte	1
	.byte	-5
	.byte	103
	.byte	16
	.byte	3
	.byte	9
	.byte	-101
	.byte	10
	.byte	-3
	.byte	103
	.byte	64
	.byte	3
	.byte	-2
	.byte	103
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	4
	.byte	127
	.byte	43
	.byte	-13
	.byte	43
	.byte	-5
	.byte	115
	.byte	-45
	.byte	16
	.byte	3
	.byte	2
	.byte	106
	.byte	103
	.byte	27
	.byte	-113
	.byte	113
	.byte	119
	.byte	13
	.byte	-105
	.byte	10
	.byte	-117
	.byte	15
	.byte	103
	.byte	100
	.byte	52
	.byte	115
	.byte	8
	.byte	104
	.byte	12
	.byte	5
	.byte	23
	.byte	-125
	.byte	1
	.byte	93
	.byte	-33
	.byte	11
	.byte	-4
	.byte	22
	.byte	119
	.byte	68
	.byte	9
	.byte	-36
	.byte	30
	.byte	127
	.byte	-9
	.byte	-1
	.byte	123
	.byte	-1
	.byte	0
	.byte	56
	.byte	-38
	.byte	-15
	.byte	-1
	.byte	-64
	.byte	2
	.byte	65
	.byte	5
	.byte	-64
	.byte	48
	.byte	3
	.byte	52
	.byte	16
	.byte	3
	.byte	115
	.byte	96
	.byte	65
	.byte	10
	.byte	-13
	.byte	0
	.byte	3
	.byte	103
	.byte	16
	.byte	65
	.byte	51
	.byte	71
	.byte	-5
	.byte	51
	.byte	-1
	.byte	0
	.byte	-104
	.byte	2
	.byte	4
	.byte	16
	.byte	-13
	.byte	82
	.byte	-12
	.byte	70
	.byte	14
	.byte	-123
	.byte	105
	.byte	-1
	.byte	12
	.byte	115
	.byte	102
	.byte	1
	.byte	55
	.byte	0
	.byte	3
	.byte	114
	.byte	-5
	.byte	103
	.byte	20
	.byte	-65
	.byte	12
	.byte	-86
	.byte	20
	.byte	12
	.byte	87
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-13
	.byte	-1
	.byte	-93
	.byte	-1
	.byte	7
	.byte	-113
	.byte	68
	.byte	-31
	.byte	87
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	117
	.byte	-1
	.byte	55
	.byte	51
	.byte	22
	.byte	0
	.byte	7
	.byte	-1
	.byte	-6
	.byte	3
	.byte	-1
	.byte	56
	.byte	3
	.byte	-104
	.byte	7
	.byte	-16
	.byte	114
	.byte	-45
	.byte	-1
	.byte	70
	.byte	5
	.byte	-13
	.byte	102
	.byte	123
	.byte	52
	.byte	7
	.byte	-1
	.byte	19
	.byte	-5
	.byte	87
	.byte	-1
	.byte	47
	.byte	-121
	.byte	49
	.byte	14
	.byte	64
	.byte	85
	.byte	119
	.byte	-2
	.byte	31
	.byte	115
	.byte	31
	.byte	123
	.byte	8
	.byte	14
	.byte	56
	.byte	15
	.byte	64
	.byte	3
	.byte	104
	.byte	107
	.byte	-16
	.byte	3
	.byte	17
	.byte	-28
	.byte	31
	.byte	-101
	.byte	-16
	.byte	113
	.byte	-51
	.byte	-1
	.byte	67
	.byte	100
	.byte	14
	.byte	103
	.byte	67
	.byte	68
	.byte	-45
	.byte	42
	.byte	-9
	.byte	32
	.byte	3
	.byte	71
	.byte	11
	.byte	7
	.byte	103
	.byte	68
	.byte	103
	.byte	-1
	.byte	55
	.byte	-21
	.byte	-3
	.byte	-59
	.byte	-2
	.byte	119
	.byte	-1
	.byte	16
	.byte	99
	.byte	64
	.byte	3
	.byte	-96
	.byte	-125
	.byte	7
	.byte	-1
	.byte	17
	.byte	7
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-59
	.byte	-15
	.byte	127
	.byte	27
	.byte	-1
	.byte	102
	.byte	54
	.byte	19
	.byte	-9
	.byte	3
	.byte	54
	.byte	14
	.byte	3
	.byte	-19
	.byte	7
	.byte	3
	.byte	73
	.byte	-1
	.byte	15
	.byte	-122
	.byte	102
	.byte	11
	.byte	91
	.byte	16
	.byte	3
	.byte	70
	.byte	64
	.byte	7
	.byte	-1
	.byte	32
	.byte	11
	.byte	99
	.byte	-1
	.byte	30
	.byte	50
	.byte	25
	.byte	119
	.byte	5
	.byte	-121
	.byte	30
	.byte	3
	.byte	11
	.byte	-50
	.byte	39
	.byte	15
	.byte	-15
	.byte	-16
	.byte	114
	.byte	-9
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	120
	.byte	3
	.byte	103
	.byte	100
	.byte	70
	.byte	5
	.byte	90
	.byte	-1
	.byte	-15
	.byte	-128
	.byte	-121
	.byte	-113
	.byte	55
	.byte	119
	.byte	-16
	.byte	3
	.byte	45
	.byte	-105
	.byte	-16
	.byte	113
	.byte	-9
	.byte	-1
	.byte	56
	.byte	111
	.byte	47
	.byte	102
	.byte	102
	.byte	-112
	.byte	3
	.byte	16
	.byte	0
	.byte	16
	.byte	83
	.byte	-1
	.byte	52
	.byte	103
	.byte	-48
	.byte	1
	.byte	126
	.byte	22
	.byte	11
	.byte	24
	.byte	22
	.byte	-5
	.byte	61
	.byte	-1
	.byte	16
	.byte	16
	.byte	-112
	.byte	3
	.byte	10
	.byte	56
	.byte	1
	.byte	-1
	.byte	11
	.byte	59
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-10
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	115
	.byte	-1
	.byte	11
	.byte	115
	.byte	70
	.byte	7
	.byte	119
	.byte	54
	.byte	-1
	.byte	113
	.byte	-29
	.byte	29
	.byte	-37
	.byte	4
	.byte	-56
	.byte	59
	.byte	-1
	.byte	51
	.byte	119
	.byte	52
	.byte	25
	.byte	119
	.byte	5
	.byte	-119
	.byte	-100
	.byte	119
	.byte	-6
	.byte	102
	.byte	52
	.byte	6
	.byte	-13
	.byte	11
	.byte	4
	.byte	13
	.byte	-1
	.byte	51
	.byte	23
	.byte	86
	.byte	0
	.byte	13
	.byte	-66
	.byte	17
	.byte	13
	.byte	-62
	.byte	20
	.byte	14
	.byte	62
	.byte	48
	.byte	3
	.byte	119
	.byte	56
	.byte	51
	.byte	20
	.byte	13
	.byte	-82
	.byte	-11
	.byte	-1
	.byte	-27
	.byte	-1
	.byte	103
	.byte	102
	.byte	16
	.byte	-97
	.byte	9
	.byte	-64
	.byte	16
	.byte	103
	.byte	11
	.byte	-1
	.byte	13
	.byte	-68
	.byte	-109
	.byte	-1
	.byte	28
	.byte	7
	.byte	67
	.byte	-9
	.byte	-65
	.byte	77
	.byte	-11
	.byte	115
	.byte	14
	.byte	14
	.byte	30
	.byte	118
	.byte	48
	.byte	3
	.byte	25
	.byte	-105
	.byte	6
	.byte	-109
	.byte	15
	.byte	111
	.byte	-5
	.byte	16
	.byte	3
	.byte	117
	.byte	127
	.byte	15
	.byte	-94
	.byte	16
	.byte	3
	.byte	9
	.byte	-109
	.byte	103
	.byte	-15
	.byte	-1
	.byte	-21
	.byte	-1
	.byte	-16
	.byte	0
	.byte	-13
	.byte	13
	.byte	-48
	.byte	8
	.byte	-30
	.byte	4
	.byte	7
	.byte	99
	.byte	102
	.byte	49
	.byte	99
	.byte	-4
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	21
	.byte	12
	.byte	71
	.byte	-1
	.byte	64
	.byte	103
	.byte	8
	.byte	-104
	.byte	20
	.byte	102
	.byte	49
	.byte	54
	.byte	103
	.byte	0
	.byte	3
	.byte	0
	.byte	-113
	.byte	102
	.byte	67
	.byte	20
	.byte	10
	.byte	-61
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-58
	.byte	-16
	.byte	1
	.byte	101
	.byte	-1
	.byte	51
	.byte	23
	.byte	113
	.byte	7
	.byte	127
	.byte	64
	.byte	3
	.byte	51
	.byte	-113
	.byte	48
	.byte	3
	.byte	119
	.byte	51
	.byte	17
	.byte	15
	.byte	116
	.byte	87
	.byte	-1
	.byte	9
	.byte	-1
	.byte	15
	.byte	110
	.byte	-31
	.byte	17
	.byte	121
	.byte	57
	.byte	-3
	.byte	31
	.byte	123
	.byte	51
	.byte	119
	.byte	55
	.byte	115
	.byte	87
	.byte	-1
	.byte	-122
	.byte	15
	.byte	119
	.byte	17
	.byte	115
	.byte	103
	.byte	68
	.byte	38
	.byte	-5
	.byte	7
	.byte	-62
	.byte	20
	.byte	120
	.byte	119
	.byte	10
	.byte	3
	.byte	25
	.byte	-113
	.byte	-16
	.byte	114
	.byte	-52
	.byte	127
	.byte	52
	.byte	115
	.byte	70
	.byte	-113
	.byte	0
	.byte	3
	.byte	102
	.byte	16
	.byte	70
	.byte	16
	.byte	3
	.byte	7
	.byte	119
	.byte	57
	.byte	-117
	.byte	25
	.byte	-109
	.byte	-2
	.byte	25
	.byte	-105
	.byte	39
	.byte	126
	.byte	13
	.byte	-6
	.byte	8
	.byte	110
	.byte	49
	.byte	-8
	.byte	13
	.byte	-45
	.byte	80
	.byte	126
	.byte	115
	.byte	-38
	.byte	13
	.byte	-21
	.byte	31
	.byte	-113
	.byte	19
	.byte	10
	.byte	33
	.byte	0
	.byte	3
	.byte	70
	.byte	13
	.byte	-9
	.byte	68
	.byte	-2
	.byte	0
	.byte	11
	.byte	123
	.byte	-1
	.byte	31
	.byte	-105
	.byte	-16
	.byte	113
	.byte	-51
	.byte	-1
	.byte	62
	.byte	-9
	.byte	30
	.byte	-5
	.byte	102
	.byte	3
	.byte	113
	.byte	70
	.byte	99
	.byte	102
	.byte	113
	.byte	52
	.byte	16
	.byte	3
	.byte	-15
	.byte	-1
	.byte	-3
	.byte	-15
	.byte	-1
	.byte	51
	.byte	-1
	.byte	24
	.byte	99
	.byte	0
	.byte	-119
	.byte	1
	.byte	-1
	.byte	16
	.byte	-121
	.byte	99
	.byte	-13
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-125
	.byte	-15
	.byte	-1
	.byte	1
	.byte	16
	.byte	115
	.byte	119
	.byte	23
	.byte	6
	.byte	-13
	.byte	7
	.byte	7
	.byte	-67
	.byte	16
	.byte	3
	.byte	115
	.byte	7
	.byte	15
	.byte	11
	.byte	-52
	.byte	57
	.byte	-113
	.byte	85
	.byte	-1
	.byte	51
	.byte	7
	.byte	-1
	.byte	-1
	.byte	1
	.byte	21
	.byte	39
	.byte	-5
	.byte	96
	.byte	3
	.byte	53
	.byte	-1
	.byte	103
	.byte	3
	.byte	-9
	.byte	-125
	.byte	7
	.byte	-125
	.byte	-16
	.byte	114
	.byte	-1
	.byte	-7
	.byte	-1
	.byte	-112
	.byte	3
	.byte	119
	.byte	-121
	.byte	55
	.byte	-113
	.byte	9
	.byte	-4
	.byte	9
	.byte	-111
	.byte	-10
	.byte	0
	.byte	109
	.byte	-113
	.byte	-1
	.byte	119
	.byte	127
	.byte	-16
	.byte	3
	.byte	-8
	.byte	127
	.byte	-9
	.byte	-1
	.byte	71
	.byte	-9
	.byte	-11
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-12
	.byte	11
	.byte	-1
	.byte	64
	.byte	-13
	.byte	-43
	.byte	-1
	.byte	0
	.byte	79
	.byte	17
	.byte	25
	.byte	91
	.byte	0
	.byte	0
	.global	tileset01_data
	.type	tileset01_data, %object
	.size	tileset01_data, 2340
tileset01_data:
	.byte	16
	.byte	96
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	34
	.byte	34
	.byte	0
	.byte	98
	.byte	102
	.byte	102
	.byte	12
	.byte	32
	.byte	102
	.byte	102
	.byte	102
	.byte	0
	.byte	6
	.byte	64
	.byte	3
	.byte	51
	.byte	51
	.byte	-127
	.byte	80
	.byte	3
	.byte	0
	.byte	0
	.byte	34
	.byte	34
	.byte	34
	.byte	34
	.byte	16
	.byte	25
	.byte	-96
	.byte	-80
	.byte	2
	.byte	99
	.byte	0
	.byte	47
	.byte	51
	.byte	51
	.byte	102
	.byte	102
	.byte	34
	.byte	2
	.byte	34
	.byte	2
	.byte	0
	.byte	102
	.byte	102
	.byte	38
	.byte	64
	.byte	3
	.byte	102
	.byte	84
	.byte	2
	.byte	0
	.byte	70
	.byte	38
	.byte	64
	.byte	3
	.byte	35
	.byte	0
	.byte	33
	.byte	35
	.byte	0
	.byte	120
	.byte	0
	.byte	-16
	.byte	1
	.byte	-112
	.byte	5
	.byte	-112
	.byte	107
	.byte	-80
	.byte	3
	.byte	119
	.byte	119
	.byte	98
	.byte	46
	.byte	102
	.byte	103
	.byte	0
	.byte	-119
	.byte	99
	.byte	0
	.byte	-115
	.byte	-16
	.byte	1
	.byte	16
	.byte	13
	.byte	119
	.byte	71
	.byte	55
	.byte	0
	.byte	-127
	.byte	54
	.byte	51
	.byte	35
	.byte	0
	.byte	25
	.byte	-16
	.byte	3
	.byte	64
	.byte	11
	.byte	-35
	.byte	-16
	.byte	113
	.byte	-48
	.byte	127
	.byte	103
	.byte	0
	.byte	-9
	.byte	16
	.byte	3
	.byte	-80
	.byte	-125
	.byte	32
	.byte	16
	.byte	-5
	.byte	-110
	.byte	0
	.byte	-6
	.byte	102
	.byte	118
	.byte	16
	.byte	-127
	.byte	119
	.byte	119
	.byte	1
	.byte	30
	.byte	54
	.byte	26
	.byte	51
	.byte	99
	.byte	54
	.byte	32
	.byte	-13
	.byte	32
	.byte	-119
	.byte	35
	.byte	1
	.byte	23
	.byte	2
	.byte	33
	.byte	0
	.byte	0
	.byte	0
	.byte	-123
	.byte	35
	.byte	119
	.byte	119
	.byte	54
	.byte	0
	.byte	-21
	.byte	-64
	.byte	16
	.byte	-17
	.byte	16
	.byte	7
	.byte	19
	.byte	33
	.byte	51
	.byte	51
	.byte	17
	.byte	33
	.byte	15
	.byte	17
	.byte	17
	.byte	17
	.byte	33
	.byte	48
	.byte	33
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-80
	.byte	3
	.byte	1
	.byte	-2
	.byte	34
	.byte	-113
	.byte	-79
	.byte	-5
	.byte	102
	.byte	102
	.byte	50
	.byte	1
	.byte	106
	.byte	80
	.byte	3
	.byte	17
	.byte	-3
	.byte	-31
	.byte	-4
	.byte	-18
	.byte	97
	.byte	-1
	.byte	16
	.byte	31
	.byte	81
	.byte	-1
	.byte	102
	.byte	16
	.byte	39
	.byte	49
	.byte	-5
	.byte	1
	.byte	-121
	.byte	54
	.byte	-67
	.byte	33
	.byte	-117
	.byte	115
	.byte	-15
	.byte	127
	.byte	-64
	.byte	2
	.byte	96
	.byte	103
	.byte	1
	.byte	-34
	.byte	32
	.byte	-80
	.byte	3
	.byte	10
	.byte	119
	.byte	50
	.byte	51
	.byte	115
	.byte	81
	.byte	-5
	.byte	115
	.byte	1
	.byte	-3
	.byte	103
	.byte	-91
	.byte	0
	.byte	5
	.byte	103
	.byte	64
	.byte	5
	.byte	51
	.byte	119
	.byte	1
	.byte	-8
	.byte	102
	.byte	17
	.byte	-114
	.byte	56
	.byte	51
	.byte	103
	.byte	1
	.byte	127
	.byte	18
	.byte	107
	.byte	65
	.byte	127
	.byte	99
	.byte	102
	.byte	35
	.byte	64
	.byte	103
	.byte	2
	.byte	123
	.byte	115
	.byte	102
	.byte	54
	.byte	33
	.byte	51
	.byte	103
	.byte	97
	.byte	54
	.byte	-15
	.byte	127
	.byte	-32
	.byte	127
	.byte	103
	.byte	102
	.byte	50
	.byte	115
	.byte	0
	.byte	-13
	.byte	-45
	.byte	0
	.byte	52
	.byte	0
	.byte	3
	.byte	54
	.byte	64
	.byte	7
	.byte	102
	.byte	32
	.byte	1
	.byte	4
	.byte	19
	.byte	27
	.byte	-6
	.byte	17
	.byte	-9
	.byte	48
	.byte	-4
	.byte	64
	.byte	6
	.byte	48
	.byte	11
	.byte	2
	.byte	-116
	.byte	99
	.byte	2
	.byte	-5
	.byte	34
	.byte	0
	.byte	34
	.byte	51
	.byte	115
	.byte	54
	.byte	2
	.byte	51
	.byte	51
	.byte	55
	.byte	62
	.byte	2
	.byte	54
	.byte	0
	.byte	-21
	.byte	16
	.byte	-9
	.byte	34
	.byte	-113
	.byte	2
	.byte	-9
	.byte	3
	.byte	66
	.byte	2
	.byte	-1
	.byte	3
	.byte	57
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-32
	.byte	1
	.byte	16
	.byte	-93
	.byte	3
	.byte	-2
	.byte	35
	.byte	-31
	.byte	-111
	.byte	-1
	.byte	33
	.byte	-113
	.byte	119
	.byte	63
	.byte	119
	.byte	55
	.byte	18
	.byte	31
	.byte	-46
	.byte	0
	.byte	-109
	.byte	-119
	.byte	-15
	.byte	-1
	.byte	51
	.byte	-1
	.byte	4
	.byte	31
	.byte	109
	.byte	38
	.byte	-13
	.byte	127
	.byte	-16
	.byte	1
	.byte	32
	.byte	1
	.byte	115
	.byte	-112
	.byte	3
	.byte	114
	.byte	16
	.byte	3
	.byte	-47
	.byte	4
	.byte	94
	.byte	0
	.byte	3
	.byte	102
	.byte	16
	.byte	3
	.byte	51
	.byte	115
	.byte	119
	.byte	1
	.byte	-7
	.byte	47
	.byte	102
	.byte	55
	.byte	1
	.byte	-90
	.byte	118
	.byte	1
	.byte	-49
	.byte	0
	.byte	15
	.byte	20
	.byte	119
	.byte	1
	.byte	-88
	.byte	-14
	.byte	2
	.byte	14
	.byte	0
	.byte	3
	.byte	20
	.byte	27
	.byte	35
	.byte	-9
	.byte	119
	.byte	119
	.byte	1
	.byte	123
	.byte	102
	.byte	72
	.byte	55
	.byte	4
	.byte	115
	.byte	118
	.byte	39
	.byte	67
	.byte	-117
	.byte	2
	.byte	102
	.byte	99
	.byte	-57
	.byte	-15
	.byte	-1
	.byte	-48
	.byte	1
	.byte	114
	.byte	102
	.byte	51
	.byte	48
	.byte	107
	.byte	4
	.byte	-48
	.byte	80
	.byte	119
	.byte	59
	.byte	18
	.byte	97
	.byte	113
	.byte	-1
	.byte	16
	.byte	99
	.byte	-128
	.byte	3
	.byte	99
	.byte	48
	.byte	15
	.byte	4
	.byte	120
	.byte	-67
	.byte	35
	.byte	25
	.byte	0
	.byte	4
	.byte	-5
	.byte	0
	.byte	103
	.byte	32
	.byte	107
	.byte	82
	.byte	-125
	.byte	102
	.byte	1
	.byte	-1
	.byte	47
	.byte	102
	.byte	35
	.byte	3
	.byte	67
	.byte	2
	.byte	21
	.byte	90
	.byte	-16
	.byte	114
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-4
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-14
	.byte	0
	.byte	34
	.byte	0
	.byte	-1
	.byte	5
	.byte	-5
	.byte	-31
	.byte	-1
	.byte	20
	.byte	3
	.byte	19
	.byte	-113
	.byte	37
	.byte	-2
	.byte	-13
	.byte	-2
	.byte	-123
	.byte	-1
	.byte	17
	.byte	3
	.byte	127
	.byte	34
	.byte	21
	.byte	-9
	.byte	80
	.byte	3
	.byte	98
	.byte	3
	.byte	22
	.byte	11
	.byte	-16
	.byte	112
	.byte	-60
	.byte	127
	.byte	-61
	.byte	-9
	.byte	95
	.byte	98
	.byte	5
	.byte	-26
	.byte	114
	.byte	1
	.byte	-14
	.byte	1
	.byte	-105
	.byte	32
	.byte	3
	.byte	-11
	.byte	-1
	.byte	69
	.byte	-5
	.byte	-14
	.byte	66
	.byte	22
	.byte	22
	.byte	111
	.byte	6
	.byte	-121
	.byte	-16
	.byte	3
	.byte	51
	.byte	102
	.byte	4
	.byte	82
	.byte	102
	.byte	-53
	.byte	-15
	.byte	-128
	.byte	-15
	.byte	-1
	.byte	51
	.byte	114
	.byte	1
	.byte	-48
	.byte	114
	.byte	3
	.byte	-56
	.byte	48
	.byte	3
	.byte	76
	.byte	103
	.byte	16
	.byte	3
	.byte	99
	.byte	32
	.byte	6
	.byte	-13
	.byte	21
	.byte	29
	.byte	51
	.byte	102
	.byte	116
	.byte	118
	.byte	2
	.byte	-128
	.byte	32
	.byte	-125
	.byte	-96
	.byte	-121
	.byte	54
	.byte	65
	.byte	-1
	.byte	119
	.byte	55
	.byte	44
	.byte	102
	.byte	2
	.byte	6
	.byte	22
	.byte	2
	.byte	4
	.byte	-117
	.byte	-96
	.byte	-125
	.byte	34
	.byte	50
	.byte	-65
	.byte	0
	.byte	123
	.byte	32
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-11
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	7
	.byte	-2
	.byte	2
	.byte	6
	.byte	-21
	.byte	35
	.byte	87
	.byte	111
	.byte	-85
	.byte	71
	.byte	11
	.byte	99
	.byte	24
	.byte	3
	.byte	34
	.byte	71
	.byte	3
	.byte	34
	.byte	22
	.byte	16
	.byte	71
	.byte	111
	.byte	95
	.byte	99
	.byte	7
	.byte	15
	.byte	102
	.byte	55
	.byte	15
	.byte	3
	.byte	57
	.byte	55
	.byte	-1
	.byte	19
	.byte	-26
	.byte	53
	.byte	-62
	.byte	63
	.byte	115
	.byte	39
	.byte	21
	.byte	-113
	.byte	-112
	.byte	3
	.byte	-16
	.byte	113
	.byte	-58
	.byte	127
	.byte	71
	.byte	107
	.byte	-112
	.byte	7
	.byte	-66
	.byte	-121
	.byte	-1
	.byte	99
	.byte	1
	.byte	105
	.byte	-15
	.byte	-1
	.byte	64
	.byte	10
	.byte	19
	.byte	-123
	.byte	32
	.byte	111
	.byte	115
	.byte	-79
	.byte	3
	.byte	115
	.byte	103
	.byte	48
	.byte	3
	.byte	5
	.byte	-54
	.byte	35
	.byte	115
	.byte	54
	.byte	37
	.byte	-1
	.byte	127
	.byte	2
	.byte	16
	.byte	3
	.byte	-16
	.byte	113
	.byte	-9
	.byte	-1
	.byte	-8
	.byte	123
	.byte	7
	.byte	-1
	.byte	2
	.byte	-120
	.byte	25
	.byte	27
	.byte	-1
	.byte	17
	.byte	-3
	.byte	40
	.byte	-23
	.byte	0
	.byte	-119
	.byte	-80
	.byte	-127
	.byte	51
	.byte	-1
	.byte	80
	.byte	103
	.byte	2
	.byte	-112
	.byte	38
	.byte	-17
	.byte	-127
	.byte	4
	.byte	-121
	.byte	39
	.byte	103
	.byte	102
	.byte	119
	.byte	39
	.byte	114
	.byte	-13
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-74
	.byte	113
	.byte	-1
	.byte	119
	.byte	0
	.byte	-81
	.byte	5
	.byte	95
	.byte	50
	.byte	9
	.byte	-44
	.byte	7
	.byte	-5
	.byte	102
	.byte	86
	.byte	114
	.byte	9
	.byte	87
	.byte	34
	.byte	8
	.byte	-9
	.byte	32
	.byte	5
	.byte	118
	.byte	41
	.byte	-2
	.byte	114
	.byte	27
	.byte	119
	.byte	119
	.byte	119
	.byte	7
	.byte	84
	.byte	73
	.byte	-9
	.byte	54
	.byte	16
	.byte	3
	.byte	19
	.byte	120
	.byte	-104
	.byte	55
	.byte	3
	.byte	2
	.byte	0
	.byte	0
	.byte	-6
	.byte	21
	.byte	7
	.byte	34
	.byte	102
	.byte	54
	.byte	-7
	.byte	89
	.byte	7
	.byte	57
	.byte	-5
	.byte	25
	.byte	-101
	.byte	-16
	.byte	114
	.byte	-47
	.byte	-1
	.byte	118
	.byte	119
	.byte	26
	.byte	123
	.byte	-1
	.byte	80
	.byte	3
	.byte	10
	.byte	-118
	.byte	2
	.byte	123
	.byte	122
	.byte	-117
	.byte	19
	.byte	119
	.byte	21
	.byte	109
	.byte	49
	.byte	-121
	.byte	19
	.byte	-17
	.byte	-57
	.byte	26
	.byte	117
	.byte	16
	.byte	126
	.byte	54
	.byte	51
	.byte	54
	.byte	5
	.byte	-115
	.byte	24
	.byte	107
	.byte	89
	.byte	-9
	.byte	-1
	.byte	6
	.byte	42
	.byte	7
	.byte	-5
	.byte	64
	.byte	3
	.byte	5
	.byte	-5
	.byte	7
	.byte	-50
	.byte	-15
	.byte	-1
	.byte	-22
	.byte	127
	.byte	26
	.byte	-9
	.byte	127
	.byte	54
	.byte	72
	.byte	-9
	.byte	80
	.byte	3
	.byte	9
	.byte	-1
	.byte	103
	.byte	-1
	.byte	42
	.byte	99
	.byte	8
	.byte	78
	.byte	118
	.byte	8
	.byte	-2
	.byte	6
	.byte	120
	.byte	17
	.byte	33
	.byte	39
	.byte	-34
	.byte	16
	.byte	99
	.byte	54
	.byte	3
	.byte	10
	.byte	-17
	.byte	38
	.byte	3
	.byte	99
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-57
	.byte	-16
	.byte	1
	.byte	-45
	.byte	-1
	.byte	115
	.byte	119
	.byte	39
	.byte	40
	.byte	-1
	.byte	11
	.byte	79
	.byte	41
	.byte	-5
	.byte	15
	.byte	115
	.byte	119
	.byte	119
	.byte	50
	.byte	26
	.byte	7
	.byte	12
	.byte	19
	.byte	51
	.byte	-1
	.byte	10
	.byte	-31
	.byte	-67
	.byte	39
	.byte	107
	.byte	55
	.byte	35
	.byte	5
	.byte	21
	.byte	123
	.byte	25
	.byte	2
	.byte	7
	.byte	12
	.byte	115
	.byte	49
	.byte	-1
	.byte	127
	.byte	39
	.byte	73
	.byte	-1
	.byte	27
	.byte	7
	.byte	123
	.byte	-125
	.byte	7
	.byte	-71
	.byte	-15
	.byte	-1
	.byte	-39
	.byte	-1
	.byte	12
	.byte	73
	.byte	-47
	.byte	22
	.byte	95
	.byte	12
	.byte	127
	.byte	99
	.byte	114
	.byte	7
	.byte	54
	.byte	51
	.byte	32
	.byte	9
	.byte	-29
	.byte	123
	.byte	50
	.byte	9
	.byte	-25
	.byte	103
	.byte	124
	.byte	24
	.byte	5
	.byte	39
	.byte	-4
	.byte	103
	.byte	10
	.byte	90
	.byte	28
	.byte	23
	.byte	-36
	.byte	42
	.byte	27
	.byte	28
	.byte	32
	.byte	35
	.byte	4
	.byte	36
	.byte	41
	.byte	119
	.byte	80
	.byte	3
	.byte	54
	.byte	99
	.byte	77
	.byte	49
	.byte	55
	.byte	-1
	.byte	54
	.byte	51
	.byte	-15
	.byte	-1
	.byte	-38
	.byte	127
	.byte	115
	.byte	58
	.byte	103
	.byte	-33
	.byte	69
	.byte	-9
	.byte	0
	.byte	7
	.byte	55
	.byte	16
	.byte	11
	.byte	105
	.byte	-1
	.byte	8
	.byte	87
	.byte	10
	.byte	29
	.byte	22
	.byte	103
	.byte	-1
	.byte	26
	.byte	111
	.byte	22
	.byte	5
	.byte	48
	.byte	-8
	.byte	103
	.byte	-1
	.byte	9
	.byte	-25
	.byte	10
	.byte	-25
	.byte	26
	.byte	3
	.byte	2
	.byte	127
	.byte	31
	.byte	54
	.byte	35
	.byte	55
	.byte	12
	.byte	3
	.byte	4
	.byte	-75
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-107
	.byte	-1
	.byte	118
	.byte	21
	.byte	119
	.byte	39
	.byte	98
	.byte	9
	.byte	95
	.byte	18
	.byte	11
	.byte	56
	.byte	114
	.byte	3
	.byte	-34
	.byte	-1
	.byte	89
	.byte	123
	.byte	23
	.byte	-9
	.byte	85
	.byte	-1
	.byte	81
	.byte	-13
	.byte	19
	.byte	11
	.byte	17
	.byte	-9
	.byte	35
	.byte	19
	.byte	22
	.byte	35
	.byte	-27
	.byte	14
	.byte	62
	.byte	14
	.byte	7
	.byte	11
	.byte	3
	.byte	102
	.byte	38
	.byte	7
	.byte	11
	.byte	38
	.byte	23
	.byte	7
	.byte	-7
	.byte	11
	.byte	-103
	.byte	32
	.byte	7
	.byte	23
	.byte	-109
	.byte	-16
	.byte	114
	.byte	-39
	.byte	-1
	.byte	99
	.byte	102
	.byte	10
	.byte	3
	.byte	-18
	.byte	-112
	.byte	3
	.byte	25
	.byte	-1
	.byte	41
	.byte	-5
	.byte	114
	.byte	46
	.byte	101
	.byte	67
	.byte	-21
	.byte	67
	.byte	-13
	.byte	99
	.byte	-1
	.byte	67
	.byte	-5
	.byte	84
	.byte	3
	.byte	-9
	.byte	-9
	.byte	-80
	.byte	3
	.byte	-16
	.byte	113
	.byte	-39
	.byte	-1
	.byte	10
	.byte	103
	.byte	92
	.byte	-17
	.byte	-3
	.byte	4
	.byte	-26
	.byte	32
	.byte	-1
	.byte	27
	.byte	-1
	.byte	5
	.byte	-64
	.byte	31
	.byte	27
	.byte	-104
	.byte	112
	.byte	119
	.byte	36
	.byte	11
	.byte	-7
	.byte	20
	.byte	-6
	.byte	118
	.byte	0
	.byte	32
	.byte	115
	.byte	0
	.byte	-9
	.byte	6
	.byte	115
	.byte	38
	.byte	115
	.byte	0
	.byte	127
	.byte	-33
	.byte	16
	.byte	7
	.byte	71
	.byte	-1
	.byte	38
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	93
	.byte	-1
	.byte	47
	.byte	111
	.byte	14
	.byte	-9
	.byte	103
	.byte	-65
	.byte	14
	.byte	-5
	.byte	55
	.byte	64
	.byte	3
	.byte	71
	.byte	-1
	.byte	44
	.byte	0
	.byte	53
	.byte	-1
	.byte	22
	.byte	2
	.byte	13
	.byte	34
	.byte	-1
	.byte	32
	.byte	7
	.byte	45
	.byte	-103
	.byte	37
	.byte	5
	.byte	83
	.byte	-1
	.byte	-75
	.byte	-1
	.byte	-1
	.byte	127
	.byte	-16
	.byte	1
	.byte	-9
	.byte	-1
	.byte	-1
	.byte	-25
	.byte	-1
	.byte	23
	.byte	-5
	.byte	12
	.byte	0
	.byte	45
	.byte	-2
	.byte	27
	.byte	-9
	.byte	19
	.byte	-5
	.byte	46
	.byte	10
	.byte	80
	.byte	7
	.byte	-2
	.byte	59
	.byte	-9
	.byte	11
	.byte	-1
	.byte	15
	.byte	123
	.byte	14
	.byte	33
	.byte	8
	.byte	11
	.byte	0
	.byte	7
	.byte	48
	.byte	3
	.byte	2
	.byte	-3
	.byte	29
	.byte	-101
	.byte	-16
	.byte	113
	.byte	-25
	.byte	-1
	.byte	8
	.byte	-21
	.byte	-8
	.byte	3
	.byte	13
	.byte	-1
	.byte	115
	.byte	45
	.byte	-1
	.byte	-4
	.byte	44
	.byte	116
	.byte	36
	.byte	111
	.byte	40
	.byte	1
	.byte	44
	.byte	-114
	.byte	29
	.byte	-2
	.byte	75
	.byte	-1
	.byte	51
	.byte	55
	.byte	61
	.byte	54
	.byte	2
	.byte	14
	.byte	-117
	.byte	5
	.byte	-1
	.byte	32
	.byte	-17
	.byte	8
	.byte	-1
	.byte	115
	.byte	8
	.byte	-113
	.byte	63
	.byte	103
	.byte	35
	.byte	7
	.byte	67
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-5
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-57
	.byte	-1
	.byte	114
	.byte	14
	.byte	-23
	.byte	115
	.byte	123
	.byte	-105
	.byte	31
	.byte	-48
	.byte	54
	.byte	99
	.byte	53
	.byte	-1
	.byte	115
	.byte	9
	.byte	-115
	.byte	15
	.byte	114
	.byte	9
	.byte	-115
	.byte	-32
	.byte	-109
	.byte	123
	.byte	12
	.byte	4
	.byte	61
	.byte	-1
	.byte	51
	.byte	39
	.byte	0
	.byte	119
	.byte	115
	.byte	63
	.byte	54
	.byte	34
	.byte	20
	.byte	-1
	.byte	31
	.byte	123
	.byte	13
	.byte	-90
	.byte	41
	.byte	-121
	.byte	25
	.byte	-109
	.byte	-16
	.byte	114
	.byte	-57
	.byte	-19
	.byte	-1
	.byte	-125
	.byte	-1
	.byte	54
	.byte	102
	.byte	32
	.byte	71
	.byte	127
	.byte	92
	.byte	-125
	.byte	12
	.byte	104
	.byte	-5
	.byte	31
	.byte	127
	.byte	3
	.byte	-2
	.byte	63
	.byte	-121
	.byte	60
	.byte	119
	.byte	106
	.byte	11
	.byte	115
	.byte	13
	.byte	-110
	.byte	57
	.byte	-5
	.byte	-9
	.byte	26
	.byte	3
	.byte	10
	.byte	11
	.byte	14
	.byte	48
	.byte	82
	.byte	123
	.byte	2
	.byte	10
	.byte	-82
	.byte	-15
	.byte	-1
	.byte	-37
	.byte	-1
	.byte	-1
	.byte	28
	.byte	111
	.byte	44
	.byte	115
	.byte	19
	.byte	-5
	.byte	6
	.byte	-13
	.byte	4
	.byte	104
	.byte	25
	.byte	7
	.byte	87
	.byte	-1
	.byte	82
	.byte	104
	.byte	-3
	.byte	9
	.byte	1
	.byte	12
	.byte	-120
	.byte	28
	.byte	-11
	.byte	28
	.byte	-4
	.byte	121
	.byte	-1
	.byte	9
	.byte	38
	.byte	2
	.byte	16
	.byte	3
	.byte	10
	.byte	102
	.byte	119
	.byte	55
	.byte	33
	.byte	4
	.byte	-93
	.byte	33
	.byte	4
	.byte	-1
	.byte	35
	.byte	-1
	.byte	4
	.byte	-84
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-31
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-101
	.byte	-1
	.byte	51
	.byte	115
	.byte	38
	.byte	50
	.byte	4
	.byte	-34
	.byte	-37
	.byte	45
	.byte	115
	.byte	14
	.byte	-31
	.byte	114
	.byte	28
	.byte	-35
	.byte	51
	.byte	-105
	.byte	115
	.byte	89
	.byte	-1
	.byte	43
	.byte	-17
	.byte	-24
	.byte	-83
	.byte	127
	.byte	60
	.byte	3
	.byte	27
	.byte	-1
	.byte	55
	.byte	91
	.byte	-1
	.byte	115
	.byte	119
	.byte	33
	.byte	-47
	.byte	11
	.byte	-125
	.byte	48
	.byte	3
	.byte	115
	.byte	0
	.byte	7
	.byte	51
	.byte	103
	.byte	33
	.byte	-16
	.byte	114
	.byte	-100
	.byte	-29
	.byte	-1
	.byte	103
	.byte	32
	.byte	15
	.byte	-52
	.byte	14
	.byte	7
	.byte	0
	.byte	3
	.byte	115
	.byte	102
	.byte	111
	.byte	98
	.byte	11
	.byte	-60
	.byte	16
	.byte	3
	.byte	50
	.byte	15
	.byte	-20
	.byte	0
	.byte	3
	.byte	94
	.byte	106
	.byte	62
	.byte	127
	.byte	-19
	.byte	34
	.byte	1
	.byte	-66
	.byte	-118
	.byte	9
	.byte	-114
	.byte	33
	.byte	8
	.byte	19
	.byte	0
	.byte	3
	.byte	115
	.byte	0
	.byte	7
	.byte	125
	.byte	51
	.byte	1
	.byte	127
	.byte	52
	.byte	15
	.byte	6
	.byte	47
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	0
	.byte	23
	.byte	-5
	.byte	-65
	.byte	14
	.byte	-17
	.byte	55
	.byte	94
	.byte	-13
	.byte	86
	.byte	11
	.byte	85
	.byte	-1
	.byte	-112
	.byte	-9
	.byte	9
	.byte	22
	.byte	43
	.byte	6
	.byte	-33
	.byte	29
	.byte	-3
	.byte	-9
	.byte	-1
	.byte	103
	.byte	11
	.byte	-5
	.byte	68
	.byte	-5
	.byte	10
	.byte	-125
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-13
	.byte	-1
	.byte	-1
	.byte	87
	.byte	115
	.byte	4
	.byte	3
	.byte	24
	.byte	3
	.byte	41
	.byte	-113
	.byte	59
	.byte	-1
	.byte	61
	.byte	-5
	.byte	39
	.byte	-1
	.byte	46
	.byte	-5
	.byte	107
	.byte	51
	.byte	10
	.byte	15
	.byte	40
	.byte	2
	.byte	99
	.byte	61
	.byte	-1
	.byte	38
	.byte	23
	.byte	7
	.byte	31
	.byte	111
	.byte	-33
	.byte	39
	.byte	-125
	.byte	24
	.byte	7
	.byte	54
	.byte	24
	.byte	7
	.byte	15
	.byte	19
	.byte	-16
	.byte	114
	.byte	-13
	.byte	-1
	.byte	23
	.byte	-13
	.byte	-9
	.byte	7
	.byte	-9
	.byte	9
	.byte	-13
	.byte	73
	.byte	-9
	.byte	55
	.byte	-113
	.byte	119
	.byte	10
	.byte	118
	.byte	89
	.byte	-25
	.byte	-32
	.byte	1
	.byte	-2
	.byte	5
	.byte	-122
	.byte	44
	.byte	24
	.byte	-33
	.byte	119
	.byte	-128
	.byte	7
	.byte	16
	.byte	-113
	.byte	-15
	.byte	-1
	.byte	-25
	.byte	-1
	.byte	54
	.byte	-17
	.byte	40
	.byte	-21
	.byte	-108
	.byte	115
	.byte	-101
	.byte	-1
	.byte	99
	.byte	14
	.byte	0
	.byte	4
	.byte	115
	.byte	66
	.byte	-1
	.byte	30
	.byte	9
	.byte	-40
	.byte	43
	.byte	7
	.byte	-105
	.byte	-1
	.byte	2
	.byte	15
	.byte	13
	.byte	2
	.byte	107
	.byte	102
	.byte	38
	.byte	99
	.byte	-61
	.byte	7
	.byte	-5
	.byte	88
	.byte	-9
	.byte	34
	.byte	18
	.byte	102
	.byte	34
	.byte	7
	.byte	-1
	.byte	-16
	.byte	112
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	-117
	.byte	19
	.byte	-1
	.byte	54
	.byte	103
	.byte	38
	.byte	51
	.byte	119
	.byte	55
	.byte	3
	.byte	127
	.byte	14
	.byte	-1
	.byte	-41
	.byte	64
	.byte	3
	.byte	4
	.byte	-4
	.byte	119
	.byte	43
	.byte	-1
	.byte	18
	.byte	11
	.byte	-1
	.byte	15
	.byte	88
	.byte	0
	.byte	3
	.byte	-113
	.byte	12
	.byte	-3
	.byte	54
	.byte	102
	.byte	115
	.byte	1
	.byte	-36
	.byte	30
	.byte	14
	.byte	25
	.byte	-117
	.byte	93
	.byte	-1
	.byte	-84
	.byte	7
	.byte	18
	.byte	34
	.byte	12
	.byte	14
	.byte	39
	.byte	19
	.byte	-113
	.byte	19
	.byte	-109
	.byte	51
	.byte	51
	.byte	58
	.byte	23
	.byte	33
	.byte	9
	.byte	48
	.byte	-13
	.byte	-1
	.byte	-29
	.byte	-1
	.byte	115
	.byte	13
	.byte	-9
	.byte	115
	.byte	-50
	.byte	-9
	.byte	-1
	.byte	39
	.byte	-1
	.byte	102
	.byte	118
	.byte	-76
	.byte	117
	.byte	-16
	.byte	1
	.byte	6
	.byte	103
	.byte	33
	.byte	38
	.byte	115
	.byte	22
	.byte	0
	.byte	3
	.byte	102
	.byte	22
	.byte	0
	.byte	3
	.byte	4
	.byte	119
	.byte	17
	.byte	127
	.byte	17
	.byte	101
	.byte	-1
	.byte	22
	.byte	3
	.byte	-16
	.byte	113
	.byte	-3
	.byte	-1
	.byte	-16
	.byte	3
	.byte	14
	.byte	-117
	.byte	14
	.byte	-128
	.byte	-98
	.byte	75
	.byte	-1
	.byte	51
	.byte	102
	.byte	15
	.byte	11
	.byte	2
	.byte	2
	.byte	34
	.byte	3
	.byte	116
	.byte	-128
	.byte	38
	.byte	-37
	.byte	13
	.byte	25
	.byte	18
	.byte	-5
	.byte	119
	.byte	19
	.byte	-5
	.byte	18
	.byte	3
	.byte	38
	.byte	16
	.byte	20
	.byte	80
	.byte	3
	.byte	-65
	.byte	4
	.byte	56
	.byte	2
	.byte	13
	.byte	59
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-8
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	87
	.byte	-1
	.byte	55
	.byte	119
	.byte	102
	.byte	15
	.byte	114
	.byte	53
	.byte	51
	.byte	103
	.byte	-112
	.byte	3
	.byte	6
	.byte	-4
	.byte	69
	.byte	-1
	.byte	76
	.byte	-1
	.byte	-1
	.byte	15
	.byte	12
	.byte	7
	.byte	-127
	.byte	3
	.byte	-38
	.byte	117
	.byte	-111
	.byte	35
	.byte	-1
	.byte	13
	.byte	-1
	.byte	50
	.byte	46
	.byte	127
	.byte	-117
	.byte	-1
	.byte	9
	.byte	34
	.byte	7
	.byte	-117
	.byte	-7
	.byte	-1
	.byte	-32
	.byte	127
	.byte	31
	.byte	107
	.byte	-64
	.byte	3
	.byte	37
	.byte	-121
	.byte	5
	.byte	107
	.byte	-33
	.byte	17
	.byte	-1
	.byte	8
	.byte	116
	.byte	102
	.byte	11
	.byte	120
	.byte	9
	.byte	-107
	.byte	27
	.byte	125
	.byte	-16
	.byte	1
	.byte	45
	.byte	-17
	.byte	-1
	.byte	77
	.byte	-5
	.byte	-112
	.byte	127
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	86
	.byte	-126
	.byte	-1
	.byte	73
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	34
	.byte	7
	.byte	0
	.byte	71
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	87
	.byte	-1
	.byte	62
	.byte	-81
	.byte	76
	.byte	-1
	.byte	-1
	.byte	37
	.byte	-5
	.byte	41
	.byte	-125
	.byte	24
	.byte	-4
	.byte	93
	.byte	-1
	.byte	37
	.byte	115
	.byte	22
	.byte	3
	.byte	-127
	.byte	11
	.byte	29
	.byte	-116
	.byte	-17
	.byte	53
	.byte	-1
	.byte	71
	.byte	-1
	.byte	43
	.byte	-13
	.byte	119
	.byte	103
	.byte	7
	.byte	13
	.byte	-73
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-127
	.byte	-1
	.byte	63
	.byte	112
	.byte	-16
	.byte	1
	.byte	97
	.byte	-1
	.byte	59
	.byte	119
	.byte	-16
	.byte	3
	.byte	-15
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-103
	.byte	-1
	.byte	-97
	.byte	9
	.byte	-64
	.byte	114
	.byte	117
	.byte	14
	.byte	-5
	.byte	11
	.byte	92
	.byte	39
	.byte	-5
	.byte	11
	.byte	105
	.byte	26
	.byte	-8
	.byte	-1
	.byte	17
	.byte	-101
	.byte	-15
	.byte	-1
	.byte	27
	.byte	-109
	.byte	42
	.byte	15
	.byte	15
	.byte	-116
	.byte	7
	.byte	-12
	.byte	71
	.byte	3
	.byte	-105
	.byte	127
	.byte	-1
	.byte	33
	.byte	11
	.byte	55
	.byte	-1
	.byte	-15
	.byte	0
	.byte	-15
	.byte	-1
	.byte	-31
	.byte	-5
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	115
	.byte	-1
	.byte	-1
	.byte	32
	.byte	123
	.byte	-16
	.byte	3
	.byte	64
	.byte	-109
	.byte	-16
	.byte	113
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	3
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-24
	.byte	83
	.byte	-1
	.byte	-128
	.byte	-13
	.byte	-77
	.byte	-1
	.byte	34
	.byte	27
	.byte	91
	.byte	0
	.global	tileset02_data
	.type	tileset02_data, %object
	.size	tileset02_data, 2148
tileset02_data:
	.byte	16
	.byte	96
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	34
	.byte	34
	.byte	0
	.byte	98
	.byte	102
	.byte	102
	.byte	13
	.byte	32
	.byte	102
	.byte	102
	.byte	102
	.byte	0
	.byte	6
	.byte	-112
	.byte	3
	.byte	51
	.byte	16
	.byte	3
	.byte	3
	.byte	0
	.byte	0
	.byte	34
	.byte	34
	.byte	34
	.byte	34
	.byte	16
	.byte	25
	.byte	64
	.byte	2
	.byte	16
	.byte	51
	.byte	51
	.byte	51
	.byte	16
	.byte	3
	.byte	51
	.byte	99
	.byte	51
	.byte	51
	.byte	0
	.byte	119
	.byte	103
	.byte	54
	.byte	51
	.byte	34
	.byte	34
	.byte	2
	.byte	0
	.byte	18
	.byte	102
	.byte	102
	.byte	38
	.byte	64
	.byte	3
	.byte	102
	.byte	2
	.byte	0
	.byte	70
	.byte	38
	.byte	-45
	.byte	16
	.byte	3
	.byte	0
	.byte	38
	.byte	35
	.byte	16
	.byte	3
	.byte	0
	.byte	0
	.byte	-16
	.byte	1
	.byte	-112
	.byte	5
	.byte	-88
	.byte	0
	.byte	122
	.byte	115
	.byte	-80
	.byte	3
	.byte	51
	.byte	16
	.byte	3
	.byte	103
	.byte	98
	.byte	102
	.byte	70
	.byte	115
	.byte	0
	.byte	-113
	.byte	115
	.byte	102
	.byte	54
	.byte	0
	.byte	-121
	.byte	16
	.byte	124
	.byte	54
	.byte	59
	.byte	51
	.byte	99
	.byte	64
	.byte	3
	.byte	16
	.byte	11
	.byte	0
	.byte	-84
	.byte	99
	.byte	32
	.byte	-110
	.byte	0
	.byte	-123
	.byte	-74
	.byte	48
	.byte	103
	.byte	54
	.byte	0
	.byte	111
	.byte	0
	.byte	36
	.byte	35
	.byte	0
	.byte	-74
	.byte	0
	.byte	3
	.byte	54
	.byte	-65
	.byte	0
	.byte	7
	.byte	102
	.byte	32
	.byte	3
	.byte	-16
	.byte	113
	.byte	-48
	.byte	127
	.byte	48
	.byte	103
	.byte	48
	.byte	115
	.byte	16
	.byte	123
	.byte	-34
	.byte	48
	.byte	-9
	.byte	1
	.byte	15
	.byte	51
	.byte	16
	.byte	-6
	.byte	48
	.byte	-13
	.byte	80
	.byte	123
	.byte	32
	.byte	-6
	.byte	103
	.byte	-119
	.byte	1
	.byte	2
	.byte	115
	.byte	51
	.byte	35
	.byte	1
	.byte	23
	.byte	2
	.byte	0
	.byte	16
	.byte	-13
	.byte	-25
	.byte	0
	.byte	119
	.byte	48
	.byte	107
	.byte	16
	.byte	115
	.byte	54
	.byte	99
	.byte	48
	.byte	3
	.byte	16
	.byte	-1
	.byte	48
	.byte	33
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-47
	.byte	-80
	.byte	3
	.byte	1
	.byte	-2
	.byte	34
	.byte	-15
	.byte	-5
	.byte	102
	.byte	102
	.byte	50
	.byte	1
	.byte	-25
	.byte	-3
	.byte	16
	.byte	3
	.byte	17
	.byte	-3
	.byte	113
	.byte	-4
	.byte	-94
	.byte	6
	.byte	32
	.byte	2
	.byte	113
	.byte	-1
	.byte	102
	.byte	17
	.byte	43
	.byte	-57
	.byte	65
	.byte	127
	.byte	49
	.byte	-5
	.byte	119
	.byte	119
	.byte	55
	.byte	-15
	.byte	127
	.byte	-64
	.byte	2
	.byte	48
	.byte	103
	.byte	0
	.byte	115
	.byte	119
	.byte	34
	.byte	99
	.byte	103
	.byte	102
	.byte	32
	.byte	115
	.byte	-47
	.byte	2
	.byte	-121
	.byte	16
	.byte	3
	.byte	103
	.byte	18
	.byte	-113
	.byte	54
	.byte	54
	.byte	114
	.byte	48
	.byte	102
	.byte	15
	.byte	115
	.byte	119
	.byte	119
	.byte	119
	.byte	0
	.byte	17
	.byte	18
	.byte	4
	.byte	-94
	.byte	-122
	.byte	17
	.byte	-121
	.byte	-33
	.byte	0
	.byte	41
	.byte	17
	.byte	-21
	.byte	54
	.byte	1
	.byte	119
	.byte	48
	.byte	7
	.byte	33
	.byte	-1
	.byte	18
	.byte	7
	.byte	18
	.byte	15
	.byte	55
	.byte	51
	.byte	51
	.byte	-15
	.byte	127
	.byte	-64
	.byte	2
	.byte	114
	.byte	2
	.byte	56
	.byte	-96
	.byte	3
	.byte	2
	.byte	-32
	.byte	6
	.byte	114
	.byte	102
	.byte	118
	.byte	119
	.byte	32
	.byte	1
	.byte	0
	.byte	19
	.byte	27
	.byte	115
	.byte	5
	.byte	55
	.byte	115
	.byte	102
	.byte	115
	.byte	54
	.byte	0
	.byte	3
	.byte	51
	.byte	48
	.byte	3
	.byte	-65
	.byte	1
	.byte	-6
	.byte	102
	.byte	16
	.byte	-114
	.byte	48
	.byte	-5
	.byte	2
	.byte	31
	.byte	0
	.byte	99
	.byte	64
	.byte	3
	.byte	80
	.byte	115
	.byte	-33
	.byte	32
	.byte	123
	.byte	3
	.byte	38
	.byte	2
	.byte	3
	.byte	57
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-32
	.byte	1
	.byte	16
	.byte	-93
	.byte	3
	.byte	-2
	.byte	35
	.byte	-31
	.byte	-41
	.byte	49
	.byte	-9
	.byte	48
	.byte	3
	.byte	34
	.byte	3
	.byte	-25
	.byte	32
	.byte	16
	.byte	3
	.byte	-14
	.byte	0
	.byte	-15
	.byte	-1
	.byte	-17
	.byte	113
	.byte	-1
	.byte	35
	.byte	-5
	.byte	99
	.byte	-1
	.byte	115
	.byte	-15
	.byte	-1
	.byte	-30
	.byte	127
	.byte	1
	.byte	82
	.byte	1
	.byte	-9
	.byte	11
	.byte	54
	.byte	32
	.byte	115
	.byte	54
	.byte	33
	.byte	-1
	.byte	50
	.byte	1
	.byte	-46
	.byte	2
	.byte	15
	.byte	-123
	.byte	34
	.byte	123
	.byte	50
	.byte	51
	.byte	119
	.byte	55
	.byte	64
	.byte	103
	.byte	119
	.byte	17
	.byte	119
	.byte	-21
	.byte	17
	.byte	-18
	.byte	1
	.byte	-122
	.byte	16
	.byte	3
	.byte	54
	.byte	48
	.byte	14
	.byte	54
	.byte	20
	.byte	-125
	.byte	67
	.byte	-17
	.byte	-60
	.byte	2
	.byte	3
	.byte	68
	.byte	115
	.byte	51
	.byte	51
	.byte	55
	.byte	0
	.byte	123
	.byte	54
	.byte	2
	.byte	-15
	.byte	0
	.byte	31
	.byte	-15
	.byte	-1
	.byte	-46
	.byte	127
	.byte	1
	.byte	-46
	.byte	50
	.byte	115
	.byte	99
	.byte	0
	.byte	3
	.byte	75
	.byte	54
	.byte	0
	.byte	7
	.byte	51
	.byte	115
	.byte	2
	.byte	-9
	.byte	103
	.byte	16
	.byte	3
	.byte	97
	.byte	-1
	.byte	-9
	.byte	64
	.byte	117
	.byte	1
	.byte	-15
	.byte	2
	.byte	-107
	.byte	0
	.byte	113
	.byte	54
	.byte	2
	.byte	115
	.byte	0
	.byte	3
	.byte	51
	.byte	25
	.byte	46
	.byte	0
	.byte	0
	.byte	4
	.byte	-95
	.byte	2
	.byte	0
	.byte	16
	.byte	4
	.byte	-9
	.byte	4
	.byte	115
	.byte	54
	.byte	-33
	.byte	112
	.byte	-117
	.byte	3
	.byte	63
	.byte	2
	.byte	21
	.byte	90
	.byte	-16
	.byte	114
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-7
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-14
	.byte	0
	.byte	34
	.byte	0
	.byte	3
	.byte	-1
	.byte	-13
	.byte	-127
	.byte	-1
	.byte	3
	.byte	-9
	.byte	3
	.byte	112
	.byte	3
	.byte	123
	.byte	102
	.byte	32
	.byte	5
	.byte	84
	.byte	37
	.byte	-2
	.byte	-5
	.byte	-63
	.byte	-9
	.byte	3
	.byte	-41
	.byte	5
	.byte	-109
	.byte	81
	.byte	-1
	.byte	21
	.byte	3
	.byte	34
	.byte	21
	.byte	-9
	.byte	80
	.byte	3
	.byte	-7
	.byte	53
	.byte	-1
	.byte	64
	.byte	3
	.byte	-16
	.byte	112
	.byte	-60
	.byte	127
	.byte	50
	.byte	103
	.byte	119
	.byte	32
	.byte	3
	.byte	95
	.byte	119
	.byte	32
	.byte	6
	.byte	80
	.byte	19
	.byte	-13
	.byte	48
	.byte	3
	.byte	54
	.byte	32
	.byte	3
	.byte	33
	.byte	-4
	.byte	2
	.byte	5
	.byte	-6
	.byte	98
	.byte	112
	.byte	66
	.byte	120
	.byte	84
	.byte	20
	.byte	80
	.byte	103
	.byte	96
	.byte	7
	.byte	51
	.byte	48
	.byte	3
	.byte	119
	.byte	88
	.byte	51
	.byte	18
	.byte	-62
	.byte	102
	.byte	-15
	.byte	-128
	.byte	-45
	.byte	-1
	.byte	102
	.byte	54
	.byte	115
	.byte	-109
	.byte	48
	.byte	3
	.byte	51
	.byte	115
	.byte	4
	.byte	11
	.byte	103
	.byte	114
	.byte	3
	.byte	-21
	.byte	16
	.byte	3
	.byte	23
	.byte	32
	.byte	34
	.byte	50
	.byte	6
	.byte	-5
	.byte	32
	.byte	21
	.byte	-1
	.byte	6
	.byte	-126
	.byte	22
	.byte	117
	.byte	31
	.byte	51
	.byte	51
	.byte	54
	.byte	6
	.byte	-4
	.byte	23
	.byte	0
	.byte	50
	.byte	-3
	.byte	49
	.byte	-1
	.byte	7
	.byte	13
	.byte	127
	.byte	2
	.byte	32
	.byte	3
	.byte	-64
	.byte	-121
	.byte	7
	.byte	50
	.byte	1
	.byte	88
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	7
	.byte	-2
	.byte	2
	.byte	-65
	.byte	5
	.byte	-1
	.byte	35
	.byte	87
	.byte	-17
	.byte	-112
	.byte	7
	.byte	6
	.byte	-4
	.byte	49
	.byte	-1
	.byte	22
	.byte	12
	.byte	35
	.byte	-16
	.byte	-9
	.byte	3
	.byte	-114
	.byte	3
	.byte	39
	.byte	48
	.byte	3
	.byte	35
	.byte	20
	.byte	102
	.byte	23
	.byte	-1
	.byte	23
	.byte	-26
	.byte	22
	.byte	42
	.byte	-65
	.byte	23
	.byte	-13
	.byte	115
	.byte	16
	.byte	3
	.byte	7
	.byte	-121
	.byte	7
	.byte	-83
	.byte	39
	.byte	-121
	.byte	-16
	.byte	113
	.byte	-58
	.byte	127
	.byte	-5
	.byte	71
	.byte	107
	.byte	-112
	.byte	7
	.byte	-112
	.byte	-117
	.byte	21
	.byte	-8
	.byte	19
	.byte	120
	.byte	55
	.byte	6
	.byte	-93
	.byte	6
	.byte	30
	.byte	-65
	.byte	67
	.byte	-123
	.byte	99
	.byte	51
	.byte	-115
	.byte	16
	.byte	16
	.byte	103
	.byte	-17
	.byte	-128
	.byte	3
	.byte	8
	.byte	7
	.byte	8
	.byte	15
	.byte	-1
	.byte	1
	.byte	-105
	.byte	-11
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	-9
	.byte	39
	.byte	-1
	.byte	8
	.byte	-120
	.byte	25
	.byte	27
	.byte	50
	.byte	125
	.byte	-1
	.byte	-16
	.byte	1
	.byte	113
	.byte	-1
	.byte	48
	.byte	103
	.byte	88
	.byte	-17
	.byte	88
	.byte	-9
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-127
	.byte	-1
	.byte	115
	.byte	109
	.byte	119
	.byte	16
	.byte	-81
	.byte	39
	.byte	-17
	.byte	114
	.byte	16
	.byte	3
	.byte	71
	.byte	-52
	.byte	32
	.byte	9
	.byte	124
	.byte	-65
	.byte	49
	.byte	-1
	.byte	119
	.byte	5
	.byte	127
	.byte	41
	.byte	6
	.byte	9
	.byte	-116
	.byte	8
	.byte	-31
	.byte	74
	.byte	13
	.byte	19
	.byte	24
	.byte	-123
	.byte	25
	.byte	-1
	.byte	55
	.byte	119
	.byte	39
	.byte	0
	.byte	5
	.byte	-117
	.byte	34
	.byte	5
	.byte	-113
	.byte	121
	.byte	35
	.byte	-48
	.byte	3
	.byte	-16
	.byte	114
	.byte	-15
	.byte	-1
	.byte	7
	.byte	-21
	.byte	51
	.byte	32
	.byte	5
	.byte	-23
	.byte	-1
	.byte	22
	.byte	111
	.byte	88
	.byte	119
	.byte	88
	.byte	127
	.byte	41
	.byte	117
	.byte	67
	.byte	-14
	.byte	57
	.byte	123
	.byte	55
	.byte	-125
	.byte	102
	.byte	15
	.byte	-65
	.byte	5
	.byte	-1
	.byte	119
	.byte	97
	.byte	-9
	.byte	-94
	.byte	7
	.byte	21
	.byte	-109
	.byte	-15
	.byte	-1
	.byte	-8
	.byte	127
	.byte	-32
	.byte	115
	.byte	-1
	.byte	24
	.byte	-5
	.byte	87
	.byte	-1
	.byte	38
	.byte	111
	.byte	54
	.byte	118
	.byte	18
	.byte	-121
	.byte	96
	.byte	3
	.byte	85
	.byte	-1
	.byte	80
	.byte	103
	.byte	-1
	.byte	104
	.byte	-121
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-29
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-1
	.byte	51
	.byte	51
	.byte	39
	.byte	86
	.byte	-9
	.byte	-48
	.byte	3
	.byte	-101
	.byte	43
	.byte	-2
	.byte	114
	.byte	115
	.byte	1
	.byte	98
	.byte	9
	.byte	-100
	.byte	54
	.byte	7
	.byte	-92
	.byte	48
	.byte	7
	.byte	55
	.byte	102
	.byte	99
	.byte	64
	.byte	7
	.byte	27
	.byte	-1
	.byte	119
	.byte	1
	.byte	-1
	.byte	18
	.byte	10
	.byte	83
	.byte	-13
	.byte	-21
	.byte	-111
	.byte	7
	.byte	-16
	.byte	114
	.byte	-31
	.byte	127
	.byte	103
	.byte	8
	.byte	107
	.byte	103
	.byte	8
	.byte	107
	.byte	64
	.byte	3
	.byte	-17
	.byte	6
	.byte	7
	.byte	9
	.byte	-42
	.byte	24
	.byte	19
	.byte	50
	.byte	9
	.byte	102
	.byte	11
	.byte	-8
	.byte	1
	.byte	-34
	.byte	12
	.byte	115
	.byte	126
	.byte	54
	.byte	0
	.byte	-125
	.byte	119
	.byte	-8
	.byte	56
	.byte	7
	.byte	10
	.byte	39
	.byte	23
	.byte	-1
	.byte	7
	.byte	-21
	.byte	35
	.byte	127
	.byte	55
	.byte	7
	.byte	-13
	.byte	44
	.byte	3
	.byte	28
	.byte	7
	.byte	11
	.byte	-1
	.byte	2
	.byte	-89
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-23
	.byte	9
	.byte	-1
	.byte	22
	.byte	103
	.byte	42
	.byte	3
	.byte	115
	.byte	2
	.byte	-5
	.byte	103
	.byte	114
	.byte	9
	.byte	-25
	.byte	-73
	.byte	24
	.byte	-125
	.byte	32
	.byte	3
	.byte	8
	.byte	55
	.byte	-1
	.byte	54
	.byte	33
	.byte	-9
	.byte	82
	.byte	-17
	.byte	12
	.byte	-112
	.byte	-21
	.byte	28
	.byte	-113
	.byte	101
	.byte	-1
	.byte	13
	.byte	38
	.byte	2
	.byte	12
	.byte	-100
	.byte	2
	.byte	104
	.byte	123
	.byte	8
	.byte	-13
	.byte	127
	.byte	115
	.byte	8
	.byte	-109
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-123
	.byte	-1
	.byte	119
	.byte	115
	.byte	39
	.byte	54
	.byte	-9
	.byte	119
	.byte	99
	.byte	6
	.byte	-1
	.byte	39
	.byte	7
	.byte	39
	.byte	15
	.byte	34
	.byte	7
	.byte	27
	.byte	85
	.byte	-1
	.byte	93
	.byte	-9
	.byte	-2
	.byte	-48
	.byte	3
	.byte	26
	.byte	-29
	.byte	13
	.byte	-96
	.byte	-26
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	53
	.byte	-1
	.byte	54
	.byte	87
	.byte	115
	.byte	32
	.byte	3
	.byte	51
	.byte	16
	.byte	3
	.byte	51
	.byte	32
	.byte	3
	.byte	12
	.byte	123
	.byte	9
	.byte	-121
	.byte	63
	.byte	119
	.byte	103
	.byte	9
	.byte	-101
	.byte	110
	.byte	111
	.byte	-48
	.byte	3
	.byte	24
	.byte	25
	.byte	40
	.byte	29
	.byte	-16
	.byte	115
	.byte	-1
	.byte	-16
	.byte	127
	.byte	-16
	.byte	1
	.byte	123
	.byte	-1
	.byte	12
	.byte	107
	.byte	24
	.byte	-21
	.byte	0
	.byte	-5
	.byte	16
	.byte	7
	.byte	56
	.byte	119
	.byte	-3
	.byte	-125
	.byte	-1
	.byte	80
	.byte	103
	.byte	100
	.byte	-123
	.byte	-58
	.byte	0
	.byte	-16
	.byte	115
	.byte	103
	.byte	-1
	.byte	38
	.byte	-9
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	109
	.byte	-1
	.byte	-9
	.byte	3
	.byte	87
	.byte	-1
	.byte	44
	.byte	0
	.byte	-48
	.byte	-4
	.byte	72
	.byte	7
	.byte	11
	.byte	127
	.byte	-41
	.byte	-1
	.byte	-2
	.byte	-41
	.byte	7
	.byte	-16
	.byte	113
	.byte	-11
	.byte	-1
	.byte	-64
	.byte	3
	.byte	31
	.byte	-125
	.byte	15
	.byte	-121
	.byte	31
	.byte	-117
	.byte	51
	.byte	127
	.byte	103
	.byte	59
	.byte	-18
	.byte	99
	.byte	-18
	.byte	19
	.byte	127
	.byte	-36
	.byte	-121
	.byte	-32
	.byte	115
	.byte	64
	.byte	11
	.byte	19
	.byte	-109
	.byte	-49
	.byte	-15
	.byte	127
	.byte	-25
	.byte	-1
	.byte	115
	.byte	54
	.byte	0
	.byte	3
	.byte	14
	.byte	-5
	.byte	32
	.byte	3
	.byte	8
	.byte	115
	.byte	127
	.byte	51
	.byte	32
	.byte	3
	.byte	87
	.byte	-1
	.byte	58
	.byte	-12
	.byte	54
	.byte	-14
	.byte	22
	.byte	-117
	.byte	52
	.byte	-127
	.byte	18
	.byte	21
	.byte	-1
	.byte	69
	.byte	-1
	.byte	-115
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-3
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-11
	.byte	-1
	.byte	102
	.byte	3
	.byte	115
	.byte	30
	.byte	3
	.byte	-97
	.byte	53
	.byte	-1
	.byte	119
	.byte	119
	.byte	-121
	.byte	-13
	.byte	44
	.byte	6
	.byte	27
	.byte	19
	.byte	31
	.byte	5
	.byte	-107
	.byte	-1
	.byte	-65
	.byte	95
	.byte	-121
	.byte	51
	.byte	64
	.byte	3
	.byte	29
	.byte	-101
	.byte	-16
	.byte	114
	.byte	-5
	.byte	-1
	.byte	-48
	.byte	3
	.byte	-104
	.byte	3
	.byte	-89
	.byte	13
	.byte	-106
	.byte	115
	.byte	13
	.byte	-102
	.byte	103
	.byte	51
	.byte	15
	.byte	-121
	.byte	-115
	.byte	-1
	.byte	98
	.byte	20
	.byte	-1
	.byte	-23
	.byte	-5
	.byte	21
	.byte	-5
	.byte	0
	.byte	127
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-9
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	14
	.byte	71
	.byte	-33
	.byte	62
	.byte	115
	.byte	32
	.byte	-19
	.byte	115
	.byte	14
	.byte	-121
	.byte	-71
	.byte	-1
	.byte	103
	.byte	-1
	.byte	13
	.byte	-5
	.byte	14
	.byte	24
	.byte	127
	.byte	35
	.byte	6
	.byte	47
	.byte	32
	.byte	3
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-8
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-117
	.byte	-1
	.byte	55
	.byte	115
	.byte	39
	.byte	125
	.byte	98
	.byte	11
	.byte	-46
	.byte	34
	.byte	-5
	.byte	11
	.byte	90
	.byte	14
	.byte	11
	.byte	17
	.byte	-52
	.byte	102
	.byte	11
	.byte	-117
	.byte	-97
	.byte	57
	.byte	-1
	.byte	114
	.byte	55
	.byte	1
	.byte	-46
	.byte	9
	.byte	-117
	.byte	105
	.byte	-118
	.byte	106
	.byte	2
	.byte	39
	.byte	-1
	.byte	127
	.byte	115
	.byte	25
	.byte	-1
	.byte	-125
	.byte	-1
	.byte	27
	.byte	127
	.byte	14
	.byte	78
	.byte	32
	.byte	3
	.byte	-16
	.byte	114
	.byte	-29
	.byte	-1
	.byte	-65
	.byte	0
	.byte	103
	.byte	99
	.byte	32
	.byte	107
	.byte	16
	.byte	111
	.byte	0
	.byte	127
	.byte	3
	.byte	-113
	.byte	32
	.byte	3
	.byte	43
	.byte	-1
	.byte	-3
	.byte	62
	.byte	121
	.byte	10
	.byte	5
	.byte	35
	.byte	127
	.byte	112
	.byte	3
	.byte	60
	.byte	23
	.byte	10
	.byte	-112
	.byte	99
	.byte	0
	.byte	103
	.byte	-1
	.byte	16
	.byte	3
	.byte	64
	.byte	111
	.byte	-128
	.byte	7
	.byte	46
	.byte	-113
	.byte	-16
	.byte	113
	.byte	-15
	.byte	-1
	.byte	65
	.byte	-13
	.byte	70
	.byte	119
	.byte	-1
	.byte	-71
	.byte	-1
	.byte	89
	.byte	-13
	.byte	95
	.byte	1
	.byte	14
	.byte	118
	.byte	66
	.byte	3
	.byte	57
	.byte	-1
	.byte	11
	.byte	34
	.byte	94
	.byte	-9
	.byte	-17
	.byte	32
	.byte	-13
	.byte	14
	.byte	-108
	.byte	8
	.byte	-113
	.byte	102
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-77
	.byte	-1
	.byte	107
	.byte	-1
	.byte	-100
	.byte	7
	.byte	-3
	.byte	31
	.byte	-101
	.byte	-67
	.byte	-1
	.byte	-16
	.byte	1
	.byte	45
	.byte	-1
	.byte	6
	.byte	-22
	.byte	9
	.byte	20
	.byte	34
	.byte	-9
	.byte	7
	.byte	-1
	.byte	-9
	.byte	127
	.byte	-15
	.byte	-1
	.byte	37
	.byte	-13
	.byte	97
	.byte	-1
	.byte	18
	.byte	115
	.byte	15
	.byte	-109
	.byte	55
	.byte	-109
	.byte	53
	.byte	-33
	.byte	-1
	.byte	39
	.byte	110
	.byte	23
	.byte	-121
	.byte	40
	.byte	115
	.byte	26
	.byte	11
	.byte	47
	.byte	-121
	.byte	31
	.byte	-109
	.byte	47
	.byte	-112
	.byte	-9
	.byte	127
	.byte	-1
	.byte	48
	.byte	11
	.byte	16
	.byte	-113
	.byte	-15
	.byte	-1
	.byte	-39
	.byte	-1
	.byte	64
	.byte	103
	.byte	-48
	.byte	3
	.byte	87
	.byte	-1
	.byte	52
	.byte	-21
	.byte	-2
	.byte	48
	.byte	112
	.byte	68
	.byte	-2
	.byte	32
	.byte	7
	.byte	-121
	.byte	-1
	.byte	24
	.byte	-5
	.byte	-24
	.byte	-1
	.byte	7
	.byte	-1
	.byte	34
	.byte	-1
	.byte	7
	.byte	-1
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	19
	.byte	-1
	.byte	3
	.byte	-89
	.byte	-9
	.byte	-1
	.byte	71
	.byte	-1
	.byte	53
	.byte	-1
	.byte	5
	.byte	125
	.byte	-1
	.byte	43
	.byte	114
	.byte	21
	.byte	-12
	.byte	-91
	.byte	-125
	.byte	-9
	.byte	-1
	.byte	47
	.byte	123
	.byte	59
	.byte	-121
	.byte	15
	.byte	-121
	.byte	-16
	.byte	114
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-48
	.byte	3
	.byte	-112
	.byte	-117
	.byte	69
	.byte	119
	.byte	32
	.byte	8
	.byte	78
	.byte	3
	.byte	-88
	.byte	-117
	.byte	37
	.byte	-5
	.byte	-9
	.byte	53
	.byte	-17
	.byte	38
	.byte	7
	.byte	37
	.byte	-125
	.byte	44
	.byte	19
	.byte	55
	.byte	47
	.byte	-105
	.byte	-16
	.byte	113
	.byte	-41
	.byte	-1
	.byte	-9
	.byte	96
	.byte	-9
	.byte	8
	.byte	3
	.byte	112
	.byte	3
	.byte	7
	.byte	-1
	.byte	102
	.byte	45
	.byte	-1
	.byte	96
	.byte	103
	.byte	-48
	.byte	1
	.byte	111
	.byte	38
	.byte	15
	.byte	25
	.byte	16
	.byte	-5
	.byte	51
	.byte	32
	.byte	103
	.byte	16
	.byte	16
	.byte	-112
	.byte	3
	.byte	5
	.byte	63
	.byte	127
	.byte	2
	.byte	15
	.byte	59
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	-13
	.byte	-1
	.byte	27
	.byte	127
	.byte	45
	.byte	-5
	.byte	29
	.byte	-105
	.byte	87
	.byte	-1
	.byte	-1
	.byte	94
	.byte	-1
	.byte	37
	.byte	-124
	.byte	19
	.byte	118
	.byte	45
	.byte	-109
	.byte	-9
	.byte	-1
	.byte	109
	.byte	7
	.byte	-7
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-105
	.byte	-1
	.byte	-124
	.byte	7
	.byte	-13
	.byte	-1
	.byte	-124
	.byte	3
	.byte	105
	.byte	-6
	.byte	56
	.byte	-119
	.byte	-39
	.byte	-9
	.byte	40
	.byte	11
	.byte	-16
	.byte	38
	.byte	127
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	59
	.byte	-1
	.byte	50
	.byte	115
	.byte	103
	.byte	102
	.byte	93
	.byte	98
	.byte	7
	.byte	-37
	.byte	98
	.byte	12
	.byte	-45
	.byte	-47
	.byte	-1
	.byte	80
	.byte	-14
	.byte	119
	.byte	5
	.byte	-40
	.byte	-1
	.byte	23
	.byte	-1
	.byte	52
	.byte	114
	.byte	20
	.byte	118
	.byte	-105
	.byte	-1
	.byte	17
	.byte	-1
	.byte	8
	.byte	-17
	.byte	15
	.byte	8
	.byte	90
	.byte	-121
	.byte	-1
	.byte	6
	.byte	-61
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-28
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	109
	.byte	-1
	.byte	119
	.byte	39
	.byte	71
	.byte	115
	.byte	54
	.byte	50
	.byte	-17
	.byte	15
	.byte	-60
	.byte	13
	.byte	119
	.byte	9
	.byte	3
	.byte	119
	.byte	43
	.byte	-48
	.byte	-11
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-5
	.byte	-1
	.byte	-114
	.byte	63
	.byte	11
	.byte	115
	.byte	119
	.byte	119
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	25
	.byte	-13
	.byte	115
	.byte	-89
	.byte	0
	.byte	-125
	.byte	103
	.byte	113
	.byte	-1
	.byte	102
	.byte	99
	.byte	-123
	.byte	-1
	.byte	0
	.byte	70
	.byte	7
	.byte	85
	.byte	-1
	.byte	-101
	.byte	-10
	.byte	-116
	.byte	3
	.byte	12
	.byte	19
	.byte	-25
	.byte	-5
	.byte	11
	.byte	-83
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-59
	.byte	-1
	.byte	-65
	.byte	45
	.byte	-1
	.byte	102
	.byte	22
	.byte	-9
	.byte	41
	.byte	-1
	.byte	67
	.byte	-1
	.byte	112
	.byte	106
	.byte	44
	.byte	3
	.byte	105
	.byte	1
	.byte	-1
	.byte	83
	.byte	-1
	.byte	80
	.byte	103
	.byte	10
	.byte	33
	.byte	48
	.byte	-9
	.byte	93
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-95
	.byte	-1
	.byte	63
	.byte	3
	.byte	-33
	.byte	119
	.byte	7
	.byte	57
	.byte	-1
	.byte	54
	.byte	73
	.byte	-1
	.byte	75
	.byte	-1
	.byte	61
	.byte	6
	.byte	-121
	.byte	7
	.byte	29
	.byte	-1
	.byte	31
	.byte	34
	.byte	0
	.byte	55
	.byte	-10
	.byte	-1
	.byte	103
	.byte	-125
	.byte	-16
	.byte	114
	.byte	-7
	.byte	-1
	.byte	-73
	.byte	-5
	.byte	-1
	.byte	-127
	.byte	-117
	.byte	119
	.byte	115
	.byte	7
	.byte	-9
	.byte	55
	.byte	-121
	.byte	39
	.byte	-9
	.byte	-97
	.byte	-116
	.byte	119
	.byte	127
	.byte	-16
	.byte	3
	.byte	-1
	.byte	-8
	.byte	127
	.byte	-7
	.byte	-1
	.byte	107
	.byte	-5
	.byte	4
	.byte	7
	.byte	7
	.byte	-28
	.byte	-11
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	90
	.byte	-7
	.byte	-12
	.byte	17
	.byte	-34
	.byte	80
	.byte	-13
	.byte	-43
	.byte	-1
	.byte	10
	.byte	-61
	.byte	34
	.byte	27
	.byte	91
	.byte	0
	.global	tileset03_data
	.type	tileset03_data, %object
	.size	tileset03_data, 2068
tileset03_data:
	.byte	16
	.byte	96
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	34
	.byte	34
	.byte	0
	.byte	98
	.byte	102
	.byte	102
	.byte	13
	.byte	32
	.byte	102
	.byte	102
	.byte	102
	.byte	0
	.byte	6
	.byte	-112
	.byte	3
	.byte	54
	.byte	16
	.byte	3
	.byte	3
	.byte	0
	.byte	0
	.byte	34
	.byte	34
	.byte	34
	.byte	34
	.byte	16
	.byte	25
	.byte	-80
	.byte	2
	.byte	32
	.byte	51
	.byte	51
	.byte	48
	.byte	1
	.byte	34
	.byte	34
	.byte	2
	.byte	0
	.byte	102
	.byte	37
	.byte	102
	.byte	38
	.byte	64
	.byte	3
	.byte	102
	.byte	2
	.byte	0
	.byte	70
	.byte	38
	.byte	16
	.byte	3
	.byte	-89
	.byte	0
	.byte	31
	.byte	35
	.byte	16
	.byte	3
	.byte	0
	.byte	0
	.byte	-16
	.byte	1
	.byte	-112
	.byte	5
	.byte	80
	.byte	103
	.byte	-2
	.byte	-16
	.byte	3
	.byte	48
	.byte	127
	.byte	80
	.byte	103
	.byte	-16
	.byte	1
	.byte	96
	.byte	9
	.byte	32
	.byte	103
	.byte	0
	.byte	-113
	.byte	39
	.byte	2
	.byte	51
	.byte	51
	.byte	119
	.byte	38
	.byte	51
	.byte	115
	.byte	0
	.byte	123
	.byte	103
	.byte	31
	.byte	54
	.byte	35
	.byte	115
	.byte	0
	.byte	-108
	.byte	16
	.byte	3
	.byte	-16
	.byte	113
	.byte	-16
	.byte	127
	.byte	-16
	.byte	3
	.byte	45
	.byte	102
	.byte	54
	.byte	1
	.byte	15
	.byte	54
	.byte	16
	.byte	-6
	.byte	64
	.byte	-25
	.byte	115
	.byte	0
	.byte	-17
	.byte	90
	.byte	103
	.byte	48
	.byte	3
	.byte	115
	.byte	0
	.byte	-5
	.byte	0
	.byte	14
	.byte	35
	.byte	1
	.byte	23
	.byte	2
	.byte	19
	.byte	0
	.byte	0
	.byte	103
	.byte	64
	.byte	-17
	.byte	102
	.byte	54
	.byte	64
	.byte	7
	.byte	16
	.byte	-5
	.byte	39
	.byte	99
	.byte	54
	.byte	0
	.byte	-5
	.byte	19
	.byte	33
	.byte	48
	.byte	33
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-80
	.byte	3
	.byte	1
	.byte	-2
	.byte	70
	.byte	34
	.byte	-15
	.byte	-5
	.byte	102
	.byte	102
	.byte	50
	.byte	1
	.byte	-32
	.byte	0
	.byte	3
	.byte	115
	.byte	-31
	.byte	17
	.byte	-3
	.byte	-15
	.byte	-9
	.byte	1
	.byte	-3
	.byte	119
	.byte	119
	.byte	119
	.byte	119
	.byte	0
	.byte	55
	.byte	-69
	.byte	113
	.byte	-1
	.byte	102
	.byte	16
	.byte	39
	.byte	97
	.byte	-9
	.byte	0
	.byte	30
	.byte	35
	.byte	0
	.byte	86
	.byte	-15
	.byte	-1
	.byte	-126
	.byte	-64
	.byte	2
	.byte	50
	.byte	51
	.byte	119
	.byte	103
	.byte	50
	.byte	0
	.byte	72
	.byte	34
	.byte	-70
	.byte	1
	.byte	72
	.byte	32
	.byte	80
	.byte	3
	.byte	0
	.byte	-113
	.byte	16
	.byte	-109
	.byte	114
	.byte	-62
	.byte	117
	.byte	54
	.byte	-4
	.byte	-16
	.byte	14
	.byte	18
	.byte	-105
	.byte	32
	.byte	103
	.byte	1
	.byte	127
	.byte	48
	.byte	7
	.byte	64
	.byte	15
	.byte	99
	.byte	102
	.byte	93
	.byte	54
	.byte	0
	.byte	127
	.byte	54
	.byte	-15
	.byte	127
	.byte	-64
	.byte	2
	.byte	16
	.byte	99
	.byte	114
	.byte	2
	.byte	102
	.byte	91
	.byte	114
	.byte	2
	.byte	-47
	.byte	114
	.byte	48
	.byte	-13
	.byte	32
	.byte	3
	.byte	32
	.byte	1
	.byte	0
	.byte	19
	.byte	27
	.byte	-67
	.byte	50
	.byte	-21
	.byte	99
	.byte	18
	.byte	-17
	.byte	112
	.byte	-5
	.byte	98
	.byte	-5
	.byte	17
	.byte	27
	.byte	54
	.byte	2
	.byte	-13
	.byte	-58
	.byte	16
	.byte	3
	.byte	16
	.byte	115
	.byte	102
	.byte	35
	.byte	51
	.byte	16
	.byte	3
	.byte	50
	.byte	-5
	.byte	2
	.byte	-1
	.byte	3
	.byte	57
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-4
	.byte	-16
	.byte	1
	.byte	-32
	.byte	1
	.byte	16
	.byte	-93
	.byte	3
	.byte	-2
	.byte	35
	.byte	-31
	.byte	-127
	.byte	-9
	.byte	51
	.byte	34
	.byte	-12
	.byte	1
	.byte	-33
	.byte	33
	.byte	-121
	.byte	-62
	.byte	0
	.byte	3
	.byte	-9
	.byte	99
	.byte	16
	.byte	3
	.byte	119
	.byte	119
	.byte	95
	.byte	55
	.byte	0
	.byte	-22
	.byte	118
	.byte	-125
	.byte	-1
	.byte	49
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-94
	.byte	127
	.byte	-33
	.byte	65
	.byte	-21
	.byte	2
	.byte	-125
	.byte	51
	.byte	81
	.byte	-13
	.byte	-108
	.byte	-121
	.byte	20
	.byte	106
	.byte	20
	.byte	124
	.byte	1
	.byte	91
	.byte	-65
	.byte	-108
	.byte	-125
	.byte	99
	.byte	80
	.byte	15
	.byte	16
	.byte	103
	.byte	4
	.byte	37
	.byte	2
	.byte	107
	.byte	16
	.byte	3
	.byte	33
	.byte	-13
	.byte	-98
	.byte	64
	.byte	7
	.byte	51
	.byte	2
	.byte	1
	.byte	-75
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-1
	.byte	-60
	.byte	-9
	.byte	118
	.byte	58
	.byte	119
	.byte	114
	.byte	0
	.byte	-37
	.byte	-111
	.byte	-1
	.byte	20
	.byte	-4
	.byte	118
	.byte	2
	.byte	-17
	.byte	55
	.byte	-88
	.byte	-31
	.byte	-3
	.byte	0
	.byte	4
	.byte	-5
	.byte	51
	.byte	4
	.byte	-13
	.byte	51
	.byte	2
	.byte	119
	.byte	-106
	.byte	4
	.byte	115
	.byte	51
	.byte	115
	.byte	19
	.byte	-9
	.byte	55
	.byte	32
	.byte	-9
	.byte	3
	.byte	63
	.byte	2
	.byte	-1
	.byte	21
	.byte	90
	.byte	-16
	.byte	114
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-35
	.byte	-16
	.byte	1
	.byte	-14
	.byte	0
	.byte	34
	.byte	17
	.byte	-125
	.byte	97
	.byte	-1
	.byte	-109
	.byte	-1
	.byte	32
	.byte	5
	.byte	-28
	.byte	-9
	.byte	37
	.byte	-2
	.byte	-27
	.byte	-3
	.byte	-107
	.byte	-1
	.byte	17
	.byte	3
	.byte	34
	.byte	21
	.byte	-9
	.byte	80
	.byte	3
	.byte	101
	.byte	7
	.byte	-1
	.byte	18
	.byte	11
	.byte	-16
	.byte	112
	.byte	-60
	.byte	127
	.byte	64
	.byte	103
	.byte	80
	.byte	7
	.byte	20
	.byte	119
	.byte	19
	.byte	-121
	.byte	35
	.byte	-113
	.byte	-1
	.byte	-29
	.byte	113
	.byte	-16
	.byte	1
	.byte	-48
	.byte	111
	.byte	-126
	.byte	-125
	.byte	20
	.byte	-73
	.byte	-15
	.byte	-128
	.byte	-45
	.byte	-1
	.byte	6
	.byte	97
	.byte	-40
	.byte	4
	.byte	103
	.byte	16
	.byte	3
	.byte	54
	.byte	52
	.byte	11
	.byte	52
	.byte	119
	.byte	32
	.byte	34
	.byte	50
	.byte	127
	.byte	51
	.byte	21
	.byte	29
	.byte	-48
	.byte	113
	.byte	22
	.byte	-112
	.byte	54
	.byte	-108
	.byte	81
	.byte	-1
	.byte	-16
	.byte	-9
	.byte	19
	.byte	3
	.byte	-1
	.byte	7
	.byte	50
	.byte	1
	.byte	88
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-11
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	7
	.byte	-2
	.byte	2
	.byte	5
	.byte	-1
	.byte	35
	.byte	8
	.byte	2
	.byte	98
	.byte	51
	.byte	-80
	.byte	3
	.byte	7
	.byte	-37
	.byte	102
	.byte	51
	.byte	115
	.byte	39
	.byte	-2
	.byte	114
	.byte	40
	.byte	119
	.byte	119
	.byte	7
	.byte	79
	.byte	54
	.byte	16
	.byte	3
	.byte	103
	.byte	102
	.byte	99
	.byte	-114
	.byte	0
	.byte	3
	.byte	102
	.byte	51
	.byte	103
	.byte	7
	.byte	-102
	.byte	23
	.byte	-98
	.byte	23
	.byte	-1
	.byte	119
	.byte	-4
	.byte	3
	.byte	-26
	.byte	24
	.byte	10
	.byte	-121
	.byte	-117
	.byte	96
	.byte	7
	.byte	-16
	.byte	113
	.byte	-45
	.byte	-1
	.byte	51
	.byte	103
	.byte	-41
	.byte	-96
	.byte	3
	.byte	7
	.byte	103
	.byte	98
	.byte	3
	.byte	72
	.byte	98
	.byte	0
	.byte	97
	.byte	16
	.byte	3
	.byte	24
	.byte	2
	.byte	-1
	.byte	-16
	.byte	3
	.byte	16
	.byte	123
	.byte	5
	.byte	-112
	.byte	56
	.byte	29
	.byte	-32
	.byte	115
	.byte	85
	.byte	127
	.byte	21
	.byte	-125
	.byte	-16
	.byte	113
	.byte	-3
	.byte	-57
	.byte	-1
	.byte	64
	.byte	103
	.byte	-48
	.byte	3
	.byte	101
	.byte	-1
	.byte	8
	.byte	-127
	.byte	-112
	.byte	3
	.byte	99
	.byte	64
	.byte	15
	.byte	-5
	.byte	83
	.byte	-1
	.byte	80
	.byte	103
	.byte	8
	.byte	123
	.byte	3
	.byte	-1
	.byte	5
	.byte	-1
	.byte	103
	.byte	48
	.byte	3
	.byte	-13
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-59
	.byte	-127
	.byte	-1
	.byte	36
	.byte	-81
	.byte	119
	.byte	119
	.byte	50
	.byte	9
	.byte	52
	.byte	50
	.byte	8
	.byte	-48
	.byte	-114
	.byte	16
	.byte	3
	.byte	34
	.byte	103
	.byte	54
	.byte	39
	.byte	-113
	.byte	41
	.byte	-2
	.byte	8
	.byte	12
	.byte	119
	.byte	119
	.byte	119
	.byte	19
	.byte	107
	.byte	19
	.byte	111
	.byte	49
	.byte	-9
	.byte	54
	.byte	-127
	.byte	-1
	.byte	17
	.byte	-26
	.byte	-15
	.byte	-1
	.byte	-13
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	8
	.byte	127
	.byte	119
	.byte	-9
	.byte	54
	.byte	32
	.byte	0
	.byte	115
	.byte	32
	.byte	-125
	.byte	-49
	.byte	-121
	.byte	-121
	.byte	33
	.byte	-9
	.byte	54
	.byte	54
	.byte	7
	.byte	-127
	.byte	-95
	.byte	-13
	.byte	-7
	.byte	-1
	.byte	-16
	.byte	3
	.byte	-3
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	8
	.byte	127
	.byte	68
	.byte	115
	.byte	0
	.byte	-32
	.byte	8
	.byte	111
	.byte	55
	.byte	36
	.byte	7
	.byte	-1
	.byte	16
	.byte	-117
	.byte	71
	.byte	-1
	.byte	-12
	.byte	113
	.byte	-75
	.byte	-1
	.byte	113
	.byte	-1
	.byte	-80
	.byte	-125
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-47
	.byte	-1
	.byte	-2
	.byte	120
	.byte	-5
	.byte	-111
	.byte	127
	.byte	81
	.byte	-1
	.byte	34
	.byte	1
	.byte	11
	.byte	84
	.byte	19
	.byte	-110
	.byte	3
	.byte	-4
	.byte	99
	.byte	-31
	.byte	64
	.byte	7
	.byte	41
	.byte	-1
	.byte	1
	.byte	-22
	.byte	1
	.byte	119
	.byte	119
	.byte	19
	.byte	10
	.byte	39
	.byte	63
	.byte	51
	.byte	33
	.byte	103
	.byte	-125
	.byte	11
	.byte	3
	.byte	23
	.byte	-113
	.byte	-16
	.byte	114
	.byte	-15
	.byte	127
	.byte	27
	.byte	100
	.byte	-1
	.byte	-42
	.byte	7
	.byte	86
	.byte	11
	.byte	11
	.byte	-53
	.byte	96
	.byte	107
	.byte	36
	.byte	116
	.byte	16
	.byte	-125
	.byte	-91
	.byte	-1
	.byte	55
	.byte	-13
	.byte	119
	.byte	54
	.byte	32
	.byte	111
	.byte	56
	.byte	11
	.byte	12
	.byte	-101
	.byte	33
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-111
	.byte	-1
	.byte	-3
	.byte	-48
	.byte	3
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-93
	.byte	-1
	.byte	10
	.byte	-17
	.byte	12
	.byte	115
	.byte	35
	.byte	12
	.byte	15
	.byte	-1
	.byte	42
	.byte	3
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-27
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-109
	.byte	-1
	.byte	115
	.byte	39
	.byte	11
	.byte	-17
	.byte	103
	.byte	27
	.byte	-17
	.byte	-18
	.byte	-128
	.byte	3
	.byte	35
	.byte	-48
	.byte	69
	.byte	-1
	.byte	55
	.byte	73
	.byte	-121
	.byte	25
	.byte	-117
	.byte	43
	.byte	-122
	.byte	103
	.byte	-27
	.byte	10
	.byte	-20
	.byte	13
	.byte	99
	.byte	11
	.byte	-1
	.byte	34
	.byte	0
	.byte	10
	.byte	-13
	.byte	2
	.byte	10
	.byte	-9
	.byte	95
	.byte	38
	.byte	-96
	.byte	3
	.byte	51
	.byte	48
	.byte	3
	.byte	-16
	.byte	114
	.byte	-9
	.byte	-1
	.byte	-15
	.byte	-9
	.byte	113
	.byte	-121
	.byte	-33
	.byte	16
	.byte	99
	.byte	18
	.byte	118
	.byte	115
	.byte	11
	.byte	-4
	.byte	64
	.byte	11
	.byte	32
	.byte	119
	.byte	34
	.byte	-121
	.byte	22
	.byte	-108
	.byte	-25
	.byte	0
	.byte	103
	.byte	10
	.byte	33
	.byte	-128
	.byte	3
	.byte	51
	.byte	38
	.byte	10
	.byte	-96
	.byte	13
	.byte	-113
	.byte	48
	.byte	3
	.byte	-13
	.byte	-16
	.byte	113
	.byte	-15
	.byte	-1
	.byte	-72
	.byte	115
	.byte	12
	.byte	11
	.byte	103
	.byte	54
	.byte	113
	.byte	-1
	.byte	0
	.byte	120
	.byte	-1
	.byte	34
	.byte	-9
	.byte	-96
	.byte	3
	.byte	118
	.byte	0
	.byte	80
	.byte	103
	.byte	16
	.byte	111
	.byte	4
	.byte	-90
	.byte	32
	.byte	119
	.byte	8
	.byte	36
	.byte	95
	.byte	38
	.byte	8
	.byte	62
	.byte	38
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-8
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	77
	.byte	-1
	.byte	54
	.byte	119
	.byte	119
	.byte	-81
	.byte	7
	.byte	111
	.byte	118
	.byte	-41
	.byte	7
	.byte	34
	.byte	15
	.byte	72
	.byte	46
	.byte	32
	.byte	15
	.byte	5
	.byte	26
	.byte	-4
	.byte	-29
	.byte	-9
	.byte	11
	.byte	25
	.byte	-1
	.byte	3
	.byte	-1
	.byte	119
	.byte	39
	.byte	1
	.byte	48
	.byte	46
	.byte	12
	.byte	-1
	.byte	-105
	.byte	23
	.byte	3
	.byte	51
	.byte	103
	.byte	5
	.byte	-5
	.byte	115
	.byte	32
	.byte	3
	.byte	-16
	.byte	113
	.byte	-47
	.byte	-1
	.byte	-33
	.byte	7
	.byte	107
	.byte	-96
	.byte	3
	.byte	115
	.byte	7
	.byte	-9
	.byte	0
	.byte	3
	.byte	8
	.byte	98
	.byte	16
	.byte	3
	.byte	-48
	.byte	115
	.byte	-3
	.byte	21
	.byte	-1
	.byte	6
	.byte	14
	.byte	55
	.byte	-109
	.byte	58
	.byte	-123
	.byte	-11
	.byte	-5
	.byte	32
	.byte	123
	.byte	87
	.byte	3
	.byte	-1
	.byte	122
	.byte	87
	.byte	-15
	.byte	127
	.byte	-21
	.byte	-1
	.byte	48
	.byte	103
	.byte	8
	.byte	-17
	.byte	115
	.byte	48
	.byte	3
	.byte	102
	.byte	-97
	.byte	16
	.byte	3
	.byte	51
	.byte	32
	.byte	9
	.byte	0
	.byte	61
	.byte	-1
	.byte	-120
	.byte	123
	.byte	14
	.byte	6
	.byte	18
	.byte	-1
	.byte	-1
	.byte	32
	.byte	-108
	.byte	103
	.byte	-1
	.byte	48
	.byte	103
	.byte	0
	.byte	111
	.byte	16
	.byte	115
	.byte	96
	.byte	-9
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-119
	.byte	-1
	.byte	27
	.byte	119
	.byte	119
	.byte	39
	.byte	-102
	.byte	-5
	.byte	75
	.byte	7
	.byte	51
	.byte	31
	.byte	-109
	.byte	57
	.byte	-1
	.byte	-5
	.byte	87
	.byte	-5
	.byte	61
	.byte	123
	.byte	-113
	.byte	-126
	.byte	-89
	.byte	-1
	.byte	7
	.byte	-102
	.byte	35
	.byte	80
	.byte	3
	.byte	-9
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	103
	.byte	-1
	.byte	-61
	.byte	-1
	.byte	123
	.byte	-113
	.byte	57
	.byte	-25
	.byte	-16
	.byte	1
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	3
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	11
	.byte	-1
	.byte	91
	.byte	-9
	.byte	15
	.byte	-68
	.byte	107
	.byte	-1
	.byte	24
	.byte	-109
	.byte	-59
	.byte	-1
	.byte	-5
	.byte	82
	.byte	111
	.byte	62
	.byte	-117
	.byte	-111
	.byte	-1
	.byte	-73
	.byte	-1
	.byte	30
	.byte	-121
	.byte	51
	.byte	14
	.byte	-117
	.byte	-15
	.byte	-1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-67
	.byte	-25
	.byte	-1
	.byte	119
	.byte	70
	.byte	3
	.byte	32
	.byte	3
	.byte	87
	.byte	-109
	.byte	91
	.byte	-1
	.byte	119
	.byte	6
	.byte	-40
	.byte	-14
	.byte	37
	.byte	-8
	.byte	-111
	.byte	-4
	.byte	37
	.byte	-1
	.byte	11
	.byte	-1
	.byte	119
	.byte	39
	.byte	29
	.byte	7
	.byte	34
	.byte	-1
	.byte	15
	.byte	-92
	.byte	15
	.byte	-125
	.byte	48
	.byte	3
	.byte	15
	.byte	-81
	.byte	32
	.byte	11
	.byte	-16
	.byte	114
	.byte	-11
	.byte	-1
	.byte	-11
	.byte	-5
	.byte	-2
	.byte	119
	.byte	-121
	.byte	99
	.byte	-27
	.byte	-16
	.byte	1
	.byte	93
	.byte	-1
	.byte	113
	.byte	-5
	.byte	71
	.byte	-125
	.byte	55
	.byte	-121
	.byte	54
	.byte	124
	.byte	2
	.byte	16
	.byte	3
	.byte	-16
	.byte	113
	.byte	-11
	.byte	-1
	.byte	122
	.byte	111
	.byte	75
	.byte	3
	.byte	115
	.byte	102
	.byte	111
	.byte	99
	.byte	-9
	.byte	-1
	.byte	1
	.byte	3
	.byte	119
	.byte	114
	.byte	-9
	.byte	83
	.byte	-1
	.byte	80
	.byte	103
	.byte	32
	.byte	-9
	.byte	31
	.byte	54
	.byte	99
	.byte	35
	.byte	7
	.byte	28
	.byte	-9
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-2
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-13
	.byte	-1
	.byte	13
	.byte	-1
	.byte	54
	.byte	-59
	.byte	13
	.byte	-1
	.byte	16
	.byte	3
	.byte	51
	.byte	51
	.byte	98
	.byte	11
	.byte	99
	.byte	98
	.byte	-63
	.byte	-1
	.byte	-73
	.byte	-57
	.byte	3
	.byte	99
	.byte	87
	.byte	19
	.byte	49
	.byte	-1
	.byte	35
	.byte	23
	.byte	7
	.byte	29
	.byte	43
	.byte	103
	.byte	11
	.byte	-6
	.byte	-9
	.byte	127
	.byte	-16
	.byte	1
	.byte	-15
	.byte	-1
	.byte	67
	.byte	-1
	.byte	27
	.byte	-113
	.byte	53
	.byte	11
	.byte	-109
	.byte	85
	.byte	-1
	.byte	56
	.byte	0
	.byte	-16
	.byte	3
	.byte	56
	.byte	16
	.byte	6
	.byte	-98
	.byte	30
	.byte	22
	.byte	55
	.byte	127
	.byte	87
	.byte	-13
	.byte	7
	.byte	-5
	.byte	-41
	.byte	12
	.byte	34
	.byte	0
	.byte	3
	.byte	102
	.byte	4
	.byte	-113
	.byte	102
	.byte	-15
	.byte	-1
	.byte	-45
	.byte	-1
	.byte	0
	.byte	99
	.byte	-4
	.byte	96
	.byte	3
	.byte	16
	.byte	115
	.byte	9
	.byte	3
	.byte	16
	.byte	3
	.byte	93
	.byte	-1
	.byte	120
	.byte	115
	.byte	54
	.byte	99
	.byte	-1
	.byte	35
	.byte	2
	.byte	12
	.byte	-120
	.byte	49
	.byte	-1
	.byte	55
	.byte	-1
	.byte	16
	.byte	99
	.byte	16
	.byte	103
	.byte	88
	.byte	-17
	.byte	89
	.byte	7
	.byte	15
	.byte	34
	.byte	98
	.byte	102
	.byte	34
	.byte	7
	.byte	-1
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	25
	.byte	-1
	.byte	3
	.byte	51
	.byte	-5
	.byte	22
	.byte	-13
	.byte	-48
	.byte	3
	.byte	27
	.byte	-48
	.byte	-63
	.byte	-1
	.byte	13
	.byte	125
	.byte	103
	.byte	7
	.byte	117
	.byte	16
	.byte	3
	.byte	111
	.byte	115
	.byte	32
	.byte	3
	.byte	35
	.byte	-1
	.byte	55
	.byte	1
	.byte	-1
	.byte	9
	.byte	15
	.byte	7
	.byte	-114
	.byte	43
	.byte	127
	.byte	-1
	.byte	43
	.byte	-121
	.byte	44
	.byte	7
	.byte	-13
	.byte	-1
	.byte	-32
	.byte	127
	.byte	23
	.byte	107
	.byte	-64
	.byte	3
	.byte	-112
	.byte	-117
	.byte	28
	.byte	1
	.byte	-2
	.byte	26
	.byte	6
	.byte	-13
	.byte	-7
	.byte	53
	.byte	-3
	.byte	84
	.byte	103
	.byte	12
	.byte	-110
	.byte	43
	.byte	127
	.byte	120
	.byte	-125
	.byte	119
	.byte	-2
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	7
	.byte	-1
	.byte	96
	.byte	-9
	.byte	8
	.byte	115
	.byte	112
	.byte	3
	.byte	7
	.byte	-1
	.byte	102
	.byte	-17
	.byte	-91
	.byte	-1
	.byte	-76
	.byte	-5
	.byte	8
	.byte	6
	.byte	38
	.byte	15
	.byte	25
	.byte	28
	.byte	-5
	.byte	54
	.byte	103
	.byte	16
	.byte	16
	.byte	-33
	.byte	-112
	.byte	3
	.byte	8
	.byte	56
	.byte	2
	.byte	15
	.byte	59
	.byte	-16
	.byte	112
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-4
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-15
	.byte	127
	.byte	27
	.byte	-1
	.byte	115
	.byte	119
	.byte	127
	.byte	39
	.byte	63
	.byte	119
	.byte	4
	.byte	-1
	.byte	-115
	.byte	3
	.byte	-117
	.byte	-1
	.byte	20
	.byte	-7
	.byte	21
	.byte	0
	.byte	-3
	.byte	5
	.byte	-1
	.byte	21
	.byte	-1
	.byte	7
	.byte	-26
	.byte	10
	.byte	30
	.byte	29
	.byte	43
	.byte	-25
	.byte	-121
	.byte	-16
	.byte	114
	.byte	-13
	.byte	-1
	.byte	-90
	.byte	3
	.byte	-1
	.byte	10
	.byte	103
	.byte	59
	.byte	-121
	.byte	23
	.byte	-105
	.byte	9
	.byte	112
	.byte	-15
	.byte	-13
	.byte	97
	.byte	-6
	.byte	21
	.byte	-2
	.byte	-16
	.byte	115
	.byte	-77
	.byte	23
	.byte	127
	.byte	102
	.byte	5
	.byte	-121
	.byte	5
	.byte	-109
	.byte	118
	.byte	55
	.byte	-15
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	47
	.byte	102
	.byte	50
	.byte	6
	.byte	-36
	.byte	50
	.byte	2
	.byte	52
	.byte	23
	.byte	3
	.byte	36
	.byte	-1
	.byte	10
	.byte	87
	.byte	-41
	.byte	81
	.byte	-1
	.byte	70
	.byte	-14
	.byte	118
	.byte	12
	.byte	-12
	.byte	55
	.byte	-112
	.byte	-1
	.byte	44
	.byte	-7
	.byte	1
	.byte	-34
	.byte	15
	.byte	102
	.byte	55
	.byte	51
	.byte	2
	.byte	1
	.byte	21
	.byte	99
	.byte	-1
	.byte	82
	.byte	7
	.byte	10
	.byte	67
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-67
	.byte	-1
	.byte	-17
	.byte	7
	.byte	-111
	.byte	-1
	.byte	25
	.byte	-12
	.byte	-15
	.byte	-125
	.byte	65
	.byte	-1
	.byte	39
	.byte	-1
	.byte	-3
	.byte	-15
	.byte	-1
	.byte	-15
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-27
	.byte	-1
	.byte	2
	.byte	99
	.byte	9
	.byte	-109
	.byte	55
	.byte	9
	.byte	-105
	.byte	63
	.byte	118
	.byte	114
	.byte	3
	.byte	-35
	.byte	-16
	.byte	113
	.byte	71
	.byte	-115
	.byte	23
	.byte	-5
	.byte	50
	.byte	-112
	.byte	-117
	.byte	-13
	.byte	-62
	.byte	28
	.byte	115
	.byte	28
	.byte	123
	.byte	103
	.byte	35
	.byte	119
	.byte	119
	.byte	7
	.byte	-109
	.byte	99
	.byte	-33
	.byte	-9
	.byte	-1
	.byte	-9
	.byte	-1
	.byte	51
	.byte	17
	.byte	-9
	.byte	54
	.byte	-9
	.byte	33
	.byte	-5
	.byte	-77
	.byte	-1
	.byte	58
	.byte	-16
	.byte	-11
	.byte	9
	.byte	-47
	.byte	-64
	.byte	-1
	.byte	83
	.byte	-1
	.byte	10
	.byte	62
	.byte	2
	.byte	14
	.byte	50
	.byte	2
	.byte	20
	.byte	-5
	.byte	-1
	.byte	48
	.byte	-13
	.byte	62
	.byte	-5
	.byte	-13
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-16
	.byte	1
	.byte	-87
	.byte	-1
	.byte	1
	.byte	-1
	.byte	18
	.byte	-1
	.byte	3
	.byte	7
	.byte	24
	.byte	-1
	.byte	-9
	.byte	15
	.byte	-36
	.byte	28
	.byte	-8
	.byte	6
	.byte	23
	.byte	75
	.byte	-1
	.byte	119
	.byte	57
	.byte	-123
	.byte	-99
	.byte	-1
	.byte	48
	.byte	14
	.byte	-81
	.byte	31
	.byte	4
	.byte	0
	.byte	8
	.byte	-17
	.byte	2
	.byte	86
	.byte	-9
	.byte	-64
	.byte	3
	.byte	-15
	.byte	0
	.byte	-5
	.byte	-1
	.byte	82
	.byte	102
	.byte	12
	.byte	3
	.byte	54
	.byte	12
	.byte	7
	.byte	51
	.byte	32
	.byte	15
	.byte	119
	.byte	114
	.byte	-1
	.byte	5
	.byte	-19
	.byte	71
	.byte	-121
	.byte	73
	.byte	-1
	.byte	-16
	.byte	1
	.byte	-54
	.byte	0
	.byte	16
	.byte	123
	.byte	-16
	.byte	3
	.byte	64
	.byte	-109
	.byte	-1
	.byte	-16
	.byte	113
	.byte	-7
	.byte	-1
	.byte	49
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-11
	.byte	-1
	.byte	-101
	.byte	0
	.byte	77
	.byte	-1
	.byte	71
	.byte	-17
	.byte	-48
	.byte	-43
	.byte	-1
	.byte	14
	.byte	67
	.byte	34
	.byte	19
	.byte	91
	.global	coordsX
	.type	coordsX, %object
	.size	coordsX, 30
coordsX:
	.byte	39
	.byte	72
	.byte	96
	.byte	120
	.byte	-112
	.byte	-79
	.byte	39
	.byte	72
	.byte	96
	.byte	120
	.byte	-112
	.byte	-79
	.byte	39
	.byte	72
	.byte	96
	.byte	120
	.byte	-112
	.byte	-79
	.byte	39
	.byte	72
	.byte	96
	.byte	120
	.byte	-112
	.byte	-79
	.byte	39
	.byte	72
	.byte	96
	.byte	120
	.byte	-112
	.byte	-79
	.global	coordsY
	.type	coordsY, %object
	.size	coordsY, 30
coordsY:
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	68
	.byte	68
	.byte	68
	.byte	68
	.byte	68
	.byte	68
	.byte	92
	.byte	92
	.byte	92
	.byte	92
	.byte	92
	.byte	92
	.byte	116
	.byte	116
	.byte	116
	.byte	116
	.byte	116
	.byte	116
	.type	win.1635, %object
	.size	win.1635, 30
win.1635:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	0
	.byte	0
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	0
	.byte	0
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	0
	.byte	0
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	0
	.type	C.4.1394, %object
	.size	C.4.1394, 30
C.4.1394:
	.byte	3
	.byte	0
	.byte	0
	.byte	4
	.byte	0
	.byte	8
	.byte	11
	.byte	6
	.byte	0
	.byte	0
	.byte	14
	.byte	0
	.byte	7
	.byte	0
	.byte	9
	.byte	1
	.byte	0
	.byte	0
	.byte	15
	.byte	2
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	0
	.byte	0
	.byte	16
	.byte	10
	.byte	12
	.type	C.3.1393, %object
	.size	C.3.1393, 30
C.3.1393:
	.byte	1
	.byte	14
	.byte	0
	.byte	5
	.byte	16
	.byte	6
	.byte	11
	.byte	0
	.byte	0
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	4
	.byte	0
	.byte	10
	.byte	9
	.byte	12
	.byte	3
	.byte	0
	.byte	0
	.byte	15
	.type	C.2.1392, %object
	.size	C.2.1392, 30
C.2.1392:
	.byte	4
	.byte	14
	.byte	0
	.byte	12
	.byte	3
	.byte	8
	.byte	10
	.byte	2
	.byte	6
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	0
	.byte	7
	.byte	1
	.byte	15
	.byte	0
	.byte	0
	.byte	13
	.byte	0
	.byte	11
	.byte	0
	.byte	0
	.type	C.1.1391, %object
	.size	C.1.1391, 30
C.1.1391:
	.byte	9
	.byte	5
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	0
	.byte	14
	.byte	4
	.byte	2
	.byte	0
	.byte	0
	.byte	13
	.byte	0
	.byte	0
	.byte	7
	.byte	10
	.byte	0
	.byte	1
	.byte	8
	.byte	11
	.byte	6
	.byte	0
	.byte	15
	.comm	MOVEFLAG,2,2
	.comm	STEPS,2,2
	.comm	CARRYFLAG,2,2
	.comm	ABUTTON,2,2
	.comm	DESTX,2,2
	.comm	DESTY,2,2
	.comm	CURX,2,2
	.comm	CURY,2,2
	.comm	DATAX,1,1
	.comm	DATAY,1,1
	.comm	CURRENTTILE,1,1
	.comm	sprites,1024,4
	.comm	tileConfiguration,30,4
	.ident	"GCC: (devkitARM release 24) 4.3.2"
