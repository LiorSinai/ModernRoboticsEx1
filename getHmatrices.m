%%% Lior Sinai and Juan Pablo Avelar Luna
%%% 10 June 2018
%%% Calculate the end effector position using Brockett's formula


function [H0_1, H0_2, H0_3] = getHmatrices(q, L)
    
    %Define unit twists
    omega_unit=[0 0 1]'; r=[0 0 0]';
    T100 = [omega_unit; cross(r,omega_unit)];
    
    omega_unit=[1 0 0]'; r=[0 0 L(1)]';
    T210 = [omega_unit; cross(r,omega_unit)];
    
    omega_unit=[1 0 0]'; r=[0 0 L(1)+L(2)]';
    T320 = [omega_unit; cross(r,omega_unit)];
   
    %Assume the arm is pointing straight up
    H0_1_0=[eye(3) [0 0 L(1)]'           ; 0 0 0 1];
    H0_2_0=[eye(3) [0 0 L(1)+L(2)]'      ; 0 0 0 1];
    H0_3_0=[eye(3) [0 0 L(1)+L(2)+L(3)]' ; 0 0 0 1];
    
   % Calculate the H matrices
    H0_1 = expTwist(T100,q(1))*H1_0_0;
    H0_2 = expTwist(T100,q(1))*expTwist(T210,q(2))*H2_0_0;
    H0_3 = expTwist(T100,q(1))*expTwist(T210,q(2))*expTwist(T320,q(3))*H3_0_0; 

end


