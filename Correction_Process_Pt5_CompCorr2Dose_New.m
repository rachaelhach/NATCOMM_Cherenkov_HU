% %TAKING ROIS

%% TAKING MEDIANS _ RPO 6X

%PT 30
cmap = inferno(2.^16);
clear Pt30_median_tp_RPO_6 Pt30_median_ckov_corr_2cf_RPO_6 Pt30_median_ckov_uncorr_RPO_6
for i = 2:size(Pt30_im_th_RPO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt30_uncorrected_image_stack_RPO6(:,:,i-1) = Pt30_im_th_RPO(:,:,i);
    Pt30_corrected_image_stack_RPO6(:,:,i-1) = Pt30_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt30_ROI,3)
        roi_u = Pt30_ROI(:,:,j).*Pt30_im_th_RPO(:,:,i);
        roi_c = Pt30_ROI(:,:,j).*Pt30_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt30_ROI(:,:,j).*Pt30_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        Pt30_median_ckov_uncorr_RPO_6(i-1,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt30_median_ckov_corr_2cf_RPO_6(i-1,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt30_median_tp_RPO_6(i-1,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

%PT 31
cmap = inferno(2.^16);
clear Pt31_median_tp_RPO_6 Pt31_median_ckov_corr_2cf_RPO_6 Pt31_median_ckov_uncorr_RPO_6
for i = 1:size(Pt31_im_th_RPO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt31_uncorrected_image_stack_RPO6(:,:,i) = Pt31_im_th_RPO(:,:,i);
    Pt31_corrected_image_stack_RPO6(:,:,i) = Pt31_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt31_ROI,3)
        roi_u = Pt31_ROI(:,:,j).*Pt31_im_th_RPO(:,:,i);
        roi_c = Pt31_ROI(:,:,j).*Pt31_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt31_ROI(:,:,j).*Pt31_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        Pt31_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt31_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt31_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
    end
    clear roi_u roi_c roi_tp
end

% PT32
cmap = inferno(2.^16);
clear Pt32_median_tp_RPO_6 Pt32_median_ckov_corr_2cf_RPO_6 Pt32_median_ckov_uncorr_RPO_6
for i = 1:size(Pt32_im_th_RPO_6,3)
    %now read back in the ROI's to take the medians
    Pt32_uncorrected_image_stack_RPO6(:,:,i) = Pt32_im_th_RPO_6(:,:,i);
    Pt32_corrected_image_stack_RPO6(:,:,i) = Pt32_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt32_ROI,3)
        roi_u = Pt32_ROI(:,:,j).*Pt32_im_th_RPO_6(:,:,i);
        roi_c = Pt32_ROI(:,:,j).*Pt32_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt32_ROI(:,:,j).*Pt32_registered_tp_RPO_6;
        
        roi_u(isnan(roi_u)) = 0;
        Pt32_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt32_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt32_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end  
end

%PT 35
clear Pt35_median_tp_RPO_6 Pt35_median_ckov_corr_2cf_RPO_6 Pt35_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt35_im_th_RPO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt35_uncorrected_image_stack_RPO6(:,:,i) = Pt35_im_th_RPO(:,:,i);
    Pt35_corrected_image_stack_RPO6(:,:,i) = Pt35_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt35_ROI,3)
        roi_u = Pt35_ROI(:,:,j).*Pt35_im_th_RPO(:,:,i);
        roi_c = Pt35_ROI(:,:,j).*Pt35_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt35_ROI(:,:,j).*Pt35_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        roi_c(isnan(roi_c)) = 0;
        Pt35_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        Pt35_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt35_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


%PT 36
cmap = inferno(2.^16);
clear Pt36_median_tp_RPO_6 Pt36_median_ckov_corr_2cf_RPO_6 Pt36_median_ckov_uncorr_RPO_6
for i = 1:size(Pt36_im_th_RPO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt36_uncorrected_image_stack_RPO6(:,:,i) = Pt36_im_th_RPO(:,:,i);
    Pt36_corrected_image_stack_RPO6(:,:,i) = Pt36_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt36_ROI,3)
        roi_u = Pt36_ROI(:,:,j).*Pt36_im_th_RPO(:,:,i);
        roi_c = Pt36_ROI(:,:,j).*Pt36_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt36_ROI(:,:,j).*Pt36_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt36_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt36_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt36_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


%PT 37
cmap = inferno(2.^16);
clear Pt37_median_tp_RPO_6 Pt37_median_ckov_corr_2cf_RPO_6 Pt37_median_ckov_uncorr_RPO_6
for i = 1:size(Pt37_im_th_RPO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt37_uncorrected_image_stack_RPO6(:,:,i) = Pt37_im_th_RPO(:,:,i);
    Pt37_corrected_image_stack_RPO6(:,:,i) = Pt37_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt37_ROI,3)
        roi_u = Pt37_ROI(:,:,j).*Pt37_im_th_RPO(:,:,i);
        roi_c = Pt37_ROI(:,:,j).*Pt37_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt37_ROI(:,:,j).*Pt37_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt37_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt37_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt37_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


%PT 39
cmap = inferno(2.^16);
clear Pt39_median_tp_RPO_6 Pt39_median_ckov_corr_2cf_RPO_6 Pt39_median_ckov_uncorr_RPO_6
for i = 1:size(Pt39_im_th_RPO_6,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt39_uncorrected_image_stack_RPO6(:,:,i) = Pt39_im_th_RPO_6(:,:,i);
    Pt39_corrected_image_stack_RPO6(:,:,i) = Pt39_artnorm_HU_corr_RPO6(:,:,i);
    for j = 1:size(Pt39_ROI,3)
        roi_u = Pt39_ROI(:,:,j).*Pt39_im_th_RPO_6(:,:,i);
        roi_c = Pt39_ROI(:,:,j).*Pt39_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt39_ROI(:,:,j).*Pt39_registered_tp_RPO_6;
        
        roi_u(isnan(roi_u)) = 0;
        Pt39_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt39_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt39_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        clear roi_u roi_c roi_tp
    end
end

% PT 41
clear Pt41_median_tp_RPO_6 Pt41_median_ckov_corr_2cf_RPO_6 Pt41_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt41_im_th_RPO_6,3)
    %now read back in the ROI's to take the medians
    Pt41_corrected_image_stack_RPO6(:,:,i) = Pt41_artnorm_HU_corr_RPO6(:,:,i);
    Pt41_uncorrected_image_stack_RPO6(:,:,i) = Pt41_im_th_RPO_6(:,:,i);
    for j = 1:size(Pt41_ROI,3)
        roi_u = Pt41_ROI(:,:,j).*Pt41_im_th_RPO_6(:,:,i);
        roi_c = Pt41_ROI(:,:,j).*Pt41_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt41_ROI(:,:,j).*Pt41_registered_tp_RPO_6;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt41_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt41_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt41_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
    end
end

% PT 44
clear Pt44_median_tp_RPO_6 Pt44_median_ckov_corr_2cf_RPO_6 Pt44_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt44_Ckov_RPO_stack,3)
    %now read back in the ROI's to take the medians
    Pt44_corrected_image_stack_RPO6(:,:,i) = Pt44_artnorm_HU_corr_RPO6(:,:,i);
    Pt44_uncorrected_image_stack_RPO6(:,:,i) = Pt44_im_th_RPO(:,:,i);
    for j = 1:size(Pt44_ROI,3)
        roi_u = Pt44_ROI(:,:,j).*Pt44_im_th_RPO(:,:,i);
        roi_c = Pt44_ROI(:,:,j).*Pt44_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt44_ROI(:,:,j).*Pt44_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt44_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt44_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt44_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
    end
    
end

%PT 45
clear Pt45_median_tp_RPO_6 Pt45_median_ckov_corr_2cf_RPO_6 Pt45_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt45_RPO_6X_stack,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt45_corrected_image_stack_RPO6(:,:,i) = Pt45_artnorm_HU_corr_RPO6(:,:,i);
    Pt45_uncorrected_image_stack_RPO6(:,:,i) = Pt45_im_th_RPO_6(:,:,i);
    for j = 1:size(Pt45_ROI,3)
        roi_u = Pt45_ROI(:,:,j).*Pt45_im_th_RPO_6(:,:,i);
        roi_c = Pt45_ROI(:,:,j).*Pt45_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt45_ROI(:,:,j).*Pt45_registered_tp_RPO_6;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt45_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt45_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt45_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


% PT 56
clear Pt56_median_tp_RPO_6 Pt56_median_ckov_corr_2cf_RPO_6 Pt56_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt56_RPO_stack,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt56_corrected_image_stack_RPO6(:,:,i) = Pt56_artnorm_HU_corr_RPO6(:,:,i);
    Pt56_uncorrected_image_stack_RPO6(:,:,i) = Pt56_im_th_RPO(:,:,i);

    for j = 1:size(Pt56_ROI,3)
        roi_u = Pt56_ROI(:,:,j).*Pt56_im_th_RPO(:,:,i);
        roi_c = Pt56_ROI(:,:,j).*Pt56_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt56_ROI(:,:,j).*Pt56_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt56_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt56_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt56_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

% Pt 58
clear Pt58_median_tp_RPO_6 Pt58_median_ckov_corr_2cf_RPO_6 Pt58_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt58_RPO_stack,3) 
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt58_corrected_image_stack_RPO6(:,:,i) = Pt58_artnorm_HU_corr_RPO6(:,:,i);
    Pt58_uncorrected_image_stack_RPO6(:,:,i) = Pt58_im_th_RPO(:,:,i);
    for j = 1:size(Pt58_ROI,3)
        roi_u = Pt58_ROI(:,:,j).*Pt58_im_th_RPO(:,:,i);
        roi_c = Pt58_ROI(:,:,j).*Pt58_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt58_ROI(:,:,j).*Pt58_registered_tp_RPO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt58_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt58_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt58_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
    
end


% Pt 59
clear Pt59_median_tp_RPO_6 Pt59_median_ckov_corr_2cf_RPO_6 Pt59_median_ckov_uncorr_RPO_6
cmap = inferno(2.^16);
for i = 1:size(Pt59_im_th_RPO_6,3) 
    %now take several ROI's to get a surface dose, Ckov a nd corrected Ckov
    Pt59_corrected_image_stack_RPO6(:,:,i) = Pt59_artnorm_HU_corr_RPO6(:,:,i);
    Pt59_uncorrected_image_stack_RPO6(:,:,i) = Pt59_im_th_RPO_6(:,:,i);
    for j = 1:size(Pt59_ROI,3)
        roi_u = Pt59_ROI(:,:,j).*Pt59_im_th_RPO_6(:,:,i);
        roi_c = Pt59_ROI(:,:,j).*Pt59_artnorm_HU_corr_RPO6(:,:,i);
        roi_tp = Pt59_ROI(:,:,j).*Pt59_registered_tp_RPO_6;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt59_median_ckov_uncorr_RPO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt59_median_ckov_corr_2cf_RPO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt59_median_tp_RPO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

%PLOT ALL RPO 6X BEAMS
figure(350)
[ha, pos] = tight_subplot(1, 2,[.12 .07],[.1 .06],[.05 .03]);
subplot('Position', pos{1})
scatter(Pt30_median_tp_RPO_6(:), Pt30_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt31_median_tp_RPO_6(:), Pt31_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_RPO_6(:), Pt32_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_RPO_6(:), Pt35_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_RPO_6(:), Pt36_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_RPO_6(:), Pt37_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_RPO_6(:), Pt39_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_6(:), Pt41_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_RPO_6(:), Pt44_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_6(:), Pt45_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_RPO_6(:), Pt56_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_RPO_6(:), Pt58_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_6(:), Pt59_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('Cherenkov')
legend('Pt30-RPO6X', 'Pt31-RPO6X', 'Pt32-RPO6X', 'Pt35-RPO6X', 'Pt36-RPO6X', 'Pt37-RPO6X',  'Pt39-RPO6X', 'Pt41-RPO6X', 'Pt44-RPO6X', 'Pt45-RPO6X',...
    'Pt56-RPO6X', 'Pt58-RPO6X','Pt59-RPO6X', 'Location', 'Northwest');

subplot('Position', pos{2})
scatter(Pt30_median_tp_RPO_6(:), Pt30_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt31_median_tp_RPO_6(:), Pt31_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_RPO_6(:), Pt32_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_RPO_6(:), Pt35_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_RPO_6(:), Pt36_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_RPO_6(:), Pt37_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_RPO_6(:), Pt39_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_6(:), Pt41_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_RPO_6(:), Pt44_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_6(:), Pt45_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_RPO_6(:), Pt56_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_RPO_6(:), Pt58_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_6(:), Pt59_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('HU Corrected Cherenkov')
legend('Pt30-RPO6X', 'Pt31-RPO6X', 'Pt32-RPO6X', 'Pt35-RPO6X', 'Pt36-RPO6X', 'Pt37-RPO6X',  'Pt39-RPO6X', 'Pt41-RPO6X', 'Pt44-RPO6X', 'Pt45-RPO6X',...
    'Pt56-RPO6X', 'Pt58-RPO6X','Pt59-RPO6X', 'Location', 'Northwest');


%% TAKING MEDIANS _ LAO 6X

%PT 30
cmap = inferno(2.^16);
clear Pt30_median_tp_LAO_6 Pt30_median_ckov_corr_2cf_LAO_6 Pt30_median_ckov_uncorr_LAO_6
for i = 2:size(Pt30_im_th_LAO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt30_uncorrected_image_stack_LAO6(:,:,i-1) = Pt30_im_th_LAO(:,:,i);
    Pt30_corrected_image_stack_LAO6(:,:,i-1) = Pt30_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt30_ROI,3)
        roi_u = Pt30_ROI(:,:,j).*Pt30_im_th_LAO(:,:,i);
        roi_c = Pt30_ROI(:,:,j).*Pt30_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt30_ROI(:,:,j).*Pt30_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        Pt30_median_ckov_uncorr_LAO_6(i-1,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt30_median_ckov_corr_2cf_LAO_6(i-1,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt30_median_tp_LAO_6(i-1,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

%PT 31
cmap = inferno(2.^16);
clear Pt31_median_tp_LAO_6 Pt31_median_ckov_corr_2cf_LAO_6 Pt31_median_ckov_uncorr_LAO_6
for i = 1:size(Pt31_im_th_LAO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt31_uncorrected_image_stack_LAO6(:,:,i) = Pt31_im_th_LAO(:,:,i);
    Pt31_corrected_image_stack_LAO6(:,:,i) = Pt31_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt31_ROI,3)
        roi_u = Pt31_ROI(:,:,j).*Pt31_im_th_LAO(:,:,i);
        roi_c = Pt31_ROI(:,:,j).*Pt31_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt31_ROI(:,:,j).*Pt31_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        Pt31_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt31_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt31_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
    end
    clear roi_u roi_c roi_tp
end

% PT32
cmap = inferno(2.^16);
clear Pt32_median_tp_LAO_6 Pt32_median_ckov_corr_2cf_LAO_6 Pt32_median_ckov_uncorr_LAO_6
for i = 1:size(Pt32_im_th_LAO_6,3)
    %now read back in the ROI's to take the medians
    Pt32_uncorrected_image_stack_LAO6(:,:,i) = Pt32_im_th_LAO_6(:,:,i);
    Pt32_corrected_image_stack_LAO6(:,:,i) = Pt32_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt32_ROI,3)
        roi_u = Pt32_ROI(:,:,j).*Pt32_im_th_LAO_6(:,:,i);
        roi_c = Pt32_ROI(:,:,j).*Pt32_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt32_ROI(:,:,j).*Pt32_registered_tp_LAO_6;
        
        roi_u(isnan(roi_u)) = 0;
        Pt32_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt32_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt32_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end  
end

%PT 35
clear Pt35_median_tp_LAO_6 Pt35_median_ckov_corr_2cf_LAO_6 Pt35_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt35_im_th_LAO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt35_uncorrected_image_stack_LAO6(:,:,i) = Pt35_im_th_LAO(:,:,i);
    Pt35_corrected_image_stack_LAO6(:,:,i) = Pt35_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt35_ROI,3)
        roi_u = Pt35_ROI(:,:,j).*Pt35_im_th_LAO(:,:,i);
        roi_c = Pt35_ROI(:,:,j).*Pt35_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt35_ROI(:,:,j).*Pt35_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        roi_c(isnan(roi_c)) = 0;
        Pt35_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        Pt35_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt35_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


%PT 36
cmap = inferno(2.^16);
clear Pt36_median_tp_LAO_6 Pt36_median_ckov_corr_2cf_LAO_6 Pt36_median_ckov_uncorr_LAO_6
for i = 1:size(Pt36_im_th_LAO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt36_uncorrected_image_stack_LAO6(:,:,i) = Pt36_im_th_LAO(:,:,i);
    Pt36_corrected_image_stack_LAO6(:,:,i) = Pt36_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt36_ROI,3)
        roi_u = Pt36_ROI(:,:,j).*Pt36_im_th_LAO(:,:,i);
        roi_c = Pt36_ROI(:,:,j).*Pt36_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt36_ROI(:,:,j).*Pt36_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt36_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt36_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt36_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


%PT 37
cmap = inferno(2.^16);
clear Pt37_median_tp_LAO_6 Pt37_median_ckov_corr_2cf_LAO_6 Pt37_median_ckov_uncorr_LAO_6
for i = 1:size(Pt37_im_th_LAO,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt37_uncorrected_image_stack_LAO6(:,:,i) = Pt37_im_th_LAO(:,:,i);
    Pt37_corrected_image_stack_LAO6(:,:,i) = Pt37_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt37_ROI,3)
        roi_u = Pt37_ROI(:,:,j).*Pt37_im_th_LAO(:,:,i);
        roi_c = Pt37_ROI(:,:,j).*Pt37_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt37_ROI(:,:,j).*Pt37_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt37_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt37_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt37_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


%PT 39
cmap = inferno(2.^16);
clear Pt39_median_tp_LAO_6 Pt39_median_ckov_corr_2cf_LAO_6 Pt39_median_ckov_uncorr_LAO_6
for i = 1:size(Pt39_im_th_LAO_6,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt39_uncorrected_image_stack_LAO6(:,:,i) = Pt39_im_th_LAO_6(:,:,i);
    Pt39_corrected_image_stack_LAO6(:,:,i) = Pt39_artnorm_HU_corr_LAO6(:,:,i);
    for j = 1:size(Pt39_ROI,3)
        roi_u = Pt39_ROI(:,:,j).*Pt39_im_th_LAO_6(:,:,i);
        roi_c = Pt39_ROI(:,:,j).*Pt39_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt39_ROI(:,:,j).*Pt39_registered_tp_LAO_6;
        
        roi_u(isnan(roi_u)) = 0;
        Pt39_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt39_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt39_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        clear roi_u roi_c roi_tp
    end
end

% PT 41
clear Pt41_median_tp_LAO_6 Pt41_median_ckov_corr_2cf_LAO_6 Pt41_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt41_im_th_LAO_6,3)
    %now read back in the ROI's to take the medians
    Pt41_corrected_image_stack_LAO6(:,:,i) = Pt41_artnorm_HU_corr_LAO6(:,:,i);
    Pt41_uncorrected_image_stack_LAO6(:,:,i) = Pt41_im_th_LAO_6(:,:,i);
    for j = 1:size(Pt41_ROI,3)
        roi_u = Pt41_ROI(:,:,j).*Pt41_im_th_LAO_6(:,:,i);
        roi_c = Pt41_ROI(:,:,j).*Pt41_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt41_ROI(:,:,j).*Pt41_registered_tp_LAO_6;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt41_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt41_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt41_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
    end
end

% PT 44
clear Pt44_median_tp_LAO_6 Pt44_median_ckov_corr_2cf_LAO_6 Pt44_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt44_Ckov_LAO_stack,3)
    %now read back in the ROI's to take the medians
    Pt44_corrected_image_stack_LAO6(:,:,i) = Pt44_artnorm_HU_corr_LAO6(:,:,i);
    Pt44_uncorrected_image_stack_LAO6(:,:,i) = Pt44_im_th_LAO(:,:,i);
    for j = 1:size(Pt44_ROI,3)
        roi_u = Pt44_ROI(:,:,j).*Pt44_im_th_LAO(:,:,i);
        roi_c = Pt44_ROI(:,:,j).*Pt44_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt44_ROI(:,:,j).*Pt44_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt44_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt44_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt44_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
    end
    
end

%PT 45
clear Pt45_median_tp_LAO_6 Pt45_median_ckov_corr_2cf_LAO_6 Pt45_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt45_LAO_6X_stack,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt45_corrected_image_stack_LAO6(:,:,i) = Pt45_artnorm_HU_corr_LAO6(:,:,i);
    Pt45_uncorrected_image_stack_LAO6(:,:,i) = Pt45_im_th_LAO_6(:,:,i);
    for j = 1:size(Pt45_ROI,3)
        roi_u = Pt45_ROI(:,:,j).*Pt45_im_th_LAO_6(:,:,i);
        roi_c = Pt45_ROI(:,:,j).*Pt45_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt45_ROI(:,:,j).*Pt45_registered_tp_LAO_6;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt45_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt45_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt45_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


% PT 56
clear Pt56_median_tp_LAO_6 Pt56_median_ckov_corr_2cf_LAO_6 Pt56_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt56_LAO_stack,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt56_corrected_image_stack_LAO6(:,:,i) = Pt56_artnorm_HU_corr_LAO6(:,:,i);
    Pt56_uncorrected_image_stack_LAO6(:,:,i) = Pt56_im_th_LAO(:,:,i);

    for j = 1:size(Pt56_ROI,3)
        roi_u = Pt56_ROI(:,:,j).*Pt56_im_th_LAO(:,:,i);
        roi_c = Pt56_ROI(:,:,j).*Pt56_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt56_ROI(:,:,j).*Pt56_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt56_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt56_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt56_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

% Pt 58
clear Pt58_median_tp_LAO_6 Pt58_median_ckov_corr_2cf_LAO_6 Pt58_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt58_LAO_stack,3) 
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt58_corrected_image_stack_LAO6(:,:,i) = Pt58_artnorm_HU_corr_LAO6(:,:,i);
    Pt58_uncorrected_image_stack_LAO6(:,:,i) = Pt58_im_th_LAO(:,:,i);
    for j = 1:size(Pt58_ROI,3)
        roi_u = Pt58_ROI(:,:,j).*Pt58_im_th_LAO(:,:,i);
        roi_c = Pt58_ROI(:,:,j).*Pt58_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt58_ROI(:,:,j).*Pt58_registered_tp_LAO;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt58_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt58_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt58_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
    
end


% Pt 59
clear Pt59_median_tp_LAO_6 Pt59_median_ckov_corr_2cf_LAO_6 Pt59_median_ckov_uncorr_LAO_6
cmap = inferno(2.^16);
for i = 1:size(Pt59_im_th_LAO_6,3) 
    %now take several ROI's to get a surface dose, Ckov a nd corrected Ckov
    Pt59_corrected_image_stack_LAO6(:,:,i) = Pt59_artnorm_HU_corr_LAO6(:,:,i);
    Pt59_uncorrected_image_stack_LAO6(:,:,i) = Pt59_im_th_LAO_6(:,:,i);
    for j = 1:size(Pt59_ROI,3)
        roi_u = Pt59_ROI(:,:,j).*Pt59_im_th_LAO_6(:,:,i);
        roi_c = Pt59_ROI(:,:,j).*Pt59_artnorm_HU_corr_LAO6(:,:,i);
        roi_tp = Pt59_ROI(:,:,j).*Pt59_registered_tp_LAO_6;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt59_median_ckov_uncorr_LAO_6(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt59_median_ckov_corr_2cf_LAO_6(i,j) = mean(roi_c(roi_c~=0));
        Pt59_median_tp_LAO_6(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

%PLOT ALL LAO 6X BEAMS
figure(350)
[ha, pos] = tight_subplot(1, 2,[.12 .07],[.1 .06],[.05 .03]);
subplot('Position', pos{1})
scatter(Pt30_median_tp_LAO_6(:), Pt30_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt31_median_tp_LAO_6(:), Pt31_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_LAO_6(:), Pt32_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_LAO_6(:), Pt35_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_LAO_6(:), Pt36_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_LAO_6(:), Pt37_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_LAO_6(:), Pt39_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_6(:), Pt41_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_LAO_6(:), Pt44_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_6(:), Pt45_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_LAO_6(:), Pt56_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_LAO_6(:), Pt58_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_6(:), Pt59_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('Cherenkov')
legend('Pt30-LAO6X', 'Pt31-LAO6X', 'Pt32-LAO6X', 'Pt35-LAO6X', 'Pt36-LAO6X', 'Pt37-LAO6X',  'Pt39-LAO6X', 'Pt41-LAO6X', 'Pt44-LAO6X', 'Pt45-LAO6X',...
    'Pt56-LAO6X', 'Pt58-LAO6X','Pt59-LAO6X', 'Location', 'Northwest');

subplot('Position', pos{2})
scatter(Pt30_median_tp_LAO_6(:), Pt30_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt31_median_tp_LAO_6(:), Pt31_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_LAO_6(:), Pt32_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_LAO_6(:), Pt35_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_LAO_6(:), Pt36_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_LAO_6(:), Pt37_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_LAO_6(:), Pt39_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_6(:), Pt41_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_LAO_6(:), Pt44_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_6(:), Pt45_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_LAO_6(:), Pt56_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_LAO_6(:), Pt58_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_6(:), Pt59_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('HU Corrected Cherenkov')
legend('Pt30-LAO6X', 'Pt31-LAO6X', 'Pt32-LAO6X', 'Pt35-LAO6X', 'Pt36-LAO6X', 'Pt37-LAO6X',  'Pt39-LAO6X', 'Pt41-LAO6X', 'Pt44-LAO6X', 'Pt45-LAO6X',...
    'Pt56-LAO6X', 'Pt58-LAO6X','Pt59-LAO6X', 'Location', 'Northwest');
%% TAKING MEDIANS _ RPO 10X

% PT32
cmap = inferno(2.^16);
clear Pt32_median_tp_RPO_10 Pt32_median_ckov_corr_2cf_RPO_10 Pt32_median_ckov_uncorr_RPO_10
for i = 1:size(Pt32_im_th_RPO_10,3)
    %now read back in the ROI's to take the medians
    Pt32_uncorrected_image_stack_RPO10(:,:,i) = Pt32_im_th_RPO_10(:,:,i);
    Pt32_corrected_image_stack_RPO10(:,:,i) = Pt32_artnorm_HU_corr_RPO10(:,:,i);
    for j = 1:size(Pt32_ROI,3)
        roi_u = Pt32_ROI(:,:,j).*Pt32_im_th_RPO_10(:,:,i);
        roi_c = Pt32_ROI(:,:,j).*Pt32_artnorm_HU_corr_RPO10(:,:,i);
        roi_tp = Pt32_ROI(:,:,j).*Pt32_registered_tp_RPO_10;
        
        roi_u(isnan(roi_u)) = 0;
        Pt32_median_ckov_uncorr_RPO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt32_median_ckov_corr_2cf_RPO_10(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt32_median_tp_RPO_10(i,j) = mean(roi_tp(roi_tp~=0));
        
    end  
end


%PT 39
cmap = inferno(2.^16);
clear Pt39_median_tp_RPO_10 Pt39_median_ckov_corr_2cf_RPO_10 Pt39_median_ckov_uncorr_RPO_10
for i = 1:size(Pt39_im_th_RPO_10,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt39_uncorrected_image_stack_RPO10(:,:,i) = Pt39_im_th_RPO_10(:,:,i);
    Pt39_corrected_image_stack_RPO10(:,:,i) = Pt39_artnorm_HU_corr_RPO10(:,:,i);
    for j = 1:size(Pt39_ROI,3)
        roi_u = Pt39_ROI(:,:,j).*Pt39_im_th_RPO_10(:,:,i);
        roi_c = Pt39_ROI(:,:,j).*Pt39_artnorm_HU_corr_RPO10(:,:,i);
        roi_tp = Pt39_ROI(:,:,j).*Pt39_registered_tp_RPO_10;
        
        roi_u(isnan(roi_u)) = 0;
        Pt39_median_ckov_uncorr_RPO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt39_median_ckov_corr_2cf_RPO_10(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt39_median_tp_RPO_10(i,j) = mean(roi_tp(roi_tp~=0));
        clear roi_u roi_c roi_tp
    end
end

% PT 41
clear Pt41_median_tp_RPO_10 Pt41_median_ckov_corr_2cf_RPO_10 Pt41_median_ckov_uncorr_RPO_10
cmap = inferno(2.^16);
for i = 1:size(Pt41_im_th_RPO_10,3)
    %now read back in the ROI's to take the medians
    Pt41_corrected_image_stack_RPO10(:,:,i) = Pt41_artnorm_HU_corr_RPO10(:,:,i);
    Pt41_uncorrected_image_stack_RPO10(:,:,i) = Pt41_im_th_RPO_10(:,:,i);
    for j = 1:size(Pt41_ROI,3)
        roi_u = Pt41_ROI(:,:,j).*Pt41_im_th_RPO_10(:,:,i);
        roi_c = Pt41_ROI(:,:,j).*Pt41_artnorm_HU_corr_RPO10(:,:,i);
        roi_tp = Pt41_ROI(:,:,j).*Pt41_registered_tp_RPO_10;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt41_median_ckov_uncorr_RPO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt41_median_ckov_corr_2cf_RPO_10(i,j) = mean(roi_c(roi_c~=0));
        Pt41_median_tp_RPO_10(i,j) = mean(roi_tp(roi_tp~=0));
    end
end


%PT 45
clear Pt45_median_tp_RPO_10 Pt45_median_ckov_corr_2cf_RPO_10 Pt45_median_ckov_uncorr_RPO_10
cmap = inferno(2.^16);
for i = 1:size(Pt45_RPO_10X_stack,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt45_corrected_image_stack_RPO10(:,:,i) = Pt45_artnorm_HU_corr_RPO10(:,:,i);
    Pt45_uncorrected_image_stack_RPO10(:,:,i) = Pt45_im_th_RPO_10(:,:,i);
    for j = 1:size(Pt45_ROI,3)
        roi_u = Pt45_ROI(:,:,j).*Pt45_im_th_RPO_10(:,:,i);
        roi_c = Pt45_ROI(:,:,j).*Pt45_artnorm_HU_corr_RPO10(:,:,i);
        roi_tp = Pt45_ROI(:,:,j).*Pt45_registered_tp_RPO_10;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt45_median_ckov_uncorr_RPO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt45_median_ckov_corr_2cf_RPO_10(i,j) = mean(roi_c(roi_c~=0));
        Pt45_median_tp_RPO_10(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


% Pt 59
clear Pt59_median_tp_RPO_10 Pt59_median_ckov_corr_2cf_RPO_10 Pt59_median_ckov_uncorr_RPO_10
cmap = inferno(2.^16);
for i = 1:size(Pt59_im_th_RPO_10,3) 
    %now take several ROI's to get a surface dose, Ckov a nd corrected Ckov
    Pt59_corrected_image_stack_RPO10(:,:,i) = Pt59_artnorm_HU_corr_RPO10(:,:,i);
    Pt59_uncorrected_image_stack_RPO10(:,:,i) = Pt59_im_th_RPO_10(:,:,i);
    for j = 1:size(Pt59_ROI,3)
        roi_u = Pt59_ROI(:,:,j).*Pt59_im_th_RPO_10(:,:,i);
        roi_c = Pt59_ROI(:,:,j).*Pt59_artnorm_HU_corr_RPO10(:,:,i);
        roi_tp = Pt59_ROI(:,:,j).*Pt59_registered_tp_RPO_10;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt59_median_ckov_uncorr_RPO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt59_median_ckov_corr_2cf_RPO_10(i,j) = mean(roi_c(roi_c~=0));
        Pt59_median_tp_RPO_10(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

%PLOT ALL RPO 6X BEAMS
figure(350)
[ha, pos] = tight_subplot(1, 2,[.12 .07],[.1 .06],[.05 .03]);
subplot('Position', pos{1})
scatter(Pt32_median_tp_RPO_10(:), Pt32_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt39_median_tp_RPO_10(:), Pt39_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_10(:), Pt41_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_10(:), Pt45_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_10(:), Pt59_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('Cherenkov')
legend('Pt32-RPO10X', 'Pt39-RPO10X', 'Pt41-RPO10X', 'Pt45-RPO10X',...
    'Pt59-RPO10X', 'Location', 'Northwest');

subplot('Position', pos{2})
scatter(Pt32_median_tp_RPO_10(:), Pt32_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt39_median_tp_RPO_10(:), Pt39_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_10(:), Pt41_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_10(:), Pt45_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_10(:), Pt59_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('HU Corrected Cherenkov')
legend('Pt32-RPO10X', 'Pt39-RPO10X', 'Pt41-RPO10X', 'Pt45-RPO10X',...
    'Pt59-RPO10X', 'Location', 'Northwest');





%% TAKING MEDIANS _ LAO 10X

% PT32
cmap = inferno(2.^16);
clear Pt32_median_tp_LAO_10 Pt32_median_ckov_corr_2cf_LAO_10 Pt32_median_ckov_uncorr_LAO_10
for i = 1:size(Pt32_im_th_LAO_10,3)
    %now read back in the ROI's to take the medians
    Pt32_uncorrected_image_stack_LAO10(:,:,i) = Pt32_im_th_LAO_10(:,:,i);
    Pt32_corrected_image_stack_LAO10(:,:,i) = Pt32_artnorm_HU_corr_LAO10(:,:,i);
    for j = 1:size(Pt32_ROI,3)
        roi_u = Pt32_ROI(:,:,j).*Pt32_im_th_LAO_10(:,:,i);
        roi_c = Pt32_ROI(:,:,j).*Pt32_artnorm_HU_corr_LAO10(:,:,i);
        roi_tp = Pt32_ROI(:,:,j).*Pt32_registered_tp_LAO_10;
        
        roi_u(isnan(roi_u)) = 0;
        Pt32_median_ckov_uncorr_LAO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt32_median_ckov_corr_2cf_LAO_10(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt32_median_tp_LAO_10(i,j) = mean(roi_tp(roi_tp~=0));
        
    end  
end


%PT 39
cmap = inferno(2.^16);
clear Pt39_median_tp_LAO_10 Pt39_median_ckov_corr_2cf_LAO_10 Pt39_median_ckov_uncorr_LAO_10
for i = 1:size(Pt39_im_th_LAO_10,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt39_uncorrected_image_stack_LAO10(:,:,i) = Pt39_im_th_LAO_10(:,:,i);
    Pt39_corrected_image_stack_LAO10(:,:,i) = Pt39_artnorm_HU_corr_LAO10(:,:,i);
    for j = 1:size(Pt39_ROI,3)
        roi_u = Pt39_ROI(:,:,j).*Pt39_im_th_LAO_10(:,:,i);
        roi_c = Pt39_ROI(:,:,j).*Pt39_artnorm_HU_corr_LAO10(:,:,i);
        roi_tp = Pt39_ROI(:,:,j).*Pt39_registered_tp_LAO_10;
        
        roi_u(isnan(roi_u)) = 0;
        Pt39_median_ckov_uncorr_LAO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt39_median_ckov_corr_2cf_LAO_10(i,j) = mean(roi_c(roi_c~=0));
        roi_tp(isnan(roi_tp)) = 0;
        Pt39_median_tp_LAO_10(i,j) = mean(roi_tp(roi_tp~=0));
        clear roi_u roi_c roi_tp
    end
end

% PT 41
clear Pt41_median_tp_LAO_10 Pt41_median_ckov_corr_2cf_LAO_10 Pt41_median_ckov_uncorr_LAO_10
cmap = inferno(2.^16);
for i = 1:size(Pt41_im_th_LAO_10,3)
    %now read back in the ROI's to take the medians
    Pt41_corrected_image_stack_LAO10(:,:,i) = Pt41_artnorm_HU_corr_LAO10(:,:,i);
    Pt41_uncorrected_image_stack_LAO10(:,:,i) = Pt41_im_th_LAO_10(:,:,i);
    for j = 1:size(Pt41_ROI,3)
        roi_u = Pt41_ROI(:,:,j).*Pt41_im_th_LAO_10(:,:,i);
        roi_c = Pt41_ROI(:,:,j).*Pt41_artnorm_HU_corr_LAO10(:,:,i);
        roi_tp = Pt41_ROI(:,:,j).*Pt41_registered_tp_LAO_10;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt41_median_ckov_uncorr_LAO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt41_median_ckov_corr_2cf_LAO_10(i,j) = mean(roi_c(roi_c~=0));
        Pt41_median_tp_LAO_10(i,j) = mean(roi_tp(roi_tp~=0));
    end
end


%PT 45
clear Pt45_median_tp_LAO_10 Pt45_median_ckov_corr_2cf_LAO_10 Pt45_median_ckov_uncorr_LAO_10
cmap = inferno(2.^16);
for i = 1:size(Pt45_LAO_10X_stack,3)
    %now take several ROI's to get a surface dose, Ckov and corrected Ckov
    Pt45_corrected_image_stack_LAO10(:,:,i) = Pt45_artnorm_HU_corr_LAO10(:,:,i);
    Pt45_uncorrected_image_stack_LAO10(:,:,i) = Pt45_im_th_LAO_10(:,:,i);
    for j = 1:size(Pt45_ROI,3)
        roi_u = Pt45_ROI(:,:,j).*Pt45_im_th_LAO_10(:,:,i);
        roi_c = Pt45_ROI(:,:,j).*Pt45_artnorm_HU_corr_LAO10(:,:,i);
        roi_tp = Pt45_ROI(:,:,j).*Pt45_registered_tp_LAO_10;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt45_median_ckov_uncorr_LAO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt45_median_ckov_corr_2cf_LAO_10(i,j) = mean(roi_c(roi_c~=0));
        Pt45_median_tp_LAO_10(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end


% Pt 59
clear Pt59_median_tp_LAO_10 Pt59_median_ckov_corr_2cf_LAO_10 Pt59_median_ckov_uncorr_LAO_10
cmap = inferno(2.^16);
for i = 1:size(Pt59_im_th_LAO_10,3) 
    %now take several ROI's to get a surface dose, Ckov a nd corrected Ckov
    Pt59_corrected_image_stack_LAO10(:,:,i) = Pt59_artnorm_HU_corr_LAO10(:,:,i);
    Pt59_uncorrected_image_stack_LAO10(:,:,i) = Pt59_im_th_LAO_10(:,:,i);
    for j = 1:size(Pt59_ROI,3)
        roi_u = Pt59_ROI(:,:,j).*Pt59_im_th_LAO_10(:,:,i);
        roi_c = Pt59_ROI(:,:,j).*Pt59_artnorm_HU_corr_LAO10(:,:,i);
        roi_tp = Pt59_ROI(:,:,j).*Pt59_registered_tp_LAO_10;
        
        roi_u(isnan(roi_u)) = 0;
        roi_tp(isnan(roi_tp)) = 0;
        Pt59_median_ckov_uncorr_LAO_10(i,j) = mean(roi_u(roi_u~=0));
        roi_c(isnan(roi_c)) = 0;
        Pt59_median_ckov_corr_2cf_LAO_10(i,j) = mean(roi_c(roi_c~=0));
        Pt59_median_tp_LAO_10(i,j) = mean(roi_tp(roi_tp~=0));
        
    end
end

%PLOT ALL LAO 6X BEAMS
figure(350)
[ha, pos] = tight_subplot(1, 2,[.12 .07],[.1 .06],[.05 .03]);
subplot('Position', pos{1})
scatter(Pt32_median_tp_LAO_10(:), Pt32_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt39_median_tp_LAO_10(:), Pt39_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_10(:), Pt41_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_10(:), Pt45_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_10(:), Pt59_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('Cherenkov')
legend('Pt32-LAO10X', 'Pt39-LAO10X', 'Pt41-LAO10X', 'Pt45-LAO10X',...
    'Pt59-LAO10X', 'Location', 'Northwest');

subplot('Position', pos{2})
scatter(Pt32_median_tp_LAO_10(:), Pt32_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt39_median_tp_LAO_10(:), Pt39_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_10(:), Pt41_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_10(:), Pt45_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_10(:), Pt59_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 2])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('HU Corrected Cherenkov')
legend('Pt32-LAO10X', 'Pt39-LAO10X', 'Pt41-LAO10X', 'Pt45-LAO10X',...
    'Pt59-LAO10X', 'Location', 'Northwest');

%% NOW SEPARARTE OUT THE TRENDS
figure(360)
clf;
[ha, pos] = tight_subplot(1, 2,[.12 .07],[.1 .010],[.05 .03]);
subplot('Position', pos{1})
scatter(Pt30_median_tp_RPO_6(:), Pt30_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt31_median_tp_RPO_6(:), Pt31_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_RPO_6(:), Pt32_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_RPO_6(:), Pt35_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_RPO_6(:), Pt36_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_RPO_6(:), Pt37_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_RPO_6(:), Pt39_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_6(:), Pt41_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_RPO_6(:), Pt44_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_6(:), Pt45_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_RPO_6(:), Pt56_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_RPO_6(:), Pt58_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_6(:), Pt59_median_ckov_uncorr_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)

scatter(Pt30_median_tp_LAO_6(:), Pt30_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt31_median_tp_LAO_6(:), Pt31_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_LAO_6(:), Pt32_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_LAO_6(:), Pt35_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_LAO_6(:), Pt36_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_LAO_6(:), Pt37_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_LAO_6(:), Pt39_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_6(:), Pt41_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_LAO_6(:), Pt44_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_6(:), Pt45_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_LAO_6(:), Pt56_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_LAO_6(:), Pt58_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_6(:), Pt59_median_ckov_uncorr_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)


scatter(Pt32_median_tp_RPO_10(:), Pt32_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_RPO_10(:), Pt39_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_10(:), Pt41_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_10(:), Pt45_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_10(:), Pt59_median_ckov_uncorr_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)

scatter(Pt32_median_tp_LAO_10(:), Pt32_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_LAO_10(:), Pt39_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_10(:), Pt41_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_10(:), Pt45_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_10(:), Pt59_median_ckov_uncorr_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 1.8])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('Uncorrected Cherenkov Intensity (cts)')


subplot('Position', pos{2})
scatter(Pt30_median_tp_RPO_6(:), Pt30_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
hold on
scatter(Pt31_median_tp_RPO_6(:), Pt31_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_RPO_6(:), Pt32_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_RPO_6(:), Pt35_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_RPO_6(:), Pt36_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_RPO_6(:), Pt37_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_RPO_6(:), Pt39_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_6(:), Pt41_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_RPO_6(:), Pt44_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_6(:), Pt45_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_RPO_6(:), Pt56_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_RPO_6(:), Pt58_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_6(:), Pt59_median_ckov_corr_2cf_RPO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)

scatter(Pt30_median_tp_LAO_6(:), Pt30_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt31_median_tp_LAO_6(:), Pt31_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt32_median_tp_LAO_6(:), Pt32_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt35_median_tp_LAO_6(:), Pt35_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt36_median_tp_LAO_6(:), Pt36_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt37_median_tp_LAO_6(:), Pt37_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_LAO_6(:), Pt39_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_6(:), Pt41_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt44_median_tp_LAO_6(:), Pt44_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_6(:), Pt45_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt56_median_tp_LAO_6(:), Pt56_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt58_median_tp_LAO_6(:), Pt58_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_6(:), Pt59_median_ckov_corr_2cf_LAO_6(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('CadetBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)


scatter(Pt32_median_tp_RPO_10(:), Pt32_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_RPO_10(:), Pt39_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_RPO_10(:), Pt41_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_RPO_10(:), Pt45_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_RPO_10(:), Pt59_median_ckov_corr_2cf_RPO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)

scatter(Pt32_median_tp_LAO_10(:), Pt32_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt39_median_tp_LAO_10(:), Pt39_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt41_median_tp_LAO_10(:), Pt41_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt45_median_tp_LAO_10(:), Pt45_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
scatter(Pt59_median_tp_LAO_10(:), Pt59_median_ckov_corr_2cf_LAO_10(:), 'filled',...
    'SizeData', 170, 'MarkerFaceColor', rgb('DarkBlue'), 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2)
ax = gca;
ax.FontSize = 26;
xlim([0 1.8])
ylim([0 9e4])
ax.FontName = 'Times New Roman';
xlabel('Dose (Gy)')
ylabel('HU - Corrected Cherenkov Intensity')

%% ORGANIZE DATA INTO ARRAYS FOR FITS
%uncorrected 6X matrix
tp_6_array = [Pt30_median_tp_RPO_6(:)', Pt31_median_tp_RPO_6(:)',...
    Pt32_median_tp_RPO_6(:)', Pt35_median_tp_RPO_6(:)',...
    Pt36_median_tp_RPO_6(:)', Pt37_median_tp_RPO_6(:)',...
    Pt39_median_tp_RPO_6(:)', Pt41_median_tp_RPO_6(:)',...
    Pt44_median_tp_RPO_6(:)', Pt45_median_tp_RPO_6(:)',...
    Pt56_median_tp_RPO_6(:)', Pt58_median_tp_RPO_6(:)',...
    Pt59_median_tp_RPO_6(:)',...
    Pt30_median_tp_LAO_6(:)', Pt31_median_tp_LAO_6(:)',...
    Pt32_median_tp_LAO_6(:)', Pt35_median_tp_LAO_6(:)',...
    Pt36_median_tp_LAO_6(:)', Pt37_median_tp_LAO_6(:)',...
    Pt39_median_tp_LAO_6(:)', Pt41_median_tp_LAO_6(:)',...
    Pt44_median_tp_LAO_6(:)', Pt45_median_tp_LAO_6(:)',...
    Pt56_median_tp_LAO_6(:)', Pt58_median_tp_LAO_6(:)',...
    Pt59_median_tp_LAO_6(:)'];

tp_10_array = [Pt32_median_tp_RPO_10(:)', Pt39_median_tp_RPO_10(:)',...
    Pt41_median_tp_RPO_10(:)', Pt45_median_tp_RPO_10(:)', Pt59_median_tp_RPO_10(:)'...
    Pt32_median_tp_LAO_10(:)', Pt39_median_tp_LAO_10(:)', Pt41_median_tp_LAO_10(:)',...
    Pt45_median_tp_LAO_10(:)', Pt59_median_tp_LAO_10(:)'];

uncorr_6_array = [Pt30_median_ckov_uncorr_RPO_6(:)', Pt31_median_ckov_uncorr_RPO_6(:)',...
    Pt32_median_ckov_uncorr_RPO_6(:)', Pt35_median_ckov_uncorr_RPO_6(:)',...
    Pt36_median_ckov_uncorr_RPO_6(:)', Pt37_median_ckov_uncorr_RPO_6(:)',...
    Pt39_median_ckov_uncorr_RPO_6(:)', Pt41_median_ckov_uncorr_RPO_6(:)',...
    Pt44_median_ckov_uncorr_RPO_6(:)', Pt45_median_ckov_uncorr_RPO_6(:)',...
    Pt56_median_ckov_uncorr_RPO_6(:)', Pt58_median_ckov_uncorr_RPO_6(:)',...
    Pt59_median_ckov_uncorr_RPO_6(:)',...
    Pt30_median_ckov_uncorr_LAO_6(:)', Pt31_median_ckov_uncorr_LAO_6(:)',...
    Pt32_median_ckov_uncorr_LAO_6(:)', Pt35_median_ckov_uncorr_LAO_6(:)',...
    Pt36_median_ckov_uncorr_LAO_6(:)', Pt37_median_ckov_uncorr_LAO_6(:)',...
    Pt39_median_ckov_uncorr_LAO_6(:)', Pt41_median_ckov_uncorr_LAO_6(:)',...
    Pt44_median_ckov_uncorr_LAO_6(:)', Pt45_median_ckov_uncorr_LAO_6(:)',...
    Pt56_median_ckov_uncorr_LAO_6(:)', Pt58_median_ckov_uncorr_LAO_6(:)',...
    Pt59_median_ckov_uncorr_LAO_6(:)'];

corr_6_array = [Pt30_median_ckov_corr_2cf_RPO_6(:)', Pt31_median_ckov_corr_2cf_RPO_6(:)',...
    Pt32_median_ckov_corr_2cf_RPO_6(:)', Pt35_median_ckov_corr_2cf_RPO_6(:)',...
    Pt36_median_ckov_corr_2cf_RPO_6(:)', Pt37_median_ckov_corr_2cf_RPO_6(:)',...
    Pt39_median_ckov_corr_2cf_RPO_6(:)', Pt41_median_ckov_corr_2cf_RPO_6(:)',...
    Pt44_median_ckov_corr_2cf_RPO_6(:)', Pt45_median_ckov_corr_2cf_RPO_6(:)',...
    Pt56_median_ckov_corr_2cf_RPO_6(:)', Pt58_median_ckov_corr_2cf_RPO_6(:)',...
    Pt59_median_ckov_corr_2cf_RPO_6(:)',...
    Pt30_median_ckov_corr_2cf_LAO_6(:)', Pt31_median_ckov_corr_2cf_LAO_6(:)',...
    Pt32_median_ckov_corr_2cf_LAO_6(:)', Pt35_median_ckov_corr_2cf_LAO_6(:)',...
    Pt36_median_ckov_corr_2cf_LAO_6(:)', Pt37_median_ckov_corr_2cf_LAO_6(:)',...
    Pt39_median_ckov_corr_2cf_LAO_6(:)', Pt41_median_ckov_corr_2cf_LAO_6(:)',...
    Pt44_median_ckov_corr_2cf_LAO_6(:)', Pt45_median_ckov_corr_2cf_LAO_6(:)',...
    Pt56_median_ckov_corr_2cf_LAO_6(:)', Pt58_median_ckov_corr_2cf_LAO_6(:)',...
    Pt59_median_ckov_corr_2cf_LAO_6(:)'];
        
uncorr_10_array = [Pt32_median_ckov_uncorr_RPO_10(:)', Pt39_median_ckov_uncorr_RPO_10(:)',...
    Pt41_median_ckov_uncorr_RPO_10(:)'...
    Pt45_median_ckov_uncorr_RPO_10(:)', Pt59_median_ckov_uncorr_RPO_10(:)'...
    Pt32_median_ckov_uncorr_LAO_10(:)', Pt39_median_ckov_uncorr_LAO_10(:)', Pt41_median_ckov_uncorr_LAO_10(:)',...
    Pt45_median_ckov_uncorr_LAO_10(:)', Pt59_median_ckov_uncorr_LAO_10(:)'];

corr_10_array = [Pt32_median_ckov_corr_2cf_RPO_10(:)', Pt39_median_ckov_corr_2cf_RPO_10(:)',...
    Pt41_median_ckov_corr_2cf_RPO_10(:)'...
    Pt45_median_ckov_corr_2cf_RPO_10(:)', Pt59_median_ckov_corr_2cf_RPO_10(:)'...
    Pt32_median_ckov_corr_2cf_LAO_10(:)', Pt39_median_ckov_corr_2cf_LAO_10(:)', Pt41_median_ckov_corr_2cf_LAO_10(:)',...
    Pt45_median_ckov_corr_2cf_LAO_10(:)', Pt59_median_ckov_corr_2cf_LAO_10(:)'];

xspace = [0:0.01:1.8];
yspace_6X_uncorr = uncorrected_6X_fit.a.*xspace;
yspace_6X_corr = corrected_6X_fit.a.*xspace;
yspace_10X_uncorr = uncorrected_10X_fit.a.*xspace;
yspace_10X_corr = corrected_10X_fit.a.*xspace;

figure(360)
subplot('Position', pos{1})
hold on
plot(xspace, yspace_6X_uncorr, 'Color', rgb('CadetBlue'), 'LineWidth', 3);
plot(xspace, yspace_10X_uncorr, 'Color', rgb('DarkBlue'), 'LineWidth', 3);
subplot('Position', pos{2})
hold on
plot(xspace, yspace_6X_corr, 'Color', rgb('CadetBlue'), 'LineWidth', 3);
plot(xspace, yspace_10X_corr, 'Color', rgb('DarkBlue'), 'LineWidth', 3);


% appended_corr_array_6 = [tp_6_array', corr_6_array'];
% appended_uncorr_array_6 = [tp_6_array', uncorr_6_array'];

% %6X Corrected and Uncorrected
% clear fit
% [fit_6X_uncorr_t gof_6X_uncorr_t] = fit(tp_6_array', uncorr_6_array', 'poly1')
% fit_6X_uncorr_t = polyfitZero(tp_6_array', uncorr_6_array', 1)
% 
% xspace = [0:0.01:1.5];
% yspace_6X_uncorr = fit_6X_uncorr_t.p1*xspace + fit_6X_uncorr_t.p2;
% yspace_6X_uncorr = fit_6X_uncorr_t(1).*xspace;
% clear fit
% [fit_6X_corr gof_6X_corr] = fit(tp_6_array', corr_6_array', 'poly1')
% yspace_6X_corr = fit_6X_corr.p1*xspace + fit_6X_corr.p2;
% 
% figure(360)
% subplot('Position', pos{1})
% hold on
% plot(xspace, yspace_6X_uncorr, 'Color', rgb('CadetBlue'), 'LineWidth', 3);

%statistics for Uncorrected RPO 6X
[r p] = corrcoef(tp_6_array', uncorr_6_array')

% statistics for Corrected RPO 6X
[r p] = corrcoef(tp_6_array', corr_6_array')
% 

% subplot('Position', pos{2})
% hold on
% plot(xspace, yspace_6X_corr, 'Color', rgb('CadetBlue'), 'LineWidth', 3);
% 

%edit the arrays
% uncorrected_10 = [tp_10_array', uncorr_10_array'];
% corr_10 = [tp_10_array', corr_10_array'];
% 
% %10X Corrected and Uncorrected
% clear fit
% [fit_10X_uncorr gof_10X_uncorr] = fit(tp_10_array', uncorr_10_array', 'poly1')
% xspace = [0:0.01:1.5];
% yspace_10X_uncorr = fit_10X_uncorr.p1*xspace + fit_10X_uncorr.p2;
% clear fit
% [fit_10X_corr gof_10X_corr] = fit(tp_10_array', corr_10_array', 'poly1')
% yspace_10X_corr = fit_10X_corr.p1*xspace + fit_10X_corr.p2;
% 
% figure(360)
% subplot('Position', pos{1})
% hold on
% plot(xspace, yspace_10X_uncorr, 'Color', rgb('DarkBlue'), 'LineWidth', 3);
% 
% subplot('Position', pos{2})
% hold on
% plot(xspace, yspace_10X_corr, 'Color', rgb('DarkBlue'), 'LineWidth', 3);

%statistics for Uncorrected RPO 10X
[r p] = corrcoef(tp_10_array', uncorr_10_array')

% statistics for Corrected RPO 10X
[r p] = corrcoef(tp_10_array', corr_10_array')

