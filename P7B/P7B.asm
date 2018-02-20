
_interrupt:

;P7B.c,19 :: 		void interrupt(){
;P7B.c,20 :: 		if(INTCON.TMR0IF==1){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;P7B.c,21 :: 		TMR0H=0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;P7B.c,22 :: 		TMR0L=0xDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;P7B.c,23 :: 		ADCON0.GO=1;
	BSF         ADCON0+0, 2 
;P7B.c,24 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P7B.c,25 :: 		}
L_interrupt0:
;P7B.c,26 :: 		if(PIR1.ADIF==1){
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt1
;P7B.c,27 :: 		cb=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _cb+0 
	MOVLW       0
	MOVWF       _cb+1 
;P7B.c,28 :: 		cb=cb+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _cb+0, 0 
	ADDWF       R0, 1 
	MOVF        _cb+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _cb+0 
	MOVF        R1, 0 
	MOVWF       _cb+1 
;P7B.c,29 :: 		resultado=0.00488758*cb*100;
	CALL        _word2double+0, 0
	MOVLW       254
	MOVWF       R4 
	MOVLW       39
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _resultado+0 
	MOVF        R1, 0 
	MOVWF       _resultado+1 
	MOVF        R2, 0 
	MOVWF       _resultado+2 
	MOVF        R3, 0 
	MOVWF       _resultado+3 
;P7B.c,30 :: 		FLOATTOSTR(resultado,txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;P7B.c,31 :: 		LCD_OUT(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7B.c,32 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7B.c,33 :: 		}
L_interrupt1:
;P7B.c,34 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P7B.c,36 :: 		void main() {
;P7B.c,38 :: 		PORTD.B0=0;
	BCF         PORTD+0, 0 
;P7B.c,39 :: 		TRISE.B1=1;
	BSF         TRISE+0, 1 
;P7B.c,40 :: 		ADCON0=0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;P7B.c,41 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;P7B.c,42 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7B.c,43 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;P7B.c,44 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7B.c,45 :: 		T0CON=0x05;
	MOVLW       5
	MOVWF       T0CON+0 
;P7B.c,46 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P7B.c,47 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;P7B.c,48 :: 		TMR0H=0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;P7B.c,49 :: 		TMR0L=0xDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;P7B.c,50 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;P7B.c,51 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P7B.c,52 :: 		LCD_INIT();
	CALL        _Lcd_Init+0, 0
;P7B.c,53 :: 		ADCON0.GO=1;
	BSF         ADCON0+0, 2 
;P7B.c,54 :: 		while(1);
L_main2:
	GOTO        L_main2
;P7B.c,55 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
