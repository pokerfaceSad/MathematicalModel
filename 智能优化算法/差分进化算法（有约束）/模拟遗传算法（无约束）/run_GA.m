
clc;
clear all;
close all;

popsize = 100;  %��Ⱥ��ģ      
pc = 0.6;       %�������
pm = 0.01;      %�������    

%---------------------------
% Cal_Obj_Problem: ά��Ϊ 30���������½�:[-600��600]��
%---------------------------
objfun='Cal_Obj_Problem'; 
D =30;                 %Ŀ�꺯��ά��    
Lower=-600;  Upper=600;  %Ŀ�꺯��������   
Max_iter=5000;         %��������         
Runtime=30;             %���д��� 
%% -------------------------------------------------------
for i = 1:Runtime
    g(i) = GA_Algorithm(popsize,D,pc,pm,i,objfun,Lower,Upper,Max_iter);
end
    mean_g = mean(g) 
    [min_g,k1] = min(g)  
    [max_g,k2] = max(g)  
     std_g = std(g)  
%% ---------------------------------------------------------------
