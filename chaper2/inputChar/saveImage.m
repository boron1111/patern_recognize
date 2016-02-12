function saveImage(~,~,ax_h)

try
    one=load('zeros.mat');
    one=one.one;
catch
    one=[];
end
a=getappdata(ax_h,'a');
one=cat(3,one,a);
save('one.mat','one');
imshow(ones(100),'parent',ax_h);
setappdata(ax_h,'a',ones(100));