%%
%���ɷַ���PCA

clear,clc
load data4%��������
data  =zscore(data);%���ݱ�׼��
r  = corrcoef(data);%�������ϵ������

%�������ϵ������������ɷַ���
[vecl,lamda,rate] = pcacov(r)                             %lamdaΪ����ֵ��rateΪ�������ɷֵĹ�����
f = repmat(sign(sum(vecl)),size(vecl,1),1);       %������veclά����ͬ��Ԫ��Ϊ����һ�ľ���
vec2 = vecl.*f14                                                   %�޸����������������ţ�ʹ��ÿ�����������ķ�����Ϊ��
num  = 8;                                                              %numΪѡȡ���ɷֵĸ���
df = data*vec2(:,1:num);                                     %����������ɷֵ÷�
tf = df*rate(1:num)/100;                                      %�����ۺϵ÷�
[stf,ind] = sort(df,'descend');                               %�ѵ÷ְ��Ӹߵ��͵Ĵ�������
stf = stf',ind = ind'
