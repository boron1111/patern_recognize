clc
x=rand(1000,1);
x=(x-0.5)*2*sqrt(10);
y=x;
for id=1:length(x)
    y_bound=sqrt((1-(x(id)^2)/10)*3);
    y(id)=(rand(1)-0.5)*2*y_bound;
end
x=x+0.5;
y=y+0.3;
plot(x,y,'.')
ylim([-4 4]);xlim([-4 4]);

X=[x';y'];
cov(X')

rot=[cos(pi/6) sin(pi/6);-sin(pi/6) cos(pi/6)];
X=rot*X;
figure;plot(X(1,:),X(2,:),'.');
ylim([-4 4]);xlim([-4 4]);
cov(X')

[pc latent,explained]=pcacov(cov(X'));
Y=X'*pc;
Y=Y';
figure;plot(Y(1,:),Y(2,:),'.');
ylim([-4 4]);xlim([-4 4]);
cov(Y')
