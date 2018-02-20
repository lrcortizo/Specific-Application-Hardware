#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P8B/P8B.c"
float aux=0;
char txt[14];
float ab=0.0;
float ac=0.0;

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void interrupt(){
 if(INTCON.TMR0IF){
 INTCON.TMR0IF=0;
 TMR0H=(3036>>8);
 TMR0L=3036;
 ADCON0.GO=1;
 }
 if(PIR1.ADIF){
 PIR1.ADIF=0;
 aux=(ADRESH<<8)+ADRESL;
 aux=aux*0.0048828;
 ab=270000.0*((5.0/aux)-1.0);
 ac=1.0/(2.5316e-4*log(ab/15000.0)+0.0033);
 ac=ac-273.15;
 lcd_cmd(_lcd_clear);
 floattostr(ac,txt);
 Lcd_out(1,1,txt);

 }
}

void main() {
 TRISA.B1=1;
 ADCON0=0x49;
 ADCON1=0xC0;
 lcd_init();
 PIR1.ADIF=0;
 PIE1.ADIE=1;
 INTCON.PEIE = 1;
 INTCON.TMR0IF=0;
 INTCON.TMR0IE=1;
 INTCON.GIE=1;
 T0CON=0X83;
 TMR0H=(3036>>8);
 TMR0L=3036;


 while(1);

}
