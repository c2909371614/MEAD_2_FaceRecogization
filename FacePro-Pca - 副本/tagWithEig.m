function tag = tagWithEig(M,Face,eigFace,meanFace)
%ѡȡǰM����������Face���б�ʾ��������Ȩ��
tag = zeros(M,1);
for i = 1:M
    tag(i) = eigFace( : , i)' * (Face-double(meanFace) );
end
end