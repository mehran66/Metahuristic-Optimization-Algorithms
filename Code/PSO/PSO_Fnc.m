function [BestCost,MeanCost,GlobalBestPosition]=PSO_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,SwarmSize,MaxIter,C1,C2,funnum)
%% Initial Swarm
Particle=(rand(SwarmSize,2));
Particle(:,1)=Particle(:,1)*(X_VarHigh-X_VarLow)+X_VarLow; 
Particle(:,2)=Particle(:,2)*(Y_VarHigh-Y_VarLow)+Y_VarLow; 
Velocity = rand(SwarmSize,2)*0; 


%% Evaluate initial population
Cost=Function(Particle(:,1),Particle(:,2),funnum);
BestCost(1)=min(Cost); 
MeanCost(1)=mean(Cost);
Globalmin=BestCost(1);
LocalBestPosition = Particle; 
LocalBestCost = Cost; 
[GlobalBestCost,Index] = min(Cost);
GlobalBestPosition=Particle(Index,:);


[X,Y]=meshgrid(X_VarLow:.2:X_VarHigh,Y_VarLow:.2:Y_VarHigh);
Z=Function(X,Y,funnum);
% meshc(X,Y,Z)
surfl(X,Y,Z);
shading interp
colormap copper
hold on
s1=text(Particle(:,1),Particle(:,2),Cost,'*');
set(s1,'color','r','Fontsize',25);

%% Swarm loop
Iter = 0;
cond=100;
%cond >10*10^(-10)
%Iter<MaxIter
while Iter<MaxIter
Iter = Iter + 1;
W=1; 
r1 = rand(SwarmSize,2);
r2 = rand(SwarmSize,2); 
Velocity =.5*(W*Velocity + C1 *r1.*(LocalBestPosition-Particle) +C2*r2.*(ones(SwarmSize,1)*GlobalBestPosition-Particle));
Particle = Particle + Velocity; 

Inx=find(Particle(:,1)>X_VarHigh);
Particle(Inx,1)=X_VarHigh;
Inx=find(Particle(:,1)<X_VarLow);
Particle(Inx,1)=X_VarLow;

Inx=find(Particle(:,2)>Y_VarHigh);
Particle(Inx,2)=Y_VarHigh;
Inx=find(Particle(:,2)<Y_VarLow);
Particle(Inx,2)=Y_VarLow;

% Evaluate the new swarm

Cost=Function(Particle(:,1),Particle(:,2),funnum);
for j=1:SwarmSize
set(s1(j),'position',[Particle(j,1),Particle(j,2),Cost(j)])
end
% hold (handles.axes1,'off');
bettercost = Cost < LocalBestCost;
LocalBestCost = LocalBestCost.*not(bettercost) +Cost.*bettercost;
LocalBestPosition(find(bettercost),:) =Particle(find(bettercost),:);

[temp, t] = min(LocalBestCost);
if temp<GlobalBestCost
GlobalBestPosition=Particle(t,:); indx=t; GlobalBestCost=temp;
end
[Iter GlobalBestPosition GlobalBestCost];
BestCost(Iter+1)=min(Cost);
Globalmin(Iter+1)=GlobalBestCost; 
MeanCost(Iter+1)=mean(Cost);
cond=MeanCost(Iter+1)-BestCost(Iter+1);
pause(.02)
n = 3;
end
GlobalBestPosition=[GlobalBestPosition BestCost(end)] ;