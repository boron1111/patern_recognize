function h=zhengtai(x)
% 检验x是否是正态分布。返回值：0满足，1不满足
% 这是书中第二章的程序

% m=x;  %选择是否降维
m=zeros(5,size(x,2));
div=floor(size(x,1)/5);
for id=1:4
    m(id,:)=sum(x((id-1)*div+1:id*div,:)); % 将特征从size(x,1)维降到5维
end
m(5,:)=sum(x(4*div+1:end));
dsig_cov=cov(m');
pc=pcacov(dsig_cov); % 主成分分析
pc=pc(:,1);
% pc(:,2:5)=[];
y=m'*pc;
figure;
hist(y,40);
h=jbtest(y,0.05); % 正态分布检验