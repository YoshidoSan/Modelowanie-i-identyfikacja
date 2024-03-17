filename = 'danestat1.txt';
[data,delimiterOut]=importdata(filename);
figure
plot(data(:,1),'red');
hold on
plot(data(:,2),'blue');
xlabel('numer próbki');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y');
title('rysunek danych statycznych');
%print("z1a.png","-dpng","-r400")

filename = 'danestat1.txt';
[data,delimiterOut]=importdata(filename);
trainingData=data(1:2:end,:);
validationData=data(2:2:end,:);
trainingDataU=trainingData(:,1);
trainingDataY=trainingData(:,2);
validationDataU=validationData(:,1);
validationDataY=validationData(:,2);

figure
plot(trainingDataU,trainingDataY,'.blue');
title('charakterystyka y(u) dla danych uczących');
xlabel('u');
ylabel('y');
%print("z1ayucz.png","-dpng","-r400")

figure
plot(trainingDataU,'red');
hold on
plot(trainingDataY,'blue');
title('rysunek danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y');
%print("z1aucz.png","-dpng","-r400")

figure
plot(validationDataU,validationDataY,'.blue');
title('charakterystyka y(u) dla danych weryfikujących');
xlabel('u');
ylabel('y');
%print("z1aywer.png","-dpng","-r400")

figure
plot(validationDataU,'red');
hold on
plot(validationDataY,'blue');
title('rysunek danych weryfikujących');
xlabel('k');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y')
%print("z1awer.png","-dpng","-r400")
