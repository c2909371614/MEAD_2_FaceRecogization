function [numPics, numPeop, allNum, imgDirs] = setValue()
%���ó���Ļ�������
numPics = 16;%ÿ����20����Ƭ
numPeop = 7;%�߸���
allNum = numPics * numPeop;
imgPath = 'faceData';%�ļ���ȡ·��
imgdirsT = dir(imgPath);%��ȡ�ļ�·���������ļ���
imgDirs = imgdirsT(3:length(imgdirsT) );%ȥ��. �� ..������ļ���
end