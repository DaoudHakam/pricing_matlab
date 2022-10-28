function [ S ] = BinTree( S0,u,d,N )
    S = zeros(2*N+1,N+1);
    S(N+1,1) = S0;
    for j = 1:N
        for i = N+1-j+1:2:N+1+j-1
            S(i-1,j+1) = u*S(i,j);
            S(i+1,j+1) = d*S(i,j);
        end
    end
end

