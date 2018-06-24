%%% Lior Sinai and Juan Pablo Avelar Luna
%%% 10 June 2018
%%% Calculate exponential of a twist

function H= expTwist(T,q)
    omega=T(1:3);
    v    =T(4:6);
    
    if norm(omega)~=0
        R=rodriguez(omega,q) ;
        %omega=q*omega;
        %v=q*v;
        H=[R ((eye(3)-R)*(cross(omega,v))+q*omega'*v*omega)/norm(omega)^2; 0 0 0 1];
        %note: invalid if norm(omega)=0
    else
        % a translation only
        H=[eye(3) v*q; 0 0 0 1]; 
    end
    
end


function R=rodriguez(omega,q)

    omega_norm = omega/norm(omega); 
    W=tilde(omega_norm);
    theta =q*norm(omega);

    %Rodriguez formula
    R=eye(3)+W*sin(theta)+W^2*(1-cos(theta));

end