
_interrupt:

;P3_2.c,1 :: 		void interrupt(){
;P3_2.c,3 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;P3_2.c,4 :: 		PORTB.B1=~PORTB.B1;
	BTG         PORTB+0, 1 
;P3_2.c,6 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;P3_2.c,7 :: 		void main() {
;P3_2.c,9 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;P3_2.c,10 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;P3_2.c,11 :: 		RBPU_bit=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;P3_2.c,12 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;P3_2.c,13 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;P3_2.c,14 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;P3_2.c,15 :: 		while(1);
L_main0:
	GOTO        L_main0
;P3_2.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
