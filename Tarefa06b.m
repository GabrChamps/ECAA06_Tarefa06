#Criar robo
clc
clear all
close all
startup_rvc;

L1 = Link([0 0 0 pi/2]);
L2 = Link([0 0 1 0]);
L3 = Link([0 0 1 0]);
r = SerialLink([L1 L2 L3])

r.plot([0 pi/4 -pi/2]);