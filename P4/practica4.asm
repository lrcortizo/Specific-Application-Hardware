
_interrupt:

;practica4.c,2 :: 		void interrupt(){
;practica4.c,3 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;practica4.c,5 :: 		if(pos==0){
	MOVF        _pos+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;practica4.c,6 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;practica4.c,7 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	DECFSZ      R11, 1, 1
	BRA         L_interrupt2
;practica4.c,8 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;practica4.c,9 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
;practica4.c,10 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;practica4.c,11 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
;practica4.c,12 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;practica4.c,13 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	DECFSZ      R11, 1, 1
	BRA         L_interrupt5
;practica4.c,14 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;practica4.c,15 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt6:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt6
	DECFSZ      R12, 1, 1
	BRA         L_interrupt6
	DECFSZ      R11, 1, 1
	BRA         L_interrupt6
;practica4.c,16 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;practica4.c,17 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt7:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt7
	DECFSZ      R12, 1, 1
	BRA         L_interrupt7
	DECFSZ      R11, 1, 1
	BRA         L_interrupt7
;practica4.c,18 :: 		pos++;
	INCF        _pos+0, 1 
;practica4.c,19 :: 		}  else {
	GOTO        L_interrupt8
L_interrupt1:
;practica4.c,20 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;practica4.c,21 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
;practica4.c,22 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;practica4.c,23 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;practica4.c,24 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt10:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt10
	DECFSZ      R12, 1, 1
	BRA         L_interrupt10
	DECFSZ      R11, 1, 1
	BRA         L_interrupt10
;practica4.c,25 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;practica4.c,26 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;practica4.c,27 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt11:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt11
	DECFSZ      R12, 1, 1
	BRA         L_interrupt11
	DECFSZ      R11, 1, 1
	BRA         L_interrupt11
;practica4.c,28 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;practica4.c,29 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;practica4.c,30 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt12:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt12
	DECFSZ      R12, 1, 1
	BRA         L_interrupt12
	DECFSZ      R11, 1, 1
	BRA         L_interrupt12
;practica4.c,31 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;practica4.c,32 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;practica4.c,33 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt13:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt13
	DECFSZ      R12, 1, 1
	BRA         L_interrupt13
	DECFSZ      R11, 1, 1
	BRA         L_interrupt13
;practica4.c,34 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;practica4.c,35 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;practica4.c,36 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt14:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt14
	DECFSZ      R12, 1, 1
	BRA         L_interrupt14
	DECFSZ      R11, 1, 1
	BRA         L_interrupt14
;practica4.c,37 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;practica4.c,38 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;practica4.c,39 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt15:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt15
	DECFSZ      R12, 1, 1
	BRA         L_interrupt15
	DECFSZ      R11, 1, 1
	BRA         L_interrupt15
;practica4.c,40 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;practica4.c,41 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;practica4.c,42 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt16:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt16
	DECFSZ      R12, 1, 1
	BRA         L_interrupt16
	DECFSZ      R11, 1, 1
	BRA         L_interrupt16
;practica4.c,43 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;practica4.c,44 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt17:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt17
	DECFSZ      R12, 1, 1
	BRA         L_interrupt17
	DECFSZ      R11, 1, 1
	BRA         L_interrupt17
;practica4.c,45 :: 		pos++;
	INCF        _pos+0, 1 
;practica4.c,46 :: 		}
L_interrupt8:
;practica4.c,47 :: 		}
L_interrupt0:
;practica4.c,48 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica4.c,49 :: 		}
L_end_interrupt:
L__interrupt21:
	RETFIE      1
; end of _interrupt

_main:

;practica4.c,50 :: 		void main() {
;practica4.c,51 :: 		TRISC=0;
	CLRF        TRISC+0 
;practica4.c,52 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;practica4.c,53 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;practica4.c,55 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;practica4.c,56 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;practica4.c,57 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;practica4.c,58 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica4.c,59 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;practica4.c,60 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;practica4.c,61 :: 		RBPU_BIT=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;practica4.c,62 :: 		while(1){}
L_main18:
	GOTO        L_main18
;practica4.c,63 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
