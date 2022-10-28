function [ S, PayoffCall,PayoffPut,Call,Put] = Binomial( S0,K,r,T,Sigma,N )
  
   dt = T/N;
   u = exp(Sigma*sqrt(dt));
   d=exp(-Sigma*sqrt(dt));
   p = (exp(r*dt)-d)/(u-d);
   S = zeros(2*N+1,N+1);
   S(N+1) = S0;
   for j = 1:N
       for i = N+1-j+1:2:N+1+j-1
           S(i+1,j+1) = u*S(i,j);
           S(i+1,j+1) = d*S(i,j);
       end
   end
   PayoffCall = zeros(2*N+1,N+1);
   PayoffPut = zeros(2*N+1,N+1);
   for i=1:2:2*N+1
       PayoffCall(i,N+1) = max(S(i,N+1)-K,0);
       PayoffPut(i,N+1) = max(K-S(i,N+1),0);
   end
   for j = N:1:1
       for i = N+1-j+1:2:N+1+j-1
           PayoffCall(i,j) = exp(-r*dt)*(p*PayoffCall(i-1,j+1)+(1-p)*PayoffCall(i+1,j+1));
           PayoffPut(i,j) = exp(-r*dt)*(p*PayoffPut(i-1,j+1)+(1-p)*PauoffPut(i+1,j+1));
       end
   end
   Call = PayoffCall(N+1,1);
   Put = PayoffPut(N+1,1);
   
end

