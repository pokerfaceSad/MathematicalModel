function [newpop2] = Cross( pop,pc )
%算数杂交
[px,py] = size(pop);
newpop2 = ones(size(pop));  %生成全一矩阵
for i = 1:2:px-1
    for j = 1:py
        if rand < pc        %若生成的随机数小于交叉概率，则进行交叉
            alpha = rand(); 
            newpop2(i,j)   = alpha*pop(i,j)+(1-alpha)*pop(i+1,j);
            newpop2(i+1,j) = alpha*pop(i+1,j)+(1-alpha)*pop(i,j);  
        else                %否则不交叉
            neppop2(i,j) = pop(i,j);
            newpop2(i+1,j) = pop(i+1,j);
        end
    end
end 
