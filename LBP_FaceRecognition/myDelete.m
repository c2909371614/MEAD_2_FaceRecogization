% function myDelete()
[~, numPeop, ~, imgDirs] = setValue();
imgPath = 'testFace';
for i = 1 : numPeop
    fileDirs = fullfile(imgPath, imgDirs(i).name);
    imgSubDirs = dir([fileDirs '\*.jpg']);
    for j = 5 : 20
        filenames = fullfile(fileDirs, strcat(num2str(j),'.jpg'));%����ͼƬ·��
        delete(filenames);
    end
end
% end