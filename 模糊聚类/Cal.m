%�󴫵ݱհ�

function [B,n] = Cal(R) 

a=size(R);
B=zeros(a);
flag=0;
n=1;
while flag==0
for i= 1: a
    for j= 1: a
        for k=1:a
        B( i , j ) = max(min( R( i , k) , R( k, j) ) , B( i , j ) ) ;%R��R�ڻ�����ȡС��ȡ��
        end
    end
end
n = n+1;
if B==R
    flag=1;
else
    R=B;%ѭ������R���ݱհ�
end
end