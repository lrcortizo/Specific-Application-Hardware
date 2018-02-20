#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P3/P3_3.c"
unsigned short unidades=0;
unsigned short decenas=0;

void interrupt(){

 INTCON.INT0IF=0;
 unidades++;
 if(unidades==10){
 unidades=0;
 decenas++;
} if (decenas==10){
 decenas=0;
}

}
void main() {
 char num []= {0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
 TRISA=0;
 PORTA=0;
 TRISD=0;
 PORTD=0;
 TRISB.B0=1;
 TRISB.B1=0;
 RBPU_bit=0;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.GIE=1;

 while(1){

 PORTA=0X02;
 PORTD=num[unidades];
 DELAY_MS(20);
 PORTA=0X01;
 PORTD=num[decenas];
 DELAY_MS(20);
}}
