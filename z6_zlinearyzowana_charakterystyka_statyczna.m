u = [-1:0.1:1];
ud = -1;
y = 1.76*u - 0.44*u.^2 + 0.32*u.^3 - 2.6*u.^4;
yzl = (1.76 - 0.88*ud + 0.96*ud^2 - 10.56*ud^3)*u + 0.44*ud^2 - 0.64*ud^3 +7.92*ud^4;
plot(u,y);
hold on;
grid on;
plot(u,yzl);
title('Charakterystyka statyczna i charakterystyka zlinearyzowana');
xlabel('ud');
ylabel('y'); 
%print("z5_-1.png","-dpng","-r400")

