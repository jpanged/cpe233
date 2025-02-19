; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;- Port Constants
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.equ outport = 0x42 ; output port for values
.equ inport = 0x9A ; input to take 8-bit value
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;- Main program
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.cseg
.org  0x01 ; memory location of instruction data
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
main:
	in r0, inport
	mov r10, 0x04 ; Initialize counter
	mov r1, 0x00 ; Initialize R1
	mov r2, 0x00 ; Initialize R2, takes care of 0 case

split_bits:
	clc ; Clear carry
	lsr r0 ; Shift input right
	lsr r1 ; Shift carry into register
	sub r10, 0x01 ; Keep track of shifts
	brne split_bits

shift_register: ; Gets bits in the right place
	lsr r1
	lsr r1
	lsr r1
	lsr r1

check_if_zero: ; Goes straight to output if a zero exists
	cmp r0, 0x00
	breq output
	cmp r1, 0x00
	breq output

duplicate_register_for_sum:
	mov r2, r1
	sub r0, 0x01

multiply: ; Adds r1 to r2, r0 times (multiplies)
	add r2, r1
	sub r0, 0x01
	brne multiply

output:
	out r2, outport
	brn main
