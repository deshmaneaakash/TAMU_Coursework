%% ECEN 628 ASSIGNMENT 3
% AAKASH DESHMANE
% 133008022
% Q.10.1
%_________________________________________________________________________
clc
clear
syms s p
p2 = s + 1;
p1 = s^3;
p0 = s^2;
q2 = s - 1;
q1 = s*(s + 3)*(s^2 - 2*s + 1.25);
d1 = q2*p2 + q1*(p1 + p0);
d2 = q2*p2 + q1*(p1 + 5*p0);
d0 = d1 - d2;
%d = q2*p2 + q1*(p1 + p*p0)
n = length(linspace(1,5,10));
sol = [];
f = 1;
% p = 2;
delta = q2*p2 + q1*(p1 + p*p0);
for lambda = linspace(1,5,100)
    d = subs(delta,p,lambda);
    solution = vpasolve(d,s);
    r = double(real(solution));
    i = double(imag(solution));
    sol = [sol; 
           r i];
    % f = f + 10;
end
plot(sol(:,1),sol(:,2),'o')
xlabel('Real Axis')
ylabel('Imaginary Axis')
title('Root Space Plot of the family')



    
