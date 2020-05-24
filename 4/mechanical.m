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

m_MIN = 10;
m_MAX = 100;

m1 = m_MIN + (((m_MAX - m_MIN) / 5) * 3); 
m2 = m_MIN + (((m_MAX - m_MIN) / 5) * 4);
m3 = m_MIN + (((m_MAX - m_MIN) / 5) * 2);

k_MIN = 5000;
k_MAX = 15000;

k1 = k_MIN + (((k_MAX - k_MIN) / 5) * 4); 
k2 = k_MIN + (((k_MAX - k_MIN) / 5) * 2); 
k3 = k_MIN + (((k_MAX - k_MIN) / 5) * 3); 

c_MIN = 100;
c_MAX = 200;

c2 = c_MIN + (((c_MAX - c_MIN) / 4) * 2); 
c3 = c_MIN + (((c_MAX - c_MIN) / 4) * 3); 

disp(' ')
disp('MASSES: ')
disp(['m1: ', num2str(m1)])
disp(['m2: ', num2str(m2)])
disp(['m3: ', num2str(m3)])

disp(' ')
disp('ELASTICITIES: ')
disp(['k1: ', num2str(k1)])
disp(['k2: ', num2str(k2)])
disp(['k3: ', num2str(k3)])

disp(' ')
disp('ATTENUATIONS: ')
disp(['c2: ', num2str(c2)])
disp(['c3: ', num2str(c3)])

% fprintf('m1: %5.0f        m2: %5.0f        m3: %5.0f\n', m1, m2, m3)
% fprintf('k1: %5.0f        k2: %5.0f        k3: %5.0f\n', k1, k2, k3)
% fprintf('                 c2: %5.0f        c3: %5.0f\n', c2, c3)

disp(' ')

%% MATRICES

disp('/-/-/-/-/-/-/-/-/-/-/-/')
disp('-> STATE SPACE MATRICES')
disp('/-/-/-/-/-/-/-/-/-/-/-/')

disp(' ')
disp('STATE MATRIX:')

A=[          0       1            0            0       0       0;
   -(k1+k2)/m1  -c2/m1        k2/m1        c2/m1       0       0;
             0       0            0            1       0       0;
         k2/m2   c2/m2  -(k2+k3)/m2  -(c2+c3)/m2   k3/m2   c3/m2;
             0       0            0            0       0       1;
             0       0         k3/m3        c3/m3  -k3/m3  -c3/m3]

disp(' ')
disp('INPUT MATRIX:')

B=[   0     0     0;
   1/m1     0     0;
      0     0     0;
      0  1/m2     0;
      0     0     0;
      0     0  1/m3]

disp(' ')
disp('OUTPUT MATRIX:')

C=[          1       0            0            0       0       0;
             0       0            1            0       0       0;
             0       0            0            0       1       0;
             0       1            0            0       0       0;
             0       0            0            1       0       0;
             0       0            0            0       0       1;
   -(k1+k2)/m1  -c2/m1        k2/m1        c2/m1       0       0;
         k2/m2   c2/m2  -(k2+k3)/m2  -(c2+c3)/m2   k3/m2   c3/m2;
             0       0        k3/m3        c3/m3  -k3/m3  -c3/m3;
            k1       0            0            0       0       0;
            k2       0          -k2            0       0       0;
             0      c2            0          -c2       0       0;
             0       0           k3            0     -k3       0;
             0       0            0           c3       0     -c3]
 
disp(' ')
disp('INPUT MATRIX:')

D=[0       0     0;
   0       0     0;
   0       0     0;
   0       0     0;
   0       0     0;
   0       0     0;
   1/m1    0     0;
   0    1/m2     0;
   0       0  1/m3;
   0       0     0;
   0       0     0;
   0       0     0;
   0       0     0;
   0       0     0]

%% TRANSFER FUNCTIONS 

disp('/-/-/-/-/-/-/-/-/-/-/')
disp('-> TRANSFER FUNCTIONS')
disp('/-/-/-/-/-/-/-/-/-/-/')

% /////////////////////////////////
% TRANSFER FUNCTIONS w.r.t INPUT: 1
% /////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 1')

[num1,den] = ss2tf(A,B,C,D,1)

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
% TRANSFER FUNCTIONS w.r.t INPUT: 2
% /////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 2')

[num2,den] = ss2tf(A,B,C,D,2)

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
% TRANSFER FUNCTIONS w.r.t INPUT: 3
% /////////////////////////////////

disp(' ')
disp('TRANSFER FUNCTION << INPUT 3')

[num3,den] = ss2tf(A,B,C,D,3)

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

%% ASSIGNMENT 3
 
disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 2 |')
disp('|-----------------------------|')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:          A') 
disp('>>> INPUT:            f3') 
disp('>>> STEP MAGNITUDE:  100')

disp(' ')
disp(' ')
disp('$ OUTPUT:   x1')
sysA_01=tf(num3(01,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x2')
sysA_02=tf(num3(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x3')
sysA_03=tf(num3(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u1')
sysA_04=tf(num3(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u2')
sysA_05=tf(num3(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u3')
sysA_06=tf(num3(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a1')
sysA_07=tf(num3(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a2')
sysA_08=tf(num3(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a3')
sysA_09=tf(num3(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k1')
sysA_10=tf(num3(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k2')
sysA_11=tf(num3(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c2')
sysA_12=tf(num3(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k3')
sysA_13=tf(num3(13,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c3')
sysA_14=tf(num3(14,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 2 <- QUESTION A')
disp('### PAUSE 1/2 ###')
pause
disp(' ')
disp(' ')

% <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

disp(' ')
disp('>>> QUESTION:                       B') 
disp('>>> INPUT:                         f1') 
disp('>>> SINUSOIDAL:  f_p    - p = 1000 Nt')
disp('>>>              f_mean     =    0 Nt')

disp(' ')
disp(' ')
disp('$ OUTPUT:   x1')
sysB_01=tf(num1(1,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x2')
sysB_02=tf(num1(02,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   x3')
sysB_03=tf(num1(03,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u1')
sysB_04=tf(num1(04,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u2')
sysB_05=tf(num1(05,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   u3')
sysB_06=tf(num1(06,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a1')
sysB_07=tf(num1(07,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a2')
sysB_08=tf(num1(08,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT:   a3')
sysB_09=tf(num1(09,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k1')
sysB_10=tf(num1(10,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k2')
sysB_11=tf(num1(11,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c2')
sysB_12=tf(num1(12,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_k3')
sysB_13=tf(num1(13,:), den)
disp(' ')
disp(' ')
disp('$ OUTPUT: f_c3')
sysB_14=tf(num1(14,:), den)

disp(' ')
disp('ASSIGNMENT 3 <- EXCERSISE 2 <- QUESTION B')
disp('### PAUSE 2/2 ###')
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

kss_1 = num1(:,7)./den(7)
kss_2 = num2(:,7)./den(7)
kss_3 = num3(:,7)./den(7)

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

%% ASSIGNMENT 3 ANALYSIS A

disp('|---------------|')
disp('| ASSIGNMENT: 3 |')
disp('|   ANALYSIS: A |')
disp('|---------------|')
close all

optA = stepDataOptions('StepAmplitude',100)

fA_01=figure('Name','sysA_01_x1');
step(sysA_01, optA, 'r'), title('RESPONSE (STEP x 100) f3:x1'), grid, zoom
disp('do FIGURE sysA_01_x1')

fA_02=figure('Name','sysA_02_x2');
step(sysA_02, optA, 'g'), title('RESPONSE (STEP x 100) f3:x2'), grid, zoom
disp('do FIGURE sysA_02_x2')

fA_03=figure('Name','sysA_03_x3');
step(sysA_03, optA, 'b'), title('RESPONSE (STEP x 100) f3:x3'), grid, zoom
disp('do FIGURE sysA_03_x3')

fA_04=figure('Name','sysA_04_u1');
step(sysA_04, optA, 'r'), title('RESPONSE (STEP x 100) f3:u1'), grid, zoom
disp('do FIGURE sysA_04_u1')

fA_05=figure('Name','sysA_05_u2');
step(sysA_05, optA, 'g'), title('RESPONSE (STEP x 100) f3:u2'), grid, zoom
disp('do FIGURE sysA_05_u2')

fA_06=figure('Name','sysA_06_u3');
step(sysA_06, optA, 'b'), title('RESPONSE (STEP x 100) f3:u3'), grid, zoom
disp('do FIGURE sysA_06_u3')

fA_07=figure('Name','sysA_07_a1');
step(sysA_07, optA, 'r'), title('RESPONSE (STEP x 100) f3:a1'), grid, zoom
disp('do FIGURE sysA_07_a1')

fA_08=figure('Name','sysA_08_a2');
step(sysA_08, optA, 'g'), title('RESPONSE (STEP x 100) f3:a2'), grid, zoom
disp('do FIGURE sysA_08_a2')

fA_09=figure('Name','sysA_09_a3');
step(sysA_09, optA, 'b'), title('RESPONSE (STEP x 100) f3:a3'), grid, zoom
disp('do FIGURE sysA_09_a3')

fA_10=figure('Name','sysA_10_fk1');
step(sysA_10, optA, 'r'), title('RESPONSE (STEP x 100) f3:fk1'), grid, zoom
disp('do FIGURE sysA_10_fk1')

fA_11=figure('Name','sysA_11_fk2');
step(sysA_11, optA, 'g'), title('RESPONSE (STEP x 100) f3:fk2'), grid, zoom
disp('do FIGURE sysA_11_fk2')

fA_12=figure('Name','sysA_12_fc2');
step(sysA_12, optA, 'g'), title('RESPONSE (STEP x 100) f3:fc2'), grid, zoom
disp('do FIGURE sysA_12_fc2')

fA_13=figure('Name','sysA_13_fk3');
step(sysA_13, optA, 'b'), title('RESPONSE (STEP x 100) f3:fk3'), grid, zoom
disp('do FIGURE sysA_13_fk3')

fA_14=figure('Name','sysA_14_fc3');
step(sysA_14, optA, 'b'), title('RESPONSE (STEP x 100) f3:fc3'), grid, zoom
disp('do FIGURE sysA_14_fc3')

disp(' ')
disp('### PAUSE -> FIGURES >>> ASSIGNMENT 3 :: SYSTEM A ###')
pause 
disp(' ')

%% ASSIGNMENT 3 ANALYSIS B

disp('|---------------|')
disp('| ASSIGNMENT: 3 |')
disp('|   ANALYSIS: B |')
disp('|---------------|')
close all

% ///////////////////////
% fp     - p = 1000    Nt
% f_mean     =    0    Nt
% ///////////////////////
% frequency:      1    Hz
% duration:     120     s
% sampling:     100 spl/s
% ///////////////////////

[u,t] = gensig('sin', 1, 60, 0.001);
u = 500 * u;

disp(' ')

fB_01 = figure('Name','sysB_01_x1');
lB_01 = lsim(sysB_01, u, t);
plot(t, lB_01, 'r'); xlabel('t'); ylabel('x1');
title('RESPONSE (SINE) f1:x1'); grid; zoom;
disp('do FIGURE sysB_01_x1')

fB_02 = figure('Name','sysB_02_x2');
lB_02 = lsim(sysB_02, u, t);
plot(t, lB_02, 'g'); xlabel('t'); ylabel('x2');
title('RESPONSE (SINE) f1:x2'); grid; zoom;
disp('do FIGURE sysB_02_x2')

fB_03 = figure('Name','sysB_03_x3');
lB_03 = lsim(sysB_03, u, t);
plot(t, lB_02, 'b'); xlabel('t'); ylabel('x3');
title('RESPONSE (SINE) f1:x3'); grid; zoom;
disp('do FIGURE sysB_03_x3')

fB_04 = figure('Name','sysB_04_u1');
lB_04 = lsim(sysB_04, u, t);
plot(t, lB_04, 'r'); xlabel('t'); ylabel('u1');
title('RESPONSE (SINE) f1:u1'); grid; zoom;
disp('do FIGURE sysB_04_u1')

fB_05 = figure('Name','sysB_05_u2');
lB_05 = lsim(sysB_05, u, t);
plot(t, lB_05, 'g'); xlabel('t'); ylabel('u2');
title('RESPONSE (SINE) f1:u2'); grid; zoom;
disp('do FIGURE sysB_05_u2')

fB_06 = figure('Name','sysB_06_u3');
lB_06 = lsim(sysB_06, u, t);
plot(t, lB_01, 'b'); xlabel('t'); ylabel('u3');
title('RESPONSE (SINE) f1:u3'); grid; zoom;
disp('do FIGURE sysB_06_u3')

fB_07 = figure('Name','sysB_07_a1');
lB_07 = lsim(sysB_07, u, t);
plot(t, lB_07, 'r'); xlabel('t'); ylabel('a1');
title('RESPONSE (SINE) f1:a1'); grid; zoom;
disp('do FIGURE sysB_07_a1')

fB_08 = figure('Name','sysB_08_a2');
lB_08 = lsim(sysB_08, u, t);
plot(t, lB_08, 'r'); xlabel('t'); ylabel('a2');
title('RESPONSE (SINE) f1:a2'); grid; zoom;
disp('do FIGURE sysB_08_a2')

fB_09 = figure('Name','sysB_09_a3');
lB_09 = lsim(sysB_09, u, t);
plot(t, lB_09, 'r'); xlabel('t'); ylabel('a3');
title('RESPONSE (SINE) f1:a3'); grid; zoom;
disp('do FIGURE sysB_09_a3')

fB_10 = figure('Name','sysB_10_fk1');
lB_10 = lsim(sysB_10, u, t);
plot(t, lB_10, 'r'); xlabel('t'); ylabel('fk1');
title('RESPONSE (SINE) f1:fk1'); grid; zoom;
disp('do FIGURE sysB_10_fk1')

fB_11 = figure('Name','sysB_11_fk2');
lB_11 = lsim(sysB_11, u, t);
plot(t, lB_11, 'g'); xlabel('t'); ylabel('fk2');
title('RESPONSE (SINE) f1:fk2'); grid; zoom;
disp('do FIGURE sysB_11_fk2')

fB_12=figure('Name','sysB_12_fc2');
lB_12 = lsim(sysB_12, u, t);
plot(t, lB_12, 'g'); xlabel('t'); ylabel('fc2');
title('RESPONSE (SINE) f1:fc2'); grid; zoom;
disp('do FIGURE sysB_12_fc2')

fB_13=figure('Name','sysB_13_fk3');
lB_13 = lsim(sysB_13, u, t);
plot(t, lB_13, 'b'); xlabel('t'); ylabel('fk3');
title('RESPONSE (SINE) f1:fk3'); grid; zoom;
disp('do FIGURE sysB_13_fk3')

fB_14=figure('Name','sysB_14_fc3');
lB_14 = lsim(sysB_14, u, t);
plot(t, lB_14, 'b'); xlabel('t'); ylabel('fc3');
title('RESPONSE (SINE) f1:fc3'); grid; zoom;
disp('do FIGURE sysB_14_fc3')

disp(' ')
disp('### PAUSE -> FIGURES >>> ASSIGNMENT 3 :: SYSTEM B ###')
pause 
disp(' ')

%% FREQUENCY RESPONSES

disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 2 |')
disp('| <><><>< QUESTION: M ><><><> |')
disp('|-----------------------------|')
disp(' ')

close all

f_bode_sysA_01 = figure('Name','bode(sysA_01) => x1');
bode(sysA_01), grid
disp('do BODE-FIGURE sysA_01_x1')
f_bode_sysA_04 = figure('Name','bode(sysA_04) => u1');
bode(sysA_04), grid 
disp('do BODE-FIGURE sysA_04_u1')
f_bode_sysA_07 = figure('Name','bode(sysA_07) => a1');
bode(sysA_07), grid 
disp('do BODE-FIGURE sysA_07_a1')

disp(' ')

disp(' ')
disp('|-----------------------------|')
disp('| ASSIGNMENT 3 <- EXCERSISE 2 |')
disp('| <><><>< QUESTION: N ><><><> |')
disp('|-----------------------------|')
disp(' ')

fA_06=figure('Name','sysA_04_u1');
step(100*sysA_04,20), grid, zoom
disp('do FIGURE sysA_04_u1')

disp(' ')
stepinfo(100*sysA_04)

disp(' ')
dcgain(100*sysA_04)/2 

%% ASSIGNMENT 4

disp('|------------------------|')
disp('| ASSIGNMENT: 4          |')
disp('|     SYSTEM: MECHANICAL |')
disp('|------------------------|')

% /////////////////////////////////////////////////////////////////////////
% PREPERATION /////////////////////////////////////////////////////////////
% /////////////////////////////////////////////////////////////////////////

clear  
close all

% /////////////////////////////////////////////////////////////////////////

m_MIN = 10;
m_MAX = 100;

m1 = m_MIN + (((m_MAX - m_MIN) / 5) * 3); 
m2 = m_MIN + (((m_MAX - m_MIN) / 5) * 4);
m3 = m_MIN + (((m_MAX - m_MIN) / 5) * 2);

k_MIN = 5000;
k_MAX = 15000;

k1 = k_MIN + (((k_MAX - k_MIN) / 5) * 4); 
k2 = k_MIN + (((k_MAX - k_MIN) / 5) * 2); 
k3 = k_MIN + (((k_MAX - k_MIN) / 5) * 3); 

c_MIN = 100;
c_MAX = 200;

c2 = c_MIN + (((c_MAX - c_MIN) / 4) * 2); 
c3 = c_MIN + (((c_MAX - c_MIN) / 4) * 3); 

% /////////////////////////////////////////////////////////////////////////

A =[          0       1            0            0       0       0;
    -(k1+k2)/m1  -c2/m1        k2/m1        c2/m1       0       0;
              0       0            0            1       0       0;
          k2/m2   c2/m2  -(k2+k3)/m2  -(c2+c3)/m2   k3/m2   c3/m2;
              0       0            0            0       0       1;
              0       0         k3/m3        c3/m3  -k3/m3  -c3/m3];

B =[   0     0     0;
    1/m1     0     0;
       0     0     0;
       0  1/m2     0;
       0     0     0;
       0     0  1/m3];

C =[          1       0            0            0       0       0;
              0       0            1            0       0       0;
              0       0            0            0       1       0;
              0       1            0            0       0       0;
              0       0            0            1       0       0;
              0       0            0            0       0       1;
    -(k1+k2)/m1  -c2/m1        k2/m1        c2/m1       0       0;
          k2/m2   c2/m2  -(k2+k3)/m2  -(c2+c3)/m2   k3/m2   c3/m2;
              0       0        k3/m3        c3/m3  -k3/m3  -c3/m3;
             k1       0            0            0       0       0;
             k2       0          -k2            0       0       0;
              0      c2            0          -c2       0       0;
              0       0           k3            0     -k3       0;
              0       0            0           c3       0     -c3];

D =[0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    1/m1    0     0;
    0    1/m2     0;
    0       0  1/m3;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0;
    0       0     0];

% ///////////////////////////////////////////////
% STEP RESPONSES FOR EVERY OUTPUT PER EVERY INPUT 
% ///////////////////////////////////////////////

% for in = 1:3
%     [num{in},denom] = ss2tf(A,B,C,D,in);
%     for out = 1:3
%         f = figure('Name', ['step in:[', num2str(in), '] out:[', num2str(out), ']']);
%         step(tf(num{in}(out,:), den))
%     end
% end

% ////////////////////////////////////////////////////////////////
% TRANSFER FUNCTION IN LAPLACE FORM FOR 1ST ZIEGLER-NICHOLS METHOD 
% ////////////////////////////////////////////////////////////////
%  INPUT: 1 
% OUTPUT: 3 
% /////////

[num{1},den]=ss2tf(A,B,C,D,1);
tf(num{1}(3,:),den)
step(tf(num{1}(3,:),den))

% /////////
% OPEN LOOP 
% /////////

% Evaluate its unit step response (12 Volts) with t \in [0  10].
sys = tf(num{1}(3,:),den);

ls = linspace(0, 35, 35000);
y = step(sys, ls);

plot(ls, y, 'b-', 'linewidth', 2)
title('Open loop step response','fontsize',18)
set(gca,'linewidth',2,'fontsize',18)
xlabel('Time','fontsize',18)
ylabel('Amplitude','fontsize',18)
grid 
zoom

% Evaluate various K_P controllers (simulate up to 12 secs).
% Closed loop unit step response (K_P controller, unity negative feedback).
figure

subplot(2,2,1) 
step(feedback(series(1.42e+04, sys), 1), 35)
title('feedback(series(k, sys), 1)')
legend('k = 1.42e+04') 
grid 
zoom

subplot(2,2,2) 
step(feedback(series(1.43e+04, sys), 1), 35)
title('feedback(series(k, sys), 1)')
legend('k = 1.43e+04') 
grid 
zoom

subplot(2,2,3) 
step(feedback(series(1.44e+04, sys), 1), 35)
title('feedback(series(k, sys), 1)')
legend('k = 1.44e+04') 
grid 
zoom

subplot(2,2,4) 
step(feedback(series(1.45e+04, sys), 1), 35)
title('feedback(series(k, sys), 1)')
legend('k = 1.45e+04')
grid 
zoom

% RLOCUS command.
figure 

rlocus(sys, linspace(0, 10000000, 1000000))

disp('---> p = rlocus(sys, 1.44e+04), pause <---')
p = rlocus(sys, 1.44e+04) 

% Define K_unstbl and T_unstb from the rlocus and 
% the closed loop response (12 sec), respectively.
Kosc = 1.44e+04;

% /////////////////////////////////////////////////////////////////////////
figure 

ls = linspace(0, 35, 35000); 
y = step(feedback(series(Kosc, sys), 1), ls);

plot(ls, y)
title('open loop step response')
set(gca, 'linewidth', 1)
xlabel('time(s)')
ylabel('\Omega(rad/sec)')
grid 
zoom

%//////////////////////////////////////////////////////////////////////////

Tosc = 23.3 - 22.7;
final = 7.65e-05;

% Evaluate and define the P controller.
KP = 0.5*Kosc 
con_P = tf(KP,1)

% Evaluate and define the P-I controller.
KP = 0.45*Kosc 
TI = Tosc/1.2 
KI = KP/TI 
con_PI = parallel(tf(KP, 1), tf(KI, [1 0]))

% Evaluate and define the P-I-D controller.
KP =0.60*Kosc 
TI = Tosc/2.0 
KI = KP/TI 
TD =Tosc/8.0 
KD = KP*TD
con_PID = parallel(parallel(tf(KP, 1), tf(KI, [1 0])), tf([KD 0], 1))

% Compare all step responses (open and closed loop).
figure 

time_vec = linspace(0,4,40000);
y = step(sys, time_vec);
plot(time_vec , y, 'k-', 'linewidth', 1) 
grid 
zoom
hold

% Step (60 rad/sec) REFERENCE response of the P-based closed loop.
con_P_CL = feedback(series(con_P, sys), 1)

yP = step(final * con_P_CL, time_vec);
plot(time_vec , yP, 'r-', 'linewidth', 1)

% Step (60 rad/sec) REFERENCE response of the P-I-based closed loop.
con_PI_CL = feedback(series(con_PI, sys), 1)

yPI = step(final * con_PI_CL, time_vec);
plot(time_vec, yPI, 'g-', 'linewidth', 1)

% Step (60 rad/sec) REFERENCE response of the P-I-D-based closed loop.
con_PID_CL = feedback(series(con_PID, sys), 1)

yPID = step(final * con_PID_CL, time_vec);
plot(time_vec, yPID, 'b-', 'linewidth', 1)

title('all step responses (open and closed loop)')
legend('open loop', 'closed loop, P', 'closed loop, P-I', 'closed loop, P-I-D')

% set(gca,'linewidth',2,'fontsize',18)
xlabel('time(s)')
ylabel('\Omega(rad/sec)')