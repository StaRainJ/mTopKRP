function [pr,re,f_1]= evaluate(ind,CorrectIndex,numx1)
%     TP = length(intersect(ind,CorrectIndex));
%     FP = length(ind)-length(intersect(ind,CorrectIndex));
%     FN = length(CorrectIndex)-length(intersect(ind,CorrectIndex));
%     TN = numx1-TP-FP-FN;
%     ac  = (TP+TN)/numx1;

    pr  = length(intersect(ind,CorrectIndex))/length(ind);
    re  = length(intersect(ind,CorrectIndex))/length(CorrectIndex);
    f_1 = 2*pr*re/(pr+re);