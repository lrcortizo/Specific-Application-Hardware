
_interrupt:

;P6.c,3 :: 		void interrupt(){
;P6.c,4 :: 		T0CON.B7=0;
	BCF         T0CON+0, 7 
;P6.c,5 :: 		if(flag==0){
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;P6.c,6 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P6.c,7 :: 		TMR0L=81;
	MOVLW       81
	MOVWF       TMR0L+0 
;P6.c,8 :: 		flag++;
	INCF        _flag+0, 1 
;P6.c,9 :: 		}
	GOTO        L_interrupt1
L_interrupt0:
;P6.c,11 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;P6.c,12 :: 		TMR0L=181;
	MOVLW       181
	MOVWF       TMR0L+0 
;P6.c,13 :: 		flag=0;
	CLRF        _flag+0 
;P6.c,14 :: 		}
L_interrupt1:
;P6.c,15 :: 		T0CON.B7=1;
	BSF         T0CON+0, 7 
;P6.c,16 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P6.c,17 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P6.c,19 :: 		void main() {
;P6.c,21 :: 		TRISC=0;
	CLRF        TRISC+0 
;P6.c,23 :: 		INTCON.PEIE = 0;
	BCF         INTCON+0, 6 
;P6.c,24 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;P6.c,25 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P6.c,26 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;P6.c,27 :: 		T0CON=0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;P6.c,28 :: 		TMR0L=81;
	MOVLW       81
	MOVWF       TMR0L+0 
;P6.c,29 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;P6.c,30 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;P6.c,32 :: 		while(1){
L_main2:
;P6.c,33 :: 		}
	GOTO        L_main2
;P6.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
