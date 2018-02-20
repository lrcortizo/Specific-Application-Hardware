
_interrupt:

;P3_3.c,4 :: 		void interrupt(){
;P3_3.c,6 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;P3_3.c,7 :: 		unidades++;
	INCF        _unidades+0, 1 
;P3_3.c,8 :: 		if(unidades==10){
	MOVF        _unidades+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;P3_3.c,9 :: 		unidades=0;
	CLRF        _unidades+0 
;P3_3.c,10 :: 		decenas++;
	INCF        _decenas+0, 1 
;P3_3.c,11 :: 		} if (decenas==10){
L_interrupt0:
	MOVF        _decenas+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;P3_3.c,12 :: 		decenas=0;
	CLRF        _decenas+0 
;P3_3.c,13 :: 		}
L_interrupt1:
;P3_3.c,15 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;P3_3.c,16 :: 		void main() {
;P3_3.c,17 :: 		char num []= {0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
	MOVLW       63
	MOVWF       main_num_L0+0 
	MOVLW       6
	MOVWF       main_num_L0+1 
	MOVLW       91
	MOVWF       main_num_L0+2 
	MOVLW       79
	MOVWF       main_num_L0+3 
	MOVLW       102
	MOVWF       main_num_L0+4 
	MOVLW       109
	MOVWF       main_num_L0+5 
	MOVLW       125
	MOVWF       main_num_L0+6 
	MOVLW       7
	MOVWF       main_num_L0+7 
	MOVLW       127
	MOVWF       main_num_L0+8 
	MOVLW       103
	MOVWF       main_num_L0+9 
;P3_3.c,18 :: 		TRISA=0;
	CLRF        TRISA+0 
;P3_3.c,19 :: 		PORTA=0;
	CLRF        PORTA+0 
;P3_3.c,20 :: 		TRISD=0;
	CLRF        TRISD+0 
;P3_3.c,21 :: 		PORTD=0;
	CLRF        PORTD+0 
;P3_3.c,22 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;P3_3.c,23 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;P3_3.c,24 :: 		RBPU_bit=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;P3_3.c,25 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;P3_3.c,26 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;P3_3.c,27 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;P3_3.c,29 :: 		while(1){
L_main2:
;P3_3.c,31 :: 		PORTA=0X02;
	MOVLW       2
	MOVWF       PORTA+0 
;P3_3.c,32 :: 		PORTD=num[unidades];
	MOVLW       main_num_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_num_L0+0)
	MOVWF       FSR0H 
	MOVF        _unidades+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;P3_3.c,33 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;P3_3.c,34 :: 		PORTA=0X01;
	MOVLW       1
	MOVWF       PORTA+0 
;P3_3.c,35 :: 		PORTD=num[decenas];
	MOVLW       main_num_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_num_L0+0)
	MOVWF       FSR0H 
	MOVF        _decenas+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;P3_3.c,36 :: 		DELAY_MS(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;P3_3.c,37 :: 		}}
	GOTO        L_main2
L_end_main:
	GOTO        $+0
; end of _main
