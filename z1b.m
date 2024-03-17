filename = 'danestat1.txt';
[data,delimiterOut]=importdata(filename);
trainingData=data(1:2:end,:);
validationData=data(2:2:end,:);
trainingDataU=trainingData(:,1);
trainingDataY=trainingData(:,2);
validationDataU=validationData(:,1);
validationDataY=validationData(:,2);

Y=trainingDataY;
o=ones(size(trainingDataU));
M=[o trainingDataU] ;
W=M\Y;


Mt=[o trainingDataU] ;
Mv=[o validationDataU] ;
Yt=trainingDataY;
Yv=validationDataY;
trainingError=(norm(Mt*W-Yt))^2;
validationError=(norm(Mv*W-Yv))^2;

u=[-1:0.01:1];
y=u.*W(2) + W(1);

figure
plot(trainingDataU,trainingDataY,'.blue');
hold on
plot(u,y,'red');
title('charakterystyka statyczna modelu na tle danych uczących');
xlabel('u');
ylabel('y');
%print("z1bucz.png","-dpng","-r400")

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
%print("z1byucz.png","-dpng","-r400")

figure
plot(validationDataU,validationDataY,'.blue');
hold on
plot(u,y,'red');
title('charakterystyka statyczna modelu na tle danych weryfikujących');
xlabel('u');
ylabel('y');
%print("z1bwer.png","-dpng","-r400")

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
%print("z1bywer.png","-dpng","-r400")
