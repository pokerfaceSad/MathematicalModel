
%���ú���

function group=Test(p)
%��������
load data

%��׼������
WRecord = Standard(Record);

%�õ�ģ����ϵ�����󴫵ݱհ�
Result = Cal(Dispose(WRecord));

%ȡ�ؼ�
CutSet = Cut(Result,p);

%����
[group,SNum,GNum,GLength] = arrange(CutSet);

end