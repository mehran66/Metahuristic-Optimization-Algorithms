function z=Function(x,y,funnum)
 funnum= funnum-1;
if funnum==1 
z=x.^2+y.^2;
elseif funnum==2
z=100*(y.^2-x).^2+(1-x).^2;
elseif funnum==3
aa=x.^2+y.^2;
bb=((x+.5).^2+y.^2).^0.1;
z=aa.^0.25.*sin(30*bb).^2+abs(x)+abs(y);
elseif funnum==4
z=x.*sin(sqrt(abs(x-(y+9))))-(y+9).*sin(sqrt(abs(y+0.5.*x+9)));
elseif funnum==5
r = sqrt(x.^2 + y.^2);
z =- sin(r)./r;
elseif funnum==6
z=-peaks(x,y);
elseif funnum==7
z=-x.*exp(-x.^2-y.^2);
elseif funnum==8
z=x.^2+y.^2-10*((cos(x))+(cos(y)));
elseif funnum==9
z=x.^2+(x.^2+y.^2) ;   
elseif funnum==10
    z=x.*sin(sqrt(abs(x)))-y.*sin(sqrt(abs(y)));
elseif funnum==11 
  z=peaks(x,y);
elseif funnum==12
z = 20 + x.^2 + y.^2 - 10*(cos(2*pi*x) + cos(2*pi*y)) + (y - 1).^2;
end

