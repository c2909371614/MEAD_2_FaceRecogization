function [meanFace,eigFace] = GetEigFace()
%����õ�������
[numPics, numPeop, allNum,~] = setValue();%ÿ��20����Ƭ7����
gData = getGrayFace('faceData', 1);
meanFace = mean(gData, 2);%����(256*256) * 1
% imshow(uint8(meanFace));
diffFace = gData - meanFace;%����������Ϣ��ֵ(256*256) * allNum
cov_tran = diffFace' * diffFace;%����Э��������ת�þ���allNum * allNum
[eigVec, D] = eig(cov_tran);%D�ĶԽ�Ԫ��Ϊ����ֵ eigVec(i) = (allNum * 1)
eigVal = diag(D);
[~, index] = sort(-eigVal);%������ֵ��������õ����к�����õ����
eigFace = zeros(256*256, allNum);%��������ʼ��
% m  = allNum;
%�������е�������
disp(index);
for i = 1 : numPeop 
    for j = 1:numPics
        %���������ֵ�� tot-th��� ������
        tot = (i-1)*numPics + j;
        %����������������
        eigFace( : , tot) = diffFace * eigVec( : , index(tot));
    end
end
% saveEigFace(eigFace,meanFace);
disEigFace(eigFace);%չʾ������
end