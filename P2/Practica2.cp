#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P2/Practica2.c"
void main() {

int unidades;
int decenas;
int i;
char numeros [] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};

TRISC=0;
PORTC=0;
TRISD=0;
PORTD=0;

while(1){

if (unidades==10){

 unidades=0;
 decenas++;
}
if (decenas==6){

 decenas=0;
}
for (i=0; i<25; i++){

 PORTD=0x01;
 PORTC=numeros[unidades];
 DELAY_MS(20);
 PORTD=0x02;
 PORTC=numeros[decenas];
 DELAY_MS(20);
}
unidades++;
}
}
