
for t=1:30
% clc
% clear all
% close all
tic;
allX=diag([0.1,0.1,0.1,0.1])*ones(4,28)+diag([2.0,10.0,10.0,2.0])*rand(4,28);  %初始化可行域内的种群  每一列为一个个体 种群规模为49
   for i=1:28

   %解析种群矩阵    
   alX=allX(:,i);    
   
   x1(i)=alX(1,:);  
   x2(i)=alX(2,:);
   x3(i)=alX(3,:);
   x4(i)=alX(4,:);
   
    c11(i)=g1(allX(:,i));  
   c12(i)=g2(allX(:,i));
   c13(i)=g3(allX(:,i));
   c14(i)=g4(allX(:,i));
    c15(i)=g5(allX(:,i));
    c16(i)=g6(allX(:,i));
    c17(i)=g7(allX(:,i));
 
   %计算约束违反度总和
   cf(i)=max(c11(i),0)+max(c12(i),0)+max(c13(i),0)+max(c14(i),0)+max(c15(i),0)+max(c16(i),0)+max(c17(i),0)+max(0.1-x1(i),0)+max(x1(i)-2.0,0)+max(0.1-x2(i),0)+max(x2(i)-10.0,0)+max(0.1-x3(i),0)+max(x3(i)-10.0,0)+max(0.1-x4(i),0)+max(x4(i)-2.0,0);
   %计算目标函数值
   evalf(i)=f(allX(:,i));  
   end
 m=1;
while m<=720
    %随机自适应参数
   T=0.4+0.4*rand;
   %杂交率
   CR=0.9;
   for i=1:28
   alX=allX(:,i);
   x1(i)=alX(1,:);  
   x2(i)=alX(2,:);
   x3(i)=alX(3,:);
   x4(i)=alX(4,:);  
   cons1(i)=cf(i);
   eval1(i)=evalf(i);
   end
   
   %变异 DE/Rand/1
   %选出两个不同于A(i)的个体，使A(i)变异
   for i=1:28
     A=[1:49]; A(i)=[]; 
     a1=round(1+26*rand);  %产生1~27的随机整数
     r1=A(a1);A(a1)=[];
     a2=round(1+25*rand);
     r2=A(a2);A(a2)=[];
     a3=round(1+24*rand);
     r3=A(a3);
     x1new(i)=x1(r1)+T*(x1(r2)-x1(r3));
     x2new(i)=x2(r1)+T*(x2(r2)-x2(r3));
     x3new(i)=x3(r1)+T*(x3(r2)-x3(r3));
     x4new(i)=x4(r1)+T*(x4(r2)-x4(r3));
   end
   
 %杂交
  for i=1:28
        p=rand(1,4);k=4-round(3*rand);
      if p(1)<=CR|k==1
         x1new1(i)=x1new(i);
      else x1new1(i)=x1(i);
      end
      if p(2)<=CR|k==2
         x2new1(i)=x2new(i);
      else x2new1(i)=x2(i);
      end
      if p(3)<=CR|k==3
         x3new1(i)=x3new(i);
      else x3new1(i)=x3(i);
      end
      if p(4)<=CR|k==4
         x4new1(i)=x4new(i);
      else x4new1(i)=x4(i);
      end
      
  end 
   
  %选择
    for i=1:28 
   
    X = [x1new1;x2new1;x3new1;x4new1];
        
   c31(i)=g1(X(:,i));
   c32(i)=g2(X(:,i));
   c33(i)=g3(X(:,i));
   c34(i)=g4(X(:,i));
   c35(i)=g5(X(:,i));;
   c36(i)=g6(X(:,i));;
   c37(i)=g7(X(:,i));;
  
  %得到试验向量个体的违反度总和
   cons3(i)=max(c31(i),0)+max(c32(i),0)+max(c33(i),0)+max(c34(i),0)+max(c35(i),0)+max(c36(i),0)+max(c37(i),0)+max(0.1-x1new1(i),0)+max(x1new1(i)-2.0,0)+max(0.1-x2new1(i),0)+max(x2new1(i)-10.0,0)+max(0.1-x3new1(i),0)+max(x3new1(i)-10.0,0)+max(0.1-x4new1(i),0)+max(x4new1(i)-2.0,0);
  %得到试验向量个体的目标函数值
   eval3(i)=f(X(:,i));   
     end
    for i=1:28
        %可行性比较法
       if (cons1(i)==0&cons3(i)==0&eval3(i)<eval1(i))|(cons1(i)>0&cons3(i)==0)|(cons1(i)>0&cons3(i)>0&cons1(i)>cons3(i))
          x1new2(i)=x1new1(i);
          x2new2(i)=x2new1(i);
          x3new2(i)=x3new1(i);
          x4new2(i)=x4new1(i);
          eval4(i)=eval3(i);
          cons4(i)=cons3(i);
       elseif (cons1(i)==0&cons3(i)==0&eval1(i)<eval3(i))|(cons1(i)==0&cons3(i)>0)|(cons1(i)>0&cons3(i)>0&cons1(i)<cons3(i))
          x1new2(i)=x1(i);
          x2new2(i)=x2(i);
          x3new2(i)=x3(i);
          x4new2(i)=x4(i);
          eval4(i)=eval1(i);
          cons4(i)=cons1(i);
       end
    end
    xnew2=[x1new2;x2new2;x3new2;x4new2];
    if cons4==0
     [b1,I1]=sort(eval4);
     bx=xnew2(:,I1);
     consq=cons4;
   elseif cons4>0
     [C2,I2]=sort(cons4);
     b1=eval4(I2);
     bx=xnew2(:,I2);
     consq=C2; 
   else 
      J1=find(cons4==0); 
      eval41=eval4(J1);xnew21=xnew2(:,J1);
     [be,I21]=sort(eval41);
      bx1=xnew21(:,I21); cons41=cons4(J1);
       J2=find(cons4>0); 
      eval42=eval4(J2);xnew22=xnew2(:,J2);cons422=cons4(J2);
     [bc,I22]=sort(cons422);
      bx2=xnew22(:,I22); evalq=eval42(I22);
      bx=[bx1,bx2];
      b1=[be,evalq];
      consq=[cons41,bc];
   end 
    B=[2:28];a4=round(1+26*rand);
    r4=B(a4);B(a4)=[];
    r5=B(round(1+25*rand));
    xb=bx(:,1);fb=b1(1);
    xa=bx(:,r4);fa=b1(r4);
    xc=bx(:,r5);fc=b1(r5);
if (xb-xc).*fa+(xc-xa).*fb+(xa-xb).*fc==0
    eval5=[eval4];
    xfff=[xnew2];
    cons5=[cons4];
else
    xm=0.5*(((xb.*xb-xc.*xc).*fa+(xc.*xc-xa.*xa).*fb+(xa.*xa-xb.*xb).*fc)./((xb-xc).*fa+(xc-xa).*fb+(xa-xb).*fc));
   cm1=g1(xm);
   cm2=g2(xm);
   cm3=g3(xm);
   cm4=g4(xm);
   cm5=g5(xm);
   cm6=g6(xm);
   cm7=g7(xm);
   cfm=max(cm1,0)+max(cm2,0)+max(cm3,0)+max(cm4,0)+max(cm5,0)+max(cm6,0)+max(cm7,0)+max(0.1-xm(1),0)+max(xm(1)-2.0,0)+max(0.1-xm(2),0)+max(xm(2)-10.0,0)+max(0.1-xm(3),0)+max(xm(3)-10.0,0)+max(0.1-xm(4),0)+max(xm(4)-2.0,0);
   fm=f(xm);
    end 
    if cons4>0
       [bc,l]=min(cons4);    
       [hc,k]=max(cons4);
       bf=eval4(l);
       wf=eval4(k);
       if (cfm>0&cfm<bc)|(cfm==0)
          eval4(l)=fm;
          xnew2(:,l)=xm;
          cons4(l)=cfm;  
          eval5=[eval4];
          xfff=[xnew2];
          cons5=[cons4];
       elseif (cfm>0&cfm>bc&cfm<hc)
           eval4(k)=fm;
           xnew2(:,k)=xm;
           cons4(k)=cfm;  
           eval5=[eval4];
           xfff=[xnew2];
           cons5=[cons4];
       elseif (cfm>0&cfm>hc)
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];
        end
    elseif cons4==0
         [bf,l]=min(eval4);
         [wf,k]=max(eval4);
         if cfm==0&fm<bf
         eval4(l)=fm;
         xnew2(:,l)=xm;
         cons4(l)=cfm;  
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];    
         elseif cfm==0&fm>bf&fm<wf
         eval4(k)=fm;
         xnew2(:,k)=xm;
         cons4(k)=cfm;  
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];
         elseif (cfm>0)|(cfm==0&fm>wf)
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];
         end
    elseif cons4>=0
         eval4b=eval4(find(cons4==0));
         bf=min(eval4b);
         l=find(eval4==bf);   
         [hc,k]=max(cons4);
          wf=eval4(k);
          if cfm==0&fm<bf
         eval4(l)=fm;
         xnew2(:,l)=xm;
         cons4(l)=cfm;  
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];    
         elseif cfm==0&fm>bf|cfm>0&fm<wf
         eval4(k)=fm;
         xnew2(:,k)=xm;
         cons4(k)=cfm;  
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];
         elseif (cfm>0&fm>wf)
         eval5=[eval4];
         xfff=[xnew2];
         cons5=[cons4];
         end
    end
    optb=xfff;
   if cons5==0
   [best1,I]=min(eval5);                 
    bestx=optb(:,I);
   elseif cons5>0
   J=find(cons5>0);
   optcons=cons5(J);
   optva=eval5(J);
   optbx=optb(:,J);
   [bestc,I]=min(optcons);  
    best1=optva(I);
    bestx=optbx(:,I);
   else
     J=find(cons5==0);
   optva=eval5(J);
   optbx=optb(:,J);
   [best1,I]=min(optva);                 
    bestx=optbx(:,I);
   end
    evalf=eval5;
    cf=cons5;
    allX=xfff;
    m=m+1
 end
 toc;
 [mbest(t),I5(t)]=min(best1)
   m=bestx(:,I5(t))
   c1=g1(m)
   c2=g2(m)
   c3=g3(m)
   c4=g4(m)
   c5=g5(m)
   c6=g6(m)
   c7=g7(m)
   evalf=f(m)
end   
 av=mean(mbest)
 mi=min(mbest)
 ma=max(mbest)
 me=median(mbest)
 st=std(mbest)
 
 
      