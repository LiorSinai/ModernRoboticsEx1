%%% Lior Sinai and Juan Pablo Avelar Luna
%%% 10 June 2018
%%% Calculate the Adjoint matrix of a homogenous H matrix

function Adj = Adjoint(H)
    
    R=H(1:3,1:3);
    p=H(1:3,4);
    
    Adj=[R zeros(3,3); tilde(p)*R R];

end
