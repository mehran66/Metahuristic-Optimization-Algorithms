function [avrcost,finalcost,GlobalBestPosition]=SA(xlow,xhigh,ylow,yhigh,initial_temp,final_temp,cool,func_no,mM)
%initial solution & it's fitness value
r1 = xlow + (xhigh-xlow).*rand;
r2 = ylow + (yhigh-ylow).*rand;
solution(1,1:2)=[r1,r2];
solution(1,3)=Function(solution(1,1),solution(1,2),func_no);
%metropolis loop to find new solution
%equilibrium criterion has been set to 100
[X,Y]=meshgrid(xlow:.2:xhigh,ylow:.2:yhigh);
Z=Function(X,Y,func_no);
% meshc(X,Y,Z)
surfl(X,Y,Z);
shading interp
colormap copper
hold on
s1=text(solution(1),solution(2),solution(3),'*');
set(s1,'color','r','Fontsize',25);


temp=initial_temp;
counter=1;
switch mM
    case 1
while floor(temp)>final_temp
for i=1:1000
    n1=-.5+rand;
    n2=-.5+rand;
    neighbor(1,1:2)=[solution(1,1)+n1,solution(1,2)+n2];
    if neighbor(1,1)<xlow
        neighbor(1,1)=xlow;
    elseif neighbor(1,1)>xhigh
         neighbor(1,1)=xhigh;
    end
    if neighbor(1,2)<ylow
        neighbor(1,2)=ylow;
    elseif neighbor(1,2)>yhigh
        neighbor(1,2)=yhigh;
    end
    neighbor(1,3)=Function(neighbor(1,1),neighbor(1,2),func_no);
    if neighbor(1,3)<=solution(1,3)
        solution=neighbor;
    elseif rand<exp((solution(1,3)-neighbor(1,3))/(.0001*temp));
        solution=neighbor;
    end
    itercost(1,i)=solution(1,3);
end
avrcost(1,counter)=sum(itercost)/length(itercost);
finalcost(1,counter)=solution(1,3);
temp=cool*temp;
counter=counter+1;
      set(s1(1),'position',[solution(2),solution(2),solution(3)]);
      pause(.02)
end
GlobalBestPosition=solution;
    case 2
while floor(temp)>final_temp
for i=1:1000
    n1=-.5+rand;
    n2=-.5+rand;
    neighbor(1,1:2)=[solution(1,1)+n1,solution(1,2)+n2];
    if neighbor(1,1)<xlow
        neighbor(1,1)=xlow;
    elseif neighbor(1,1)>xhigh
         neighbor(1,1)=xhigh;
    end
    if neighbor(1,2)<ylow
        neighbor(1,2)=ylow;
    elseif neighbor(1,2)>yhigh
        neighbor(1,2)=yhigh;
    end
    neighbor(1,3)=Function(neighbor(1,1),neighbor(1,2),func_no);
    if neighbor(1,3)>=solution(1,3)
        solution=neighbor;
    elseif rand<exp((neighbor(1,3)-solution(1,3))/(.0001*temp));
        solution=neighbor;
    end
    itercost(1,i)=solution(1,3);
end
avrcost(1,counter)=sum(itercost)/length(itercost);
finalcost(1,counter)=solution(1,3);
temp=cool*temp;
counter=counter+1; 
      set(s1(1),'position',[solution(2),solution(2),solution(3)]);
      pause(.02)
end
GlobalBestPosition=solution;
end
        