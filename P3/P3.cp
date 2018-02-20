#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes 9 a 11/P3/P3.c"
void main() {

 int a=0;
 RBPU_bit=0;
 TRISB.B0=1;
 TRISB.B1=0;

 while(1){

 if (PORTB.B0==0 && a==0){
 PORTB.B1=~PORTB.B1;
 a=1;
 }
 else if (PORTB.B0==1 && a==1){
 a=0;
 }
}
}
