%%
% *AAKASH DESHMANE
% ECEN 628 ASSIGNMENT AND TAKE HOME EXAM
% LQR PROBLEMS
% Q 13.7* 

clc
clear
close all

% DEFINING STATES
M = 2;
m = 1;
L = 0.5;
g = -9.18;

A = [0    1           0          0 ;
     0    0       -m/(M*g)       0 ;
     0    0           0          1 ;
     0    0  ((M + m)*g)/(M*L)   0];

B = [ 0     ;
     1/M    ;
      0     ;
   -1/(M*L) ];

Q = diag([1 1 1 1]);

R = [1];

x0 = [0 ; 0 ; 1 ; 0];

% IMPLEMENTING LQR
[K, S, E] = lqr(A,B,Q,R);
simout = sim('lqr_model');

%% PLOTTING

figure(1)
plot(simout.tout,simout.control, 'LineWidth',2)
xlabel('time in seconds')
ylabel('Control input in Newtons')


figure(2)
plot(simout.tout,simout.state(:,3), 'LineWidth',2)
xlabel('time in seconds')
ylabel('Theta')

%__________________________________________________________________________

