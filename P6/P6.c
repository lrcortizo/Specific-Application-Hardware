unsigned char flag=0;

void interrupt(){
     T0CON.B7=0;
     if(flag==0){
          PORTC.B0=0;
          TMR0L=81;
          flag++;
     }
     else{
          PORTC.B0=1;
          TMR0L=181;
          flag=0;
     }
     T0CON.B7=1;
     INTCON.TMR0IF=0;
}

void main() {

     TRISC=0;

     INTCON.PEIE = 0;
     RCON.IPEN = 0;
    INTCON.TMR0IF=0;
    INTCON.TMR0IE=1;
    T0CON=0xC2;
    TMR0L=81;
     PORTC.B0=1;
    INTCON.GIE=1;

    while(1){
    }
}