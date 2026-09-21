% Lukas Gudelis
% Data: 2026-09-21
% Grupe : EIF-25

%% Pagrindine uzduotis , 13 VARIANTAS

clc; clear;

%% 1. Vienmaciai masyvai

a = 10:-1:-15;
b = log2(a);
c = a ./ b;
rezultatas = c'

%% 2. Dvimaciai masyvai
Cm1 = pi/2:pi/2:3*pi/2;
Cm2 = -1:1;
Cm3 = -3:-1:-5;
C = [Cm1
    Cm2
    Cm3]
S = sum(C,2)

%% 3. Praktinis veiksmu su masyvais taikymas
Ampl = 6;
f = 4;
sigma = 1.2;
t = 0:0.001:1.5;
U1 = 3.5;
U2 = 2.5;
s = Ampl*sin(2*pi*f*t) + 0.5*Ampl*cos(4*pi*f*t);
n = sigma*randn(size(t));
s_triuksmas = s + n;
a = s_triuksmas(s_triuksmas > U1);
b = s_triuksmas;
b(abs(b) < U2) = 0;
c = length(s_triuksmas);
d = length(a);
edid = max(b);
emaz = min(b);
disp('Nefiltruoto signalo dydis:')
disp(c)
disp('Atrinktu reiksmiu dydis:')
disp(d)
disp('Didziausia filtruoto signalo reiksme:')
disp(edid)
disp('Maziausia filtruoto signalo reiksme:')
disp(emaz)
%% Papildoma uzduotis 9 VARIANTAS

A = [0 1 0 2 3 0 4;
     0 0 0 0 0 0 0;
     0 5 0 6 7 0 8;
     0 9 0 1 2 0 3;
     0 0 0 0 0 0 0;
     0 4 0 5 6 0 7];

tinkamos_eilutes = any(A ~= 0, 2);
tinkami_stulpeliai = any(A ~= 0, 1);

B = A(tinkamos_eilutes, tinkami_stulpeliai);

disp('Matrica B:');
disp(B);