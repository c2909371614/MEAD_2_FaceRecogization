function LBP = tranToLBP(grayFace)
LBP = zeros(256,256);
%将灰度图编码改成LBP编码格式
sum = 0;
for i = 1+1 : 256-1
    for j = 1+1 : 256-1
        LBP(i, j) = LBP_sum(i, j, grayFace);
        sum = sum + LBP(i, j);
    end
end
%---处理边缘数据为0----

end
