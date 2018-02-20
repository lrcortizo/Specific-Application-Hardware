
_main:

;Practica1.c,1 :: 		void main() {
;Practica1.c,2 :: 		unsigned short int x = 1;
	MOVLW       1
	MOVWF       main_x_L0+0 
	MOVLW       128
	MOVWF       main_y_L0+0 
;Practica1.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1.c,7 :: 		while(1)
L_main0:
;Practica1.c,9 :: 		PORTC = x+y;
	MOVF        main_y_L0+0, 0 
	ADDWF       main_x_L0+0, 0 
	MOVWF       PORTC+0 
;Practica1.c,10 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;Practica1.c,11 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1.c,12 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;Practica1.c,13 :: 		x = x*2;
	MOVF        main_x_L0+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       main_x_L0+0 
;Practica1.c,14 :: 		y = y/2;
	RRCF        main_y_L0+0, 1 
	BCF         main_y_L0+0, 7 
;Practica1.c,15 :: 		if(x==128)
	MOVF        R1, 0 
	XORLW       128
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Practica1.c,17 :: 		x =1;
	MOVLW       1
	MOVWF       main_x_L0+0 
;Practica1.c,18 :: 		y =128;
	MOVLW       128
	MOVWF       main_y_L0+0 
;Practica1.c,19 :: 		}
L_main4:
;Practica1.c,21 :: 		}
	GOTO        L_main0
;Practica1.c,23 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
