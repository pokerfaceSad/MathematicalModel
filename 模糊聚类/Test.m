
%调用函数

function group=Test(p)
%载入数据
load data

%标准化处理
WRecord = Standard(Record);

%得到模糊关系矩阵并求传递闭包
Result = Cal(Dispose(WRecord));

%取截集
CutSet = Cut(Result,p);

%分类
[group,SNum,GNum,GLength] = arrange(CutSet);

end