
%求出适应度最大的个体，best_one返回最优个体，best_fit返回最大适应度
function [best_one,best_fit]=best(pop,fit_val)
[px,~]=size(pop);
best_one=pop(1,:);
best_fit=fit_val(1);
for i=2:px
    if fit_val(i)>best_fit
        best_one=pop(i,:);
        best_fit=fit_val(i);
    end
end
