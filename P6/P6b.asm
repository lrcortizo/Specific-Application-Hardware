
_interrupt:

;P6b.c,2 :: 		void interrupt(){
;P6b.c,3 :: 		if(INTCON3.INT1IF==1){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt0
;P6b.c,4 :: 		INTCON3.INT1IF=0;
	BCF         INTCON3+0, 0 
;P6b.c,5 :: 		INTCON3.INT1IE=0;
	BCF         INTCON3+0, 3 
;P6b.c,6 :: 		T0CON.B7=1;
	BSF         T0CON+0, 7 
;P6b.c,7 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;P6b.c,8 :: 		}
L_interrupt0:
;P6b.c,9 :: 		if(INTCON.TMR0IF==1){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;P6b.c,10 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P6b.c,11 :: 		TMR0H=(3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P6b.c,12 :: 		TMR0L=3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P6b.c,13 :: 		cont++;
	INCF        _cont+0, 1 
;P6b.c,14 :: 		if(cont==6){
	MOVF        _cont+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
;P6b.c,15 :: 		T0CON.B7=0;
	BCF         T0CON+0, 7 
;P6b.c,16 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P6b.c,17 :: 		}
L_interrupt2:
;P6b.c,18 :: 		}
L_interrupt1:
;P6b.c,19 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;P6b.c,20 :: 		void main() {
;P6b.c,21 :: 		TRISB.B1=1;
	BSF         TRISB+0, 1 
;P6b.c,22 :: 		TRISC.B0=0;
	BCF         TRISC+0, 0 
;P6b.c,23 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P6b.c,24 :: 		T0CON=0x04;
	MOVLW       4
	MOVWF       T0CON+0 
;P6b.c,25 :: 		TMR0H=(3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P6b.c,26 :: 		TMR0L=3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P6b.c,27 :: 		INTCON.PEIE = 0;
	BCF         INTCON+0, 6 
;P6b.c,28 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;P6b.c,29 :: 		INTCON2.INTEDG1=1;
	BSF         INTCON2+0, 5 
;P6b.c,30 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;P6b.c,31 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;P6b.c,32 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P6b.c,33 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;P6b.c,34 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;P6b.c,35 :: 		while(1);
L_main3:
	GOTO        L_main3
;P6b.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
