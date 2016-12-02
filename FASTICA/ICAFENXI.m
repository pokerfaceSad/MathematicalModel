%�����ݽ��б�׼��
close all,clear
load np_all
normsr=zscore(npp);
features=normsr';
[r,c]= size(features);
%�����ݽ��а׻���ʹ֮Ϊ0��ֵ����λЭ����
features = features - mean(features')'*ones(1,c);
[E, D]	= eig(cov(features',1));
V			= E*inv(sqrtm(D))*E';
z = V*features;
%ʹ��FastICA�㷨�����ݽ���������ȡ.�����Ժ���ѡ��tanh(a1y)
epsilon=0.0001;
m=r;
p=1;
W=zeros(r,1);
for p=1:m
W(:,p)=rand(r,1);
W(:,p)=W(:,p)/norm(W(:,p));
exit=0;
count=0;
iter=1;
while exit==0;
count=count+1;
temp=W(:,p);
for i=1:m
           W(i,p)=mean(z(i,:).*(tanh((temp)'*z)))-(mean(1-(tanh((temp))'*z).^2)).*temp(i,1);
end
ssum=zeros(r,1);
for counter=1:p-1
ssum=ssum+(W(:,p)'*W(:,counter))*W(:,counter);
end
W(:,p)=W(:,p)-ssum;
W(:,p)=W(:,p)/norm(W(:,p));
if(abs((dot(W(:,p),temp)))<1+epsilon)&(abs((dot(W(:,p),temp)))>1-epsilon)
exit=1;
end
iter=iter+1;
end
end
W=W';
%�ҵ�������ķ���
power=sum(abs(W)');
[m, in]	= sort(power);
W= W(in(r-2+1:r),:);
%�����µ���������.
features = W*z;
features=features';
X=features(find(kk==1|kk==2),:);
group=kk(find(kk==1|kk==2));
%��health vs npc-initial��ɢ��ͼ.
gscatter(X(:,1),X(:,2),group,'mr','o+')   
legend('health','npc-initial');
xlabel('1st component');
ylabel('2nd component');
