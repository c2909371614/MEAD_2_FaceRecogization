function LBP = tranToLBP(grayFace)
LBP = zeros(256,256);
%���Ҷ�ͼ����ĳ�LBP�����ʽ
sum = 0;
for i = 1+1 : 256-1
    for j = 1+1 : 256-1
        LBP(i, j) = LBP_sum(i, j, grayFace);
        sum = sum + LBP(i, j);
    end
end
%---�����Ե����Ϊ0----

end
