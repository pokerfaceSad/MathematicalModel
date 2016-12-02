%%
%主成分分析PCA

clear,clc
load data4%载入数据
data  =zscore(data);%数据标准化
r  = corrcoef(data);%计算相关系数矩阵

%利用相关系数矩阵进行主成分分析
[vecl,lamda,rate] = pcacov(r)                             %lamda为特征值，rate为各个主成分的贡献率
f = repmat(sign(sum(vecl)),size(vecl,1),1);       %构造与vecl维数相同的元素为正负一的矩阵
vec2 = vecl.*f14                                                   %修改特征向量的正负号，使得每个特征向量的分量和为正
num  = 8;                                                              %num为选取主成分的个数
df = data*vec2(:,1:num);                                     %计算各个主成分得分
tf = df*rate(1:num)/100;                                      %计算综合得分
[stf,ind] = sort(df,'descend');                               %把得分按从高到低的次序排列
stf = stf',ind = ind'
