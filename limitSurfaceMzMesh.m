% close all; clear; clc;
%load('3DscatterLimit_paperAsymmetric');

trans = @(d)[1 0 0; 0 1 0; d 0 1];

dataName = '3DscatterLimit_weff';

% Define geometry and adhesion capabilities
for beta = 5:10:20 % angle between grippers
defineParameters; % A, alpha, maxAdhesion 
A = Gcm;

[ mz_max, tensions ] = cvxGripMaxMz( A, constraints);
[ fx_max, tensions ] = cvxGripMaxFx( A, constraints);
res = 5; 
f = -fx_max:fx_max/res:fx_max'; 
m = -mz_max:mz_max/res:mz_max'; 

Fy = zeros(numel(f),numel(m));
nTrials = numel(Fy);
disp(['Total trials: ' num2str(nTrials)])

for ii = 1:numel(f)
    
    fx = f(ii);

    for jj = 1:numel(m)
        
        mz = m(jj);
        
        trial = (ii-1)*numel(f) + jj; 
        disp(['Trial : ' num2str(trial) ' of ' num2str(nTrials)])
        
        [ fy, vect ] = cvxGripFy( A, fx, mz, constraints );
        
        Fy(jj,ii) = fy; 
        
    end
    
end
clipFy = Fy; 
clipFy(Fy <= 0) = NaN; 

FyWrist = clipFy; 

save('3DmeshLimit','FyWrist','f','m')

%%

clipFy = Fy; 
clipFy(Fy <= 0) = NaN; 

figure; set(gca,'fontsize',16); hold on 
surf(f,m,clipFy)
xlabel('F_x [N]')
zlabel('F_y [N]')
ylabel('T_z [Nm]')
title(['Force/Torque at CM, Beta = ', num2str(beta)])
      
end
% vector = zeros(numel(Fy),3); 
%%
% figure
% surf(f,m,Fy)
%tri = delaunay(mesh_result(1, :), mesh_result(2, :));
%trisurf(tri, mesh_result(1, :), mesh_result(2, :), -mesh_result(3, :))

%[X,Y] = meshgrid(xgv,ygv)
