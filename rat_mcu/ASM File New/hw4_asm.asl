

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || ; HW 4 Part 1
(0002)                            || ; CPE 233 Winter 2018
(0003)                            || ; Professor Gerfen
(0004)                            || ; Russell Caletena, Josiah Pang & Nathan Wang
(0005)                            || ;
(0006)                            || ; r1 - takes in the switches input value
(0007)                            || ; r2 - takes in the interrupt switches value
(0008)                            || ; r3 - bit exor to blink led(0) twice in a sec
(0009)                            || ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(0010)                            || ;- Port Constants
(0011)                            || ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(0012)                       066  || .equ int_en = 0x42 ;
(0013)                       065  || .equ int_clr = 0x41 ;
(0014)                       032  || .equ switches = 0x20 ;
(0015)                       033  || .equ int_status = 0x21 ;
(0016)                       129  || .equ seg_id = 0x81 ;
(0017)                       064  || .equ leds_id = 0x40 ;
(0018)                       255  || .equ time_OUTSIDE_FOR_COUNT = 0xFF ;
(0019)                       255  || .equ time_MIDDLE_FOR_COUNT = 0xFF ;
(0020)                       064  || .equ time_INSIDE_FOR_COUNT= 0x40 ;
(0021)                            || ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(0022)                            || ;- Code
(0023)                            || ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(0024)                            || .cseg
(0025)                       016  || .org  0x10 ; Memory location of instruction data
(0026)                            || ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(0027)  CS-0x010  0x1A000         || 	sei
(0028)                     0x011  || main:
(0029)  CS-0x011  0x32120         || 	in r1, switches ; gets switches input
(0030)  CS-0x012  0x34142         || 	out r1, int_en ; outputs switches value
(0031)  CS-0x013  0x24301         || 	exor r3, 0x01 ; toggles led(0) to get it to blink
(0032)  CS-0x014  0x34340         || 	out r3, leds_id ; outputs the led(0) status
(0033)  CS-0x015  0x08159         || 	call delay ; calls delay only once because led needs to blink twice in a second
(0034)  CS-0x016  0x08088         || 	brn main ; starts over if no interrupt is called
(0035)                            || 
(0036)                       032  || .org 0x20
(0037)                     0x020  || isr:
(0038)  CS-0x020  0x32221         || 	in r2, int_status ; reads the interrupt value
(0039)  CS-0x021  0x34281         || 	out r2, seg_id ; outputs interrupt value on sseg
(0040)  CS-0x022  0x364FF         || 	mov r4, 0xFF
(0041)  CS-0x023  0x34441         ||     out r4, int_clr
(0042)  CS-0x024  0x08159         || 	call delay ; calls four delays for a 1s total delay
(0043)  CS-0x025  0x08159         || 	call delay
(0044)  CS-0x026  0x08159         || 	call delay
(0045)  CS-0x027  0x08159         || 	call delay
(0046)  CS-0x028  0x36400         || 	mov r4, 0x00
(0047)  CS-0x029  0x34441         || 	out r4, int_clr
(0048)  CS-0x02A  0x1A003         || 	retie ; starts over and resets interrupt
(0049)                            || 
(0050)                     0x02B  || delay: ; delays for half a second per call
(0051)  CS-0x02B  0x37DFF         || 				MOV     R29, time_OUTSIDE_FOR_COUNT  ;set outside for loop count
(0052)  CS-0x02C  0x2DD01  0x02C  || outside_for:    SUB     R29, 0x01
(0053)                            || 
(0054)  CS-0x02D  0x37CFF         || 				MOV     R28, time_MIDDLE_FOR_COUNT   ;set middle for loop count
(0055)  CS-0x02E  0x2DC01  0x02E  || middle_for:     SUB     R28, 0x01
(0056)                            || 
(0057)  CS-0x02F  0x37B40         || 				MOV     R27, time_INSIDE_FOR_COUNT   ;set inside for loop count
(0058)  CS-0x030  0x2DB01  0x030  || inside_for: 	SUB     R27, 0x01
(0059)  CS-0x031  0x08183         || 				BRNE    inside_for
(0060)                            || 
(0061)  CS-0x032  0x23C00         || 				OR      R28, 0x00               ;load flags for middle for counter
(0062)  CS-0x033  0x08173         || 				BRNE    middle_for
(0063)                            || 
(0064)  CS-0x034  0x23D00         || 				OR      R29, 0x00               ;load flags for outside for counter value
(0065)  CS-0x035  0x08163         || 				BRNE    outside_for
(0066)  CS-0x036  0x18002         || 				RET
(0067)                       1023  || .org 0x3FF
(0068)  CS-0x3FF  0x08100         || 	brn isr





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
DELAY          0x02B   (0050)  ||  0033 0042 0043 0044 0045 
INSIDE_FOR     0x030   (0058)  ||  0059 
ISR            0x020   (0037)  ||  0068 
MAIN           0x011   (0028)  ||  0034 
MIDDLE_FOR     0x02E   (0055)  ||  0062 
OUTSIDE_FOR    0x02C   (0052)  ||  0065 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INT_CLR        0x041   (0013)  ||  0041 0047 
INT_EN         0x042   (0012)  ||  0030 
INT_STATUS     0x021   (0015)  ||  0038 
LEDS_ID        0x040   (0017)  ||  0032 
SEG_ID         0x081   (0016)  ||  0039 
SWITCHES       0x020   (0014)  ||  0029 
TIME_INSIDE_FOR_COUNT 0x040   (0020)  ||  0057 
TIME_MIDDLE_FOR_COUNT 0x0FF   (0019)  ||  0054 
TIME_OUTSIDE_FOR_COUNT 0x0FF   (0018)  ||  0051 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
