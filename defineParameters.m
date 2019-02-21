% defineParameters.m
% Matt Estrada
% Sept 8 2016
% Set up gripper geometry and adhesion capabilities 
% Streamline the code I write at the top of every script in cvxGripper

%addpath('functionsCvx','functionsHelper','dataGenerated')
trans = @(rd) [1 0 0; 0 1 0; rd 0 1];

% %% Free Flyer setup 
% % Define Geometry 
% alphad = 11.35;      % [deg]
% r = 9/2*0.0254;     % [m]
% Acm = defineGeometry(alphad,r);
% Awrist = trans(r)*Acm; 
% 
% % Define Adhesion 
% maxAdhesion1 =  24;
% maxAdhesion2 = 19.28;
% maxAdhesion = max([maxAdhesion1 maxAdhesion2]); 
% constraints = [maxAdhesion1; maxAdhesion2; 1000000; 1000000];

% %% Generic Numbers
% % Define Geometry 
% alphad = 20;      % [deg]
% r = 0.1;     % [m]
% Acm = defineGeometry(alphad,r);
% Awrist = trans(r)*Acm; 
% 
% % Define Adhesion 
% maxAdhesion1 =  20;
% maxAdhesion2 = 20;
% maxAdhesion = max([maxAdhesion1 maxAdhesion2]); 
% constraints = [maxAdhesion1; maxAdhesion2; 1000000; 1000000];

%% Roshena Numbers
% Define Geometry 
%alphad = 10;      % [deg]
%alphad = 20;
r = 0.23; %1.2;     % [m]
wgap = .26;
alphad = asind(wgap/(2*r));
Acm = defineGeometry(alphad,r);
Bcm = [cosd(beta), sind(beta), 0;
      -sind(beta), cosd(beta), 0;
                0,          0, 1];
Gcm = [Acm, Bcm*Acm];
% Awrist = trans(r)*Acm; % is this used anywhere?

wc = .03; lc = .09;
NperArea = 100 / (4*wc*lc);
% Define Adhesion 
% maxAdhesion1 =  60;
% maxAdhesion2 = 60;
% maxAdhesion1 = 2*NperArea*w*l;
% maxAdhesion2 = 2*NperArea*w*l;
maxAdhesion1 = 20; % TODO: adhesion should be function of area
maxAdhesion2 = 20;
maxAdhesion = max([maxAdhesion1 maxAdhesion2]); 
constraints = [maxAdhesion1; maxAdhesion2; 1000000; 1000000;
               maxAdhesion1; maxAdhesion2; 1000000; 1000000];

parameters = struct('alphad',alphad,'beta',beta,'r',r,'Acm',Gcm, 'constraints',constraints);


