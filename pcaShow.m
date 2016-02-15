for id=1:length(classifiedTotalSample)
    feature=extractFeatureFromSeries(totalSample);
    pc=princomp(feature');
    pc=pc(:,1:2);
    feature=extractFeatureFromSeries(classifiedTotalSample{id});
    pcaed{id}=feature'*pc;
end

comp1=2;
comp2=3;
figure;plot(pcaed{comp1}(:,1),pcaed{comp1}(:,2),'r.',pcaed{comp2}(:,1),pcaed{comp2}(:,2),'b.')