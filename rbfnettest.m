function y=rbfnettest(sample)

global rbfnet;
feature=extractFeature(sample);
t=sim(rbfnet,feature);
t=t*10;
y=round(t);