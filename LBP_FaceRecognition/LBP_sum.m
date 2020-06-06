function sum = LBP_sum(i, j, grayFace)
sum = 0;
for k = -1 : 1
    for t = -1 : 1
        if k == 0 && t == 0
            continue;
        end
        %将3*3的附近的LBP编码转换成十进制，权重从上至下
        sum = sum*2 + myBin(grayFace(i+t, i+k), grayFace(i,j) );
    end
end
end