##Calcular a posição das juntas de um 
##manipulador 3R para os pontos
##

clc
clear all
close all
startup_rvc;

L1 = Link([0 0 1 0]);
L2 = Link([0 0 1 0]);
L3 = Link([0 0 1 0]);
r = SerialLink([L1 L2 L3])

pos = [0 0;
       0 0.5;
       0 1;
       0.5 1;
       1 1];
       
Q = [0 0 0];
M=[1 1 0 0 0 1];
thetas = zeros(size(pos)(1),3)
T=eye(4)

for i = 1:size(pos)(1)
  T(1,4)= pos(i,1);
  T(2,4)= pos(i,2);
  
  thetas(i,:)=r.ikine(T, Q, M);
  r.plot([thetas(i,:)])
  title(sprintf('Posicao: %d, %d', pos(i,1), pos(i,2)))

  fprintf('\ntheta: %d %d %d\n', thetas(i,1), thetas(i,2), thetas(i,3))
  verifica=r.fkine(thetas(i,:));
  fprintf('Posicao desejada: %d, %d\n', pos(i,1), pos(i,2))
  fprintf('Posicao final: %d, %d\n', verifica(1,4), verifica(2,4))
  input('proximo')
  
endfor  

thetas






