function saveImage(~,~,ax_h)

filename='six.mat'; %filename to save
try
    char=load(filename); 
    char=char.char;
catch
    char=[];
end
a=getappdata(ax_h,'a');
char=cat(3,char,a);
save(filename,'char');
imshow(ones(100),'parent',ax_h);
setappdata(ax_h,'a',ones(100));