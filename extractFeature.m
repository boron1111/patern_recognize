function F=extractFeature(x)
% 提取字符图片x的特征

div=5; %分成的小格数
sz=size(x);
subHeight=ceil(sz(1)/div);
subWidth=ceil(sz(2)/div);
char_cell=mat2cell(x,[subHeight*ones(1,div-1),sz(1)-(div-1)*subHeight],...
    [subWidth*ones(1,div-1),sz(2)-(div-1)*subWidth]);
char_cell=char_cell(:);
F=zeros(length(char_cell),1);
for id=1:length(char_cell)
    F(id)=1-(sum(char_cell{id}(:))/length(char_cell{id}(:)));
end