function [P, OptIter , Price ] = TrinEurToBls( S0 ,K, r ,T, sigma , flag )
P=zeros( 1 , 2 );
[ callbls , putbls]= blsprice(S0 ,K, r ,T, sigma ) ;
 i =1;
 [ ~ , ~ , ~ , call , put ] =TrinomialModel(S0 ,K, r ,T, sigma , i );
 switch flag
     case 1
         while abs( call -callbls) >0.001
             P( i , 1 )=i ;
             P( i , 2 )=call ;
             i=i +1;
             [ ~ , ~ , ~ , call , ~ ] =TrinomialModel(S0 ,K, r ,T, sigma , i ) ;
         end
             OptIter=i - 1 ;
             Price = P(i-1,2) ;
     case 0
         while abs ( put -  putbls ) >0.001
             P( i , 1 )=i ;
             P( i , 2 )=put ;
             [ ~ , ~ , ~ , ~ , put ] =TrinomialModel(S0 ,K, r ,T, sigma , i ) ;
         end
         OptIter=i - 1 ;
         Price=P( i - 1 , 2 ) ;
     otherwise
          error( ' E r r o r : f l a g t a k e s o n l y two v a l u e s , 0 f o r put o p t i o no r 1 f o r c a l l o p t i o n ' ) ;

 end
 end
     


