%input the character, filename is defined in saveImage.m

a=ones(100);
imshow(a);
fi_h=gcf;
ax_h=gca;
set(fi_h,'WindowButtonDownFcn',{@beginDraw,ax_h,fi_h});
set(ax_h,'nextplot','replacechildren');
setappdata(ax_h,'a',a);