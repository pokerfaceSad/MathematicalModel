
clc;
clear all;
close all;

popsize = 100;  %种群规模      
pc = 0.6;       %交叉概率
pm = 0.01;      %变异概率    

%---------------------------
% Cal_Obj_Problem: 维数为 30；变量上下界:[-600，600]；
%---------------------------
objfun='Cal_Obj_Problem'; 
D =30;                 %目标函数维数    
Lower=-600;  Upper=600;  %目标函数定义域   
Max_iter=5000;         %迭代次数         
Runtime=30;             %运行次数 
%% -------------------------------------------------------
for i = 1:Runtime
    g(i) = GA_Algorithm(popsize,D,pc,pm,i,objfun,Lower,Upper,Max_iter);
end
    mean_g = mean(g) 
    [min_g,k1] = min(g)  
    [max_g,k2] = max(g)  
     std_g = std(g)  
%% ---------------------------------------------------------------
