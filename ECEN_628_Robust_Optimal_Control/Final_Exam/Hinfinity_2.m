%% *AAKASH DESHMANE
% ECEN 628 ASSIGNMENT AND TAKE HOME EXAM
% H-INFINITY PROBLEMS
% Q 15.2* 

clear
clc

% DEFINING SUBMATRICES TO SOLVE ARE
A = eye(2);
B1 = [1 2 0 0 ;
      0 1 0 0];
B2 = eye(2);
C1 = [0 0;
      0 0;
      1 0;
      0 2];
C2 = eye(2);
D11 = zeros(4);
D22 = zeros(2);
D12 = [1 0;
       0 1;
       0 0;
       0 0];
D21 = [0 0 1 0;
       0 0 0 1];

% DEFINING MATRICES FOR ALGEBRAIC RICCATTI EQUATIONS
B = [B1 B2];
C = [C1; C2];
D = [D11 D12;
     D21 D22];

% DEFINING PLANT
Plant = ss(A, B, C, D);

% SOLVING ARE AND STORING CONTROLLER PARAMETERS IN K
[K, CL, gamma] = hinfsyn(Plant, 6 ,6);

disp('The Controller state space is as follows:')
disp('A =')
disp(CL.A)
disp(K)