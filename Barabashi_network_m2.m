clear %time=25m
tic
N=10000;
m=2;
A=zeros(N);
A(1,2)=1; A(2,1)=1; A(3,1)=1; A(1,3)=1; A(3,2)=1; A(2,3)=1;
num=3;
Deg=zeros(1,N);
Deg(1,1)=sum(A(1,:));
Deg(1,2)=sum(A(2,:));
Deg(1,3)=sum(A(3,:));
SUM=6;
k(1,1)=Deg(1,1);
k(2,1)=Deg(1,2);
k(3,1)=Deg(1,3);
for t=1:N-num
    num=num+1    
    %R=randi([1 num-1],1,5);
    %[a,b]=unique(R); index=sort(b);
    %[r,c]=find(A);
    for i1=1:m
        while sum(A(num,:))~=i1
            R=randi(num-1);
            %[ROW,COL]=find(A(R,:)==1); %3 khat baraye vaghti ast ke bejaye
            %daraje khode nod be jame ehtemalate darajat hamsaye nod ra
            %vasl mikonim
            %S1=sum(Deg(1,COL));
            %p=S1/SUM;
            p=(Deg(1,R)+(Deg(1,R)^2))/SUM;
            if rand < p
                A(num,R)=1;
                A(R,num)=1;
                value(1,i1)=R;
            end
        end
    end
    SUM=SUM+4;
    Deg(1,num)=2;
    Deg(1,value(1,1))=sum(A(value(1,1),:));
    Deg(1,value(1,2))=sum(A(value(1,2),:));
    k(1,t+1)=sum(A(1,:));
    k(2,t+1)=sum(A(2,:));
    k(3,t+1)=sum(A(3,:));
end
D=zeros(1,N);
D=sum(A,1);
K=unique(D);


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
%% cumulative distribution Pk=seri q(k+1,inf) pq   dar in halat Pk=k^(-gama+1) mishavad
for h=1:length(P1)-1
    O(1,h)=sum(P1(h:end));
end
O(1,length(P1))=P1(length(P1)); 
figure
L1=log(K); L2=log(O);
plot(L1,L2,'o')
%FF=(m*L1)+m1;
%plot(L1,L2,'o',L1,FF);
%% degree dynamic
nk=1;
T=1:N-2;
T=T./nk;
Lo=log(T);
LO=log(k(nk,:))-log(2);  %k=m(t/ti)^beta   log(k)-log(m)=beta*log(t/ti)
figure
plot(Lo,LO,'o');


toc