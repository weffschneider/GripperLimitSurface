% load 'SpaceGripper_dc.6'
% figure(3)
% plot(SpaceGripper_dc(:,1),SpaceGripper_dc(:,3),'m--')
% plot(SpaceGripper_dc(:,1),SpaceGripper_dc(:,4),'r','linewidth',2)

figure(12)
load 'SpaceGripper_dc_zerospeed.7'
h = plot3(-SpaceGripper_dc_zerospeed(:,1),-SpaceGripper_dc_zerospeed(:,2),SpaceGripper_dc_zerospeed(:,3),'k','linewidth',2)

set(h, 'alphadata',.5)
%%
figure
plot(SpaceGripper_dc(:,1))
hold all
plot(-SpaceGripper_dc(:,2))
plot(SpaceGripper_dc(:,3))

%%
figure(11)
load 'SpaceGripper_dc_zerospeed.7'
Fx = SpaceGripper_dc_zerospeed(1:2500,1);
Fy = SpaceGripper_dc_zerospeed(1:2500,2);
Mz = SpaceGripper_dc_zerospeed(1:2500,3);
load 'SpaceGripper_dc_zerospeed.6'
time = SpaceGripper_dc_zerospeed(1:2500,1);

%%
figure(11)
plot(time, -Fx,'linewidth',2,'color',[100, 100, 200]/255)
hold all
plot(time, -Fy,'linewidth',2, 'color',[200, 10, 20]/255)
plot(time, Mz,'linewidth',2, 'color',[120, 200, 235]/255)
legend('Fx [N]','Fy [N]','Mz [N*m]')
xlabel('Time [sec]','fontsize',20)
