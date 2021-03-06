function [BestCost,GlobalBestPosition]=TS_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,MaximumIteration,funnum)

Pop=(rand(1000,2));
Pop(:,1)=Pop(:,1)*(X_VarHigh-X_VarLow)+X_VarLow; 
Pop(:,2)=Pop(:,2)*(Y_VarHigh-Y_VarLow)+Y_VarLow; 
Cost=Function(Pop(:,1),Pop(:,2),funnum);
[Cost Index]=sort(Cost);
Pop=Pop(Index,:);
Current=Pop(1,:);
Current_Cost=Function(Pop(1,1),Pop(2,2),funnum);



[X,Y]=meshgrid(X_VarLow:.2:X_VarHigh,Y_VarLow:.2:Y_VarHigh);
Z=Function(X,Y,funnum);
% meshc(X,Y,Z)
surfl(X,Y,Z);
shading interp
colormap copper
hold on
s1=text(Current(1,1),Current(1,2),Current_Cost,'*');
set(s1,'color','r','Fontsize',25);


for ii=1:MaximumIteration
  temp1=Current_Cost; 
  Rand1=(rand(10000,2));
  Rand1(:,1)=Rand1(:,1)*0.00001; 
  Rand1(:,2)=Rand1(:,2)*0.00001;
  t1=find(Rand1(:,1)>X_VarHigh); 
  Rand1(t1,1)=X_VarHigh;
  t2=find(Rand1(:,1)<X_VarLow); 
  Rand1(t2,1)=X_VarLow;
  t3=find(Rand1(:,2)>Y_VarHigh); 
  Rand1(t3,1)=Y_VarHigh;
  t4=find(Rand1(:,2)<Y_VarLow); 
  Rand1(t4,1)=Y_VarLow;
  Cost_Rand1=Function(Rand1(:,1),Rand1(:,2),funnum);
  [Cost_Rand1 Index]=sort(Cost_Rand1);
  Pop_Rand1=Rand1(Index,:);
  if Cost_Rand1(1)<Current_Cost
      Current(1,1)=Pop_Rand1(1,1);
      Current(1,2)=Pop_Rand1(1,2);
  else
      break;
  end
  Current_Cost=Function(Current(1,1),Current(1,2),funnum);
  BestCost(ii)=Current_Cost;
  set(s1(1),'position',[Current(1,1),Current(1,1),Current_Cost]);
      pause(.02)
end

GlobalBestPosition=[Current(1) Current(2) Current_Cost]