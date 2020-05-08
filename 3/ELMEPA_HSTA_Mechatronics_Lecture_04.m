clear all, clc, close all, figure(1)

% Set system's parameter values.
m1=15;, m2=22;, k1=240;, k2=300;, c1=24;, c2=36;

% State matrix.
A=[          0            1       0       0; 
   -(k1+k2)/m1  -(c1+c2)/m1   k2/m1   c2/m1; 
             0            0       0       1;
         k2/m2        c2/m2  -k2/m2  -c2/m2]
     
% Input matrix.
B=[0        0; 
    1/m1    0; 
    0       0; 
    0    1/m2]

% Output matrix.
C=[ 1   0    0   0; 
    0   0    1   0; 
    0   1    0   0; 
    0   0    0   1; 
   k2   0  -k2   0]

% Input matrix.
D=zeros(5,2), pause

% Transfer functions w.r.t first input.
clc, [num1,den]=ss2tf(A,B,C,D,1), pause
clc, printsys(num1,den), pause

% Transfer functions w.r.t second input.
clc, [num2,den]=ss2tf(A,B,C,D,2), pause
clc, printsys(num2,den), pause

% One single transfer function (4th output, 2nd input).
% Define a system with this TF.
clc, sys=tf(num2(4,:),den), pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESPONSES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% All outputs due to the first input, unit step f1.
close all, figure, step(A,B,C,D,1), pause

% All outputs due to the second input, unit step f2.
clf(1), figure(1), step(A,B,C,D,2), pause

% All outputs due to the first input, impulse f1.
clf(1), figure(1), impulse(A,B,C,D,1), pause

% All outputs due to the second input, impulse f2.
clf(1), figure(1), impulse(A,B,C,D,2), pause

% Step response of the system sys (both inputs).
clf(1), step(sys), pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SYSTEM ANALYSIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Poles, eigen-frequencies and damping factors.
clc, damp(den), pause
% or...
damp(A), [wn,zita]=damp(A);, pause

% Damping frequencies.
wd=wn.*sqrt(1-zita.^2), pause

% All system parameters due to first input.
clc, [z1,p,k1]=tf2zp(num1,den), pause

% All system parameters due to first input.
clc, [z2,p,k2]=tf2zp(num2,den), pause

% Time constants.
clc, taf=1./abs(real(p)), pause

% Bode plots all outputs due to all inputs.
clf(1), bode(A,B,C,D), grid, pause

% Analysis of single system (TF) (y2=\dot{x}_1  w.r.t.  f1)
sys=tf(num2(1,:),den), pause

% System's step response.
clf(1), step(100*sys), grid, zoom, pause
% zoom fot t=0 up to t=5 sec.
clf(1), t=linspace(0,5,2000);, y1=step(100*sys,t);
plot(t,y1,'b','linewidth',2), grid, zoom
set(gca,'linewidth',2,'fontsize',20)
ylabel('Amplitude','fontsize',20)
xlabel('Time (sec)','fontsize',20)


% COMMENT: values such as: 
%- 1.3716e-14  or  - 5.354e-14, should be set to ZERO.


