function [newpop1]=Select(pop,fitvalue)

totalfit = sum(fitvalue);  
if(fitvalue == 0)
    newpop1 = pop;
else
    ps = fitvalue./totalfit;          
    pss = cumsum(ps);        %cumsum()––¿€º”   
    [px,py] = size(pop);
    ms = sort(rand(px,1));   %sort()≈≈–Ú     
    fitin = 1;      
    newin = 1;
    while newin <= px
        if(ms(newin) < pss(fitin))
            newpop1(newin,:) = pop(fitin,:);
            newin = newin+1;
        else
            fitin = fitin+1;
        end
    end
end
end
