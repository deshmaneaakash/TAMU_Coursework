%% AAKASH DESHMANE
% 133008022
% ECEN 628
% MIDTERM EXAM 2 TAKE HOME PART
% Q10.10

%% INITIALIZATION

clear 
close all
clc
syms s a b c
total_roots = []

%% EXPOSED EDGE PLOTTING

hold on
figure (1)
edge_1 = walk_on_edge([2.5,1,28],[2.5,9,28]);
line = walk_on_edge([2.5,1,28],[2.5,9,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_2 = walk_on_edge([2.5,1,12],[2.5,9,12]);
line = walk_on_edge([2.5,1,12],[2.5,9,12]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_3 = walk_on_edge([0.5,1,12],[0.5,1,28]);
line = walk_on_edge([0.5,1,12],[0.5,1,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_4 = walk_on_edge([0.5,9,12],[0.5,9,28]);
line = walk_on_edge([0.5,9,12],[0.5,9,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_5 = walk_on_edge([2.5,1,12],[2.5,1,28]);
line = walk_on_edge([2.5,1,12],[2.5,1,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_6 = walk_on_edge([2.5,9,12],[2.5,9,28]);
line = walk_on_edge([2.5,9,12],[2.5,9,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_7 = walk_on_edge([0.5,1,12],[0.5,9,12]);
line = walk_on_edge([0.5,1,12],[0.5,9,12]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_8 = walk_on_edge([0.5,1,28],[0.5,9,28]);
line = walk_on_edge([0.5,1,28],[0.5,9,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_9 = walk_on_edge([0.5,1,28],[2.5,1,28]);
line = walk_on_edge([0.5,1,28],[2.5,1,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_10 = walk_on_edge([0.5,1,12],[2.5,1,12]);
line = walk_on_edge([0.5,1,12],[2.5,1,12]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_11 = walk_on_edge([0.5,9,12],[2.5,9,12]);
line = walk_on_edge([0.5,9,12],[2.5,9,12]);
plot3(line(:,1),line(:,2),line(:,3),'*')

edge_12 = walk_on_edge([0.5,9,28],[2.5,9,28]);
line = walk_on_edge([0.5,9,28],[2.5,9,28]);
plot3(line(:,1),line(:,2),line(:,3),'*')

xlabel('X')
ylabel('Y')
zlabel('Z')
title('3D polynomial space with exposed edges')
hold off

%% ROOT SPACE PLOTTING

figure(2)
hold on
% Plot edge 1
plot_roots = root_space(edge_1);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 2
plot_roots = root_space(edge_2);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 3
plot_roots = root_space(edge_3);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 4
plot_roots = root_space(edge_4);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 5
plot_roots = root_space(edge_5);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 6
plot_roots = root_space(edge_6);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 7
plot_roots = root_space(edge_7);
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 8
plot_roots = root_space(edge_8);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 9
plot_roots = root_space(edge_9);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 10
plot_roots = root_space(edge_10);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 11
plot_roots = root_space(edge_11);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

% Plot edge 12
plot_roots = root_space(edge_12);
total_roots = [total_roots ; plot_roots];
plot(plot_roots(:,1),plot_roots(:,2),'*')

xlabel('Real Axis')
ylabel('Imaginary Axis')
title('Root Space Plot of the family')

hold off

%% STABILITY CRITERIA CHECK ACCORDING TO EDGE THEOREM
clc

if max(total_roots(:,1))>0
   
    disp('Roots are present in right half of complex plane. Hence, System is NOT ROBUSTLY STABLE!')
else
    disp('System is R0BUSTLY STABLE!')
end

%% FUNCTIONS

% 1) ROOT SPACE CURVE GENERATION
function roots = root_space(polynomials)
    syms s a b c    
    eqn = s^4 + b*s^2 + a*s + c;
    sol = solve(eqn,s,'MaxDegree',4);
    count = 1;
    len = length(polynomials(:,1));
    roots = zeros(4*len,2);

    for i = 1: len

        a_sub = polynomials(i,1);
        b_sub = polynomials(i,2);
        c_sub = polynomials(i,3);


        s1 = double(subs(sol,{a,b,c},{a_sub,b_sub,c_sub}));
    
        % Calculating 1st root
        x = s1(1);
        r = real(x);
        i = imag(x);
        roots(count,:) = [r i];
        count = count + 1;
    
        % Calculating 2nd root
        x = s1(2);
        r = real(x);
        i = imag(x);
        roots(count,:) = [r i];
        count = count + 1;
    
        % Calculating 3rd root
        x = s1(3);
        r = real(x);
        i = imag(x);
        roots(count,:) = [r i];
        count = count + 1;
    
        % Calculating 4th root
        x = s1(4);
        r = real(x);
        i = imag(x);
        roots(count,:) = [r i];
        count = count + 1;
    end

end

% 2) EDGE GENERATION
function line = walk_on_edge(start_point, end_point)
    n = 100;
    l = 1/n;
    %lambda = 0;
    d1 = 0;
    for i = 1:3
        d = (end_point(i) - start_point(i))^2;
        d1 = d1 + d;
    end
    distance = sqrt(d1);
    disp(distance)

    if start_point(1) ~= end_point(1)
        line = zeros(length(linspace(0,1,n)),3);
        i = 1;
        for lambda = 0:l:1
            line(i,:) = [start_point(1)+lambda*distance start_point(2) start_point(3)];
            i = i + 1;
        end
    end

    if start_point(2) ~= end_point(2)
        line = zeros(length(linspace(0,1,n)),3);
        i = 1;
        for lambda = 0:l:1
            line(i,:) = [start_point(1) start_point(2)+lambda*distance start_point(3)];
            i = i + 1;
        end
    end

    if start_point(3) ~= end_point(3)
        line = zeros(length(linspace(0,1,n)),3);
        i = 1;
        for lambda = 0:l:1
            line(i,:) = [start_point(1) start_point(2) start_point(3)+lambda*distance ];
            i = i + 1;
        end
    end
    

end

%___________________________________________________________________________
