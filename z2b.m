filename1 = 'danedynucz1.txt';
[data1,delimiterOut]=importdata(filename1);
trainingDataU=data1(:,1);
trainingDataY=data1(:,2);

filename2 = 'danedynwer1.txt';
[data2,delimiterOut]=importdata(filename2);
validationDataU=data2(:,1);
validationDataY=data2(:,2);

u=trainingDataU;
y=trainingDataY;

typmodelu=1;
kk=length(trainingDataU);
kp=typmodelu+1;

if typmodelu==1
    M=[u(kp-1:kk-1) y(kp-1:kk-1)];
end
if typmodelu==2
    M=[u(kp-1:kk-1) u(kp-2:kk-2) y(kp-1:kk-1) y(kp-2:kk-2)];
end
if typmodelu==3
    M=[u(kp-1:kk-1) u(kp-2:kk-2) u(kp-3:kk-3) y(kp-1:kk-1) y(kp-2:kk-2) y(kp-3:kk-3)]; 
end
w=M\y(kp:kk);

ymod_arx(1:kp-1)=y(1:kp-1);
ymod_oe(1:kp-1)=y(1:kp-1);

for k=kp:kk
    if typmodelu==1
        ymod_arx(k)=w(1)*u(k-1)+w(2)*y(k-1);
        ymod_oe(k)=w(1)*u(k-1)+w(2)*ymod_oe(k-1);
    end
    if typmodelu==2
        ymod_arx(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*y(k-1)+w(4)*y(k-2);
        ymod_oe(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*ymod_oe(k-1)+w(4)*ymod_oe(k-2);
    end
    if typmodelu==3
        ymod_arx(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*u(k-3)+w(4)*y(k-1)+w(5)*y(k-2)+w(6)*y(k-3);
        ymod_oe(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*u(k-3)+w(4)*ymod_oe(k-1)+w(5)*ymod_oe(k-2)+w(6)*ymod_oe(k-3);
    end
end
ucz_arx_Error=(norm(ymod_arx'-y))^2;
ucz_oe_Error=(norm(ymod_oe'-y))^2;

figure
subplot(2,1,1)
%plot(trainingDataU,'red');
hold on
plot(trainingDataY,'blue');
plot(ymod_arx(:),'green');
title('wyjście modelu arx na tle danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
subplot(2,1,2)
%plot(trainingDataU,'red');
hold on
plot(trainingDataY,'blue');
plot(ymod_oe(:),'green');
title('wyjście modelu oe na tle danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
%print("z2bucz3.png","-dpng","-r400")

u=validationDataU;
y=validationDataY;

ymod_arx(1:kp-1)=y(1:kp-1);
ymod_oe(1:kp-1)=y(1:kp-1);

for k=kp:kk
    if typmodelu==1
        ymod_arx(k)=w(1)*u(k-1)+w(2)*y(k-1);
        ymod_oe(k)=w(1)*u(k-1)+w(2)*ymod_oe(k-1);
    end
    if typmodelu==2
        ymod_arx(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*y(k-1)+w(4)*y(k-2);
        ymod_oe(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*ymod_oe(k-1)+w(4)*ymod_oe(k-2);
    end
    if typmodelu==3
        ymod_arx(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*u(k-3)+w(4)*y(k-1)+w(5)*y(k-2)+w(6)*y(k-3);
        ymod_oe(k)=w(1)*u(k-1)+w(2)*u(k-2)+w(3)*u(k-3)+w(4)*ymod_oe(k-1)+w(5)*ymod_oe(k-2)+w(6)*ymod_oe(k-3);
    end
end
wer_arx_Error=(norm(ymod_arx'-y))^2;
wer_oe_Error=(norm(ymod_oe'-y))^2;

figure
subplot(2,1,1)
%plot(trainingDataU,'red');
hold on
plot(validationDataY,'blue');
plot(ymod_arx(:),'green');
title('wyjście modelu arx na tle danych weryfikujących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
subplot(2,1,2)
%plot(trainingDataU,'red');
hold on
plot(validationDataY,'blue');
plot(ymod_oe(:),'green');
title('wyjście modelu oe na tle danych weryfikujących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
%print("z2bwer3.png","-dpng","-r400")

format long