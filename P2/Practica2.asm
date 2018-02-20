
_main:

;Practica2.c,1 :: 		void main() {
;Practica2.c,6 :: 		char numeros [] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};
	MOVLW       63
	MOVWF       main_numeros_L0+0 
	MOVLW       6
	MOVWF       main_numeros_L0+1 
	MOVLW       91
	MOVWF       main_numeros_L0+2 
	MOVLW       79
	MOVWF       main_numeros_L0+3 
	MOVLW       102
	MOVWF       main_numeros_L0+4 
	MOVLW       109
	MOVWF       main_numeros_L0+5 
	MOVLW       125
	MOVWF       main_numeros_L0+6 
	MOVLW       7
	MOVWF       main_numeros_L0+7 
	MOVLW       127
	MOVWF       main_numeros_L0+8 
	MOVLW       103
	MOVWF       main_numeros_L0+9 
;Practica2.c,8 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica2.c,9 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica2.c,10 :: 		TRISD=0;
	CLRF        TRISD+0 
;Practica2.c,11 :: 		PORTD=0;
	CLRF        PORTD+0 
;Practica2.c,13 :: 		while(1){
L_main0:
;Practica2.c,15 :: 		if (unidades==10){
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       10
	XORWF       R1, 0 
L__main10:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Practica2.c,17 :: 		unidades=0;
	CLRF        R1 
	CLRF        R2 
;Practica2.c,18 :: 		decenas++;
	INFSNZ      R3, 1 
	INCF        R4, 1 
;Practica2.c,19 :: 		}
L_main2:
;Practica2.c,20 :: 		if (decenas==6){
	MOVLW       0
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       6
	XORWF       R3, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Practica2.c,22 :: 		decenas=0;
	CLRF        R3 
	CLRF        R4 
;Practica2.c,23 :: 		}
L_main3:
;Practica2.c,24 :: 		for (i=0; i<25; i++){
	CLRF        R5 
	CLRF        R6 
L_main4:
	MOVLW       128
	XORWF       R6, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       25
	SUBWF       R5, 0 
L__main12:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;Practica2.c,26 :: 		PORTD=0x01;
	MOVLW       1
	MOVWF       PORTD+0 
;Practica2.c,27 :: 		PORTC=numeros[unidades];
	MOVLW       main_numeros_L0+0
	ADDWF       R1, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_numeros_L0+0)
	ADDWFC      R2, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica2.c,28 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;Practica2.c,29 :: 		PORTD=0x02;
	MOVLW       2
	MOVWF       PORTD+0 
;Practica2.c,30 :: 		PORTC=numeros[decenas];
	MOVLW       main_numeros_L0+0
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_numeros_L0+0)
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica2.c,31 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;Practica2.c,24 :: 		for (i=0; i<25; i++){
	INFSNZ      R5, 1 
	INCF        R6, 1 
;Practica2.c,32 :: 		}
	GOTO        L_main4
L_main5:
;Practica2.c,33 :: 		unidades++;
	INFSNZ      R1, 1 
	INCF        R2, 1 
;Practica2.c,34 :: 		}
	GOTO        L_main0
;Practica2.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
