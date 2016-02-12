load one

for id=1:size(char,3)
    if min(char(:,:,id))==1
        disp(id)
    end
end