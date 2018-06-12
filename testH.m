close all
% Initial variables
L=[5 12.5 12.5];
q=[pi/2 pi/4 0];

%omega=[5 1 2]'; v=[0.1 0.2 0.3]';
%T=[omega;v];
%expm(tildeTwist(T)*pi/4)-expTwist(T,pi/4) %This should be <1e-15


%Initial configuration
P0=[0 0 0 1]';

H1_0_0=[eye(3) [0 0 L(1)]'           ; 0 0 0 1];
H2_0_0=[eye(3) [0 0 L(1)+L(2)]'      ; 0 0 0 1];
H3_0_0=[eye(3) [0 0 L(1)+L(2)+L(3)]' ; 0 0 0 1];

P1=H1_0_0*P0; 
P2=H2_0_0*P0; 
P3=H3_0_0*P0; 

points=[P0 P1 P2 P3];
x=points(1,:);
y=points(2,:);
z=points(3,:);
plot3(x,y,z,'-ob','MarkerFaceColor',[0 0 1]);grid; 
xlabel('x'), ylabel('y'), zlabel('z')
set(gca,'DataAspectRatio',[1 1 1],...
        'PlotBoxAspectRatio',[1 1 1])

%Moved configuration
[H1_0, H2_0, H3_0] = getHmatrices(q, L);
P1=H1_0*P0; 
P2=H2_0*P0; 
P3=H3_0*P0; 

points2=[P0 P1 P2 P3];
x=points2(1,:);
y=points2(2,:);
z=points2(3,:);
hold on
plot3(x,y,z,'-xr','MarkerFaceColor',[1 0 0])
