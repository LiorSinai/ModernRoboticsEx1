%%% Lior Sinai and Juan Pablo Avelar Luna
%%% 10 June 2018
%%% Calculate skew function of a vector

function xtilde= tilde(x)

    %if all(size(x)~=([3 1]))
    %    error('input vector is not a 3x1 vector')
    %end

    xtilde=[0 -x(3) x(2); x(3) 0 -x(1); -x(2) x(1) 0; ] ;

end

And go back!
