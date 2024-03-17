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

typmodelu=12;
kk=length(trainingDataU);
kp=typmodelu+1;

if typmodelu==12
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 y(kp-1:kk-1) y(kp-1:kk-1).^2];
end
if typmodelu==13
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3];
end
if typmodelu==14
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 u(kp-1:kk-1).^4 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3 y(kp-1:kk-1).^4]; 
end
if typmodelu==22
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-2:kk-2) u(kp-2:kk-2).^2 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-2:kk-2) y(kp-2:kk-2).^2];
end
if typmodelu==23
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 u(kp-2:kk-2) u(kp-2:kk-2).^2 u(kp-2:kk-2).^3 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3 y(kp-2:kk-2) y(kp-2:kk-2).^2 y(kp-2:kk-2).^3];
end
if typmodelu==24
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 u(kp-1:kk-1).^4 u(kp-2:kk-2) u(kp-2:kk-2).^2 u(kp-2:kk-2).^3 u(kp-2:kk-2).^4 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3 y(kp-1:kk-1).^4 y(kp-2:kk-2) y(kp-2:kk-2).^2 y(kp-2:kk-2).^3 y(kp-2:kk-2).^4]; 
end
if typmodelu==32
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-2:kk-2) u(kp-2:kk-2).^2 u(kp-3:kk-3) u(kp-3:kk-3).^2 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-2:kk-2) y(kp-2:kk-2).^2 y(kp-3:kk-3) y(kp-3:kk-3).^2];
end
if typmodelu==33
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 u(kp-2:kk-2) u(kp-2:kk-2).^2 u(kp-2:kk-2).^3 u(kp-3:kk-3) u(kp-3:kk-3).^2 u(kp-3:kk-3).^3 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3 y(kp-2:kk-2) y(kp-2:kk-2).^2 y(kp-2:kk-2).^3 y(kp-3:kk-3) y(kp-3:kk-3).^2 y(kp-3:kk-3).^3];
end
if typmodelu==34
    M=[u(kp-1:kk-1) u(kp-1:kk-1).^2 u(kp-1:kk-1).^3 u(kp-1:kk-1).^4 u(kp-2:kk-2) u(kp-2:kk-2).^2 u(kp-2:kk-2).^3 u(kp-2:kk-2).^4 u(kp-3:kk-3) u(kp-3:kk-3).^2 u(kp-3:kk-3).^3 u(kp-3:kk-3).^4 y(kp-1:kk-1) y(kp-1:kk-1).^2 y(kp-1:kk-1).^3 y(kp-1:kk-1).^4 y(kp-2:kk-2) y(kp-2:kk-2).^2 y(kp-2:kk-2).^3 y(kp-2:kk-2).^4 y(kp-3:kk-3) y(kp-3:kk-3).^2 y(kp-3:kk-3).^3 y(kp-3:kk-3).^4];
end

w=M\y(kp:kk);

ymod_arx(1:kp-1)=y(1:kp-1);
ymod_oe(1:kp-1)=y(1:kp-1);

for k=kp:kk
    if typmodelu==12
        ymod_arx(k)=[u(k-1) u(k-1)^2 y(k-1) y(k-1)^2]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 ymod_oe(k-1) ymod_oe(k-1)^2]*w;
    end
    if typmodelu==13
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 y(k-1) y(k-1)^2 y(k-1)^3]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3]*w;
    end
    if typmodelu==14
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 y(k-1) y(k-1)^2 y(k-1)^3 y(k-1)^4]*w; 
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-1)^4]*w; 
    end
    if typmodelu==22
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 y(k-1) y(k-1)^2 y(k-2) y(k-2)^2]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-2) ymod_oe(k-2)^2]*w;
    end
    if typmodelu==23
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2).^2 u(k-2)^3 y(k-1) y(k-1)^2 y(k-1)^3 y(k-2) y(k-2)^2 y(k-2)^3]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2)^2 u(k-2)^3 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3]*w;
    end
    if typmodelu==24
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 y(k-1) y(k-1)^2 y(k-1)^3 y(k-1)^4 y(k-2) y(k-2)^2 y(k-2)^3 y(k-2)^4]*w; 
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-1)^4 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3 ymod_oe(k-2)^4]*w; 
    end
    if typmodelu==32
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 u(k-3) u(k-3)^2 y(k-1) y(k-1)^2 y(k-2) y(k-2)^2 y(k-3) y(k-3)^2]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 u(k-3) u(k-3)^2 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-3) ymod_oe(k-3)^2]*w;
    end
    if typmodelu==33
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2)^2 u(k-2)^3 u(k-3) u(k-3)^2 u(k-3)^3 y(k-1) y(k-1)^2 y(k-1)^3 y(k-2) y(k-2)^2 y(k-2)^3 y(k-3) y(k-3)^2 y(k-3)^3]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2)^2 u(k-2)^3 u(k-3) u(k-3)^2 u(k-3)^3 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3 ymod_oe(k-3) ymod_oe(k-3)^2 ymod_oe(k-3)^3]*w;
    end
    if typmodelu==34
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 u(k-3) u(k-3)^2 u(k-3)^3 u(k-3)^4 y(k-1) y(k-1)^2 y(k-1)^3 y(k-1)^4 y(k-2) y(k-2)^2 y(k-2)^3 y(k-2)^4 y(k-3) y(k-3)^2 y(k-3)^3 y(k-3)^4]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 u(k-3) u(k-3)^2 u(k-3)^3 u(k-3)^4 ymod_oe(k-1) ymod_oe(k-1)^2 y(k-1)^3 ymod_oe(k-1)^4 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3 ymod_oe(k-2)^4 ymod_oe(k-3) ymod_oe(k-3)^2 ymod_oe(k-3)^3 ymod_oe(k-3)^4]*w;

    end
end
ucz_arx_Error=(norm(ymod_arx'-y))^2;
ucz_oe_Error=(norm(ymod_oe'-y))^2;

figure
subplot(2,1,1)
hold on
plot(trainingDataY,'blue');
plot(ymod_arx(:),'green');
title('wyjście modelu arx na tle danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
subplot(2,1,2)
hold on
plot(trainingDataY,'blue');
plot(ymod_oe(:),'green');
title('wyjście modelu oe na tle danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
%print("z2cucz34.png","-dpng","-r400")



u=validationDataU;
y=validationDataY;

ymod_arx(1:kp-1)=y(1:kp-1);
ymod_oe(1:kp-1)=y(1:kp-1);

for k=kp:kk
    if typmodelu==12
        ymod_arx(k)=[u(k-1) u(k-1)^2 y(k-1) y(k-1)^2]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 ymod_oe(k-1) ymod_oe(k-1)^2]*w;
    end
    if typmodelu==13
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 y(k-1) y(k-1)^2 y(k-1)^3]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3]*w;
    end
    if typmodelu==14
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 y(k-1) y(k-1)^2 y(k-1)^3 y(k-1)^4]*w; 
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-1)^4]*w; 
    end
    if typmodelu==22
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 y(k-1) y(k-1)^2 y(k-2) y(k-2)^2]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-2) ymod_oe(k-2)^2]*w;
    end
    if typmodelu==23
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2).^2 u(k-2)^3 y(k-1) y(k-1)^2 y(k-1)^3 y(k-2) y(k-2)^2 y(k-2)^3]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2)^2 u(k-2)^3 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3]*w;
    end
    if typmodelu==24
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 y(k-1) y(k-1)^2 y(k-1)^3 y(k-1)^4 y(k-2) y(k-2)^2 y(k-2)^3 y(k-2)^4]*w; 
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-1)^4 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3 ymod_oe(k-2)^4]*w; 
    end
    if typmodelu==32
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 u(k-3) u(k-3)^2 y(k-1) y(k-1)^2 y(k-2) y(k-2)^2 y(k-3) y(k-3)^2]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-2) u(k-2)^2 u(k-3) u(k-3)^2 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-3) ymod_oe(k-3)^2]*w;
    end
    if typmodelu==33
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2)^2 u(k-2)^3 u(k-3) u(k-3)^2 u(k-3)^3 y(k-1) y(k-1)^2 y(k-1)^3 y(k-2) y(k-2)^2 y(k-2)^3 y(k-3) y(k-3)^2 y(k-3)^3]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-2) u(k-2)^2 u(k-2)^3 u(k-3) u(k-3)^2 u(k-3)^3 ymod_oe(k-1) ymod_oe(k-1)^2 ymod_oe(k-1)^3 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3 ymod_oe(k-3) ymod_oe(k-3)^2 ymod_oe(k-3)^3]*w;
    end
    if typmodelu==34
        ymod_arx(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 u(k-3) u(k-3)^2 u(k-3)^3 u(k-3)^4 y(k-1) y(k-1)^2 y(k-1)^3 y(k-1)^4 y(k-2) y(k-2)^2 y(k-2)^3 y(k-2)^4 y(k-3) y(k-3)^2 y(k-3)^3 y(k-3)^4]*w;
        ymod_oe(k)=[u(k-1) u(k-1)^2 u(k-1)^3 u(k-1)^4 u(k-2) u(k-2)^2 u(k-2)^3 u(k-2)^4 u(k-3) u(k-3)^2 u(k-3)^3 u(k-3)^4 ymod_oe(k-1) ymod_oe(k-1)^2 y(k-1)^3 ymod_oe(k-1)^4 ymod_oe(k-2) ymod_oe(k-2)^2 ymod_oe(k-2)^3 ymod_oe(k-2)^4 ymod_oe(k-3) ymod_oe(k-3)^2 ymod_oe(k-3)^3 ymod_oe(k-3)^4]*w;

    end
end
wer_arx_Error=(norm(ymod_arx'-y))^2;
wer_oe_Error=(norm(ymod_oe'-y))^2;

figure
subplot(2,1,1)
hold on
plot(validationDataY,'blue');
plot(ymod_arx(:),'green');
title('wyjście modelu arx na tle danych weryfikujących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
subplot(2,1,2)
hold on
plot(validationDataY,'blue');
plot(ymod_oe(:),'green');
title('wyjście modelu oe na tle danych weryfikujących');
xlabel('numer próbki');
ylabel('amplituda');
%legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
%print("z2cwer34.png","-dpng","-r400")