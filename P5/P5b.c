#include "Tecla12INT.h"
unsigned char x;
unsigned short key=0;
unsigned char txt;
unsigned char flag=0;
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

    if(flag==0){
     ByteToStr (key, txt);
     Lcd_out(1,1,txt);
     key++;
    if(key==100){
          key=0;
    }
     flag++;
     } else flag=0;
     x=PORTB; //hay que leer el puerto B para poder borrar el bit RBIF (define x global)
    INTCON.RBIF=0;//Al borrar el bit RBIF despues de llamar a la funcion tecla, nos
          //aseguramos que después de soltar la tecla éste bit se pone a 0.

}
void main() {
     TRISB=0xF0;  //el nibble alto son entradas y el nibble bajo son salidas
  PORTB=0;
  // Configuracion interrupcion RB4-RB7
   INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB
   x=PORTB;//para poder borrar el RBIF
   INTCON.RBIF=0;
   INTCON.RBIE=1;
   INTCON.GIE=1;
   Lcd_Init ();
   while(1);
}