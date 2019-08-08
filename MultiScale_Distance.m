function  Di = MultiScale_Distance(list1,dist1,list2, dist2,conf)

cost=zeros(1,size(conf,1));
for scale = 1 : size(conf,1)
 Km= conf(scale,1); PHI_MAX=conf(scale,2); d23= conf(scale,3);

% [~,ia,ib]=intersect(list1(1:Km),list2(1:Km));
%%
L1 = list1(1:Km);
L2 = list2(1:Km);
LIST = [[L1;L2],[1:2*Km]'];
L = sortrows(LIST,1);
temp1 = logical(diff(L(:,1)));
ia= L([~temp1;false],2);
ib= L([false;~temp1],2)-Km;
%%
distX=dist1(ia); distY=dist2(ib);
[~,S1] = sort(distX); [~,S2] = sort(distY);
[~,pos1] = sort(S1); [~,pos2] = sort(S2);
DP = pos1-pos2;
phi1 = sum(abs(DP) ./ min(pos1,pos2));
phi23 = 2*(Km-length(DP)) * d23;
cost(scale) = (phi1+phi23)/PHI_MAX;
% cost(scale) = (Km-length(DP))./Km;  %% the cost of LPM
% CO{scale}=CommonID;
end
Di = mean(cost);
end
