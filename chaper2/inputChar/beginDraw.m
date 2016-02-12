function beginDraw(~,~,ax_h,fi_h)
    
set(fi_h,'WindowButtonMotionFcn',{@draw,ax_h});
set(fi_h,'WindowButtonUpFcn',{@stopDraw,ax_h});