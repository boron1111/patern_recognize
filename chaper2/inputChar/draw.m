function draw(~,~,ax_h)

currPos=get(ax_h,'CurrentPoint');
currPos=uint8(currPos(1,1:2));
if (currPos>3) 
    if (currPos <98)
        a=getappdata(ax_h,'a');
        a(currPos(2)-2:currPos(2)+2,currPos(1)-2:currPos(1)+2)=0;        
        setappdata(ax_h,'a',a);
        imshow(a,'parent',ax_h);
    end
end