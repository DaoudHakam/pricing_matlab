function [ CallValue ] = MonteCarlo( K,T,S,sig,r,M,N)

dt = T/N;
nudt = (r-0.5*sig^2)*dt;
sigsdt = sig*sqrt(dt);
sum_CT = 0;
for j=1:M
    St = S;
    for i=1:N    
        s=normrnd(0,1);
        St = St*exp(nudt+sigsdt*s);
    end

CT = max(0,St-K);
sum_CT = sum_CT + CT;
%sum_CT2 =sum_CT2 +CT*CT;
end
CallValue = sum_CT/M*exp(-r*T);

        
    
    


end

