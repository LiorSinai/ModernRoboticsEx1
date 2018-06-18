%q are angles of actuators
%L are lengths of the arms
function J = getJacobian(q,L)
    %T(i)=(adjoint_lie of homogeneous matrix(i-1) to 0) times (unit_twist from
    %i to i-1 expressed in i-1)
    J = zeros(6,length(q));
    %use get H matrices
    H0_0 = eye(4);
    [H0_1, H0_2, H0_3]=getHmatrices(q,L);
    %all norm(omega) = 1;MUST REQUIREMENT
    omega1          = [0 0 1];
    r1              = [0 0 0];
    %twists must be represented with respect to the last link
    unit_twist0_1   = [omega1 cross(r1,omega1)]';
    omega2          = [1 0 0];
    r2              = [0 0 L(1)];
    unit_twist1_2   = [omega2 cross(r2,omega2)]';
    omega3          = [1 0 0];
    r3              = [0 0 L(2)];
    unit_twist2_3   = [omega3 cross(r3,omega3)]';

    J(:,1) = Adjoint(H0_0)*unit_twist0_1;
    J(:,2) = Adjoint(H0_1)*unit_twist1_2;
    J(:,3) = Adjoint(H0_2)*unit_twist2_3;
end