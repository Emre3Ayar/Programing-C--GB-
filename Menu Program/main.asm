;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _selectionScreen
	.globl _timerSystem
	.globl _timerJoy
	.globl _timerScreen
	.globl _currencyJoy
	.globl _currencyScreen
	.globl _result
	.globl _getHonderdtal
	.globl _getTiental
	.globl _getEenheid
	.globl _btwJoy
	.globl _btwScreen
	.globl _puts
	.globl _printf
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _SS
	.globl _TileLabel
	.globl _stopCount
	.globl _countTimer
	.globl _r
	.globl _amount
	.globl _l
	.globl _j
	.globl _b
	.globl _s
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_s::
	.ds 1
_b::
	.ds 3
_j::
	.ds 1
_l::
	.ds 1
_amount::
	.ds 1
_r::
	.ds 3
_countTimer::
	.ds 1
_stopCount::
	.ds 1
_TileLabel::
	.ds 256
_SS::
	.ds 8
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;BTW.c:8: void btwScreen(){
;	---------------------------------
; Function btwScreen
; ---------------------------------
_btwScreen::
;BTW.c:9: printf("^^^^^^^^^^^^^^^^^^^^");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;BTW.c:10: printf("\n\n");
	ld	de, #___str_2
	call	_puts
;BTW.c:11: printf("   Bedrag: %d", j);
	ld	hl, #_j
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_3
	push	de
	call	_printf
	add	sp, #4
;BTW.c:12: printf("\n\n\n");
	ld	de, #___str_5
	call	_puts
;BTW.c:13: printf("   BTW Percent: %d", b[s]);
	ld	bc, #_b+0
	ld	a, c
	ld	hl, #_s
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	de, #___str_6
	push	de
	call	_printf
	add	sp, #4
;BTW.c:14: printf("\n\n\n\n\n\n Made By\n\n  Emre Ayar\n  Speedysm1des\n^^^^^^^^^^^^^^^^^^^^");
	ld	de, #___str_7
	push	de
	call	_printf
	pop	hl
;BTW.c:15: }
	ret
___str_0:
	.ascii "^^^^^^^^^^^^^^^^^^^^"
	.db 0x00
___str_2:
	.db 0x0a
	.db 0x00
___str_3:
	.ascii "   Bedrag: %d"
	.db 0x00
___str_5:
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_6:
	.ascii "   BTW Percent: %d"
	.db 0x00
___str_7:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii " Made By"
	.db 0x0a
	.db 0x0a
	.ascii "  Emre Ayar"
	.db 0x0a
	.ascii "  Speedysm1des"
	.db 0x0a
	.ascii "^^^^^^^^^^^^^^^^^^^^"
	.db 0x00
;BTW.c:16: void btwJoy(){
;	---------------------------------
; Function btwJoy
; ---------------------------------
_btwJoy::
;BTW.c:17: if (J_DOWN & joypad()) {
	call	_joypad
	bit	3, a
	jr	Z, 00124$
;BTW.c:18: j--;
	ld	hl, #_j
	dec	(hl)
;BTW.c:19: cls();
	call	_cls
;BTW.c:20: btwScreen();
	call	_btwScreen
	jp	00125$
00124$:
;BTW.c:22: else if (J_UP & joypad()) {
	call	_joypad
	bit	2, a
	jr	Z, 00121$
;BTW.c:23: j++;
	ld	hl, #_j
	inc	(hl)
;BTW.c:24: cls();
	call	_cls
;BTW.c:25: btwScreen();
	call	_btwScreen
	jr	00125$
00121$:
;BTW.c:27: else if (J_RIGHT & joypad()) {
	call	_joypad
	rrca
	jr	NC, 00118$
;BTW.c:28: if (s < l && s != l) {
	ld	a, (#_s)
	ld	hl, #_l
	sub	a, (hl)
	jr	NC, 00102$
	ld	a, (#_s)
	ld	hl, #_l
	sub	a, (hl)
	jr	Z, 00102$
;BTW.c:29: s++;
	ld	hl, #_s
	inc	(hl)
00102$:
;BTW.c:31: cls();
	call	_cls
;BTW.c:32: btwScreen();
	call	_btwScreen
	jr	00125$
00118$:
;BTW.c:34: else if (J_LEFT & joypad()) {
	call	_joypad
	bit	1, a
	jr	Z, 00115$
;BTW.c:35: if (s > 0) {
	ld	hl, #_s
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;BTW.c:36: s--;
	dec	(hl)
00105$:
;BTW.c:38: cls();
	call	_cls
;BTW.c:39: btwScreen();
	call	_btwScreen
	jr	00125$
00115$:
;BTW.c:41: else if (J_START & joypad()) {
	call	_joypad
	rlca
	jr	NC, 00112$
;BTW.c:42: cls();
	call	_cls
;BTW.c:43: result();
	call	_result
	jr	00125$
00112$:
;BTW.c:45: else if (J_A & joypad()) {
	call	_joypad
	bit	4, a
	jr	Z, 00109$
;BTW.c:46: j = j + 10;
	ld	hl, #_j
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
;BTW.c:47: cls();
	call	_cls
;BTW.c:48: btwScreen();
	call	_btwScreen
	jr	00125$
00109$:
;BTW.c:50: else if (J_B & joypad()) {
	call	_joypad
	bit	5, a
	jr	Z, 00125$
;BTW.c:51: j = j - 10;
	ld	hl, #_j
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl), a
;BTW.c:52: cls();
	call	_cls
;BTW.c:53: btwScreen();
	call	_btwScreen
00125$:
;BTW.c:55: delay(500);
	ld	de, #0x01f4
;BTW.c:56: }
	jp	_delay
;BTW.c:57: UINT8 getEenheid(UINT8 n){
;	---------------------------------
; Function getEenheid
; ---------------------------------
_getEenheid::
;BTW.c:58: return n % 10;
	ld	e, a
	ld	d, #0x00
	ld	bc, #0x000a
	call	__modsint
	ld	a, c
;BTW.c:59: }
	ret
;BTW.c:60: UINT8 getTiental(UINT8 n){
;	---------------------------------
; Function getTiental
; ---------------------------------
_getTiental::
;BTW.c:61: return (n / 10) % 10;
	ld	e, a
	ld	d, #0x00
	ld	bc, #0x000a
	call	__divsint
	ld	e, c
	ld	d, b
	ld	bc, #0x000a
	call	__modsint
	ld	a, c
;BTW.c:62: }
	ret
;BTW.c:63: UINT8 getHonderdtal(UINT8 n){
;	---------------------------------
; Function getHonderdtal
; ---------------------------------
_getHonderdtal::
;BTW.c:64: return (n / 100) % 10;
	ld	e, a
	ld	d, #0x00
	ld	bc, #0x0064
	call	__divsint
	ld	e, c
	ld	d, b
	ld	bc, #0x000a
	call	__modsint
	ld	a, c
;BTW.c:65: }
	ret
;BTW.c:66: void result(){
;	---------------------------------
; Function result
; ---------------------------------
_result::
	add	sp, #-10
;BTW.c:68: printf("--------------------");
	ld	de, #___str_8
	push	de
	call	_printf
	pop	hl
;BTW.c:72: UINT8 e = getEenheid(j);
	ld	a, (#_j)
	call	_getEenheid
	ldhl	sp,	#8
	ld	(hl), a
;BTW.c:73: UINT8 t = getTiental(j);
	ld	a, (#_j)
	call	_getTiental
	ldhl	sp,	#9
	ld	(hl), a
;BTW.c:74: UINT8 h = getHonderdtal(j);
	ld	a, (#_j)
	call	_getHonderdtal
	ld	c, a
;BTW.c:76: UINT8 v = e*b[s];
	ld	a, #<(_b)
	ld	hl, #_s
	add	a, (hl)
	ld	e, a
	ld	a, #>(_b)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	b, a
	push	bc
	ld	e, b
	ldhl	sp,	#10
	ld	a, (hl)
;BTW.c:77: UINT8 vv = t*b[s];
	call	__muluchar
	ldhl	sp,	#7
	ld	(hl), c
	pop	bc
	push	bc
	ld	e, b
	ldhl	sp,	#11
	ld	a, (hl)
;BTW.c:78: UINT8 vvv = h*b[s];
	call	__muluchar
	ldhl	sp,	#8
	ld	(hl), c
	pop	bc
	ld	e, b
	ld	a, c
;BTW.c:80: UINT8 een = getEenheid(vv) + getTiental(v);
	call	__muluchar
	ldhl	sp,	#7
	ld	(hl), c
	ldhl	sp,	#6
	ld	a, (hl)
	call	_getEenheid
	ld	c, a
	push	bc
	ldhl	sp,	#7
	ld	a, (hl)
	call	_getTiental
	pop	bc
	add	a, c
	ldhl	sp,	#8
;BTW.c:81: UINT8 twee = getTiental(een) + getHonderdtal(v) + getTiental(vv) + getEenheid(vvv);
	ld	(hl), a
	call	_getTiental
	ld	c, a
	push	bc
	ldhl	sp,	#7
	ld	a, (hl)
	call	_getHonderdtal
	pop	bc
	add	a, c
	ld	c, a
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_getTiental
	pop	bc
	add	a, c
	ld	c, a
	push	bc
	ldhl	sp,	#9
	ld	a, (hl)
	call	_getEenheid
	pop	bc
	add	a, c
	ldhl	sp,	#9
;BTW.c:82: UINT8 drie = getTiental(twee) + getHonderdtal(vv) + getTiental(vvv);
	ld	(hl), a
	call	_getTiental
	ld	c, a
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_getHonderdtal
	pop	bc
	add	a, c
	ld	c, a
	push	bc
	ldhl	sp,	#9
	ld	a, (hl)
	call	_getTiental
	pop	bc
	add	a, c
	ld	d, a
;BTW.c:83: UINT8 vier = getTiental(drie) + getHonderdtal(vvv);
	push	de
	ld	a, d
	call	_getTiental
	ld	e, a
	pop	af
	ld	d, a
	push	de
	ldhl	sp,	#9
	ld	a, (hl)
	call	_getHonderdtal
	pop	de
	add	a, e
	ld	e, a
;BTW.c:85: printf("\n\n\n  %d % Percent BTW\n\n  %d Bedrag excl. \n____________________  \n  BTW bedrag %d%d%d,%d%d",b[s] ,j,vier,getEenheid(drie),getEenheid(twee),getEenheid(een),getEenheid(v));
	push	de
	ldhl	sp,	#7
	ld	a, (hl)
	call	_getEenheid
	pop	de
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	push	de
	ldhl	sp,	#10
	ld	a, (hl)
	call	_getEenheid
	pop	de
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	push	de
	ldhl	sp,	#11
	ld	a, (hl)
	call	_getEenheid
	pop	de
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	push	de
	ld	a, d
	call	_getEenheid
	pop	de
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	d, (hl)
	ld	a, (#_j)
	ldhl	sp,	#8
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #<(_b)
	ld	hl, #_s
	add	a, (hl)
	ld	c, a
	ld	a, #>(_b)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	pop	hl
	push	hl
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ldhl	sp,	#12
	ld	a, (hl)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	ldhl	sp,	#18
	ld	e, (hl)
	ld	d, #0x00
	push	de
	push	bc
	ld	de, #___str_9
	push	de
	call	_printf
	add	sp, #16
;BTW.c:86: printf("\n\n\n\n\n\n--------------------");
	ld	de, #___str_10
	push	de
	call	_printf
	pop	hl
;BTW.c:87: }
	add	sp, #10
	ret
___str_8:
	.ascii "--------------------"
	.db 0x00
___str_9:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii "  %d % Percent BTW"
	.db 0x0a
	.db 0x0a
	.ascii "  %d Bedrag excl. "
	.db 0x0a
	.ascii "____________________  "
	.db 0x0a
	.ascii "  BTW bedrag %d%d%d,%d%d"
	.db 0x00
___str_10:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii "--------------------"
	.db 0x00
;Currency.c:6: void currencyScreen(){
;	---------------------------------
; Function currencyScreen
; ---------------------------------
_currencyScreen::
;Currency.c:7: printf("$$$$$$$$$$$$$$$$$$$$");
	ld	de, #___str_11
	push	de
	call	_printf
	pop	hl
;Currency.c:8: printf("\n\n");
	ld	de, #___str_13
	call	_puts
;Currency.c:9: printf("   Amount to \n   Convert: %d", amount);
	ld	hl, #_amount
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_14
	push	de
	call	_printf
	add	sp, #4
;Currency.c:10: printf("\n\n");
	ld	de, #___str_13
	call	_puts
;Currency.c:11: printf(" ");
	ld	de, #___str_16
	push	de
	call	_printf
	pop	hl
;Currency.c:12: printf("\n\n\n\n\n Made By\n\n  Emre Ayar\n  Speedysm1des\n\n$$$$$$$$$$$$$$$$$$$$");
	ld	de, #___str_17
	push	de
	call	_printf
	pop	hl
;Currency.c:13: }
	ret
___str_11:
	.ascii "$$$$$$$$$$$$$$$$$$$$"
	.db 0x00
___str_13:
	.db 0x0a
	.db 0x00
___str_14:
	.ascii "   Amount to "
	.db 0x0a
	.ascii "   Convert: %d"
	.db 0x00
___str_16:
	.ascii " "
	.db 0x00
___str_17:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii " Made By"
	.db 0x0a
	.db 0x0a
	.ascii "  Emre Ayar"
	.db 0x0a
	.ascii "  Speedysm1des"
	.db 0x0a
	.db 0x0a
	.ascii "$$$$$$$$$$$$$$$$$$$$"
	.db 0x00
;Currency.c:14: void currencyJoy(){
;	---------------------------------
; Function currencyJoy
; ---------------------------------
_currencyJoy::
;Currency.c:15: if (J_DOWN & joypad()) {
	call	_joypad
	bit	3, a
	jr	Z, 00104$
;Currency.c:16: amount--;
	ld	hl, #_amount
	dec	(hl)
;Currency.c:17: cls();
	call	_cls
;Currency.c:18: currencyScreen();
	call	_currencyScreen
	jr	00105$
00104$:
;Currency.c:20: else if (J_UP & joypad()) {
	call	_joypad
	bit	2, a
	jr	Z, 00105$
;Currency.c:21: amount++;
	ld	hl, #_amount
	inc	(hl)
;Currency.c:22: cls();
	call	_cls
;Currency.c:23: currencyScreen();
	call	_currencyScreen
00105$:
;Currency.c:25: delay(500);
	ld	de, #0x01f4
;Currency.c:26: }
	jp	_delay
;TIMER.c:8: void timerScreen(){
;	---------------------------------
; Function timerScreen
; ---------------------------------
_timerScreen::
	dec	sp
	dec	sp
;TIMER.c:11: printf("--------------------");
	ld	de, #___str_18
	push	de
	call	_printf
	pop	hl
;TIMER.c:12: printf("\n\n");
	ld	de, #___str_20
	call	_puts
;TIMER.c:13: printf("   Seconds: %d\n   Minutes: %d\n   Uren: %d\n\n\n  A: Stop\n  B: Reset" , r[0], r[1], r[2]);
	ld	a, (#(_r + 2) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, (#(_r + 1) + 0)
	ldhl	sp,	#0
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (#_r + 0)
	ld	e, a
	ld	d, #0x00
	push	bc
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	push	de
	ld	de, #___str_21
	push	de
	call	_printf
	add	sp, #8
;TIMER.c:14: printf("\n\n\n");
	ld	de, #___str_23
	call	_puts
;TIMER.c:15: printf(" Made By\n\n  Emre Ayar\n  Speedysm1des\n--------------------");
	ld	de, #___str_24
	push	de
	call	_printf
	pop	hl
;TIMER.c:16: }
	inc	sp
	inc	sp
	ret
___str_18:
	.ascii "--------------------"
	.db 0x00
___str_20:
	.db 0x0a
	.db 0x00
___str_21:
	.ascii "   Seconds: %d"
	.db 0x0a
	.ascii "   Minutes: %d"
	.db 0x0a
	.ascii "   Uren: %d"
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii "  A: Stop"
	.db 0x0a
	.ascii "  B: Reset"
	.db 0x00
___str_23:
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_24:
	.ascii " Made By"
	.db 0x0a
	.db 0x0a
	.ascii "  Emre Ayar"
	.db 0x0a
	.ascii "  Speedysm1des"
	.db 0x0a
	.ascii "--------------------"
	.db 0x00
;TIMER.c:17: void timerJoy(){
;	---------------------------------
; Function timerJoy
; ---------------------------------
_timerJoy::
;TIMER.c:18: if (J_A & joypad()) {
	call	_joypad
	bit	4, a
	jr	Z, 00102$
;TIMER.c:19: r[0] = 0x0;
	ld	bc, #_r+0
	xor	a, a
	ld	(bc), a
;TIMER.c:20: r[1] = 0x0;
	ld	hl, #(_r + 1)
	ld	(hl), #0x00
;TIMER.c:21: r[2] = 0x0;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
00102$:
;TIMER.c:23: if (J_B & joypad()) {
	call	_joypad
	bit	5, a
	jr	Z, 00106$
;TIMER.c:24: stopCount++;
	ld	hl, #_stopCount
	inc	(hl)
	jr	00107$
00106$:
;TIMER.c:26: else if (J_START & joypad()) {
	call	_joypad
	rlca
	jr	NC, 00107$
;TIMER.c:27: saveTimer[0] = r[0];
	ld	bc, #_saveTimer+0
	ld	a, (#_r + 0)
	ld	(bc), a
;TIMER.c:28: saveTimer[1] = r[1];
	ld	a, (#(_r + 1) + 0)
	ld	hl, #(_saveTimer + 1)
	ld	(hl), a
;TIMER.c:29: saveTimer[2] = r[2];
	inc	bc
	inc	bc
	ld	a, (#(_r + 2) + 0)
	ld	(bc), a
00107$:
;TIMER.c:31: cls();
	call	_cls
;TIMER.c:32: if (stopCount % 2 == 0) {
	push	hl
	ld	hl, #_stopCount
	bit	0, (hl)
	pop	hl
	jr	NZ, 00109$
;TIMER.c:33: timerSystem();
	call	_timerSystem
00109$:
;TIMER.c:35: timerScreen();
	call	_timerScreen
;TIMER.c:36: delay(1000);
	ld	de, #0x03e8
;TIMER.c:37: }
	jp	_delay
;TIMER.c:38: UINT8* timerSystem(){
;	---------------------------------
; Function timerSystem
; ---------------------------------
_timerSystem::
;TIMER.c:39: r[0]++;
	ld	a, (#_r + 0)
	ld	c, a
	inc	c
	ld	hl, #_r
	ld	(hl), c
;TIMER.c:40: NR10_REG = 00010011;
	ld	a, #0x09
	ldh	(_NR10_REG + 0), a
;TIMER.c:41: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG + 0), a
;TIMER.c:42: NR12_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;TIMER.c:43: NR13_REG = 0x00;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;TIMER.c:44: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG + 0), a
;TIMER.c:45: if (r[0x0] % 60 == 0) {
	ld	e, c
	ld	d, #0x00
	ld	bc, #0x003c
	call	__modsint
	ld	a, b
	or	a, c
	jr	NZ, 00104$
;TIMER.c:46: r[0x1]++;
	ld	a, (#(_r + 1) + 0)
	inc	a
	ld	(#(_r + 1)),a
;TIMER.c:47: r[0x0] = 0;
	ld	hl, #_r
	ld	(hl), #0x00
;TIMER.c:48: if (r[0x1] % 60 == 0) {
	ld	a, (#(_r + 1) + 0)
	ld	e, a
	ld	d, #0x00
	ld	bc, #0x003c
	call	__modsint
	ld	a, b
	or	a, c
	jr	NZ, 00104$
;TIMER.c:49: r[0x1] = 0;
	ld	hl, #(_r + 1)
	ld	(hl), #0x00
;TIMER.c:50: r[0x2]++;
	ld	bc, #_r + 2
	ld	a, (bc)
	inc	a
	ld	(bc), a
00104$:
;TIMER.c:57: return 0;
	ld	bc, #0x0000
;TIMER.c:58: }
	ret
;main.c:17: void selectionScreen(UINT8 S){
;	---------------------------------
; Function selectionScreen
; ---------------------------------
_selectionScreen::
	ld	e, a
;main.c:18: printf("--------------------");
	push	de
	ld	bc, #___str_25
	push	bc
	call	_printf
	pop	hl
	ld	de, #___str_27
	call	_puts
	pop	de
;main.c:20: printf("Select Program:\n\n\n %s", SS[S+1]);
	ld	bc, #_SS+0
	inc	e
	ld	a, e
	rlca
	sbc	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #___str_28
	push	de
	call	_printf
	add	sp, #4
;main.c:21: printf("\n\n\n");
	ld	de, #___str_30
	call	_puts
;main.c:22: printf("\n\n\n\n\n--------------------");
	ld	de, #___str_31
	push	de
	call	_printf
	pop	hl
;main.c:23: }
	ret
___str_25:
	.ascii "--------------------"
	.db 0x00
___str_27:
	.db 0x0a
	.db 0x00
___str_28:
	.ascii "Select Program:"
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii " %s"
	.db 0x00
___str_30:
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_31:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii "--------------------"
	.db 0x00
;main.c:24: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-7
;main.c:25: NR52_REG = 0x80;// sound on
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:26: NR50_REG = 0x07;// volume set
	ld	a, #0x07
	ldh	(_NR50_REG + 0), a
;main.c:27: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:28: ENABLE_RAM_MBC1;
	ld	hl, #_rRAMG
	ld	(hl), #0x0a
;main.c:37: bool sele = false;
	ldhl	sp,	#0
	ld	(hl), #0x00
;main.c:38: short S = 0;
	xor	a, a
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), a
;main.c:41: if (saveTimer[0] != 0xFF) {
	ld	a, (#_saveTimer + 0)
	ldhl	sp,#4
	ld	(hl), a
	ld	a, (hl)
	inc	a
	jr	Z, 00102$
;main.c:42: r[0] = saveTimer[0];
	ld	bc, #_r+0
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:43: r[1] = saveTimer[1];
	ld	a, (#(_saveTimer + 1) + 0)
	ld	(#(_r + 1)),a
;main.c:44: r[2] = saveTimer[2];
	inc	bc
	inc	bc
	ld	a, (#(_saveTimer + 2) + 0)
	ld	(bc), a
	jr	00103$
00102$:
;main.c:48: r[0] = 0x0;
	ld	hl, #_r
	ld	(hl), #0x00
;main.c:49: r[1] = 0x0;
	ld	hl, #(_r + 1)
	ld	(hl), #0x00
;main.c:50: r[2] = 0x0;
	ld	hl, #(_r + 2)
	ld	(hl), #0x00
00103$:
;main.c:52: selectionScreen(S);
	xor	a, a
	call	_selectionScreen
;main.c:53: set_sprite_data(0, 1, TileLabel);
	ld	de, #_TileLabel
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;c:\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:60: while (!sele) {
00122$:
;main.c:62: if (S < 2) {
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;main.c:78: if (S == 1) {
	ld	a, c
	dec	a
	or	a, b
	ld	a, #0x01
	jr	Z, 00324$
	xor	a, a
00324$:
	ldhl	sp,	#1
	ld	(hl), a
;main.c:84: if (S == 2) {
	ld	a, c
	sub	a, #0x02
	or	a, b
	ld	a, #0x01
	jr	Z, 00326$
	xor	a, a
00326$:
	ldhl	sp,	#2
;main.c:60: while (!sele) {
	ld	(hl-), a
	dec	hl
	bit	0, (hl)
	jr	NZ, 00143$
;main.c:61: if (J_RIGHT & joypad()) {
	call	_joypad
	rrca
	jr	NC, 00120$
;main.c:62: if (S < 2) {
	ld	a, c
	sub	a, #0x02
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00121$
;main.c:63: S++;
	ldhl	sp,	#5
	inc	(hl)
	jr	NZ, 00328$
	inc	hl
	inc	(hl)
00328$:
;main.c:64: cls();
	call	_cls
;main.c:65: selectionScreen(S);
	ldhl	sp,	#5
	ld	a, (hl)
	call	_selectionScreen
	jr	00121$
00120$:
;main.c:68: else if (J_LEFT & joypad()) {
	call	_joypad
	bit	1, a
	jr	Z, 00117$
;main.c:69: if (S != 0) {
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
;main.c:70: S--;
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
;main.c:71: cls();
	call	_cls
;main.c:72: selectionScreen(S);
	ldhl	sp,	#5
	ld	a, (hl)
	call	_selectionScreen
	jr	00121$
00117$:
;main.c:75: else if (J_START & joypad()) {
	call	_joypad
	rlca
	jr	NC, 00121$
;main.c:76: savefile = 0x2;
	ld	hl, #_savefile
	ld	(hl), #0x02
;main.c:77: cls();
	call	_cls
;main.c:78: if (S == 1) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;main.c:79: btwScreen();
	call	_btwScreen
00109$:
;main.c:81: if (S == 0) {
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00111$
;main.c:82: currencyScreen();
	call	_currencyScreen
00111$:
;main.c:84: if (S == 2) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00113$
;main.c:85: timerScreen();
	call	_timerScreen
00113$:
;main.c:87: sele = true;
	ldhl	sp,	#0
	ld	(hl), #0x01
00121$:
;main.c:89: delay(500);
	ld	de, #0x01f4
	call	_delay
	jp	00122$
;main.c:91: while(sele){
00143$:
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00145$
;main.c:92: while(S == 1 && sele) {
00128$:
;main.c:65: selectionScreen(S);
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
;main.c:92: while(S == 1 && sele) {
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00171$
	dec	hl
	bit	0, (hl)
	jr	Z, 00171$
;main.c:93: btwJoy();
	call	_btwJoy
;main.c:94: if (J_SELECT & joypad()) {
	call	_joypad
	bit	6, a
	jr	Z, 00128$
;main.c:96: cls();
	call	_cls
;main.c:97: selectionScreen(S);
	ldhl	sp,	#3
	ld	a, (hl)
	call	_selectionScreen
;main.c:98: sele = false;
	ldhl	sp,	#0
	ld	(hl), #0x00
	jr	00128$
;main.c:101: while(S == 2 && sele) {
00171$:
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00134$:
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00140$
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00140$
;main.c:102: timerJoy();
	call	_timerJoy
;main.c:103: if (J_SELECT & joypad()) {
	call	_joypad
	bit	6, a
	jr	Z, 00134$
;main.c:105: cls();
	call	_cls
;main.c:106: selectionScreen(S);
	ldhl	sp,	#3
	ld	a, (hl)
	call	_selectionScreen
;main.c:107: sele = false;
	ldhl	sp,	#0
	ld	(hl), #0x00
	jr	00134$
;main.c:110: while(S == 0 && sele) {
00140$:
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00143$
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00143$
;main.c:111: currencyJoy();
	call	_currencyJoy
;main.c:112: if (J_SELECT & joypad()) {
	call	_joypad
	bit	6, a
	jr	Z, 00140$
;main.c:114: cls();
	call	_cls
;main.c:115: selectionScreen(S);
	ldhl	sp,	#3
	ld	a, (hl)
	call	_selectionScreen
;main.c:116: sele = false;
	ldhl	sp,	#0
	ld	(hl), #0x00
	jr	00140$
00145$:
;main.c:143: DISABLE_RAM_MBC1;
	ld	hl, #_rRAMG
	ld	(hl), #0x00
	jp	00122$
;main.c:145: }
	add	sp, #7
	ret
	.area _CODE
___str_32:
	.ascii "0"
	.db 0x00
___str_33:
	.ascii "Currency Convert"
	.db 0x0a
	.db 0x0a
	.ascii " -->"
	.db 0x00
___str_34:
	.ascii "BTW"
	.db 0x0a
	.db 0x0a
	.ascii " <-- -->"
	.db 0x00
___str_35:
	.ascii "Timer"
	.db 0x0a
	.db 0x0a
	.ascii " <--"
	.db 0x00
	.area _INITIALIZER
__xinit__s:
	.db #0x00	; 0
__xinit__b:
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x15	; 21
__xinit__j:
	.db #0x00	; 0
__xinit__l:
	.db #0x03	; 3
__xinit__amount:
	.db #0x00	; 0
__xinit__r:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__countTimer:
	.db #0x00	; 0
__xinit__stopCount:
	.db #0x00	; 0
__xinit__TileLabel:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__SS:
	.dw ___str_32
	.dw ___str_33
	.dw ___str_34
	.dw ___str_35
	.area _CABS (ABS)
