function [BestCost,MeanCost,GlobalBestPosition]=CSO_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,SwarmSize,max_iter,funnum,SMP,SRD,SPC,MR,c,vmax,vmin)
cat_no=SwarmSize;
%% initial position
cats1=randint(cat_no,1,[X_VarLow,X_VarHigh]);
cats2=randint(cat_no,1,[Y_VarLow,Y_VarHigh]);
cats=[cats1 cats2];

%% Evaluate initial population
for i=1:cat_no
    cats(i,3)=Function(cats(i,1),cats(i,2),funnum);
end
%initial velocity
cats(:,4:5)=0;
cats=sortrows(cats,3);
best_cat=cats(cat_no,1:3);
BestCost(1)=min(cats(:,3)); 
MeanCost(1)=mean(cats(:,3));

[X,Y]=meshgrid(X_VarLow:.2:X_VarHigh,Y_VarLow:.2:Y_VarHigh);
Z=Function(X,Y,funnum);
% meshc(X,Y,Z)
surfl(X,Y,Z);
shading interp
colormap copper
hold on
s1=text(cats(:,1),cats(:,2),cats(:,3),'.');
set(s1,'color','r','Fontsize',25);

%% Swarm loop

iter=1;
while iter<=max_iter
    cats(:,6)=0;
    for j=1:MR
        tt=randint(1,1,[1,cat_no]);
        cats(tt,6)=1;
    end
    cats=sortrows(cats,3);
    if cats(cat_no,3)>best_cat(1,3)
    best_cat=cats(cat_no,1:3);
    end
    for i=1:cat_no
        if cats(i,6)==0
            %seeking mode
            %determinig no. of copies
            if SPC==true
                j=SMP-1;
                for r=1:j
                    delta_x=SRD*(-1)+(2*SRD)*rand;
                    delta_y=SRD*(-1)+(2*SRD)*rand;
                    seeking(r,1:2)=[cats(i,1)+delta_x,cats(i,2)+delta_y];
                    seeking(r,3)=Function(seeking(r,1),seeking(r,2),funnum);
                end
                seeking(j+1,1:3)=cats(i,1:3);
                seeking=sortrows(seeking,3);
                seek_min=seeking(1,3);
                seek_max=seeking(j+1,3);
                for v=1:SMP
                    seeking(v,4)=(abs(seeking(v,3)-seek_min))/(seek_max-seek_min);
                end
                rand_cum=rand;
                for t=1:SMP
                    if rand_cum>seeking(t,4) && rand_cum<seeking(t+1,4)
                        cats(i,1:3)=seeking(t+1,1:3);
                        break;
                    end
                end
            else
                j=SMP;
                for r=1:j
                    delta_x=SRD*(-1)+(2*SRD)*rand;
                    delta_y=SRD*(-1)+(2*SRD)*rand;
                    seeking(r,1:2)=[cats(i,1)+delta_x,cats(i,2)+delta_y];
                    seeking(r,3)=Function(seeking(r,1),seeking(r,2),funnum);
                end
                seeking=sortrows(seeking,3);
                seek_min=seeking(1,3);
                seek_max=seeking(j,3);
                for v=1:SMP
                    seeking(v,4)=(abs(seeking(v,3)-seek_min))/(seek_max-seek_min);
                end
                rand_cum=rand;
                for t=1:SMP
                    if rand_cum>seeking(t,4) && rand_cum<seeking(t+1,4)
                        cats(i,1:3)=seeking(t+1,1:3);
                        break;
                    end
                end
            end
        else
            %Tracing mode
            vx=cats(i,4)+rand*c*(best_cat(1,1)-cats(i,1));
            %velocity clamping
            if vx<vmin
                vx=vmin;
            elseif vx>vmax
                vx=vmax;
            end
            cats(i,4)=vx;
            vy=cats(i,5)+rand*c*(best_cat(1,2)-cats(i,2));
            if vy<vmin
                vy=vmin;
            elseif vy>vmax
                vy=vmax;
            end
            cats(i,5)=vy;
            x=cats(i,1)+cats(i,4);
            %positional clamping (x)
            if x<-3
                x=-3;
            elseif x>3
                x=3;
            end
            cats(i,1)=x;
            y=cats(i,2)+cats(i,5);
            %positional clamping (y)
            if y<-3
                y=-3;
            elseif y>3
                y=3;
            end
            cats(i,2)=y;
            cats(i,3)=Function(cats(i,1),cats(i,2),funnum);
        end
    end
    iter=iter+1;
    for j=1:SwarmSize
        set(s1(j),'position',[cats(j,1),cats(j,2),cats(j,3)])
    end
    pause(.02)
    BestCost(iter)=min(best_cat(1,3)); 
    MeanCost(iter)=mean(cats(:,3));
end
GlobalBestPosition=best_cat(1,1:3)