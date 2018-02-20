#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P1/Practica1.c"
void main() {
 unsigned short int x = 1;
 unsigned short int y = 128;
 TRISC = 0;
 PORTC = 0;

 while(1)
 {
 PORTC = x+y;
 delay_ms(200);
 PORTC = 0;
 delay_ms(100);
 x = x*2;
 y = y/2;
 if(x==128)
 {
 x =1;
 y =128;
 }

 }

}
