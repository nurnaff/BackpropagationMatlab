data=xlsread('data.xls','L2:S351');
p=data(:,1:7);
p=p';
t=data(:,8);
t=t';
net=newff([min(p(1,:)) max(p(1,:));min(p(2,:)) max(p(2,:));min(p(3,:)) max(p(3,:));min(p(4,:)) max(p(4,:));min(p(5,:)) max(p(5,:))
;min(p(6,:)) max(p(6,:));min(p(7,:)) max(p(7,:))],[5,1],{'tansig','purelin'});
tra=train(net,p,t);
input=xlsread('data.xls','L252:S401');
query=input(:,1:7);
query=query';
target=input(:,8);
target=target';
y=sim(tra,query);
[b k]=size(target);
jum_mse=0;
for i=1:b
    jum_mse=jum_mse+((target(i)-y(i))^2);
end
rata_mse=jum_mse/b;