	.file	"switches.c"
	.comm	switch1_state_down,1,1
	.comm	switch2_state_down,1,1
	.comm	switch3_state_down,1,1
	.comm	switch4_state_down,1,1
	.comm	switch1_state_changed,1,1
	.comm	switch2_state_changed,1,1
	.comm	switch3_state_changed,1,1
	.comm	switch4_state_changed,1,1
.text
	.balign 2
	.type	switch_update_interrupt_sense, @function
switch_update_interrupt_sense:
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       2
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUB.W	#2, R1
	; end of prologue
	MOV.B	&P2IN, 1(R1)
	MOV.B	1(R1), R12
	SXT	R12
	AND.B	#15, R12
	MOV.B	R12, R13
	SXT	R13
	MOV.B	&P2IES, R12
	SXT	R12
	BIS.B	R13, R12
	SXT	R12
	AND	#0xff, R12
	MOV.B	R12, &P2IES
	MOV.B	1(R1), R12
	SXT	R12
	BIS.B	#-16, R12
	MOV.B	R12, R13
	SXT	R13
	MOV.B	&P2IES, R12
	SXT	R12
	AND.B	R13, R12
	SXT	R12
	AND	#0xff, R12
	MOV.B	R12, &P2IES
	MOV.B	1(R1), R12
	; start of epilogue
	ADD.W	#2, R1
	RET
	.size	switch_update_interrupt_sense, .-switch_update_interrupt_sense
	.balign 2
	.global	switch_init
	.type	switch_init, @function
switch_init:
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	MOV.B	&P2REN, R12
	BIS.B	#15, R12
	AND	#0xff, R12
	MOV.B	R12, &P2REN
	MOV.B	#15, &P2IE
	MOV.B	&P2OUT, R12
	BIS.B	#15, R12
	AND	#0xff, R12
	MOV.B	R12, &P2OUT
	MOV.B	&P2DIR, R12
	AND.B	#-16, R12
	AND	#0xff, R12
	MOV.B	R12, &P2DIR
	CALL	#switch_update_interrupt_sense
	CALL	#led_update
	NOP
	; start of epilogue
	RET
	.size	switch_init, .-switch_init
	.balign 2
	.global	switch1_interrupt_handler
	.type	switch1_interrupt_handler, @function
switch1_interrupt_handler:
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       2
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUB.W	#2, R1
	; end of prologue
	CALL	#switch_update_interrupt_sense
	MOV.B	R12, 1(R1)
	MOV.B	1(R1), R12
	MOV.W	R12, R13
	AND.B	#1, R13
	MOV.B	#1, R12
	CMP.W	#0, R13 { JEQ	.L5
	MOV.B	#0, R12
.L5:
	AND	#0xff, R12
	MOV.B	R12, &switch1_state_down
	MOV.B	#1, &switch1_state_changed
	CALL	#led_update
	NOP
	; start of epilogue
	ADD.W	#2, R1
	RET
	.size	switch1_interrupt_handler, .-switch1_interrupt_handler
	.balign 2
	.global	switch2_interrupt_handler
	.type	switch2_interrupt_handler, @function
switch2_interrupt_handler:
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       2
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUB.W	#2, R1
	; end of prologue
	CALL	#switch_update_interrupt_sense
	MOV.B	R12, 1(R1)
	MOV.B	1(R1), R12
	MOV.W	R12, R13
	AND.B	#2, R13
	MOV.B	#1, R12
	CMP.W	#0, R13 { JEQ	.L7
	MOV.B	#0, R12
.L7:
	AND	#0xff, R12
	MOV.B	R12, &switch2_state_down
	MOV.B	#1, &switch2_state_changed
	CALL	#led_update
	NOP
	; start of epilogue
	ADD.W	#2, R1
	RET
	.size	switch2_interrupt_handler, .-switch2_interrupt_handler
	.balign 2
	.global	switch3_interrupt_handler
	.type	switch3_interrupt_handler, @function
switch3_interrupt_handler:
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       2
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUB.W	#2, R1
	; end of prologue
	CALL	#switch_update_interrupt_sense
	MOV.B	R12, 1(R1)
	MOV.B	1(R1), R12
	MOV.W	R12, R13
	AND.B	#4, R13
	MOV.B	#1, R12
	CMP.W	#0, R13 { JEQ	.L9
	MOV.B	#0, R12
.L9:
	AND	#0xff, R12
	MOV.B	R12, &switch3_state_down
	MOV.B	#1, &switch3_state_changed
	CALL	#led_update
	NOP
	; start of epilogue
	ADD.W	#2, R1
	RET
	.size	switch3_interrupt_handler, .-switch3_interrupt_handler
	.balign 2
	.global	switch4_interrupt_handler
	.type	switch4_interrupt_handler, @function
switch4_interrupt_handler:
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       2
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUB.W	#2, R1
	; end of prologue
	CALL	#switch_update_interrupt_sense
	MOV.B	R12, 1(R1)
	MOV.B	1(R1), R12
	MOV.W	R12, R13
	AND.B	#8, R13
	MOV.B	#1, R12
	CMP.W	#0, R13 { JEQ	.L11
	MOV.B	#0, R12
.L11:
	AND	#0xff, R12
	MOV.B	R12, &switch4_state_down
	MOV.B	#1, &switch4_state_changed
	CALL	#led_update
	NOP
	; start of epilogue
	ADD.W	#2, R1
	RET
	.size	switch4_interrupt_handler, .-switch4_interrupt_handler
	.ident	"GCC: (SOMNIUM Technologies Limited - msp430-gcc 6.2.1.16) 6.2.1 20161212"
