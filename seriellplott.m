% [ utdata ] = seriell(m,k,n,prob,func )
% func = 1: resratted   
% func = 2: Full        
% func = 3 DI           
%utdata(1) = ant
%utdata(2) = time
%utdata(3) = error

%%% Må plotte konvergens(i restarted KPM) mot tid og eller antall
%%% iterasjoner


%%% ( k,m,n,prob,para,func)
%%% Done
if 1 % convergence funksjon 1
    j = 1;
    
    p = [4,8,12,16,20,40];
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    for i = p
        utdata1(j,:) = seriell( i,i,1,1,1);
        utdata2(j,:) = seriell( i,i,1,2,1);
        utdata3(j,:) = seriell( i,i,1,3,1);
        j = j + 1;
    end
    figure(1)
    loglog(p,utdata1(:,3),'k:o')
    hold on
    plot(p,utdata2(:,3),'k:+')
    plot(p,utdata3(:,3),'k:d')
    plot(p,1./p.^2,'k-')
    legend('Restarted KPM','Full KPM','Direct integration','Helpline');
    xlabel('m = k')
    ylabel('error');
    drawnow; print -djpeg s1conv1
end
%%% Done
if 1 % convergence funksjon 2
    j = 1;
    
    p = [4,8,12,16,20,40];
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    for i = p
        utdata1(j,:) = seriell( i,i,1,1,2);
        utdata2(j,:) = seriell( i,i,1,2,2);
        utdata3(j,:) = seriell( i,i,1,3,2);
        j = j + 1;
    end
    figure(2)
    loglog(p,utdata1(:,3),'k:o')
    hold on
    plot(p,utdata2(:,3),'k:+')
    plot(p,utdata3(:,3),'k:d')
    plot(p,1./p.^2,'k-')
    legend('Restarted KPM','Full KPM','Direct integration','Helpline');
    xlabel('m = k')
    ylabel('error');
    drawnow; print -djpeg s2conv2
end


if 1 % ant vs m % bare for funksjon 1
    p =  [4,8,12,16,20];
    k = 40;
    j = 1;
    utdata1 = zeros(length(p),3);
    utdata2 = zeros(length(p),3);
    utdata3 = zeros(length(p),3);
    utdata4 = zeros(length(p),3);
    utdata5 = zeros(length(p),3);
    utdata6 = zeros(length(p),3);
    for i = p
        utdata1(j,:) = seriell( i,k,1,1,1);
        utdata2(j,:) = seriell( i,k,2,1,1);
        utdata3(j,:) = seriell( i,k,5,1,1);
        utdata4(j,:) = seriell( i,k,10,1,1);
        utdata5(j,:) = seriell( i,k,20,1,1);
        utdata6(j,:) = seriell( i,k,50,1,1);
        j = j + 1;
    end
    figure(3)
    loglog(p,utdata1(:,1),'k:o')
    hold on
    plot(p,utdata2(:,1),'k:+')
    plot(p,utdata3(:,1),'k:d')
    plot(p,utdata4(:,1),'k:<')
    plot(p,utdata5(:,1),'k:^')
    plot(p,utdata6(:,1),'k:x')
    legend('n = 1','n = 2','n = 5','n = 10','n = 20','n = 50');
    xlabel('m'); ylabel('ant');
    drawnow; print -djpeg s3antvsm1
end


if 1 % ant vs m % bare for funksjon 2
    p = [4,8,12,16,20,40];
    k = 40;
    j = 1;
    utdata1 = zeros(length(p),3);
    utdata2 = zeros(length(p),3);
    utdata3 = zeros(length(p),3);
    utdata4 = zeros(length(p),3);
    utdata5 = zeros(length(p),3);
    utdata6 = zeros(length(p),3);
    for i = p
        utdata1(j,:) = seriell( i,k,1,1,2);
        utdata2(j,:) = seriell( i,k,2,1,2);
        utdata3(j,:) = seriell( i,k,5,1,2);
        utdata4(j,:) = seriell( i,k,10,1,2);
        utdata5(j,:) = seriell( i,k,20,1,2);
        utdata6(j,:) = seriell( i,k,50,1,2);
        j = j + 1;
    end
    figure(4)
    loglog(p,utdata1(:,1),'k:o')
    hold on
    plot(p,utdata2(:,1),'k:+')
    plot(p,utdata3(:,1),'k:d')
    plot(p,utdata4(:,1),'k:<')
    plot(p,utdata5(:,1),'k:^')
    plot(p,utdata6(:,1),'k:x')
    legend('n = 1','n = 2','n = 5','n = 10','n = 20','n = 50');
    xlabel('m'); ylabel('ant');
    drawnow; print -djpeg s4antvsm2
end


if 1 % time vs m % bare for funksjon 1
    p = [4,8,12,16,20,40];
    avg = 10;
    k = 40;
    j = 1;
    utdata1 = zeros(length(p),3,avg);
    utdata2 = zeros(length(p),3,avg);
    utdata3 = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( i,k,1,1,1);
            utdata2(j,:,a) = seriell( i,k,1,2,1);
            utdata3(j,:,a) = seriell( i,k,1,3,1);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(5)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    plot(p,utdata2(:,2),'k:+')
    plot(p,utdata3(:,2),'k:d')
    plot(p,p.^4/100,'k-')
    legend('Restarted KPM','Full KPM','Direct integration','Helpline');
    xlabel('m'); ylabel('Computation time');
    drawnow; print -djpeg s5timevsm1
end

if 1 % time vs m % bare for funksjon 2
    p = [4,8,12,16,20,40];
    avg = 10;
    k = 40;
    j = 1;
    utdata1 = zeros(length(p),3,avg);
    utdata2 = zeros(length(p),3,avg);
    utdata3 = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( i,k,1,1,2);
            utdata2(j,:,a) = seriell( i,k,1,2,2);
            utdata3(j,:,a) = seriell( i,k,1,3,2);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(6)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    plot(p,utdata2(:,2),'k:+')
    plot(p,utdata3(:,2),'k:d')
    plot(p,p.^4/100,'k-')
    legend('Restarted KPM','Full KPM','Direct integration','Helpline');
    xlabel('m'); ylabel('Computation time');
    drawnow; print -djpeg s6timevsm2
end
if 1 % time vs k % bare for funksjon 1
    p = [4,8,12,16,20];
    avg = 10;
    m = 20;
    j = 1;
    utdata1 = zeros(length(p),3,avg);
    utdata2 = zeros(length(p),3,avg);
    utdata3 = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( m,i,1,1,1);
            utdata2(j,:,a) = seriell( m,i,1,2,1);
            utdata3(j,:,a) = seriell( m,i,1,3,1);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(7)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    plot(p,utdata2(:,2),'k:+')
    plot(p,utdata3(:,2),'k:d')
    plot(p,p/100,'k-')
    legend('Restarted KPM','Full KPM','Direct integration','Helpline');
    xlabel('k'); ylabel('Computation time');
    drawnow; print -djpeg s7timevsk1
end
if 1 % time vs k % bare for funksjon 2
    p = [4,8,12,16,20,40];
    avg = 10;
    m = 40;
    j = 1;
    utdata1 = zeros(length(p),3,avg);
    utdata2 = zeros(length(p),3,avg);
    utdata3 = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( m,i,1,1,2);
            utdata2(j,:,a) = seriell( m,i,1,2,2);
            utdata3(j,:,a) = seriell( m,i,1,3,2);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(8)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    plot(p,utdata2(:,2),'k:+')
    plot(p,utdata3(:,2),'k:d')
    plot(p,p/100,'k-')
    legend('Restarted KPM','Full KPM','Direct integration','Helpline');
    xlabel('k'); ylabel('Computation time');
    drawnow; print -djpeg s8timevsk2
end

if 1 %restartvariabel funksjon 1
    p = [1,2,4,8,12,16,20];
    avg = 10;
    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3,avg);
    utdata2  = zeros(length(p),3,avg);
    utdata3  = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( k,10,i,1,1);
            utdata2(j,:,a) = seriell( k,50,i,1,1);
            utdata3(j,:,a) = seriell( k,100,i,1,1);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(9)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    loglog(p,utdata2(:,2),'k:+')
    loglog(p,utdata3(:,2),'k:d')
    xlabel('n'); ylabel('Computation time');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s9rest1
    
end


if 1 %restartvariabel funksjon 2
    p = [1,2,4,8,12,16,20];
    avg = 10;
    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3,avg);
    utdata2  = zeros(length(p),3,avg);
    utdata3  = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( k,10,i,1,2);
            utdata2(j,:,a) = seriell( k,50,i,1,2);
            utdata3(j,:,a) = seriell( k,100,i,1,2);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(10)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    loglog(p,utdata2(:,2),'k:+')
    loglog(p,utdata3(:,2),'k:d')
    xlabel('n'); ylabel('Computation time');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s10rest2
end

if 1 %Konvergenskriterie: time vs tol for forskjellige m, funksjon 1
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];
    avg = 10;
    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3,avg);
    utdata2  = zeros(length(p),3,avg);
    utdata3  = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( k,10,1,1,1,i);
            utdata2(j,:,a) = seriell( k,50,1,1,1,i);
            utdata3(j,:,a) = seriell( k,100,1,1,1,i);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(11)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    loglog(p,utdata2(:,2),'k:+')
    loglog(p,utdata3(:,2),'k:d')
    xlabel('tol'); ylabel('Computation time');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s11timevstol1m
end

if 1 %Konvergenskriterie: time vs tol for forskjellige m, funksjon 2
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];
    avg = 10;
    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3,avg);
    utdata2  = zeros(length(p),3,avg);
    utdata3  = zeros(length(p),3,avg);
    
    for i = p
        for a = 1:avg
            utdata1(j,:,a) = seriell( k,10,1,1,2,i);
            utdata2(j,:,a) = seriell( k,50,1,1,2,i);
            utdata3(j,:,a) = seriell( k,100,1,1,2,i);
        end
        j = j + 1;
        
    end
    utdata1 = sum(utdata1,3)/avg;
    utdata2 = sum(utdata2,3)/avg;
    utdata3 = sum(utdata3,3)/avg;
    figure(12)
    loglog(p,utdata1(:,2),'k:o')
    hold on
    loglog(p,utdata2(:,2),'k:+')
    loglog(p,utdata3(:,2),'k:d')
    xlabel('tol'); ylabel('Computation time');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s12timevstol2m
end

%%% Done
if 1 %Konvergenskriterie: ant vs tol for forskjellige m, funksjon 1 % Merkelig
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];

    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    
    for i = p
            utdata1(j,:) = seriell( k,10,1,1,1,i);
            utdata2(j,:) = seriell( k,50,1,1,1,i);
            utdata3(j,:) = seriell( k,100,1,1,1,i);
        j = j + 1;
    end
    figure(13)
    loglog(p,utdata1(:,1),'k:o')
    hold on
    loglog(p,utdata2(:,1),'k:+')
    loglog(p,utdata3(:,1),'k:d')
    xlabel('tol'); ylabel('ant');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s13antvstol1m
end

%%% Done
if 1 %Konvergenskriterie: ant vs tol for forskjellige m, funksjon 2
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];

    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    
    for i = p
            utdata1(j,:) = seriell( k,10,1,1,2,i);
            utdata2(j,:) = seriell( k,50,1,1,2,i);
            utdata3(j,:) = seriell( k,100,1,1,2,i);
        j = j + 1;
        
    end
    figure(14)
    loglog(p,utdata1(:,1),'k:o')
    hold on
    loglog(p,utdata2(:,1),'k:+')
    loglog(p,utdata3(:,1),'k:d')
    xlabel('tol'); ylabel('ant');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s14antvstol2m
end


%%% Done
if 1 %Konvergenskriterie: err vs tol for forskjellige m, funksjon 1
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];

    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    
    for i = p
            utdata1(j,:) = seriell( k,10,1,1,1,i);
            utdata2(j,:) = seriell( k,50,1,1,1,i);
            utdata3(j,:) = seriell( k,100,1,1,1,i);
        j = j + 1;
        
    end
    figure(15)
    loglog(p,utdata1(:,3),'k:o')
    hold on
    loglog(p,utdata2(:,3),'k:+')
    loglog(p,utdata3(:,3),'k:d')
    xlabel('tol'); ylabel('err');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s15errvstol1m
end

%%% Done
if 1 %Konvergenskriterie: err vs tol for forskjellige m, funksjon 2
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];

    k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    
    for i = p
            utdata1(j,:) = seriell( k,10,1,1,2,i);
            utdata2(j,:) = seriell( k,50,1,1,2,i);
            utdata3(j,:) = seriell( k,100,1,1,2,i);
        j = j + 1;
        
    end
    figure(16)
    loglog(p,utdata1(:,3),'k:o')
    hold on
    loglog(p,utdata2(:,3),'k:+')
    loglog(p,utdata3(:,3),'k:d')
    xlabel('tol'); ylabel('err');
    legend('m = 10','m = 50','m = 100')
    drawnow; print -djpeg s16errvstol2m
end

%%% Done
if 1 %Konvergenskriterie: err vs tol for forskjellige n, funksjon 1
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];

    m = 40; k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    utdata4  = zeros(length(p),3);
    
    for i = p
            utdata1(j,:) = seriell( k,m,1,1,1,i);
            utdata2(j,:) = seriell( k,m,2,1,1,i);
            utdata3(j,:) = seriell( k,m,5,1,1,i);
            utdata4(j,:) = seriell( k,m,10,1,1,i);
        j = j + 1;
        
    end
    figure(17)
    loglog(p,utdata1(:,3),'k:o')
    hold on
    loglog(p,utdata2(:,3),'k:+')
    loglog(p,utdata3(:,3),'k:d')
    loglog(p,utdata4(:,3),'k:<')
    xlabel('tol'); ylabel('error');
    legend('n = 1','n = 2','n = 5','n = 10')
    drawnow; print -djpeg s17errvstol1n
end

%%% Done
if 1 %Konvergenskriterie: err vs tol for forskjellige n, funksjon 2
    p = [1,10^-1,10^-2,10^-3,10^-5,10^-7,10^-9,10^-11,10^-13,10^-15];

    m = 40; k = 40;
    j = 1;
    
    utdata1  = zeros(length(p),3);
    utdata2  = zeros(length(p),3);
    utdata3  = zeros(length(p),3);
    utdata4  = zeros(length(p),3);
    
    for i = p
            utdata1(j,:) = seriell( k,m,1,1,2,i);
            utdata2(j,:) = seriell( k,m,2,1,2,i);
            utdata3(j,:) = seriell( k,m,5,1,2,i);
            utdata4(j,:) = seriell( k,m,10,1,2,i);
        j = j + 1;
        
    end
    figure(18)
    loglog(p,utdata1(:,3),'k:o')
    hold on
    loglog(p,utdata2(:,3),'k:+')
    loglog(p,utdata3(:,3),'k:d')
    loglog(p,utdata4(:,3),'k:<')
    xlabel('tol'); ylabel('error');
    legend('n = 1','n = 2','n = 5','n = 10')
    drawnow; print -djpeg s18errvstol2n
end

%%% Trenger jeg flere for konvergens??? n vs tol?