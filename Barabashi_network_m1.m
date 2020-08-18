clear %time=12m
tic
N=1000; %number of nodes
A=zeros(N);
A(1,2)=1;
A(2,1)=1;
num=2;
P=zeros(1,N);
P(1,1)=sum(A(1,:));
P(1,2)=sum(A(2,:));
%SUM=sum(sum(A));
SUM=0;
k(1,1)=P(1,1); % we start with 3 nodes that are fully connected
k(2,1)=P(1,2);
k(3,1)=P(1,3);
for t=1:N-2
    num=num+1
    SUM=SUM+2;
    %[r,c]=find(A);
    while sum(A(num,:))==0
    %for i=1:max(r)*10
        %R=randi([1,max(r)],1);
        R=randi(num-1);
        p=P(1,R)/SUM;
        if rand < p
            A(num,R)=1;
            A(R,num)=1;
            P(1,num)=1;
            P(1,R)=(sum(A(R,:)));
        
        end
        %if sum(A(num,:))==1
        %   break
        %end
    end
    k(1,t+1)=sum(A(1,:));
    k(2,t+1)=sum(A(2,:));
    k(3,t+1)=sum(A(3,:));
end
D=zeros(1,N);
D=sum(A,1);
K=unique(D);
%k=0;
for j=1:length(K)
    [row,col]=find(K(j)==D);
    P1(1,j)=length(row);
end
P1=P1./N;
%K=1:max(D);
%plot(log(K),log(P1),'o');
%G=graph(A)
%figure
%plot(G)
%% cumulative distribution Pk=series of q(k+1,inf) pq   in cumulative approach will be Pk=k^(-gama+1) mishavad
for h=1:length(P1)-1
    O(1,h)=sum(P1(h:end));
end
O(1,length(P1))=P1(length(P1));
figure
L1=log(K); L2=log(O);
plot(L1,L2,'o'); title('cumulative distribution')
%FF=(m*L1)+m1;
%plot(L1,L2,'o',L1,FF);
%% degree dynamic
nk=2;
T=1:N-1;
T=T./nk;
Lo=log(T);
LO=log(k(nk,:));
figure
plot(Lo,LO,'o'); title('degree dynamic')
toc