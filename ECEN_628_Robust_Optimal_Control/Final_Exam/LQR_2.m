%%
% Shaunak Kolhe
% Q 13.8 

clc
clear
close all

% DEFINING STATES
l1 = 1;
l2 = 1;
k = 1;

A = [0         0       1     0 ;
     0         0       0     1 ;
     -k/l1    k/l2     0     0 ;
     k/l2    -k/l2     0     0];

B = [ 0    ;
      0    ;
      1/l1 ;
      0    ];

Q = diag([10 0 0 0]);

R = [1];

x0 = [1 ; 0 ; 0 ; 0];

% IMPLEMENTING LQR
[K, ~, ~] = lqr(A,B,Q,R);
simout = sim('lqr_model');

%% PLOTTING
figure(1)
plot(simout.tout,simout.control)
xlabel('Time (s)')
ylabel('Control input in N')


figure(2)
hold on
plot(simout.tout,simout.state(:,1))
plot(simout.tout,simout.state(:,2))
xlabel('Time (s)')
ylabel('Theta')








