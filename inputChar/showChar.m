% load six
char=totalSample;
num=size(char,3);
n=ceil(sqrt(num));
im_cell=cell(n^2,1);
for id=1:num
    im_cell{id}=char(:,:,id);
end
for id=num+1:n^2
    im_cell{id}=ones(size(char,1),size(char,2));
end
im_cell=reshape(im_cell,[n n]);
im=cell2mat(im_cell);
imshow(im);