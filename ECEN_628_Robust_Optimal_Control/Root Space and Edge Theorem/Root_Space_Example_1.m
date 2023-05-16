%% ECEN 628 ASSIGNMENT 3
% AAKASH DESHMANE
% 133008022
% Q.10.21
%_________________________________________________________________________

clear
clc
syms s a b
tstart = cputime;

% Closed loop characteristic polynomial
eqn = s*(s - 1) + a*s + b;
sol = solve(eqn,s);

count = 1;
n = 100;
p = zeros(2*n^2,2);

% Iterating through all family of polynomials
for kp = linspace(2,4,n)
    for ki = linspace(2,4,n)

        % Solving for the particular polynomial
        s1 = double(subs(sol,{a,b},{kp,ki}));

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
tend = cputime - tstart;



