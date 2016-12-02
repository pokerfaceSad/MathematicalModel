%判断分组

%行相等的为一组，其他的单独成组

function [group,SNum,GNum,GLength] = arrange(CutSet)

%存储已分组人数
SNum = 0;    
%存储已分组数
GNum = 0;
%存储每组的人数
GLength = zeros(1,99);

%为CutSet矩阵添加一行分组标记
for i = 1:size(CutSet,1)
    CutSet(i,size(CutSet,1)+1) = 0;
end
    


%循环用norm函数判断两行是否相等

    for i = 1:size(CutSet,1)
        %若尚未分组新创建一组
        if(CutSet(i,size(CutSet,1)+1)==1)
            continue;
        end
        group(GNum+1,GLength(GNum+1)+1) = i;%加入元素
        SNum = SNum+1;%更新已分组人数
        GLength(GNum+1) = GLength(GNum+1) + 1;%更新组人数
        CutSet(i,size(CutSet,1)+1)=1;%添加标记
        for j = i+1:size(CutSet,1)        
            if(norm(CutSet(:,i)-CutSet(:,j))==0)%两列相等
                group(GNum+1,GLength(GNum+1)+1) = j;%加入元素
                CutSet(j,size(CutSet,1)+1)=1;%添加标记
                GLength(GNum+1) = GLength(GNum+1) + 1;%更新组人数
                SNum = SNum+1;%更新已分组人数
            end
        end
        GNum = size(group,1);%通过求group行数更新组数
        if(SNum==size(CutSet,1))
            break;
        end  
    end        
                