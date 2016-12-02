
function gy = GA_Algorithm(popsize,D,pc,pm,ii,objfun,Lower,Upper,Max_iter)
pop=Lower+(Upper-Lower).*rand(popsize,D);    % 对于problem2 生成了一个100x30 取值-10~10的随机矩阵 生成了一个初始种群 有100个个体 每个个体由30个指标确定 目标函数是一个30元函数

for t = 1:Max_iter
    t
    objvalue = feval(objfun,pop);        %求种群中100个个体的表现型（函数值）           
    fit_val = Cal_fitness(objvalue);     %求每个个体的适应度           
    [best_one,~] = best(pop,fit_val);    %求出最优个体           
    x(t,:) = best_one;                   %得出每代最优解构成的最优解矩阵
    y(t)=feval(objfun,x(t,:));           %求出每代最优解目标函数值构成的最优值矩阵     
    newpop1 = Select(pop,fit_val);       %选择     
    newpop2 = Cross(newpop1,pc);         %交叉    对已选择出的父代进行杂交
    newpop3 = Mutate(newpop2,pm,Lower,Upper);    %变异         
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
%title('GA算法--收敛曲线图');
%xlabel('进化代数');
%ylabel('目标函数值');