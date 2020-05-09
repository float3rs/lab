clear
close all

syms s;             
syms R;             
syms L;             
syms C;             

A = [ 0     1/C;
    -1/L  -R/L];

B = [  0;
     1/L];
 
C = [ 0  R;
     -1 -R;
      1  0];

D = [0;  1;  0];

I = eye(2);

G = C * inv(s * I - A) * B + D;