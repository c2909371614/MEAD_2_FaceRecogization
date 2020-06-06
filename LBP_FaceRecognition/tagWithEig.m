function tag = tagWithEig(M,Face,eigFace,meanFace)
%选取前M个特征脸对Face进行表示，并返回权重
tag = zeros(M,1);
for i = 1:M
    tag(i) = eigFace( : , i)' * (Face-double(meanFace) );
end
end