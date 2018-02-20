#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P7/P7.c"
unsigned int ab=0;
float resultado=0;
char txt[14];

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
 ab=ADRESL;
 ab=ab+(ADRESH<<8);
 resultado=0.00488758*ab;
 LCD_CMD(_LCD_CLEAR);
 FLOATTOSTR(resultado,txt);
 LCD_OUT(1,1,txt);
 delay_ms(1000);
 ADCON0.GO=1;
 PIR1.ADIF = 0;
}

void main() {

 TRISA.B0=1;
 ADCON0=0x41;
 ADCON1=0xCE;
 PIR1.ADIF = 0;
 PIE1.ADIE = 1;
 IPR1.ADIP = 0;
 INTCON.PEIE = 1;
 INTCON.GIE = 1;
 LCD_INIT();
 ADCON0.GO=1;
 while(1);
}
