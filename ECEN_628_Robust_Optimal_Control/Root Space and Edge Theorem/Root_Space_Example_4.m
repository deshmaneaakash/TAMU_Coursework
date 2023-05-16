%% ECEN 628 ASSIGNMENT 3
% AAKASH DESHMANE
% 133008022
% Q.10.14
%_________________________________________________________________________

clear
clc
syms s a1 b1 c1 d1
format long
tstart = cputime;
% Closed loop characteristic polynomial

eqn = s^3 + (a1 + 3*b1)*s^2 + c1*s + d1;
sol = solve(eqn,s,'MaxDegree',3);

n = 10;
p = zeros(3*n^4,2);
count = 1;

% Iterating through all family of polynomials

for a = linspace(1,2,n)
    for b = linspace(0,3,n)
        for c = linspace(10,15,n)
            for d = linspace(9,14,n)

                % Solving for the particular polynomial
                s1 = double(subs(sol,{a1,b1,c1,d1},{a,b,c,d}));

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

