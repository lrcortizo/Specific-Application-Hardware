#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P4/practica4.c"
unsigned short pos=0;
void interrupt(){
 if(INTCON.INT0IF)
 {
 if(pos==0){
 PORTC.B3 = 1;
 DELAY_MS(200);
 PORTC.B1 = 0;
 DELAY_MS(200);
 PORTC.B0 = 1;
 DELAY_MS(200);
 PORTC.B2 = 0;
 DELAY_MS(200);
 PORTC.B1 = 1;
 DELAY_MS(200);
 PORTC.B3 = 0;
 DELAY_MS(200);
 pos++;
 } else {
 PORTC.B1 = 0;
 DELAY_MS(200);
 PORTC.B0 = 0;
 PORTC.B3 = 1;
 DELAY_MS(200);
 PORTC.B3 = 0;
 PORTC.B2 = 1;
 DELAY_MS(200);
 PORTC.B2 = 0;
 PORTC.B1 = 1;
 DELAY_MS(200);
 PORTC.B1 = 0;
 PORTC.B0 = 1;
 DELAY_MS(200);
 PORTC.B0 = 0;
 PORTC.B3 = 1;
 DELAY_MS(200);
 PORTC.B3 = 0;
 PORTC.B2 = 1;
 DELAY_MS(200);
 PORTC.B2 = 0;
 PORTC.B1 = 1;
 DELAY_MS(200);
 PORTC.B0 = 1;
 DELAY_MS(200);
 pos++;
 }
 }
 INTCON.INT0IF=0;
}
void main() {
 TRISC=0;
 TRISB.B0=1;
 PORTC.B0 = 0;

 PORTC.B3 = 0;
 PORTC.B1 = 1;
 PORTC.B2 = 1;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.GIE=1;
 RBPU_BIT=0;
 while(1){}
}
