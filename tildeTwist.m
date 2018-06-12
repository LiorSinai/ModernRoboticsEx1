%%% Lior Sinai and Juan Pablo Avelar Luna
%%% 10 June 2018
%%% Calculate skew function of a Twist

function xtilde= tildeTwist(T)

    omega=T(1:3);
    v    =T(4:6);
    xtilde=[tilde(omega) v; 0 0 0 0];

end