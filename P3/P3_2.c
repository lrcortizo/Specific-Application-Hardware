void interrupt(){

  INTCON.INT0IF=0;
  PORTB.B1=~PORTB.B1;

}
void main() {

   TRISB.B0=1;
   TRISB.B1=0;
   RBPU_bit=0;
   INTCON.INT0IF=0;
   INTCON.INT0IE=1;
   INTCON.GIE=1;
   while(1);
}