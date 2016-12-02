function [objvalue] =  Cal_Obj_Problem(pop)

    
    value1 = (sum((pop.*pop)'))';

    for i=1:size(pop,1)
        for j=1:size(pop,2)
            value2 = cos(pop(i,j))/sqrt(j);
        end
    end
    value2 = prod(value2')';
    objvalue = value1-value2+1;

