filename1 = 'danedynucz1.txt';
[data1,delimiterOut]=importdata(filename1);
trainingDataU=data1(:,1);
trainingDataY=data1(:,2);
filename2 = 'danedynwer1.txt';
[data2,delimiterOut]=importdata(filename2);
validationDataU=data2(:,1);
validationDataY=data2(:,2);      

u=validationDataU;
y=validationDataY;
typmodelu=34;
kk=length(trainingDataU);
kp=typmodelu+1;

M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 u(kp-1:kk-1).^4 u(kp-2:kk-2) u(kp-2:kk-2).^2 u(kp-2:kk-2).^3 u(kp-2:kk-2).^4 u(kp-3:kk-3) u(kp-3:kk-3).^2 u(kp-3:kk-3).^3 u(kp-3:kk-3).^4 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3 y(kp-1:kk-1).^4 y(kp-2:kk-2) y(kp-2:kk-2).^2 y(kp-2:kk-2).^3 y(kp-2:kk-2).^4 y(kp-3:kk-3) y(kp-3:kk-3).^2 y(kp-3:kk-3).^3 y(kp-3:kk-3).^4];   
w=M\y(kp:kk);
clear u
%syms u;
f = @(u,ymod_oe)(w(1)+w(5)+w(9))*u+(w(2)+w(6)+w(10))*u.^2 + (w(3)+w(7)+w(11))*u.^3 + (w(4)+w(8)+w(12))*u.^4 + (w(13)+w(17)+w(21))*ymod_oe + (w(14)+w(18)+w(22))*ymod_oe.^2 + (w(15)+w(19)+w(24))*ymod_oe.^3 + (w(16)+w(20)+w(24))*ymod_oe.^4;
G = linspace(-4,4, 1000).';
for i=1:numel(G)
solve = fsolve(@(ymod_oe)f(G(i),ymod_oe),[0,1]);
x(i,:) = solve;
end 
figure
plot(G,x(:,1))
xlabel('u');
xlim([-3.5,3.5]);
ylabel('y');
title('charakterystyka statyczna y(u)');
%print("z2d.png","-dpng","-r400")