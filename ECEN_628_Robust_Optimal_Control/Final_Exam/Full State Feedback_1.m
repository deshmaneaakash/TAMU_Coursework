%% 13.10
% Full State Feedback
rho = 1;
A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = 0;
Q = [1 0; 0 2*rho];
R = 1;
[P, ~, ~] = care(A,B,Q,R)
k = lqr(A,B,Q,R)
step(ss(A-B*k,B,C,D))
eig(A - B*k)
% Plot the closed-loop eigenvalues as a function of rho
rhovec = logspace(-2,2,101);
eigvec = zeros(length(rhovec), 2);
margins = zeros(length(rhovec), 3);
for i = 1:length(rhovec)
    rho = rhovec(i);
    Q = [1 0; 0 0];
    R = rho/2;
    [K,~,~] = lqr(A,B,Q,R);
    [Gm, Pm] = margin(ss(A-B*k,B,C,D));
    disp([Gm, Pm])
    margins(i,:) = [Gm, Pm, rho];
    eigvec(i,:) = eig(A - B*K)';
end

figure;
plot(real(eigvec(:,1)), imag(eigvec(:,1)), 'b-', real(eigvec(:,2)), imag(eigvec(:,2)), 'r-');
xlabel('Real axis');
ylabel('Imaginary axis');
title('Closed-loop eigenvalues as a function of \rho');
legend('Eigenvalue 1', 'Eigenvalue 2');

figure;
plot(margins(:,1),margins(:,3),'b-');
legend('Gain Margin', 'rho');

figure;
plot(margins(:,2), margins(:,3),'r-');
legend('Phase Margin', 'Rho')
