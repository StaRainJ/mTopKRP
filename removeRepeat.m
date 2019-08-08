function idxRepeat = removeRepeat(Num,X,Y,CorrectIndex)
ind0 = zeros(Num,1);
ind0(CorrectIndex) = 1;
[aa,bb] = sort(X(:,1));
[cc,dd] = sort(Y(:,1));
cc0=logical(abs(diff(aa)));
dd0=logical(abs(diff(cc)));
cc1 = [true;cc0];
cc2 = [cc0;true];
CC=cc1&cc2;

ee1 = [true;dd0];
ee2 = [dd0;true];
EE=ee1&ee2;
ind10 = ones(Num,1);
ind11 = ones(Num,1);
ind10(bb)=CC;
ind11(dd)=EE;
idx00=ind10&ind11;
idxRepeat=find(idx00==1);
