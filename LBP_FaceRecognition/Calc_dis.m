function [min_index, min_Dis] = Calc_dis(rightPos, testPos)
%rightPos = 照片数 * M testPos = 1 * M（待识别图片)
Size_r = size(rightPos);
min_index = 1;%初始化最小的为第一个
min_Dis = norm(rightPos(1, : ) - testPos);
for i = 1 : Size_r
    if min_Dis > norm(rightPos(i, : ) - testPos)
        min_Dis = norm(rightPos(i, : ) - testPos);
        min_index = i;
    end
end