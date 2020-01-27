clc; close all; clear all;

data= load('q3_1_data.mat');
tX=data.trD';
tY=data.trLb;
vX=data.valD';
vY=data.valLb;

C=0.1;
% C=100;

[w,b]=SVM_QP(tX,tY,C);
y=vX*w+b;

y(find(y>0))=1;
y(find(y<=0))=-1;
result=[vY,y];
correct=size(find(vY.*y>0),1);
accuracy=correct/size(vY,1)
disp(['accuracy: ',num2str(accuracy)]);
confusion=[size(find(vY>0&y>0),1),size(find(vY<0&y>0),1);
           size(find(vY>0&y<0),1),size(find(vY<0&y<0),1)]