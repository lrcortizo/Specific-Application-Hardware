unsigned int cb=0;
float resultado=0;
char txt[14];
// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void interrupt(){
   if(INTCON.TMR0IF==1){
       TMR0H=0x0B;
       TMR0L=0xDC;
       ADCON0.GO=1;
       INTCON.TMR0IF=0;
   }
   if(PIR1.ADIF==1){
       cb=ADRESL;
       cb=cb+(ADRESH<<8);
       resultado=0.488758*cb;
       FLOATTOSTR(resultado,txt);
       LCD_OUT(1,1,txt);
       PIR1.ADIF = 0;
   }
}

void main() {

   PORTD.B0=0;
   TRISE.B1=1;
   ADCON0=0x71;
   ADCON1=0xC0;
   PIR1.ADIF = 0;
   PIE1.ADIE = 1;
   INTCON.PEIE = 1;
   T0CON=0x05;
   INTCON.TMR0IF=0;
   INTCON.TMR0IE=1;
   TMR0H=0x0B;
   TMR0L=0xDC;
      INTCON.GIE = 1;
   LCD_INIT();
   T0CON.TMR0ON=1;

   ADCON0.GO=1;
   while(1);
}