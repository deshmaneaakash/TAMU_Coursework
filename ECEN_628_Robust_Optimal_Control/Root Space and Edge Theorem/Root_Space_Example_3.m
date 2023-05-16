%% ECEN 628 ASSIGNMENT 3
% AAKASH DESHMANE
% 133008022
% Q.10.9
%_________________________________________________________________________

clear
clc
syms s p1 p2
format long
tstart = cputime;
% Closed loop characteristic polynomial

eqn = p1*s*(s + 9.5)*(s - 1) - p2*(6.5*s + 0.5)*(s - 2);
sol = solve(eqn,s,'MaxDegree',3);

n = 20;
p = zeros(3*n^4,2);
count = 1;

% Iterating through all family of polynomials

for p_1 = linspace(1,1.1,n)
    for p_2 = linspace(1.2,1.25,n)

        % Solving for the particular polynomial
        s1 = double(subs(sol,{p1,p2},{p_1,p_2}));

        % Calculating 1st root
        x = s1(1);
        r = real(x);
        i = imag(x);
        p(count,:) = [r i];
        count = count + 1;

        % Calculating 2nd root
        x = s1(2);
        r = real(x);
        i = imag(x);
        p(count,:) = [r i];
        count = count + 1;

        % Calculating 3rd root
        x = s1(3);
        r = real(x);
        i = imag(x);
        p(count,:) = [r i];
        count = count + 1;

    end
end

% Stability Condition
if max(p)>0
   
    disp('Roots are present in right half of complex plane. Hence, System is NOT ROBUSTLY STABLE!')
else
    disp('System is R0BUSTLY STABLE!')
end

% Plotting
plot(p(:,1),p(:,2),'*')
xlabel('Real Axis')
ylabel('Imaginary Axis')
title('Root Space Plot of the family')
tend = cputime - tstart

