function [Ia,Ib] = imageAlign(Ia,Ib)

if size(Ia,3)==1
        Ia = repmat(Ia,[1,1,3]);
end
if size(Ib,3)==1
        Ib = repmat(Ib,[1,1,3]);
end

[wa,ha,~] = size(Ia);
[wb,hb,~] = size(Ib);
maxw = max(wa,wb);maxh = max(ha,hb);
Ib(wb+1:maxw, :,:) = 0;
Ia(wa+1:maxw, :,:) = 0;