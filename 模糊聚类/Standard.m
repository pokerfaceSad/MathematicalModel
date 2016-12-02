
%对数据标准化处理

function WRecord = Standard(Record)
for i = 1:size(Record,2)
    WRecord(:,i) = Record(:,i)/max(Record(:,i));
end

