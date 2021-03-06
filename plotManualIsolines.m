function plotManualIsolines(data,grouping,mode)
%% Plot data in a more inuitive form-- connecting isolines. 
% Matt Estrada
% Aug 30 2016
% Tried plotting isolines already but it didn't connect the ends, which
% sucked 
% mode == 'flipped' if you want to flip y and z axes
% data is limit surface data, generated by 

    if ~exist('mode','var')
     % third parameter does not exist, so default it to something
      mode = 'normal';
    end
    
    % Plot on isoline "levels" 
    levels = unique(grouping);
    nLevels = numel(levels)
    
    % Gradually fade colors to indicate Fy value
    %endColor = [165, 3, 12]/255; 
    %startColor = [140, 213, 255]/255;
    %endColor = [160, 3, 12]/255;
    endColor = [3, 12, 160]/255;
    %startColor = [200, 200, 255]/255;
    startColor = [210, 230, 255]/255;
    dColor = (endColor-startColor)/(nLevels); 
    
    for ii = 1:nLevels
        thisFy = levels(ii);
        thisInd = grouping == thisFy;
        thisLevel = data(thisInd,:); 
        %thisLevel((end/2+1):end,:) = flipud(thisLevel((end/2+1):end,:)); % HACK FOR NOW
        thisLevel = [thisLevel; thisLevel(1,:)]; 
        thisColor = startColor+(ii)*dColor;
        if strcmp(mode,'flipped')
            plot3(thisLevel(:,1),thisLevel(:,3),thisLevel(:,2),'LineWidth',6,'Color',thisColor)
            xlabel('F_x [N]')
            ylabel('M_z [Nm]')    
            zlabel('F_y [N]')
        else
            plot3(thisLevel(:,1),thisLevel(:,2),thisLevel(:,3),'LineWidth',10,'Color',thisColor)
            xlabel('F_x [N]')
            zlabel('M_z [Nm]')    
            ylabel('F_y [N]')    
        end

    end
    
%     for jj = 1:20
%         thisFy = levels(1);
%         thisInd = grouping == thisFy;
%         thisLevel = data(thisInd,:); 
%         %thisLevel((end/2+1):end,:) = flipud(thisLevel((end/2+1):end,:)); % HACK FOR NOW
%         thisLevel = [thisLevel; thisLevel(1,:)]; 
%         thisColor = startColor+(20-jj+1)*dColor;
%         plot3(thisLevel(:,1),thisLevel(:,2)-jj,thisLevel(:,3),'LineWidth',10,'Color',thisColor)
%             xlabel('F_x [N]')
%             zlabel('M_z [Nm]')    
%             ylabel('F_y [N]')    
%    end
        

end
