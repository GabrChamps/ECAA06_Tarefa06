##Calccular posicoes do manipulador 2R
##usando fkine para os pontos
clc
clear all
close all
startup_rvc;

L1 = Link([0 0 1 0]);
L2 = Link([0 0 1 0]);
r = SerialLink([L1 L2])

thetas = [0 0; pi/8 0; pi/4 0; 3*pi/8 0; pi/2 0;
          pi/2 pi/8; pi/2 pi/4; pi/2 3*pi/8; pi/2 pi/2;
          pi/2 5*pi/8;pi/2 3*pi/4;pi/2 7*pi/8;pi/2 pi];

#Vetor de matrizes T          
T = zeros(4,4,size(thetas)(1));

for i =1:size(thetas)(1)
  T(:,:,i)=r.fkine(thetas(i,:)) ;
  fprintf('%d) -----------\n',i)
  fprintf('theta: %d %d \n', thetas(i,1), thetas(i,2))
  fprintf('posicao: %d , %d\n\n', T(1,4,i),T(2,4,i))
  T(:,:,i)

endfor  

figure;
plot([T(1,4,:)],[T(2,4,:)], 'o--');
grid

input('Mostrar robo....')

figure
for i =1:size(thetas)(1)
  r.plot([thetas(i,:)])
  fprintf('theta: %d %d \n', thetas(i,1), thetas(i,2))
  
  input('proximo')

endfor

