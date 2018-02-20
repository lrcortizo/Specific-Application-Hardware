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