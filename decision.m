clc;
lam=0.6;
Q = [3	6	4	10
9	7	5	11
4	5	6	12
7	8	9	13
6	7	9	8
4	5	6	13
10	6	5	11
9	10	8	3];
p=[0.1 0.4 0.4 0.1];
fprintf("Матрица Q\n");
disp (Q);
[n, m]=size (Q);

rez=zeros(1,n);

R=zeros(n,m);

qmin=min(Q,[],2);
[x,maxqmin]=max(qmin);
rez(maxqmin)=rez(maxqmin)+1;

qmax=max(Q,[],2);

B=max(Q);
for i=1:n
    for j=1:m
        R(i,j)=B(j)-Q(i,j);
    end
end
fprintf("Матрица R\n");
disp(R);

b=max(R,[],2);
[x,minb]=min(b);
rez(minb)=rez(minb)+1;

c=zeros(n,1);
for i=1:n
    c(i,1)=lam*qmin(i,1)+(1-lam)*qmax(i,1);
end
[x,maxc]=max(c);
rez(maxc)=rez(maxc)+1;

q_i=zeros(n,1);
for i=1:n
    for j=1:m
        q_i(i,1)=q_i(i,1)+p(j)*Q(i,j);
    end
end
[x,maxq_i]=max(q_i);
rez(maxq_i)=rez(maxq_i)+1;

d=zeros(n,1);
pj=1/m;
for i=1:n
    for j=1:m
        d(i,1)=d(i,1)+pj*Q(i,j);
    end
end
[x,maxd]=max(d);
rez(maxd)=rez(maxd)+1;

[x, idx] = max(rez);

fprintf("Рекомендуемое решение по критерию Вальда - a"+maxqmin+"\n");
fprintf("Рекомендуемое решение по критерию Сэвиджа - a"+minb+"\n");
fprintf("Рекомендуемое решение по критерию Гурвица - a"+maxc+"\n");
fprintf("Рекомендуемое решение по критерию Байеса - a"+maxq_i+"\n");
fprintf("Рекомендуемое решение по критерию Лапласа - a"+maxd+"\n");
fprintf("Рекомендуемое решение по совокупности критериев - a"+idx+":\n");
disp(Q(idx,:));
