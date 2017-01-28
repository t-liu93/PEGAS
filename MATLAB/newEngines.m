%http://www.spacelaunchreport.com/atlas5.html#components

%clearvars vehicle
clearvars testveh

stage_m0 = 488546;  %atlas v
stage_time = 94;
stage_area = 22.9022;
stage_drag = [0.0 0.08; 250 0.08; 343 0.80; 999 0.5; 9999 0.4];
%RD-180
stage_engines(1) = struct('mode', 1,...
                          'isp0', 338.4,...
                          'isp1', 311.9,...
                          'mflo', 3827000/(311.9*g0),...
                          'data', [0 0]);
%Aerojet SRB x3
stage_engines(2) = struct('mode', 2,...
                          'isp0', 275,...
                          'isp1', 245,...
                          'mflo', 1688400/(245*g0),...
                          'data', [0 1; 80 1; 100 0]);
scaleTo = 97;
SpaceShuttleThrustProfile
stage_engines(2).data = thrustProfile;
clearvars scaleTo thrustProfile
stage_engines(3) = stage_engines(2);
stage_engines(4) = stage_engines(2);
stage = struct('SM', 1,...
               'm0', stage_m0,...
               'EN', stage_engines,...
               'mt', stage_time,...
               'ra', stage_area,...
               'dc', stage_drag);
testveh(1) = stage;

clearvars stage_m0 stage_time stage_area stage_drag stage_engines stage

%test_ref = flightSim3D(vehicle, 1, createLaunchSite('KSC'), struct('type',0,'p',10,'v',5,'a',0), 0.25);
test_new = flightSim3D(testveh, 1, createLaunchSite('KSC'), struct('type',0,'p',10,'v',5,'a',0), 0.25);
figure(1); clf; hold on; plot(test_ref.Plots.F(2:376),'b'); plot(test_new.Plots.F(2:376),'g'); hold off;