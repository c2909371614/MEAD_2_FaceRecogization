
face = rgb2gray(imread('17.jpg') );
LBP_face = tranToLBP(face);
subplot(1,2,1);
imshow(face);
title('δ������ĻҶ�ͼ');
subplot(1,2,2)
imshow(LBP_face);
title('LBP����ͼ');