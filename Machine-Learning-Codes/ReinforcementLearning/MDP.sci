clear;
N=10; P=0.8; gamma=0.9; 
U=diag(ones(1,N));
T=zeros(N,N,2);
r=zeros(1,N)-0.1; r(1)=-1; r(N)=1;
T(1,1,:)=1; T(N,N,:)=1;
for i=2:N-1;
    T(i,i-1,1)=P;
    T(i,i+1,1)=1-P;
    T(i,i-1,2)=1-P;
    T(i,i+1,2)=P;
end

policy=floor(2*rand(1,N))+1;
Vpi=zeros(N,1);
iter = 0;
converge=0;

while ~converge
    iter = iter + 1;
    old_V = Vpi;
    Tpi=zeros(N,N); Tpi(1,1)=1; Tpi(N,N)=1;
    for s=2:N-1;
        Tpi(s,s-1)=T(s,s-1,policy(s));
        Tpi(s,s+1)=T(s,s+1,policy(s));
    end
    Vpi=inv(U-gamma*Tpi) * r';
    disp(Vpi)
    policy(1)=0; policy(N)=0;
    for s=2:N-1
        [tmp,policy(s)] = max([Vpi(s-1),Vpi(s+1)])
        disp(policy)
        disp(tmp)
    end
    //disp(policy)
    if abs(sum(old_V - Vpi)) < 0.01
        converge = 1;
    end
end

iter, policy
