#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P8/P8.c"
unsigned short unidades=0;
float var=0.0;
char txt [14];

sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D4 at RC4_bit;

sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D7_Direction at TRISC7_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D4_Direction at TRISC4_bit;

float mostrar(float var){
var=0.10718493*var+10.5;
 if(unidades==0){
 Lcd_Out(1,1,"kPa");
 }
 if(unidades==1){
 Lcd_Out(1,1,"Psi");
 var/=6.8927;
 }
 if(unidades==2){
 Lcd_Out(1,1,"Atm");
 var/=101.325;
 }
 if(unidades==3){
 Lcd_Out(1,1,"mBar");
 var/=0.1;
 }
 if(unidades==4){
 Lcd_Out(1,1,"mmHg");
 var/=0.13328;
 }
 if(unidades==5){
 Lcd_Out(1,1,"N/m2");
 var/=0.001;
 }
 if(unidades==6){
 Lcd_Out(1,1,"kg/cm2");
 var/=98.039;
 }
 if(unidades==7){
 Lcd_Out(1,1,"kp/cm2");
 var/=9.81;
 }
}
void interrupt(){
 if(INTCON3.INT2IF ==1){

 unidades++;
 if(unidades>7){
 unidades=0;
 }

 INTCON3.INT2IF =0;
 }
 if(INTCON.TMR0IF==1){
 INTCON.TMR0IF=0;
 TMR0H=(3036>>8);
 TMR0L=3036;
 ADCON0.GO=1;

 }
 if(PIR1.ADIF==1){
 var=(ADRESH<<8)+ADRESL;
 var = mostrar(var);
 FLOATtoSTR(var,txt);
 Lcd_Out(2,1,txt);
 PIR1.ADIF=0;

 }
}

void main() {
 TRISB.B2=1;
 TRISE.B0=1;
 INTCON2.RBPU=0;
 INTCON.PEIE=0;
 RCON.IPEN=0;
 INTCON2.INTEDG2=1;
 INTCON3.INT2IF=0;
 INTCON3.INT2IE=1;
 ADCON1=0x80;
 ADCON0=0xA9;
 PIR1.ADIF=0;
 PIE1.ADIE=1;
 INTCON.TMR0IF=0;
 INTCON.TMR0IE=1;
 INTCON.GIE=1;
 LCD_INIT();
 T0CON=0x84;
 TMR0H=(3036>>8);
 TMR0L=3036;
 while(1);
}
