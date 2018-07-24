function [minc,meanc,GlobalBestPosition]=GA_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,MaxIter,funnum,popsize,KeepPercent,CrossPercent,MutatPercent)
%funnum=>  objective function
npar=2; % number of optimization variables
varhi=X_VarHigh; varlo=X_VarLow;  % variable limits%
% II Stopping criteria
maxit=MaxIter;          % max number of iterations
mincost=-9999999;   % minimum cost
% III GA parameters
popsize=popsize;    % set population size
mutrate=.2;    % set mutation rate
selection=0.5; % fraction of population kept
Nt=npar;      % continuous parameter GA Nt=#variables
keep=floor(selection*popsize);    % #population
% members that survive
nmut=ceil((popsize-1)*Nt*mutrate);  % total number of 
% mutations
M=ceil((popsize-keep)/2); % number of matings
%_______________________________________________________
% Create the initial population
iga=0; % generation counter
% initialized
par=(varhi-varlo)*rand(popsize,npar)+varlo;  % random
 cost=Function(par(:,1),par(:,2),funnum);% calculates population cost 
% using ff
[cost,ind]=sort(cost);  % min cost in element 1
par=par(ind,:);         % sort continuous
minc(1)=min(cost);      % minc contains min of
meanc(1)=mean(cost);    % meanc contains mean of
% population
%_______________________________________________________

[X,Y]=meshgrid(X_VarLow:.2:X_VarHigh,Y_VarLow:.2:Y_VarHigh);
Z=Function(X,Y,funnum);
% meshc(X,Y,Z)
surfl(X,Y,Z);
shading interp
colormap copper
hold on
s1=text(par(:,1),par(:,2),cost,'*');
set(s1,'color','r','Fontsize',25);

% Iterate through generations
while iga<maxit
iga=iga+1;         % increments generation counter
%_______________________________________________________
% Pair and mate
M=ceil((popsize-keep)/2);          % number of matings
prob=flipud([1:keep]'/sum([1:keep])); % weights 
% chromosomes
odds=[0 cumsum(prob(1:keep))'];      % probability 
% distribution 
% function
pick1=rand(1,M); % mate #1
pick2=rand(1,M); % mate #2
% ma and pa contain the indicies of the chromosomes 
% that will mate
ic=1;
while ic<=M
for id=2:keep+1
if pick1(ic)<=odds(id) & pick1(ic)>odds(id-1)
ma(ic)=id-1;
end
if pick2(ic)<=odds(id) & pick2(ic)>odds(id-1)
pa(ic)=id-1;
end
end
ic=ic+1;
end
%_______________________________________________________
%    Performs mating using single point crossover
ix=1:2:keep; % index of mate #1
xp=ceil(rand(1,M)*Nt); % crossover point
r=rand(1,M); % mixing parameter
for ic=1:M
xy=par(ma(ic),xp(ic))-par(pa(ic),xp(ic)); % ma and pa
% mate
par(keep+ix(ic),:)=par(ma(ic),:);   % 1st offspring
par(keep+ix(ic)+1,:)=par(pa(ic),:);   % 2nd offspring
par(keep+ix(ic),xp(ic))=par(ma(ic),xp(ic))-r(ic).*xy;
% 1st
par(keep+ix(ic)+1,xp(ic))=par(pa(ic),xp(ic))+r(ic).*xy;
% 2nd
if xp(ic)<npar % crossover when last variable not selected
par(keep+ix(ic),:)=[par(keep+ix(ic),1:xp(ic));
par(keep+ix(ic)+1,xp(ic)+1:npar)];
par(keep+ix(ic)+1,:)=[par(keep+ix(ic)+1,1:xp(ic));
par(keep+ix(ic),xp(ic)+1:npar)];
end % if
end
%_______________________________________________________
% Mutate the population
mrow=sort(ceil(rand(1,nmut)*(popsize-1))+1);
mcol=ceil(rand(1,nmut)*Nt);
for ii=1:nmut
par(mrow(ii),mcol(ii))=(varhi-varlo)*rand+varlo;  
% mutation
end % ii
%_______________________________________________________
%    The new offspring and mutated chromosomes are 
% evaluated
 cost=Function(par(:,1),par(:,2),funnum);% calculates population cost 
%_______________________________________________________
%      Sort the costs and associated parameters
[cost,ind]=sort(cost);
par=par(ind,:);
%_______________________________________________________
%     Do statistics for a single nonaveraging run
minc(iga+1)=min(cost);
meanc(iga+1)=mean(cost);
%_______________________________________________________
% Stopping criteria
if iga>maxit | cost(1)<mincost
break
end
for j=1:popsize
set(s1(j),'position',[par(j,1),par(j,2),cost(j)])
end
pause(.02);
end %iga
%_______________________________________________________
GlobalBestPosition=[par(1,1),par(1,2),cost(1)];