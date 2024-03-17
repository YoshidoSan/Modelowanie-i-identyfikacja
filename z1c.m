filename = 'danestat1.txt';
[data,delimiterOut]=importdata(filename);
trainingData=data(1:2:end,:);
validationData=data(2:2:end,:);
trainingDataU=trainingData(:,1);
trainingDataY=trainingData(:,2);
validationDataU=validationData(:,1);
validationDataY=validationData(:,2);

degree=12;
M=ones(100,degree+1);
for i=1:degree
    M(:,i+1) = trainingDataU(:,1).^i;
end
Y=trainingDataY;
W=M\Y;

Mt=ones(100,degree+1);
for j=1:degree
    Mt(:,j+1) = trainingDataU(:,1).^j;
end
Mv=ones(100,degree+1);
for k=1:degree
    Mv(:,k+1) = validationDataU(:,1).^k;
end
Yt=trainingDataY;
Yv=validationDataY;
trainingError=(norm(Mt*W-Yt))^2;
validationError=(norm(Mv*W-Yv))^2;

u=[-1:0.01:1];
y=W(1);
for l=1:degree
    y=y+W(l+1)*u.^l;
end

figure
plot(trainingDataU,trainingDataY,'.blue');
hold on
plot(u,y,'red');
title('charakterystyka statyczna modelu na tle danych uczących');
xlabel('u');
ylabel('y');
%print("z1cguducz.png","-dpng","-r400")

Ymt=Mt*W;
figure
plot(trainingDataU,'red');
hold on
plot(trainingDataY,'blue');
plot(Ymt(:),'green');
title('wyjście modelu na tle danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
%print("z1cgudyucz.png","-dpng","-r400")

figure
plot(validationDataU,validationDataY,'.blue');
hold on
plot(u,y,'red');
title('charakterystyka statyczna modelu na tle danych weryfikujących');
xlabel('u');
ylabel('y');
%print("z1cgudwer.png","-dpng","-r400")

Ymv=Mv*W;
figure
plot(validationDataU,'red');
hold on
plot(validationDataY,'blue');
plot(Ymv(:),'green');
title('wyjście modelu na tle danych weryfikujących');
xlabel('numer próbki');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y','wyjście modelu y');
%print("z1cbadywer.png","-dpng","-r400")
