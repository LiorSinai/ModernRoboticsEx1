%These function gets the velocities required for the chosen set of
%coordinates
%Lior Sinai and Juan Pablo Avelar Luna 
%13 of june 2018
%Calculate the 
function qdot = calculate_qd(q, setpoint, L)

[H0_1, H0_2, H0_3]=getHmatrices_1(q,L);

%capital P has an attached 1 lower case p doesn't
Pos3 = H0_3*[0 0 0 1]';
pos3 = Pos3(1:3);
H0_4 = [eye(3) pos3;0 0 0 1];
Pos4 = H0_4*[0 0 0 1]';
e = setpoint - Pos4(1:3);
K_v = [1 1 1]';
pdotee = K_v.*e;

 if norm(pdotee)>10
     pdotee = 10*(pdotee/norm(pdotee));
 end
%% jacobian
J       = getJacobian(q,L);
%J_t     = J'/(J*J');        %Complete pseudo-inverse
J_mark  = adjoint_lie(inv(H0_4))*J;
J_v     = J_mark(4:6,:);    %only translation velocities
J_vt    = J_v'/(J_v*J_v');  %pseudo inverse to get the qdot needed

qdot = J_vt*pdotee;
end