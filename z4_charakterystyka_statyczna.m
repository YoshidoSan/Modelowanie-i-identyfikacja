u=[-1:0.1:1];
y = 1.76*u - 0.44*u.^2 + 0.32*u.^3 - 2.6*u.^4;
plot(u,y);
grid on;
title('Charakterystyka statyczna y(u)');
xlabel('u');
ylabel('y');
%print("z4.png","-dpng","-r400")
