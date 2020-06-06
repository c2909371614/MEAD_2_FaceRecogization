function [meanFace,eigFace] = GetEigFace()
%计算得到特征脸
[numPics, numPeop, allNum,~] = setValue();%每人20张照片7个人
gData = getGrayFace('faceData', 1);
meanFace = mean(gData, 2);%计算(256*256) * 1
% imshow(uint8(meanFace));
diffFace = gData - meanFace;%各个脸部信息差值(256*256) * allNum
cov_tran = diffFace' * diffFace;%计算协方差矩阵的转置矩阵allNum * allNum
[eigVec, D] = eig(cov_tran);%D的对角元素为特征值 eigVec(i) = (allNum * 1)
eigVal = diag(D);
[~, index] = sort(-eigVal);%对特征值进行排序得到序列和排序好的序号
eigFace = zeros(256*256, allNum);%特征脸初始化
% m  = allNum;
%保存所有的特征脸
disp(index);
for i = 1 : numPeop 
    for j = 1:numPics
        %计算出特征值第 tot-th大的 特征脸
        tot = (i-1)*numPics + j;
        %计算排序后的特征脸
        eigFace( : , tot) = diffFace * eigVec( : , index(tot));
    end
end
% saveEigFace(eigFace,meanFace);
disEigFace(eigFace);%展示特征脸
end