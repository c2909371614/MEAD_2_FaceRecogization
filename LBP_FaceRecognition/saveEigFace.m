function resFilename = saveEigFace(eigSort,meanFace)
[numPics, numPeop, ~, ~] = setValue();
resFilename = 'eigFaceSave';
sortFile = 'eigSort';
meanFile = 'meanFace';
sort = mkdir(sortFile);
mean = mkdir(meanFile);
saveMeanName = strcat(meanFile,'\meanFace','.bmp');
imwrite(uint8(reshape(meanFace,256,256)), saveMeanName);
for i = 1 : numPeop
    for j = 1 : numPics
        tot = (i-1) * numPics + j;
        saveSortName = strcat(sortFile,'\',num2str(tot),'.bmp');
        imwrite(uint8(reshape(eigSort( : , tot) ,256,256)), saveSortName);
    end
end