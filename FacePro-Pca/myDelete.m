% function myDelete()
[~, numPeop, ~, imgDirs] = setValue();
imgPath = 'testFace';
for i = 1 : numPeop
    fileDirs = fullfile(imgPath, imgDirs(i).name);
    imgSubDirs = dir([fileDirs '\*.jpg']);
    for j = 5 : 20
        filenames = fullfile(fileDirs, strcat(num2str(j),'.jpg'));%¹¹½¨Í¼Æ¬Â·¾¶
        delete(filenames);
    end
end
% end