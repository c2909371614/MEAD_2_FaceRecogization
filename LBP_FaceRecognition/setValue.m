function [numPics, numPeop, allNum, imgDirs] = setValue()
%设置程序的基本参数
numPics = 16;%每个人20张照片
numPeop = 7;%七个人
allNum = numPics * numPeop;
imgPath = 'faceData';%文件读取路径
imgdirsT = dir(imgPath);%读取文件路径下所有文件名
imgDirs = imgdirsT(3:length(imgdirsT) );%去掉. 和 ..后的子文件名
end