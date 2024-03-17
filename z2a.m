filename1 = 'danedynucz1.txt';
[data1,delimiterOut]=importdata(filename1);
trainingDataU=data1(:,1);
trainingDataY=data1(:,2);

filename2 = 'danedynwer1.txt';
[data2,delimiterOut]=importdata(filename2);
validationDataU=data2(:,1);
validationDataY=data2(:,2);

figure
plot(trainingDataU,'red');
hold on
plot(trainingDataY,'blue');
title('rysunek danych uczących');
xlabel('numer próbki');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y');
%print("z2ucz.png","-dpng","-r400")

figure
plot(validationDataU,'red');
hold on
plot(validationDataY,'blue');
title('rysunek danych weryfikujących');
xlabel('k');
ylabel('amplituda');
legend('sygnał wejściowy u','sygnał wyjściowy y')
%print("z2wer.png","-dpng","-r400")