classdef    LinearSystem
    properties
        A
        b
    end
    
    methods
        function LinSys = LinearSystem(A, b )
            [rA,cA]= size(A);
            [rb ,cb]= size(b);
          if rA~=cA
             error( ' E r r o r : En t e r a symm et ri c m a t r i x ! ' )
          else
             if rb~=rA || cb~=1
                 error( ' E r r o r : V e c to r must s a t i s f i e s [ Row= mat r i x d im en t i on & Column =1!] ' )
             else
                 LinSys.A=A;
                 LinSys.b=b;
             end
          end
        end
        function [L,U] = LU(A)
            [n,m]=size(A);
            if(n ~= m)
                error('Matrix must be symetric');
            else
                M = eye(n);
                L = eye(n);
                U = A;
                for i=1:n-1
                    L(i+1:n,i) = L(i+1:n,i)./U(i,i);
                    U=L*U;
                    M=M*(L^-1);
                    L=eye(n);
                end
                L=M;
            end
        end
    end
   
    
end

