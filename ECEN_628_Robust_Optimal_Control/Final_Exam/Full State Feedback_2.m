%% *AAKASH DESHMANE
% ECEN 628 ASSIGNMENT AND TAKE HOME EXAM
% Full State Feedback
% EIGENVALUE VISUALIZATION
% Q 13.9

clc
clear
close all

% DEFINING PARAMETERS
r = 1;
A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = 0;
Q = [1 0; 0 r];
R = 1;

[P, ~, ~] = care(A,B,Q,R)

% SOLVING LQR AND DEFINING EIGENVALUES
k = lqr(A,B,Q,R)

step(ss(A-B*k,B,C,D))

eig(A - B*k)

% PLOT CLOSED LOOP EIGENVALUES AS A FUNCTION OF R
r_vector = logspace(-2,2,101);
eigenvector = zeros(length(r_vector), 2);
for i = 1:length(r_vector)
    r = r_vector(i);
    Q = [1 0; 0 0];
    R = r/2;
    [K,~,~] = lqr(A,B,Q,R);

    eigenvector(i,:) = eig(A - B*K)';
end

% PLOTTING
figure;
plot(real(eigenvector(:,1)), imag(eigenvector(:,1)), '*', real(eigenvector(:,2)), imag(eigenvector(:,2)), '*');
xlabel('Real axis');
ylabel('Imaginary axis');
title('Closed-loop eigenvalues as a function of r');
legend('Eigenvalue 1', 'Eigenvalue 2');
