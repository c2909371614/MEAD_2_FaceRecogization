function [min_index, min_Dis] = Calc_dis(rightPos, testPos)
%rightPos = ��Ƭ�� * M testPos = 1 * M����ʶ��ͼƬ)
Size_r = size(rightPos);
min_index = 1;%��ʼ����С��Ϊ��һ��
min_Dis = norm(rightPos(1, : ) - testPos);
for i = 1 : Size_r
    if min_Dis > norm(rightPos(i, : ) - testPos)
        min_Dis = norm(rightPos(i, : ) - testPos);
        min_index = i;
    end
end