%% PREPARETION

clc

clear  
close

disp('>< ALL CLEARED')
disp('>< ALL CLOSED')
disp(' ')

%% PARAMETERS

disp('/-/-/-/-/-/-/-/-/-/-/-/-/-')
disp('-> SYSTEM PARAMETER VALUES')
disp('/-/-/-/-/-/-/-/-/-/-/-/-/-')

R1=22000; 
R2=12000; 
R3=2000;

C1=0.000100; 
C2=0.000050; 
C3=0.000010;

L2=0.1; 
L3=0.01;

disp(' ')
disp('RESISTANCES: ')
disp(['R1: ', num2str(R1)])
disp(['R2: ', num2str(R2)])
disp(['R3: ', num2str(R3)])

disp(' ')
disp('CAPACITANCES: ')
disp(['C1: ', num2str(C1)])
disp(['C2: ', num2str(C2)])
disp(['C3: ', num2str(C3)])

disp(' ')
disp('INCUCTANCES: ')
disp(['L2: ', num2str(L2)])
disp(['L3: ', num2str(L3)])

% fprintf('R1: %5.0f        R2: %5.0f        R3: %5.0f\n', R1, R2, R3)
% fprintf('C1: %5.0f        C2: %5.0f        C3: %5.0f\n', C1, C2, C3)
% fprintf('                 L2: %5.0f        L3: %5.0f\n', L2, L3)

disp(' ')

%% MATRICES

disp('/-/-/-/-/-/-/-/-/-/-/-/')
disp('-> STATE SPACE MATRICES')
disp('/-/-/-/-/-/-/-/-/-/-/-/')

disp(' ')
disp('STATE MATRIX:')

A=[1/(C1*R1)   -1/C1      0       0      0;
        1/L2  -R2/L2  -1/L2       0      0;
           0    1/C2      0   -1/C2      0;
           0       0  -1/L3  -R3/L3  -1/L3;
           0       0      0    1/C3      0]
        
% Input matrix.

disp(' ')
disp('INPUT MATRIX:')

B=[-1/(C1*R1)     0     0;
            0  1/L2     0;
            0     0     0;
            0     0  1/L3;
            0     0     0]
  
% Output matrix.

disp(' ')
disp('OUTPUT MATRIX:')

C=[    1    0   0    0  0;
       0    0   1    0  0;
       0    0   0    0  1;
      -1    0   0    0  0;
       0   R2   0    0  0;
       0    0   0   R3  0;
       1  -R2  -1    0  0;
       0    0   1  -R3 -1;
   -1/R1    0   0    0  0;
       0    1   0    0  0;
       0    0   0    1  0;
   -1/R1   -1   0    0  0;
       0    1   0   -1  0]
         
 % Input matrix.
 
disp(' ')
disp('INPUT MATRIX:')

 D=[0     0  0;
    0     0  0;
    0     0  0;
    1     0  0;
    0     0  0;
    0     0  0;
    0     1  0;
    0     0  1;
    1/R1  0  0;
    0     0  0;
    0     0  0;
    1/R1  0  0;
    0     0  0]

%% TRANSFER FUNCTIONS 

disp('/-/-/-/-/-/-/-/-/-/-/')
disp('-> TRANSFER FUNCTIONS')
disp('/-/-/-/-/-/-/-/-/-/-/')

% /////////////////////////////////
% TRANSFER FUNCTIONS w.r.t INPUT: 1
% /////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 1')

[num1,den]=ss2tf(A,B,C,D,1)

disp(' ')
disp('******************************************************')
disp('* NUM: NUMERATOR COEFFICIENS (PER OUTPUT POLYNOMIAL) *')
disp('* DEM: DENOMINATOR COEFFICIENTS (COMMON)             *')
disp('******************************************************')

disp(' ')
disp(' ')
disp('SYSTEM 1 <-> DISPLAYED AS TRANSFER FUCTIONS:')

printsys(num1,den)

disp(' ')
disp('> TRANSFER FUNCTIONS w.r.t INPUT 1')
disp('### PAUSE 1/3 ###')
pause
disp(' ')
disp(' ')

% /////////////////////////////////
% TRANSFER FUNCTIONS w.r.t INPUT: 1
% /////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 2')

[num2,den]=ss2tf(A,B,C,D,2)

disp(' ')
disp('******************************************************')
disp('* NUM: NUMERATOR COEFFICIENS (PER OUTPUT POLYNOMIAL) *')
disp('* DEM: DENOMINATOR COEFFICIENTS (COMMON)             *')
disp('******************************************************')

disp(' ')
disp(' ')
disp('SYSTEM 2 <-> DISPLAYED AS TRANSFER FUCTIONS:')

printsys(num2,den) 

disp(' ')
disp('> TRANSFER FUNCTIONS w.r.t INPUT 2')
disp('### PAUSE 2/3 ###')
pause
disp(' ')
disp(' ')

% /////////////////////////////////
% TRANSFER FUNCTIONS w.r.t INPUT: 1
% /////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 3')

[num3,den]=ss2tf(A,B,C,D,3)

disp(' ')
disp('******************************************************')
disp('* NUM: NUMERATOR COEFFICIENS (PER OUTPUT POLYNOMIAL) *')
disp('* DEM: DENOMINATOR COEFFICIENTS (COMMON)             *')
disp('******************************************************')

disp(' ')
disp(' ')
disp('SYSTEM 3 <-> DISPLAYED AS TRANSFER FUCTIONS:')

printsys(num3,den) 

disp(' ')
disp('> TRANSFER FUNCTIONS w.r.t INPUT 3')
disp('### PAUSE 3/3 ###')
pause
disp(' ')
disp(' ')

%% ASSIGNMENT
 
disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 1 |')
disp('|-----------------------------|')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:        A') 
disp('>>> INPUT:          e1') 
disp('>>> STEP MAGNITUDE:  1')

disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C1')
sysA_01=tf(num1(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C2')
sysA_02=tf(num1(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C3')
sysA_03=tf(num1(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R1')
sysA_04=tf(num1(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R2')
sysA_05=tf(num1(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R3')
sysA_06=tf(num1(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L2')
sysA_07=tf(num1(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L3')
sysA_08=tf(num1(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i1')
sysA_09=tf(num1(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i2')
sysA_10=tf(num1(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i3')
sysA_11=tf(num1(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i4')
sysA_12=tf(num1(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i5')
sysA_13=tf(num1(13,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 1 <- QUESTION A')
disp('### PAUSE 1/4 ###')
pause
disp(' ')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:         B') 
disp('>>> INPUT:           e2') 
disp('>>> STEP MAGNITUDE:  12')

disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C1')
sysB_01=tf(num2(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C2')
sysB_02=tf(num2(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C3')
sysB_03=tf(num2(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R1')
sysB_04=tf(num2(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R2')
sysB_05=tf(num2(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R3')
sysB_06=tf(num2(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L2')
sysB_07=tf(num2(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L3')
sysB_08=tf(num2(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i1')
sysB_09=tf(num2(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i2')
sysB_10=tf(num2(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i3')
sysB_11=tf(num2(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i4')
sysB_12=tf(num2(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i5')
sysB_13=tf(num2(13,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 1 <- QUESTION B')
disp('### PAUSE 2/4 ###')
pause
disp(' ')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:  C') 
disp('>>> INPUT:    e3') 
disp('>>> IMPULSE     ')

disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C1')
sysC_01=tf(num3(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C2')
sysC_02=tf(num3(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C3')
sysC_03=tf(num3(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R1')
sysC_04=tf(num3(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R2')
sysC_05=tf(num3(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R3')
sysC_06=tf(num3(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L2')
sysC_07=tf(num3(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L3')
sysC_08=tf(num3(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i1')
sysC_09=tf(num3(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i2')
sysC_10=tf(num3(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i3')
sysC_11=tf(num3(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i4')
sysC_12=tf(num3(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i5')
sysC_13=tf(num3(13,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 1 <- QUESTION C')
disp('### PAUSE 3/4 ###')
pause
disp(' ')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:                       D') 
disp('>>> INPUT:                         e2') 
disp('>>> SINUSOIDAL:     V_p    - p = 12 V')
disp('>>>                 V_mean     =  3 V')

disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C1')
sysD_01=tf(num2(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C2')
sysD_02=tf(num2(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_C3')
sysD_03=tf(num2(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R1')
sysD_04=tf(num2(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R2')
sysD_05=tf(num2(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_R3')
sysD_06=tf(num2(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L2')
sysD_07=tf(num2(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   V_L3')
sysD_08=tf(num2(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i1')
sysD_09=tf(num2(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i2')
sysD_10=tf(num2(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i3')
sysD_11=tf(num2(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i4')
sysD_12=tf(num2(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   i5')
sysD_13=tf(num2(13,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 1 <- QUESTION D')
disp('### PAUSE 4/4 ###')
pause
disp(' ')
disp(' ')

%% STEP RESPONCES

disp(' ')
disp('/-/-/-/-/-/-/-/')
disp('RESPONSES: STEP')
disp('/-/-/-/-/-/-/-/')
close 

disp(' ')
disp('>     RESPONSE GRAPH')
disp('> UNIT STEP FUNCTION')
disp('>       w.r.t. INPUT: 1')

f_step1 = figure('Name','step(A,B,C,D,1)');
step(A,B,C,D,1) 

disp(' ') 
disp('###  PAUSE 1/3 -> FIGURE step(A,B,C,D,1) ###')
pause
disp(' ')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>     RESPONSE GRAPH')
disp('> UNIT STEP FUNCTION')
disp('>       w.r.t. INPUT: 2')

f_step2 = figure('Name','step(A,B,C,D,2)');
step(A,B,C,D,2) 

disp(' ') 
disp('###  PAUSE 2/3 -> FIGURE step(A,B,C,D,2) ###')
pause
disp(' ')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>     RESPONSE GRAPH')
disp('> UNIT STEP FUNCTION')
disp('>       w.r.t. INPUT: 3')

f_step3 = figure('Name','step(A,B,C,D,3)');
step(A,B,C,D,3) 

disp(' ') 
disp('###  PAUSE 3/3 -> FIGURE step(A,B,C,D,3) ###')
pause
disp(' ')
disp(' ')

%% IMPULSE RESPONSES

disp(' ')
disp('/-/-/-/-/-/-/-/-/-')
disp('RESPONSES: IMPULSE')
disp('/-/-/-/-/-/-/-/-/-')
close 

disp(' ')
disp('>        RESPONSE GRAPH')
disp('> UNIT IMPULSE FUNCTION')
disp('>          w.r.t. INPUT: 1')

f_impulse1 = figure('Name','impulse(A,B,C,D,1)');
impulse(A,B,C,D,1) 

disp(' ') 
disp('###  PAUSE 1/3 -> FIGURE impulse(A,B,C,D,1) ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>        RESPONSE GRAPH')
disp('> UNIT IMPULSE FUNCTION')
disp('>          w.r.t. INPUT: 2')

f_impulse2 = figure('Name','impulse(A,B,C,D,2)');
impulse(A,B,C,D,2) 

disp(' ') 
disp('###  PAUSE 2/3 -> FIGURE impulse(A,B,C,D,2) ###')
pause
disp(' ')
disp(' ')

disp(' ')
disp('>        RESPONSE GRAPH')
disp('> UNIT IMPULSE FUNCTION')
disp('>          w.r.t. INPUT: 3')

f_impulse3 = figure('Name','impulse(A,B,C,D,3)');
impulse(A,B,C,D,3) 

disp(' ') 
disp('###  PAUSE 3/3 -> FIGURE impulse(A,B,C,D,3) ###')
pause
disp(' ')
disp(' ')

%% SYSTEM ANALYSIS

disp(' ')
disp('/-/-/-/-/-/-/-/')
disp('SYSTEM ANALYSIS')
disp('/-/-/-/-/-/-/-/')
disp(' ')
close 

disp('>>>>>>>>>>>>>>> POLES')
disp('>>> EIGEN-FREQUENCIES')
disp('>>>>> DAMPING FACTORS')

damp(den) 

disp(' ')
disp('...OR')

damp(A), [wn,zita]=damp(A); 

disp(' ')
disp('> POLES/EIGEN-FREQUENCIES/DAMPING FACTORS')
disp('### PAUSE 1/2 ###')
pause
disp(' ')

disp('>>> DAMPING FREQUENCIES')

wd=wn.*sqrt(1-zita.^2)

disp(' ')
disp('> DAMPING FREQUENCIES')
disp('### PAUSE 2/2 ###')
pause
disp(' ')

%% SYSTEM PARAMETERS BECAUSE OF INPUTS

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('SYSTEM PARAMETERS   ')
disp('     DUE TO INPUT: 1')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

[z1,p,k1]=tf2zp(num1,den) 

disp(' ')
disp('> SYSTEM PARAMETERS DUE TO INPUT 1')
disp('### PAUSE 1/3###')
pause
disp(' ')

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('SYSTEM PARAMETERS   ')
disp('     DUE TO INPUT: 2')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

[z2,p,k2]=tf2zp(num2,den) 

disp(' ')
disp('> SYSTEM PARAMETERS DUE TO INPUT 2')
disp('### PAUSE 2/3 ###')
pause
disp(' ')

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('SYSTEM PARAMETERS   ')
disp('     DUE TO INPUT: 3')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

[z3,p,k3]=tf2zp(num3,den) 

disp(' ')
disp('> SYSTEM PARAMETERS DUE TO INPUT 3')
disp('### PAUSE 3/3 ###')
pause
disp(' ')

%% STEADY STATE GAIN

disp(' ')
disp('/-/-/-/-/-/-/-')
disp('STEADY-STATE GAIN')
disp('/-/-/-/-/-/-/-')
disp(' ')

kss_1 = num1(:,6)./den(6)
kss_2 = num2(:,6)./den(6)
kss_3 = num3(:,6)./den(6)

disp(' ')
disp('> STEADY-STATE GAIN')
disp('### PAUSE ###')
pause
disp(' ')

%% TIME CONSTANTS

disp(' ')
disp('/-/-/-/-/-/-/-')
disp('TIME CONSTANTS')
disp('/-/-/-/-/-/-/-')
disp(' ')
close 

% Time constants.
taf=1./abs(real(p)) 

disp(' ')
disp('> TIME CONSTANTS')
disp('### PAUSE ###')
pause
disp(' ')

%% BODE PLOTS BECAUSE OF ALL INPUTS

disp(' ')
disp('/-/-/-/-/-/-/-/-/-/-')
disp('   BODE PLOTS   ')
disp('DUE TO INPUTS: ALL')
disp('/-/-/-/-/-/-/-/-/-/-')
disp(' ')
close 

f_bode_1 = figure('Name','bode(A,B,C,D,1)');
bode(A,B,C,D,1), grid 
f_bode_2 = figure('Name','bode(A,B,C,D,2)');
bode(A,B,C,D,1), grid 
f_bode_3 = figure('Name','bode(A,B,C,D,3)');
bode(A,B,C,D,1), grid 

disp(' ') 
disp('###  PAUSE -> 3 FIGURES // bode(A,B,C,D) ###')
pause
disp(' ')
disp(' ')

%% ASSIGNMENT ANALYSIS A

disp('|-------------|')
disp('| ANALYSIS: A |')
disp('|-------------|')
close all

optA = stepDataOptions('StepAmplitude',1)

fA_01=figure('Name','sysA_01_V_C1');
step(sysA_01, optA, 'r'), title('RESPONSE (STEP) e1:V_C1'), grid, zoom
disp('do FIGURE sysA_01_V_C1')

fA_02=figure('Name','sysA_02_V_C2');
step(sysA_02, optA, 'g'), title('RESPONSE (STEP) e1:V_C2'), grid, zoom
disp('do FIGURE sysA_02_V_C2')

fA_03=figure('Name','sysA_03_V_C3');
step(sysA_03, optA, 'b'), title('RESPONSE (STEP) e1:V_C3'), grid, zoom
disp('do FIGURE sysA_03_V_C3')

fA_04=figure('Name','sysA_04_V_R1');
step(sysA_04, optA, 'r'), title('RESPONSE (STEP) e1:V_R1'), grid, zoom
disp('do FIGURE sysA_04_V_R1')

fA_05=figure('Name','sysA_05_V_R2');
step(sysA_05, optA, 'g'), title('RESPONSE (STEP) e1:V_R2'), grid, zoom
disp('do FIGURE sysA_05_V_R2')

fA_06=figure('Name','sysA_06_V_R3');
step(sysA_06, optA, 'b'), title('RESPONSE (STEP) e1:V_R3'), grid, zoom
disp('do FIGURE sysA_06_V_R3')

fA_07=figure('Name','sysA_07_V_L2');
step(sysA_07, optA, 'g'), title('RESPONSE (STEP) e1:V_L2'), grid, zoom
disp('do FIGURE sysA_07_V_L2')

fA_08=figure('Name','sysA_08_V_L3');
step(sysA_08, optA, 'b'), title('RESPONSE (STEP) e1:V_L3'), grid, zoom
disp('do FIGURE sysA_08_V_L3')

fA_09=figure('Name','sysA_09_i1');
step(sysA_09, optA), title('RESPONSE (STEP) e1:i1'), grid, zoom
disp('do FIGURE sysA_09_i1')

fA_10=figure('Name','sysA_10_i2');
step(sysA_10, optA), title('RESPONSE (STEP) e1:i2'), grid, zoom
disp('do FIGURE sysA_10_i2')

fA_11=figure('Name','sysA_11_i3');
step(sysA_11, optA), title('RESPONSE (STEP) e1:i3'), grid, zoom
disp('do FIGURE sysA_11_i3')

fA_12=figure('Name','sysA_12_i4');
step(sysA_12, optA, 'r'), title('RESPONSE (STEP) e1:i4'), grid, zoom
disp('do FIGURE sysA_12_i4')

fA_13=figure('Name','sysA_13_i5');
step(sysA_13, optA), title('RESPONSE (STEP) e1:i5'), grid, zoom
disp('do FIGURE sysA_13_i5')

disp(' ')
disp('### PAUSE -> FIGURES >>> SYSTEM A ###')
pause 
disp(' ')

%% ASSIGNMENT ANALYSIS B

disp('|-------------|')
disp('| ANALYSIS: B |')
disp('|-------------|')
close all

optB = stepDataOptions('StepAmplitude',12)

fB_01=figure('Name','sysB_01_V_C1');
step(sysB_01, optB, 'r'), title('RESPONSE (STEP x 12) e2:V_C1'), grid, zoom
disp('do FIGURE sysB_01_V_C1')

fB_02=figure('Name','sysB_02_V_C2');
step(sysB_02, optB, 'g'), title('RESPONSE (STEP x 12) e2:V_C2'), grid, zoom
disp('do FIGURE sysB_02_V_C2')

fB_03=figure('Name','sysB_03_V_C3');
step(sysB_03, optB, 'b'), title('RESPONSE (STEP x 12) e2:V_C3'), grid, zoom
disp('do FIGURE sysB_03_V_C3')

fB_04=figure('Name','sysB_04_V_R1');
step(sysB_04, optB, 'r'), title('RESPONSE (STEP x 12) e2:V_R1'), grid, zoom
disp('do FIGURE sysB_04_V_R1')

fB_05=figure('Name','sysB_05_V_R2');
step(sysB_05, optB, 'g'), title('RESPONSE (STEP x 12) e2:V_R2'), grid, zoom
disp('do FIGURE sysB_05_V_R2')

fB_06=figure('Name','sysB_06_V_R3');
step(sysB_06, optB, 'b'), title('RESPONSE (STEP x 12) e2:V_R3'), grid, zoom
disp('do FIGURE sysB_06_V_R3')

fB_07=figure('Name','sysB_07_V_L2');
step(sysB_07, optB, 'g'), title('RESPONSE (STEP x 12) e2:V_L2'), grid, zoom
disp('do FIGURE sysB_07_V_L2')

fB_08=figure('Name','sysB_08_V_L3');
step(sysB_08, optB, 'b'), title('RESPONSE (STEP x 12) e2:V_L3'), grid, zoom
disp('do FIGURE sysB_08_V_L3')

fB_09=figure('Name','sysB_09_i1');
step(sysB_09, optB), title('RESPONSE (STEP x 12) e2:i1'), grid, zoom
disp('do FIGURE sysB_09_i1')

fB_10=figure('Name','sysB_10_i2');
step(sysB_10, optB), title('RESPONSE (STEP x 12) e2:i2'), grid, zoom
disp('do FIGURE sysB_10_i2')

fB_11=figure('Name','sysB_11_i3');
step(sysB_11, optB), title('RESPONSE (STEP x 12) e2:i3'), grid, zoom
disp('do FIGURE sysB_11_i3')

fB_12=figure('Name','sysB_12_i4');
step(sysB_12, optB), title('RESPONSE (STEP x 12) e2:i4'), grid, zoom
disp('do FIGURE sysB_12_i4')

fB_13=figure('Name','sysB_13_i5');
step(sysB_13, optB), title('RESPONSE (STEP x 12) e2:i5'), grid, zoom
disp('do FIGURE sysB_13_i5')

disp(' ')
disp('### PAUSE -> FIGURES >>> SYSTEM B ###')
pause 
disp(' ')

%% ASSIGNMENT ANALYSIS C

disp('|-------------|')
disp('| ANALYSIS: C |')
disp('|-------------|')
close all

disp(' ')

fC_01=figure('Name','sysC_01_V_C1');
impulse(sysC_01, 'r'), title('RESPONSE (IMPULSE) e3:V_C1'), grid, zoom
disp('do FIGURE sysC_01_V_C1')

fC_02=figure('Name','sysC_02_V_C2');
impulse(sysC_01, 'g'), title('RESPONSE (IMPULSE) e3:V_C2'), grid, zoom
disp('do FIGURE sysC_02_V_C2')

fC_03=figure('Name','sysC_03_V_C3');
impulse(sysC_01, 'b'), title('RESPONSE (IMPULSE) e3:V_C3'), grid, zoom
disp('do FIGURE sysC_03_V_C3')

fC_04=figure('Name','sysC_04_V_R1');
impulse(sysC_01, 'r'), title('RESPONSE (IMPULSE) e3:V_R1'), grid, zoom
disp('do FIGURE sysC_04_V_R1')

fC_05=figure('Name','sysC_05_V_R2');
impulse(sysC_01, 'g'), title('RESPONSE (IMPULSE) e3:V_R2'), grid, zoom
disp('do FIGURE sysC_05_V_R2')

fC_06=figure('Name','sysC_06_V_R3');
impulse(sysC_01, 'b'), title('RESPONSE (IMPULSE) e3:V_R3'), grid, zoom
disp('do FIGURE sysC_06_V_R3')

fC_07=figure('Name','sysC_07_V_L2');
impulse(sysC_01, 'g'), title('RESPONSE (IMPULSE) e3:V_L2'), grid, zoom
disp('do FIGURE sysC_07_V_L2')

fC_08=figure('Name','sysC_08_V_L3');
impulse(sysC_01, 'b'), title('RESPONSE (IMPULSE) e3:V_L3'), grid, zoom
disp('do FIGURE sysC_08_V_L3')

fC_09=figure('Name','sysC_09_i1');
impulse(sysC_01), title('RESPONSE (IMPULSE) e3:i1'), grid, zoom
disp('do FIGURE sysC_09_i1')

fC_10=figure('Name','sysC_10_i2');
impulse(sysC_01), title('RESPONSE (IMPULSE) e3:i2'), grid, zoom
disp('do FIGURE sysC_10_i2')

fC_11=figure('Name','sysC_11_i3');
impulse(sysC_01), title('RESPONSE (IMPULSE) e3:i3'), grid, zoom
disp('do FIGURE sysC_11_i3')

fC_12=figure('Name','sysC_12_i4');
impulse(sysC_01), title('RESPONSE (IMPULSE) e3:i4'), grid, zoom
disp('do FIGURE sysC_12_i4')

fC_13=figure('Name','sysC_13_i5');
impulse(sysC_01), title('RESPONSE (IMPULSE) e3:i5'), grid, zoom
disp('do FIGURE sysC_13_i5')

disp(' ')
disp('### PAUSE -> FIGURES >>> SYSTEM C ###')
pause 
disp(' ')

%% ASSIGNMENT ANALYSIS D

disp('|-------------|')
disp('| ANALYSIS: D |')
disp('|-------------|')
close all


% ///////////////////////
% Vp     - p = 12       V
% V_mean     =  3       V
% ///////////////////////
% frequency:      1    Hz
% duration:     120     s
% sampling:    1000 spl/s
% ///////////////////////

[u,t] = gensig('sin', 1, 60, 0.001);
u = (6 * u) + 3;

disp(' ')

fD_01 = figure('Name','sysD_01_V_C1');
lD_01 = lsim(sysD_01, u, t);
plot(t, lD_01, 'r'); xlabel('t'); ylabel('V_C1');
title('RESPONSE (SINE) e2:V_C1'); grid; zoom;
disp('do FIGURE sysD_01_V_C1')

fD_02 = figure('Name','sysD_02_V_C2');
lD_02 = lsim(sysD_02, u, t);
plot(t, lD_02, 'r'); xlabel('t'); ylabel('V_C2');
title('RESPONSE (SINE) e2:V_C2'); grid; zoom;
disp('do FIGURE sysD_02_V_C2')

fD_03 = figure('Name','sysD_03_V_C3');
lD_03 = lsim(sysD_03, u, t);
plot(t, lD_03, 'r'); xlabel('t'); ylabel('V_C3');
title('RESPONSE (SINE) e2:V_C3'); grid; zoom;
disp('do FIGURE sysD_03_V_C3')

fD_04 = figure('Name','sysD_04_V_R1');
lD_04 = lsim(sysD_04, u, t);
plot(t, lD_04, 'r'); xlabel('t'); ylabel('V_R1');
title('RESPONSE (SINE) e2:V_R1'); grid; zoom;
disp('do FIGURE sysD_04_V_R1')

fD_05 = figure('Name','sysD_05_V_R2');
lD_05 = lsim(sysD_05, u, t);
plot(t, lD_05, 'r'); xlabel('t'); ylabel('V_R2');
title('RESPONSE (SINE) e2:V_R2'); grid; zoom;
disp('do FIGURE sysD_05_V_R2')

fD_06 = figure('Name','sysD_06_V_R3');
lD_06 = lsim(sysD_06, u, t);
plot(t, lD_06, 'r'); xlabel('t'); ylabel('V_R3');
title('RESPONSE (SINE) e2:V_R3'); grid; zoom;
disp('do FIGURE sysD_06_V_R3')

fD_07 = figure('Name','sysD_07_V_L2');
lD_07 = lsim(sysD_07, u, t);
plot(t, lD_07, 'r'); xlabel('t'); ylabel('V_L2');
title('RESPONSE (SINE) e2:V_L2'); grid; zoom;
disp('do FIGURE sysD_07_V_L2')

fD_08 = figure('Name','sysD_08_V_L3');
lD_08 = lsim(sysD_08, u, t);
plot(t, lD_08, 'r'); xlabel('t'); ylabel('V_L3');
title('RESPONSE (SINE) e2:V_L3'); grid; zoom;
disp('do FIGURE sysD_08_V_L3')

fD_09 = figure('Name','sysD_09_i1');
lD_09 = lsim(sysD_09, u, t);
plot(t, lD_09, 'r'); xlabel('t'); ylabel('i1');
title('RESPONSE (SINE) e2:i1'); grid; zoom;
disp('do FIGURE sysD_09_i1')

fD_10 = figure('Name','sysD_10_i2');
lD_10 = lsim(sysD_10, u, t);
plot(t, lD_10, 'r'); xlabel('t'); ylabel('i2');
title('RESPONSE (SINE) e2:i2'); grid; zoom;
disp('do FIGURE sysD_10_i2')

fD_11 = figure('Name','sysD_11_i3');
lD_11 = lsim(sysD_11, u, t);
plot(t, lD_11, 'r'); xlabel('t'); ylabel('i3');
title('RESPONSE (SINE) e2:i3'); grid; zoom;
disp('do FIGURE sysD_11_i3')

fD_12 = figure('Name','sysD_12_i4');
lD_12 = lsim(sysD_12, u, t);
plot(t, lD_12, 'r'); xlabel('t'); ylabel('i4');
title('RESPONSE (SINE) e2:i4'); grid; zoom;
disp('do FIGURE sysD_12_i4')

fD_13 = figure('Name','sysD_13_i5');
lD_13 = lsim(sysD_13, u, t);
plot(t, lD_13, 'r'); xlabel('t'); ylabel('i5');
title('RESPONSE (SINE) e2:i5'); grid; zoom;
disp('do FIGURE sysD_13_i5')

disp(' ')
disp('### PAUSE -> FIGURES >>> SYSTEM B ###')
pause 
disp(' ')

%% FREQUENCY RESPONSES

disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 1 |')
disp('| <><><>< QUESTION: M ><><><> |')
disp('|-----------------------------|')
disp(' ')

close all

f_bode_sysA_03 = figure('Name','bode(sysA_03) => V_C3');
bode(sysA_03), grid
disp('do BODE-FIGURE sysA_03_x1')
f_bode_sysA_06 = figure('Name','bode(sysA_06) => V_R3');
bode(sysA_06), grid 
disp('do BODE-FIGURE sysA_06_u1')
f_bode_sysA_08 = figure('Name','bode(sysA_08) => V_L3');
bode(sysA_08), grid 
disp('do BODE-FIGURE sysA_08_a1')

disp(' ')

disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 1 |')
disp('| <><><>< QUESTION: N ><><><> |')
disp('|-----------------------------|')
disp(' ')

fA_06=figure('Name','sysA_06_V_R1');
step(sysA_06), grid, zoom
disp('do FIGURE sysA_06_V_R1')

disp(' ')
stepinfo(sysA_06)
