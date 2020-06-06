function gData = getGrayFace(imgPath, flag)
%flag == 1 ʱ����LBP����
%��ȡͼƬת���ɻҶ�ͼ������gDataΪ allNum * (256*256)
% imgPath = 'faceData';%�ļ���ȡ·��
[~, numPeop, ~,imgDirs] = setValue();
fileDirs = fullfile(imgPath, imgDirs(1).name);
imgSubDirs = dir([fileDirs '\*.jpg']);
numPics = length(imgSubDirs);
allNum = numPics*numPeop;
gData = zeros(256*256, allNum);%n�ŻҶ�ͼ������Ϣ
for i = 1 : numPeop
    fileDirs = fullfile(imgPath, imgDirs(i).name);
    imgSubDirs = dir([fileDirs '\*.jpg']);
%     figure('name',imgDirs(i).name);%�����µ�ͼ����ʾ����
    for j = 1 : numPics
        filenames = fullfile(fileDirs, imgSubDirs(j).name);%����ͼƬ·��
        imgData = imread(filenames);
        %ת�ɻҶ�ͼ��ת����LBP����
        imgGrayData = rgb2gray(imgData);
        if flag == 1
            imgGrayData = tranToLBP(imgGrayData);
        end
        %---���Ҷ�ͼ����浽gData��ÿһ�д���һ��ͼƬ
        gData( : , (i-1)*numPics + j) = reshape(imgGrayData,256*256,1);
        %         subplot(numPics/4,4,j);%��4*5�Ĵ�����ʾ
        %         imshow(imgGrayData);
    end
end
end