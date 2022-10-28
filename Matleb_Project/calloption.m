ST=0:100;
[ call , ~]= blsprice(ST, 50 , 0.1 , 0 , 0.4 );
 Callplot=plot(ST, call);
 title( ' Eur V a n i l l a C a l l PayOff ( P r i c e at T) ' );
 xlabel( ' Value of S at T ') ; ylabel( ' PayOff ');
