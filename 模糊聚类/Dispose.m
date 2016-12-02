
%求模糊关系矩阵

function Result = Dispose(WRecord)
    
    for i = 1:length(WRecord)

        for j = 1:length(WRecord)
            Result(i,j) =1 - abs(WRecord(i)-WRecord(j));
        end    

    end   

end