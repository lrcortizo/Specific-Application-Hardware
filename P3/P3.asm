
_main:

;P3.c,1 :: 		void main() {
;P3.c,3 :: 		int a=0;
	CLRF        main_a_L0+0 
	CLRF        main_a_L0+1 
;P3.c,4 :: 		RBPU_bit=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;P3.c,5 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;P3.c,6 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;P3.c,8 :: 		while(1){
L_main0:
;P3.c,10 :: 		if (PORTB.B0==0 && a==0){
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	MOVLW       0
	XORWF       main_a_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       0
	XORWF       main_a_L0+0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main10:
;P3.c,11 :: 		PORTB.B1=~PORTB.B1;
	BTG         PORTB+0, 1 
;P3.c,12 :: 		a=1;
	MOVLW       1
	MOVWF       main_a_L0+0 
	MOVLW       0
	MOVWF       main_a_L0+1 
;P3.c,13 :: 		}
	GOTO        L_main5
L_main4:
;P3.c,14 :: 		else if (PORTB.B0==1 && a==1){
	BTFSS       PORTB+0, 0 
	GOTO        L_main8
	MOVLW       0
	XORWF       main_a_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       1
	XORWF       main_a_L0+0, 0 
L__main13:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main9:
;P3.c,15 :: 		a=0;
	CLRF        main_a_L0+0 
	CLRF        main_a_L0+1 
;P3.c,16 :: 		}
L_main8:
L_main5:
;P3.c,17 :: 		}
	GOTO        L_main0
;P3.c,18 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
