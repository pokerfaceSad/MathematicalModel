%�жϷ���

%����ȵ�Ϊһ�飬�����ĵ�������

function [group,SNum,GNum,GLength] = arrange(CutSet)

%�洢�ѷ�������
SNum = 0;    
%�洢�ѷ�����
GNum = 0;
%�洢ÿ�������
GLength = zeros(1,99);

%ΪCutSet�������һ�з�����
for i = 1:size(CutSet,1)
    CutSet(i,size(CutSet,1)+1) = 0;
end
    


%ѭ����norm�����ж������Ƿ����

    for i = 1:size(CutSet,1)
        %����δ�����´���һ��
        if(CutSet(i,size(CutSet,1)+1)==1)
            continue;
        end
        group(GNum+1,GLength(GNum+1)+1) = i;%����Ԫ��
        SNum = SNum+1;%�����ѷ�������
        GLength(GNum+1) = GLength(GNum+1) + 1;%����������
        CutSet(i,size(CutSet,1)+1)=1;%��ӱ��
        for j = i+1:size(CutSet,1)        
            if(norm(CutSet(:,i)-CutSet(:,j))==0)%�������
                group(GNum+1,GLength(GNum+1)+1) = j;%����Ԫ��
                CutSet(j,size(CutSet,1)+1)=1;%��ӱ��
                GLength(GNum+1) = GLength(GNum+1) + 1;%����������
                SNum = SNum+1;%�����ѷ�������
            end
        end
        GNum = size(group,1);%ͨ����group������������
        if(SNum==size(CutSet,1))
            break;
        end  
    end        
                