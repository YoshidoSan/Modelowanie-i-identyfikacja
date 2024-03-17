ud = [-1:0.1:1];
y = 1.76 - 0.88*ud + 0.96*ud.^2 + 10.4*ud.^3;
plot(ud,y);
grid on;
xlabel('ud');
ylabel('K');   
title('Wzmocnienie statyczne K(ud)');
%print("K.png","-dpng","-r400")
