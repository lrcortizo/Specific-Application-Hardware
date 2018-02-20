
_interrupt:

;P8B.c,20 :: 		void interrupt(){
;P8B.c,21 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;P8B.c,22 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P8B.c,23 :: 		TMR0H=(3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P8B.c,24 :: 		TMR0L=3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P8B.c,25 :: 		ADCON0.GO=1;
	BSF         ADCON0+0, 2 
;P8B.c,26 :: 		}
L_interrupt0:
;P8B.c,27 :: 		if(PIR1.ADIF){
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt1
;P8B.c,28 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;P8B.c,29 :: 		aux=(ADRESH<<8)+ADRESL;
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;P8B.c,30 :: 		aux=aux*0.0048828;
	MOVLW       229
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;P8B.c,31 :: 		ab=270000.0*((5.0/aux)-1.0);
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       214
	MOVWF       R5 
	MOVLW       3
	MOVWF       R6 
	MOVLW       145
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ab+0 
	MOVF        R1, 0 
	MOVWF       _ab+1 
	MOVF        R2, 0 
	MOVWF       _ab+2 
	MOVF        R3, 0 
	MOVWF       _ab+3 
;P8B.c,32 :: 		ac=1.0/(2.5316e-4*log(ab/15000.0)+0.0033);
	MOVLW       0
	MOVWF       R4 
	MOVLW       96
	MOVWF       R5 
	MOVLW       106
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_log_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_log_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_log_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_log_x+3 
	CALL        _log+0, 0
	MOVLW       143
	MOVWF       R4 
	MOVLW       186
	MOVWF       R5 
	MOVLW       4
	MOVWF       R6 
	MOVLW       115
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       208
	MOVWF       R4 
	MOVLW       68
	MOVWF       R5 
	MOVLW       88
	MOVWF       R6 
	MOVLW       118
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ac+0 
	MOVF        R1, 0 
	MOVWF       _ac+1 
	MOVF        R2, 0 
	MOVWF       _ac+2 
	MOVF        R3, 0 
	MOVWF       _ac+3 
;P8B.c,33 :: 		ac=ac-273.15;
	MOVLW       51
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ac+0 
	MOVF        R1, 0 
	MOVWF       _ac+1 
	MOVF        R2, 0 
	MOVWF       _ac+2 
	MOVF        R3, 0 
	MOVWF       _ac+3 
;P8B.c,34 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P8B.c,35 :: 		floattostr(ac,txt);
	MOVF        _ac+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _ac+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _ac+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _ac+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;P8B.c,36 :: 		Lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8B.c,38 :: 		}
L_interrupt1:
;P8B.c,39 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P8B.c,41 :: 		void main() {
;P8B.c,42 :: 		TRISA.B1=1;
	BSF         TRISA+0, 1 
;P8B.c,43 :: 		ADCON0=0x49;
	MOVLW       73
	MOVWF       ADCON0+0 
;P8B.c,44 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;P8B.c,45 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;P8B.c,46 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;P8B.c,47 :: 		PIE1.ADIE=1;
	BSF         PIE1+0, 6 
;P8B.c,48 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P8B.c,49 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P8B.c,50 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;P8B.c,51 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;P8B.c,52 :: 		T0CON=0X83;
	MOVLW       131
	MOVWF       T0CON+0 
;P8B.c,53 :: 		TMR0H=(3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P8B.c,54 :: 		TMR0L=3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P8B.c,57 :: 		while(1);
L_main2:
	GOTO        L_main2
;P8B.c,59 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
