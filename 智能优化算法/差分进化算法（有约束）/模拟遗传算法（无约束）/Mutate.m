function [nextpop3] = Mutate( pop,pm,Lower,Upper )
%æ˘‘»±‰“Ï
[px,py] = size(pop);
nextpop3 = pop;
for i = 1:px
    for j = 1:py
        if rand() < pm
            nextpop3(i,j) =Lower+(Upper-Lower).*rand;
        else
            nextpop3(i,j) = pop(i,j);
        end
    end
end
