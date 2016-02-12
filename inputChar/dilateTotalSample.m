se=strel('square',8);
for id=1:size(totalSample,3)
    data=totalSample(:,:,id);
    data=1-im2bw(data);
    data=imdilate(data,se);
    totalSample(:,:,id)=double(1-data);
end
clear se data