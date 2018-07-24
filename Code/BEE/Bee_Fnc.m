function [BestCost,MeanCost,GlobalBestPosition]=Bee_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,MaxIteration,n,m,e,Ne,Nb,Nr,funnum)

%% Algoritm Parameters
%n% Number of bees
%m% best bees
%e;% Elite 
b=m-e;% Other best
%Ne;% Recruited bees  Around elite
%Nb;% Recruited bees Around other best
Sb=n-m;% Scout bees
%Nr;%Neighborhood size 
Pop=(rand(n,2));
Pop(:,1)=Pop(:,1)*(X_VarHigh-X_VarLow)+X_VarLow; 
Pop(:,2)=Pop(:,2)*(Y_VarHigh-Y_VarLow)+Y_VarLow; 

%% Evaluate initial population
Cost=Function(Pop(:,1),Pop(:,2),funnum);


 [Cost Index]=sort(Cost);
 Pop=Pop(Index,:);
 
 [X,Y]=meshgrid(X_VarLow:.2:X_VarHigh,Y_VarLow:.2:Y_VarHigh);
Z=Function(X,Y,funnum);
% meshc(X,Y,Z)
surfl(X,Y,Z);
shading interp
colormap copper
hold on
s1=text(Pop(:,1),Pop(:,2),Cost,'*');
set(s1,'color','r','Fontsize',25);
 
 %% MAIN LOOP

for Iter = 1:MaxIteration

%   Recruit bees for elite site 
       for ii=1:e
          temp1=Cost(ii); 
          Rand1=(rand(Ne,2));
          Rand1(:,1)=Rand1(:,1)*0.00001; 
          Rand1(:,2)=Rand1(:,2)*0.00001;
          Cost_Rand1=Function(Rand1(:,1),Rand1(:,2),funnum);
          [Cost_Rand1 Index]=sort(Cost_Rand1);
          Pop_Rand1=Rand1(Index,:);
          if Cost_Rand1(1)<temp1
              Pop(ii,1)=Rand1(1,1);
              Pop(ii,2)=Rand1(1,2);
          end
       end
%   Recruit bees for other best 
        for ii=1:b
            temp1=Cost(ii+e);
          Rand2=(rand(Nb,2));
          Rand2(:,1)=Rand2(:,1)*0.000001; 
          Rand2(:,2)=Rand2(:,2)*0.000001;
          Cost_Rand2=Function(Rand2(:,1),Rand2(:,2),funnum);
          [Cost_Rand2 Index]=sort(Cost_Rand2);
          Pop_Rand2=Rand2(Index,:);
          if Cost_Rand2(1)<temp1
              Pop(ii+e,1)=Rand2(1,1);
              Pop(ii+e,2)=Rand2(1,2);
          end
        end
%   Scout bees  
        Scout_Bee=(rand(Sb,2));
        Scout_Bee(:,1)=Scout_Bee(:,1)*(X_VarHigh-X_VarLow)+X_VarLow; 
        Scout_Bee(:,2)=Scout_Bee(:,2)*(Y_VarHigh-Y_VarLow)+Y_VarLow;
       
      Pop(m+1:end,:)= Scout_Bee;
      Cost=Function(Pop(:,1),Pop(:,2),funnum);
      [Cost Index]=sort(Cost);
      Pop=Pop(Index,:);
      
      BestCost(Iter)=min(Cost); 
      MeanCost(Iter)=mean(Cost);
      
      for j=1:n
            set(s1(j),'position',[Pop(j,1),Pop(j,2),Cost(j)])
      end
      pause(.02)
end

GlobalBestPosition=[Pop(1,1),Pop(1,2),BestCost(end)];



        
        
