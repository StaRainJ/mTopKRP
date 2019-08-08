%%  This is a demo for removing outliers Using mTopKRP.
% Edit by: Xingyu Jiang 
% Date:    04/12/2018
%%
clear; 
close all; 
initialization;  %run it only at the first time
addpath('data');

%%  Inpute Data
    tt=  62  ;
    Ia = imread([num2str(tt),'_l.jpg']);
    Ib = imread([num2str(tt),'_r.jpg']);
    load('Top62.mat');

%% data align
[Ia,Ib] = imageAlign(Ia,Ib);
    [numx1,numx2] = size(X);
    Num=numx1;
    if numx1<numx2
       X=X';Y=Y';
       Num=numx2;
    end
    Xt = X';Yt = Y';
 tic   
%% 
% idxRepeat=removeRepeat(Num,X,Y,CorrectIndex); %% ÌÞ³ýÖØ¸´Æ¥Åä
idxUnique=1:Num;

%% Parameters Setting
tic
    tau1 = 0.80;     numNeigh1 = 15;
    tau2 = 0.35;     numNeigh2 = 15;
    tau3 = 0.35;     numNeigh3 = 15;
%     tau4 = 0.35;     numNeigh4 = 10; 

    conf=[];
    conf.iteration = 3; 
    conf.scale = 3;  
    conf.interval = 2; 
    conf.Num = Num;
    
%% iteration1
    Idx = GetCorectIdx(Xt,Yt,numNeigh1,tau1, conf,idxUnique);
    
%% iteration2
  if  conf.iteration>=2
      Idx = GetCorectIdx(Xt,Yt,numNeigh2,tau2, conf,Idx);
  end
  
%% iteration3
  if  conf.iteration>=3
    Idx = GetCorectIdx(Xt,Yt,numNeigh3,tau3, conf,Idx);
  end
  
 %%  Measurement
toc  
ind = Idx;
[pr,re,f_1] = evaluate(ind,CorrectIndex,Num)


 %% PLOT results
[FP,FN] = plot_matches(Ia, Ib, X, Y, ind, CorrectIndex);
plot_4c(Ia, Ib, X, Y, ind, CorrectIndex);
