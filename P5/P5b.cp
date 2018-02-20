#line 1 "C:/Documents and Settings/Electr�nica/Escritorio/Pr�cticas HAE 15-16/Lunes 9 a 11/P5/P5b.c"
#line 1 "c:/documents and settings/electr�nica/escritorio/pr�cticas hae 15-16/lunes 9 a 11/p5/tecla12int.h"
#line 25 "c:/documents and settings/electr�nica/escritorio/pr�cticas hae 15-16/lunes 9 a 11/p5/tecla12int.h"
unsigned char tecla()
{

unsigned char columna=0, fila, aux1=0x10, aux2;

unsigned char teclado[4][3]={{49, 50, 51},{52, 53, 54},{55, 56, 57}, {42, 48, 35}};

delay_ms( 10 );

 for(fila=0; fila< 4 ; fila++)
 {
 if((PORTB&aux1)==0x00) break;
 aux1=(aux1<<1);
 }

 PORTB=0x01;

 while((PORTB& 0xF0 )!= 0xF0 )
 {
 PORTB=(PORTB<<1);
 columna++;
 }


 PORTB=0x00;

 do
 {delay_ms(2);
 }while((PORTB&0xF0)!=0xF0);



 aux2=teclado[fila][columna];
 return aux2;
}
#line 2 "C:/Documents and Settings/Electr�nica/Escritorio/Pr�cticas HAE 15-16/Lunes 9 a 11/P5/P5b.c"
unsigned char x;
unsigned short key=0;
unsigned char txt;
unsigned char flag=0;

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
 if(key==100){
 key=0;
 }
 if(flag==0){
 ByteToStr (key, txt);
 Lcd_out(1,1,txt);
 key++;
 flag++;
 } else flag=0;
 x=PORTB;
 INTCON.RBIF=0;


}
void main() {
 TRISB=0xF0;
 PORTB=0;

 INTCON2.RBPU=0;
 x=PORTB;
 INTCON.RBIF=0;
 INTCON.RBIE=1;
 INTCON.GIE=1;
 Lcd_Init ();
 while(1);
}
