
function gy = GA_Algorithm(popsize,D,pc,pm,ii,objfun,Lower,Upper,Max_iter)
pop=Lower+(Upper-Lower).*rand(popsize,D);    % ����problem2 ������һ��100x30 ȡֵ-10~10��������� ������һ����ʼ��Ⱥ ��100������ ÿ��������30��ָ��ȷ�� Ŀ�꺯����һ��30Ԫ����

for t = 1:Max_iter
    t
    objvalue = feval(objfun,pop);        %����Ⱥ��100������ı����ͣ�����ֵ��           
    fit_val = Cal_fitness(objvalue);     %��ÿ���������Ӧ��           
    [best_one,~] = best(pop,fit_val);    %������Ÿ���           
    x(t,:) = best_one;                   %�ó�ÿ�����Ž⹹�ɵ����Ž����
    y(t)=feval(objfun,x(t,:));           %���ÿ�����Ž�Ŀ�꺯��ֵ���ɵ�����ֵ����     
    newpop1 = Select(pop,fit_val);       %ѡ��     
    newpop2 = Cross(newpop1,pc);         %����    ����ѡ����ĸ��������ӽ�
    newpop3 = Mutate(newpop2,pm,Lower,Upper);    %����         
    objvalue1 = feval(objfun,newpop3(1,:));   
    if objvalue1 > y(t)
        newpop3(1,:) = best_one;         
    end
    pop = newpop3;     

    t = t+1;
end
[gy,k]=min(y) ;  

ii
fprintf('Optimal value: gy = %0.5f\n',gy);
fprintf('Optimal solution:');
x = x(k,:)

%figure;grid on;hold on;
%semilogy(y);
%title('GA�㷨--��������ͼ');
%xlabel('��������');
%ylabel('Ŀ�꺯��ֵ');