%º∆À„pΩÿºØ

function CutSet = Cut(Result,p)

    for i = 1:length(Result)
        for j = 1:length(Result)
            if(Result(i,j)<p)
                CutSet(i,j) = 0;
            else 
                CutSet(i,j) = 1;
            end
        end           
    end
    
end    