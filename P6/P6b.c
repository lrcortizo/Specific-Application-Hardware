unsigned short cont = 0;
void interrupt(){
     if(INTCON3.INT1IF==1){
         INTCON3.INT1IF=0;
         INTCON3.INT1IE=0;
         T0CON.B7=1;
         PORTC.B0=1;
    }
    if(INTCON.TMR0IF==1){
       INTCON.TMR0IF=0;
       TMR0H=(3036>>8);
       TMR0L=3036;
       cont++;
       if(cont==60){
       T0CON.B7=0;
       PORTC.B0=0;
       }
    }
}
void main() {
   TRISB.B1=1;
   TRISC.B0=0;
   PORTC.B0=0;
   T0CON=0x04;
   TMR0H=(3036>>8);
   TMR0L=3036;
   INTCON.PEIE = 0;
   RCON.IPEN = 0;
   INTCON2.INTEDG1=1;
   INTCON3.INT1IF = 0;
   INTCON3.INT1IE = 1;
   INTCON.TMR0IF=0;
   INTCON.TMR0IE=1;
   INTCON.GIE=1;
   while(1);
}
