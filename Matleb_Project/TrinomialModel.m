function [ S,Payoff_Call,Payoff_Put,Call,Put ] = TrinomialModel( S0 ,K, r ,T, sigma ,N)
dt = T/N;
u = exp(sigma*sqrt(2*dt));
d=1/u;
pu = ((exp(r*dt/2)-exp(-sigma*sqrt(dt/2)))/ (exp(sigma*sqrt(dt/2))-exp ( -sigma*sqrt(dt/2))))^2 ;
pd =((exp(sigma*sqrt(dt/2))-exp(r*dt/2)) /  (exp(sigma*sqrt(dt/2))-exp(sigma*sqrt(dt/2))))^2 ;
pm = 1 -pu- pd ;
S=zeros(2*N+1,N+1);
S(N+1)=S0 ;
for j =1:N
    for i=N+1-j+1:2:N+1+j-1
        S(i-1,j +1)=u*S(i,j);
        S(i,j+1)=S(i,j);
        S(i+1,j+1)=d*S(i,j);
    end
end
Payoff_Call=zeros(2*N+1,N+1) ;
Payoff_Put=zeros(2*N+1,N+1) ;
Payoff_Call( : ,N+1)=max(S( : ,N+1)- K,0 ) ;
Payoff_Put( : ,N+1)=max(K - S( : ,N+1) , 0 ) ;
for j=N : -1 : 1
    for i=N+1-j+1:N+1+j-1
        Payoff_Call(i,j)=exp( -r * dt )*( pu*Payoff_Call( i-1 , j +1)+pm*Payoff_Call(i,j+1)+pd*Payoff_Call(i+1,j+1));
        Payoff_Put(i,j)=exp( -r * dt )*( pd*Payoff_Put( i-1 , j +1)+pm*Payoff_Put(i,j+1)+pd*Payoff_Put(i+1,j+1));
    end
end
Call=Payoff_Call(N+1,1);
Put=Payoff_Put(N+1,1);


end

