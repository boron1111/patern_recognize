function h=zhengtai(x)
% ����x�Ƿ�����̬�ֲ�������ֵ��0���㣬1������
% �������еڶ��µĳ���

% m=x;  %ѡ���Ƿ�ά
m=zeros(5,size(x,2));
div=floor(size(x,1)/5);
for id=1:4
    m(id,:)=sum(x((id-1)*div+1:id*div,:)); % ��������size(x,1)ά����5ά
end
m(5,:)=sum(x(4*div+1:end));
dsig_cov=cov(m');
pc=pcacov(dsig_cov); % ���ɷַ���
pc=pc(:,1);
% pc(:,2:5)=[];
y=m'*pc;
figure;
hist(y,40);
h=jbtest(y,0.05); % ��̬�ֲ�����