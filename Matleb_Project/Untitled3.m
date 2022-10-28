 ST=0:200;T=0:0.01:1;
 call=zeros(201,201);
 for i =1:201
 for j =1:101
 [ call( i,j),~]= blsprice(ST(i),100,0.05,T(j),0.2);
 end
 end
 Callplot=mesh(ST,T, call');
 title('3D Vanilla Call Price for ST=[0,200] & T=[0 ,1] ');
 xlabel( ' Value of SatT '); ylabel( ' Time to maturityT' ) ; zlabel( 'Call Price ');
 saveas(Callplot,'EurVanillaCallPrice. jpg');
 plot(ST,call);
 title( ' 2D Eur V a n i l l a C a l l P r i c e f o r ST=[0 ,100] & T=[0 ,1] ' );
 xlabel( 'Value of S at T ') ; ylabel(CallPrice');
 saveas(figure(2), 'EurVanillaCallPrice2D.jpg ');