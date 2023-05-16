%%
% *AAKASH DESHMANE
% ECEN 628 ASSIGNMENT AND TAKE HOME EXAM
% H-INFINITY PROBLEMS
% Q 15.1* 

clear
clc

% DEFINING SUBMATRICES TO SOLVE ARE
A = 1;
B1 = 0;
B2 = -1;
C1 = 0;
C2 = -1;
D11 = 0;
D22 = 0;
D12 = 0.2;
D21 = 1;

% DEFINING MATRICES FOR ALGEBRAIC RICCATTI EQUATIONS
B = [B1 B2];
C = [C1; C2];
D = [D11 D12;
     D21 D22];

% DEFINING PLANT
Plant = ss(A, B, C, D);

% SOLVING ARE AND STORING CONTROLLER PARAMETERS IN K
[K, CL, gamma] = hinfsyn(Plant, 2 ,2);

disp('The Controller state space is as follows:')
disp('A =')
disp(CL.A)
disp(K)
