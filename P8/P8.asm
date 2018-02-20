
_mostrar:

;P8.c,19 :: 		float mostrar(float var){
;P8.c,20 :: 		var=0.10718493*var+10.5;
	MOVLW       198
	MOVWF       R0 
	MOVLW       131
	MOVWF       R1 
	MOVLW       91
	MOVWF       R2 
	MOVLW       123
	MOVWF       R3 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R4 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R5 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R6 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       40
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,21 :: 		if(unidades==0){
	MOVF        _unidades+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar0
;P8.c,22 :: 		Lcd_Out(1,1,"kPa");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,23 :: 		}
L_mostrar0:
;P8.c,24 :: 		if(unidades==1){
	MOVF        _unidades+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar1
;P8.c,25 :: 		Lcd_Out(1,1,"Psi");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,26 :: 		var/=6.8927;
	MOVLW       0
	MOVWF       R4 
	MOVLW       145
	MOVWF       R5 
	MOVLW       92
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,27 :: 		}
L_mostrar1:
;P8.c,28 :: 		if(unidades==2){
	MOVF        _unidades+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar2
;P8.c,29 :: 		Lcd_Out(1,1,"Atm");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,30 :: 		var/=101.325;
	MOVLW       102
	MOVWF       R4 
	MOVLW       166
	MOVWF       R5 
	MOVLW       74
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,31 :: 		}
L_mostrar2:
;P8.c,32 :: 		if(unidades==3){
	MOVF        _unidades+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar3
;P8.c,33 :: 		Lcd_Out(1,1,"mBar");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,34 :: 		var/=0.1;
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,35 :: 		}
L_mostrar3:
;P8.c,36 :: 		if(unidades==4){
	MOVF        _unidades+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar4
;P8.c,37 :: 		Lcd_Out(1,1,"mmHg");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,38 :: 		var/=0.13328;
	MOVLW       141
	MOVWF       R4 
	MOVLW       122
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,39 :: 		}
L_mostrar4:
;P8.c,40 :: 		if(unidades==5){
	MOVF        _unidades+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar5
;P8.c,41 :: 		Lcd_Out(1,1,"N/m2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,42 :: 		var/=0.001;
	MOVLW       111
	MOVWF       R4 
	MOVLW       18
	MOVWF       R5 
	MOVLW       3
	MOVWF       R6 
	MOVLW       117
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,43 :: 		}
L_mostrar5:
;P8.c,44 :: 		if(unidades==6){
	MOVF        _unidades+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar6
;P8.c,45 :: 		Lcd_Out(1,1,"kg/cm2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,46 :: 		var/=98.039;
	MOVLW       248
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       68
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,47 :: 		}
L_mostrar6:
;P8.c,48 :: 		if(unidades==7){
	MOVF        _unidades+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_mostrar7
;P8.c,49 :: 		Lcd_Out(1,1,"kp/cm2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_P8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_P8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,50 :: 		var/=9.81;
	MOVLW       195
	MOVWF       R4 
	MOVLW       245
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FARG_mostrar_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_mostrar_var+1, 0 
	MOVWF       R1 
	MOVF        FARG_mostrar_var+2, 0 
	MOVWF       R2 
	MOVF        FARG_mostrar_var+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
;P8.c,51 :: 		}
L_mostrar7:
;P8.c,52 :: 		}
L_end_mostrar:
	RETURN      0
; end of _mostrar

_interrupt:

;P8.c,53 :: 		void interrupt(){
;P8.c,54 :: 		if(INTCON3.INT2IF ==1){   //INT. DEL MICRO
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt8
;P8.c,56 :: 		unidades++;
	INCF        _unidades+0, 1 
;P8.c,57 :: 		if(unidades>7){
	MOVF        _unidades+0, 0 
	SUBLW       7
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt9
;P8.c,58 :: 		unidades=0;
	CLRF        _unidades+0 
;P8.c,59 :: 		}
L_interrupt9:
;P8.c,61 :: 		INTCON3.INT2IF =0;
	BCF         INTCON3+0, 1 
;P8.c,62 :: 		}
L_interrupt8:
;P8.c,63 :: 		if(INTCON.TMR0IF==1){   //Timer
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt10
;P8.c,64 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P8.c,65 :: 		TMR0H=(3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P8.c,66 :: 		TMR0L=3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P8.c,67 :: 		ADCON0.GO=1;
	BSF         ADCON0+0, 2 
;P8.c,69 :: 		}
L_interrupt10:
;P8.c,70 :: 		if(PIR1.ADIF==1){   //Interrupcion del conversor AD
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt11
;P8.c,71 :: 		var=(ADRESH<<8)+ADRESL;
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _var+0 
	MOVF        R1, 0 
	MOVWF       _var+1 
	MOVF        R2, 0 
	MOVWF       _var+2 
	MOVF        R3, 0 
	MOVWF       _var+3 
;P8.c,72 :: 		var = mostrar(var);
	MOVF        R0, 0 
	MOVWF       FARG_mostrar_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_mostrar_var+1 
	MOVF        R2, 0 
	MOVWF       FARG_mostrar_var+2 
	MOVF        R3, 0 
	MOVWF       FARG_mostrar_var+3 
	CALL        _mostrar+0, 0
	MOVF        R0, 0 
	MOVWF       _var+0 
	MOVF        R1, 0 
	MOVWF       _var+1 
	MOVF        R2, 0 
	MOVWF       _var+2 
	MOVF        R3, 0 
	MOVWF       _var+3 
;P8.c,73 :: 		FLOATtoSTR(var,txt);
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
;P8.c,74 :: 		Lcd_Out(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P8.c,75 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;P8.c,77 :: 		}
L_interrupt11:
;P8.c,78 :: 		}
L_end_interrupt:
L__interrupt16:
	RETFIE      1
; end of _interrupt

_main:

;P8.c,80 :: 		void main() {
;P8.c,81 :: 		TRISB.B2=1;
	BSF         TRISB+0, 2 
;P8.c,82 :: 		TRISE.B0=1;
	BSF         TRISE+0, 0 
;P8.c,83 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;P8.c,84 :: 		INTCON.PEIE=0;
	BCF         INTCON+0, 6 
;P8.c,85 :: 		RCON.IPEN=0;
	BCF         RCON+0, 7 
;P8.c,86 :: 		INTCON2.INTEDG2=1;
	BSF         INTCON2+0, 4 
;P8.c,87 :: 		INTCON3.INT2IF=0;
	BCF         INTCON3+0, 1 
;P8.c,88 :: 		INTCON3.INT2IE=1;
	BSF         INTCON3+0, 4 
;P8.c,89 :: 		ADCON1=0x80;
	MOVLW       128
	MOVWF       ADCON1+0 
;P8.c,90 :: 		ADCON0=0xA9;
	MOVLW       169
	MOVWF       ADCON0+0 
;P8.c,91 :: 		PIR1.ADIF=0;
	BCF         PIR1+0, 6 
;P8.c,92 :: 		PIE1.ADIE=1;
	BSF         PIE1+0, 6 
;P8.c,93 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;P8.c,94 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;P8.c,95 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;P8.c,96 :: 		LCD_INIT();
	CALL        _Lcd_Init+0, 0
;P8.c,97 :: 		T0CON=0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;P8.c,98 :: 		TMR0H=(3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P8.c,99 :: 		TMR0L=3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P8.c,100 :: 		while(1);
L_main12:
	GOTO        L_main12
;P8.c,101 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
