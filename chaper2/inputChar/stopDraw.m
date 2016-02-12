function stopDraw(fi_h,~,ax_h)

set(fi_h,'WindowButtonMotionFcn',{});
uicontrol('style','pushbutton','string','input','Callback',{@saveImage,ax_h});