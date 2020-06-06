function gData = getGrayFace(imgPath, flag)
%flag == 1 时进行LBP编码
%读取图片转化成灰度图并拉伸gData为 allNum * (256*256)
% imgPath = 'faceData';%文件读取路径
[~, numPeop, ~,imgDirs] = setValue();
fileDirs = fullfile(imgPath, imgDirs(1).name);
imgSubDirs = dir([fileDirs '\*.jpg']);
numPics = length(imgSubDirs);
allNum = numPics*numPeop;
gData = zeros(256*256, allNum);%n张灰度图矩阵信息
for i = 1 : numPeop
    fileDirs = fullfile(imgPath, imgDirs(i).name);
    imgSubDirs = dir([fileDirs '\*.jpg']);
%     figure('name',imgDirs(i).name);%创建新的图像显示窗口
    for j = 1 : numPics
        filenames = fullfile(fileDirs, imgSubDirs(j).name);%构建图片路径
        imgData = imread(filenames);
        %转成灰度图再转换成LBP编码
        imgGrayData = rgb2gray(imgData);
        if flag == 1
            imgGrayData = tranToLBP(imgGrayData);
        end
        %---将灰度图拉伸存到gData中每一列代表一幅图片
        gData( : , (i-1)*numPics + j) = reshape(imgGrayData,256*256,1);
        %         subplot(numPics/4,4,j);%以4*5的窗口显示
        %         imshow(imgGrayData);
    end
end
end