function disEigFace(eigFace)
%展示特征脸
[numPics, numPeop, ~, imgDirs] = setValue();%每人20张照片7个人
for i = 1 : numPeop 
    figure('name', imgDirs(i).name);
    for j = 1:numPics
        tot = (i-1)*numPics + j;
        eigFaceShow = reshape(uint8(eigFace( : , tot) ), 256, 256);
        subplot(4,5,j);
        imshow(eigFaceShow);
    end
end
end
