%求传递闭包

function [B,n] = Cal(R) 

a=size(R);
B=zeros(a);
flag=0;
n=1;
while flag==0
for i= 1: a
    for j= 1: a
        for k=1:a
        B( i , j ) = max(min( R( i , k) , R( k, j) ) , B( i , j ) ) ;%R与R内积，先取小再取大
        end
    end
end
n = n+1;
if B==R
    flag=1;
else
    R=B;%循环计算R传递闭包
end
end