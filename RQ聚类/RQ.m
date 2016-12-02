%%
%R型聚类
clc,clear
%载入数据
load data2
d = pdist(data','correlation'); %计算相关系数导出的距离
z = linkage(d,'average'); %按类平均法聚类
h = dendrogram(z); %画聚类图
set(h,'color','k','linewidth',1.3) %把聚类图线的颜色改成黑色，线宽加粗
T = cluster(z,'maxclust',4) %把变量分成6类
for i =1:4
    tm = find(T==i); %求第i类的对象
    tm = reshape(tm,1,length(tm)); %变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm)); %显示分类结果
end
%%
%Q型聚类
clc,clear
%载入数据
load data
d = zscore(d);%数据标准化

y = pdist(d,@dist);%求对象间欧式距离，每一行为一个对象
z = linkage(y,'average'); %按类平均法聚类
h = dendrogram(z); %画聚类图
set(h,'color','k','linewidth',1.3) %把聚类图线的颜色改成黑色，线宽加粗
T = cluster(z,'maxclust',4) %把变量分成6类
for i =1:4
    tm = find(T==i); %求第i类的对象
    tm = reshape(tm,1,length(tm)); %变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm)); %显示分类结果
end
