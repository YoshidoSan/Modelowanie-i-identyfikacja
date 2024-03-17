T=0.5;
u1=out.simout.time;
y1=out.simout.signals.values;
plot(u1,y1, 'r');
hold on;
grid on;
u2=out.simout1.time;
y2=out.simout1.signals.values;
stairs(u2,y2, 'b');
title('Odpowiedź układu na skok sygnału sterującego');
xlabel('czas');
ylabel('y');
legend('ciągły','dyskretny', 'Location','southeast');
%print("t01.png","-dpng","-r400")