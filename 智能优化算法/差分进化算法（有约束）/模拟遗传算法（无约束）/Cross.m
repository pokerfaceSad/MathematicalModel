function [newpop2] = Cross( pop,pc )
%�����ӽ�
[px,py] = size(pop);
newpop2 = ones(size(pop));  %����ȫһ����
for i = 1:2:px-1
    for j = 1:py
        if rand < pc        %�����ɵ������С�ڽ�����ʣ�����н���
            alpha = rand(); 
            newpop2(i,j)   = alpha*pop(i,j)+(1-alpha)*pop(i+1,j);
            newpop2(i+1,j) = alpha*pop(i+1,j)+(1-alpha)*pop(i,j);  
        else                %���򲻽���
            neppop2(i,j) = pop(i,j);
            newpop2(i+1,j) = pop(i+1,j);
        end
    end
end 
