function rbfnet
% ¹¹½¨²¢ÑµÁ·RBFÍøÂç
    
global rbfnet;
clc
load pattern;
c=0;
for i=1:length(pattern)
    for j=1:size(pattern{i},2)
        c=c+1;
        p(:,c)=pattern{i}(:,j);
    end
end
start=1;
for i=1:length(pattern)
    tc(:,start:start+size(pattern{i},2)-1)=i-1;
    start=start+size(pattern{i},2);
end
tc=tc/10;
t=tc;
SPREAD=1;
rbfnet=newrbe(p,t,SPREAD);