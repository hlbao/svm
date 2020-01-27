function [w, b, objective,index] = SVM_QP(x,y,C)
 
    [n,d]=size(x);
 
    if(n ~= size(y,1))
        disp('size is not correspondent');
    end
        
    p=-ones(n,1);
    A=[];
    c=[];
    %A=-A;
    epsilon=C*1e-6;
    Q=(y*y').*(x*x');
%   Q = Q + 1e-10*eye(n);
 
    [alpha, obj] = quadprog(Q,f,A,-c);
 
 
    % objective value
    objective=-obj;
%     disp(['objective value: ',num2str(objective)]);
    
    % find coefficients
    w=((alpha.*y)'*x)';
    
    % find support vectors
    index=find(alpha>epsilon&alpha<C-epsilon);
    sv=[index,x(index,:)];
%     disp(['number of support vectors: ',num2str(size(index,1))]);
    
    % find offset
    b=y(index)-x(index,:)*w;
    b=min(b);
    
end
