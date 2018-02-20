
_interrupt:

;P7.c,19 :: 		void interrupt(){
;P7.c,20 :: 		ab=ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _ab+0 
	MOVLW       0
	MOVWF       _ab+1 
;P7.c,21 :: 		ab=ab+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _ab+0, 0 
	ADDWF       R0, 1 
	MOVF        _ab+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _ab+0 
	MOVF        R1, 0 
	MOVWF       _ab+1 
;P7.c,22 :: 		resultado=0.00488758*ab;
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
	MOVF        R0, 0 
	MOVWF       _resultado+0 
	MOVF        R1, 0 
	MOVWF       _resultado+1 
	MOVF        R2, 0 
	MOVWF       _resultado+2 
	MOVF        R3, 0 
	MOVWF       _resultado+3 
;P7.c,23 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P7.c,24 :: 		FLOATTOSTR(resultado,txt);
	MOVF        _resultado+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _resultado+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _resultado+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _resultado+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;P7.c,25 :: 		LCD_OUT(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7.c,26 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;P7.c,27 :: 		ADCON0.GO=1;
	BSF         ADCON0+0, 2 
;P7.c,28 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7.c,29 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;P7.c,31 :: 		void main() {
;P7.c,33 :: 		TRISA.B0=1;
	BSF         TRISA+0, 0 
;P7.c,34 :: 		ADCON0=0x41;
	MOVLW       65
	MOVWF       ADCON0+0 
;P7.c,35 :: 		ADCON1=0xCE;
	MOVLW       206
	MOVWF       ADCON1+0 
;P7.c,36 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7.c,37 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;P7.c,38 :: 		IPR1.ADIP = 0;
	BCF         IPR1+0, 6 
;P7.c,39 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7.c,40 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P7.c,41 :: 		LCD_INIT();
	CALL        _Lcd_Init+0, 0
;P7.c,42 :: 		ADCON0.GO=1;
	BSF         ADCON0+0, 2 
;P7.c,43 :: 		while(1);
L_main1:
	GOTO        L_main1
;P7.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
