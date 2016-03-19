%%%%%%%%%%Numerisk test%%%%%%%%%%%%%%%%%
% Må sammenligne restarted med ikke restarted og alt med ordentlig løsning!
% Dette må kunne kjøre mange ganger med forskjellig k.
% Burde finne "delta" som sier noe om osilasjonen
close all
k = 9;
%len_T = 10000;
%for k = [9,25,36]
T_vec = [1000,2000,3000,4000,5000,10000,100000];

j = 1;
for len_T = T_vec
    T = linspace(0,2,len_T);
    h = T(2)-T(1);


x = linspace(0,1,k);
y = linspace(0,1,k);
htest = x(2)-x(1);

%f1 = @(t)(1/(t+1)^2); u1 = x.*(x-1).*y.*(y-1); u1 = u1';
%f2 = @(t)-t/(t+1); u2 = (2*(x-1).*x+2*(y-1).*y); u2 = u2';
f1 = @(t) 1; u1 = x; u1 = u1';
f2 = @(t) 3; u2 = y; u2 = u2';


zn1 = zeros(1,len_T);
zn2 = zeros(1,len_T);
for i=1:1:len_T
zn1(i) = f1(T(i));
zn2(i) = f2(T(i));
end


A = -1/htest^2*gallery('poisson',sqrt(k));

v1 = A*u1;
v2 = A*u2;

% restarted:
M = max(2,k);
[yres1] = KPM_IVP_res(A,v1,M,zn1,h,len_T);
[yres2] = KPM_IVP_res(A,v2,M,zn2,h,len_T);
yres = yres1+yres2;
% Ikke restartet
[y1] = KPM_IVP_res(A,v1,k,zn1,h,len_T);
[y2] = KPM_IVP_res(A,v2,k,zn2,h,len_T);
y = y1+y2;

sol = zeros(k,len_T);
%fsol =@(t) t/(t+1);
for i = 2:1:len_T
    %sol(:,i) = fsol(T(i))*(u1); % Sikkert noe feil her!
    %sol(:,i) = (expm(A*T(i))-eye(k))*(u1*f1(1));
    sol(:,i) = sol(:,i-1) +h*A*sol(:,i-1)+h*f1(T(i-1))+h*f2(T(i-1));
end
%figure(j+1)
%plot(T,y,'g')
%hold on
%plot(T,sol,'b')
%plot(T,yres,'r')


fprintf('k = %d, len_T = %d\n',k,len_T)
for i = 1:k
    Err(i) = norm(sol(i,:)-y(i,:) ,Inf);
    fprintf('Absolute error without restart %d:\t ||y-y_n||_Inf = %f\n',i, Err(i) )
    Errres(i) = norm(sol(i,:)-yres(i,:) ,Inf);
    fprintf('Absolute error with restart %d:\t\t ||y-y_n||_Inf = %f\n',i, Errres(i) )
end

Errmax(j) = max(Err);
Errresmax(j)=max(Errres);
j = j+1;

end
%end
figure(1)
loglog(T_vec,[1./T_vec;Errresmax;Errmax]); % Må lage en referanse linje til feilen her

%%%%%%%%%%Numerisk test%%%%%%%%%%%%%%%%%