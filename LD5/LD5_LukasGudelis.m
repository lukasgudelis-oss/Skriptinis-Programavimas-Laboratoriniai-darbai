% Lukas Gudelis
% Data: 2026-10-12
% Grupe : EIF-25

%% Kiti duomenu tipai ir operaciju nuoseklumas | 24 variantas
% 1 dalis
 
A = cell(2,2);
A{1,1} = [1 2; 3 4];
A{1,2} = 'Labas';
A{2,1} = int8([10 20 30]);
A{2,2} = [true false true];
 
B = cell(2,2);
B{1,1} = single(3.14);
B{1,2} = {1, 'abc'};
B{2,1} = struct('vardas', 'Jonas', 'amzius', 20);
B{2,2} = uint16([100 200 300 400]);
 
disp('Celių masyvas A:');
celldisp(A, 'A');
disp('Celių masyvas B:');
celldisp(B, 'B');
 
C = cat(3, A, B);
disp('Trimačio celių masyvo C dydis:');
disp(size(C));
disp('C dimensijų skaičius:');
disp(ndims(C));
 
disp('Elementų ilgiai (length):');
ilgiai = cellfun('length', C);
disp(ilgiai);
 
disp('Ar elementas tuščias (isempty):');
disp(cellfun('isempty', C));
 
disp('Ar elementas realus (isreal):');
disp(cellfun('isreal', C));
 
disp('Ar elemento klasė double (isclass):');
disp(cellfun('isclass', C, 'double'));
 
disp('Ilgiai po cell2mat:');
disp(cell2mat(num2cell(ilgiai)));
 
cellplot(cat(2, C(:,:,1), C(:,:,2)));
%% 2 dalis

while true
    m = input('Įveskite skaičių m: ');
    n = input('Įveskite skaičių n: ');

    if m == n
        disp('Skaičiai vienodi. Programa baigia darbą.');
        break
    end

    didesnis = max(m, n);
    mazesnis = min(m, n);

    if mazesnis <= 0
        disp('Mažesnis skaičius turi būti teigiamas. Bandykite dar kartą.');
        continue
    end

    kartai = 0;
    while didesnis - mazesnis > 0
        didesnis = didesnis - mazesnis;
        kartai = kartai + 1;
    end

    disp(['Atimta kartų: ', num2str(kartai)]);
    disp(['Mažiausia teigiama reikšmė: ', num2str(didesnis)]);
    disp('--------------------------------');
end
%% Papildoma uzd | 14 variantas
clc; clear;
 
x = input('Įveskite skaičių x: ');
y = input('Įveskite skaičių y: ');
 
A = NaN(x, y);
 
for k = 1:20
    m = randi(x);
    n = randi(y);
    A(m,n) = 0;
 
    fprintf('Iteracija %d, m = %d, n = %d\n', k, m, n);
    disp(A);
 
    pause(0.5);
    if k < 20
        clc;
    end
end
