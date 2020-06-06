% function faceRecog()
%使用特征脸进行识别
[~, numPeop, allNum, imgDirs] = setValue();
%----从文件中读取特征脸信息----
dirPath = 'eigSort';
dirNames = dir([dirPath '\*.bmp']);
eigFace = zeros(256*256, allNum);

for i = 1:allNum
    eigFace( : , i) = reshape(imread(fullfile(dirPath,dirNames(i).name) ), 256*256, 1);
end
%------读取平均脸----
meanFace = reshape(imread('meanFace\meanFace.bmp'),256*256,1);
%------读取训练集脸---
right_gData = getGrayFace('faceData', 1);
% disFace(right_gData);
train = 16*numPeop;%16张作训练
%------读取测试集脸---
test_gData = getGrayFace('testFace', 1);
% disFace(test_gData);
test = 4*numPeop;%4张做测试
%------识别-----
M = 112;%选取50个特征脸进行标识测试集人脸
rightPos = zeros(train, M);%用于比对的人脸train * M
for i = 1 : train
    rightPos(i, : ) = tagWithEig(M, right_gData( : , i),eigFace,meanFace);
end
testPos = zeros(test, M);%测试集的特征空间位置
right_cnt = 0;%成功的个数

Right_gData = getGrayFace('faceData', 0);
Test_gData = getGrayFace('testFace', 0);
% disFace(Right_gData);
for i = 1 : test
    flag = 0;
    testPos(i, : ) = tagWithEig(M, test_gData( : , i),eigFace,meanFace);
    [index, ~] = Calc_dis(rightPos, testPos(i, : ) );
    %     fprintf('test : %d check: %d dis = %.3f\n', i, index, dis);
    if floor((i-1)/4) == floor((index-1)/16)
        right_cnt = right_cnt + 1;
        flag = 1;
    end
    if flag == 1
        fprintf('right recogition, %d-%d\n', i,index);
    else
        fprintf('error i = %d index = %d\n',i,index);
    end
    %     if i == test/2
    %         figure;
    %     end
    subplot(7,8,(i-1)*2+1);
    imshow(uint8(reshape(Test_gData( : , i), 256, 256) ) );
    title('待识别的人脸');
    subplot(7,8,i*2);
    imshow(uint8(reshape(Right_gData( : , index), 256, 256) ) );
    title('识别到的人');
end

fprintf('识别率 ：%.2f right:%d \n',right_cnt/test, right_cnt);
% end