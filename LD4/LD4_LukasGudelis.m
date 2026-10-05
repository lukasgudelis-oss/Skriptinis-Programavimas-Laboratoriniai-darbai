% Lukas Gudelis
% Data: 2026-10-05
% Grupe : EIF-25

%% Rezultatu grafinis 3d atvaizdavimas, 22 VARIANTAS | Privaloma uzduotis

x = linspace(-2,2,20);
y = linspace(-2,2,20);
z = linspace(-1,1,20);
[X,Y,Z] = meshgrid(x,y,z);
R = X.^2 + Y.^2 + Z.^2;
V = sin(R/20).*exp(-R);

figure;
h = slice(X,Y,Z,V,0,0,0);
rotate(h(1),[0 0 1],90,[0 0 0]);
rotate(h(2),[0 0 1],90,[0 0 0]);
shading interp
colormap(jet)
colorbar
axis tight
grid on
view(3)
xlabel('x'); ylabel('y'); zlabel('z');
title('f(x,y,z) = sin((x^2+y^2+z^2)/20)\cdote^{-(x^2+y^2+z^2)}');

x = linspace(-2,2,40);
y = linspace(-2,2,40);
[X,Y] = meshgrid(x,y);
S = abs(X+Y);
F = sin(S/20).*exp(-S);

figure;
hs = surf(X,Y,F);
rotate(hs,[0 0 1],60,[0 0 0]);
shading interp
colormap(jet)
colorbar
axis tight
grid on
view(3)
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title('f(x,y) = sin(|x+y|/20)\cdote^{-|x+y|}');

%% Rezultatu grafinis 3d atvaizdavimas, 4 variantas | Papildoma uzduotis

x = linspace(-2,2,50);
y = linspace(-2,2,50);
[X,Y] = meshgrid(x,y);
Z = 1 - (X.^2 + Y.^2);

figure('Color','w');
surf(X,Y,Z,'FaceColor','r','EdgeColor','none');
camlight('left');
lighting gouraud
axis tight
grid on
view(3)
xlabel('X ašis'); ylabel('Y ašis'); zlabel('Z ašis');
title('z(x,y) = 1-(x^2+y^2)');
