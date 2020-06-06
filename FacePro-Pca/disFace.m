function disFace(Face)
[~, numPeop, ~, ~] = setValue();
Size = size(Face);
numPics = Size(2) / numPeop;
for i = 1:numPeop
    figure;
    for j = 1:numPics
        tot = (i-1)*numPics+j;
        subplot(numPics/4,4,j);
        imshow(uint8(reshape(Face(:,tot), 256,256)));
    end
end
