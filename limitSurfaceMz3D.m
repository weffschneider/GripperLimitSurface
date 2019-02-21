%% 2D Curved Surface Gripper
% Matt Estrada
% Generate limit surface for all 3 DOF, fx fy mz
% Using method where we constrain fx / fy anc calculate Mz
% Sept 8, 2016

%% Set up parameters 

% close all; clear; clc; 
%dataName = '3DscatterLimit_Roshena_Oct19_20deg'; 
%dataName = '3DscatterLimit_Roshena_Oct19_2';
dataName = '3DscatterLimit_weff';

% Define geometry and adhesion capabilities
for beta = 5:10:20 % angle between grippers
defineParameters; % A, alpha, maxAdhesion 

A = Gcm; 
maxFy = cvxGripMaxFy( A, constraints);

%% Sweep space 
limit = []; 

for fy = 0:2:maxFy
    [thisLimit, tensions] = limitSurfaceMz2D(A,constraints, fy);
    
    limit = [limit; thisLimit];
end

% %% Special case
% for fy = 0:1:maxFy
%     
%     [thisLimit, tensions] = limitSurfaceMz2D(A,constraints, fy);
%     
%     limit = [limit; thisLimit];
% end
    
%% Save file 
save(dataName,'limit','parameters');

manualIsolines
end
