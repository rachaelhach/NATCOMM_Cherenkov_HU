%exp74 employ double correction factors to images. 
%% ENTRANCE 6X BEAM - IMAGE CORRECTIONS
%EMPLOY FINAL TYPE CORRECTIONS: 
% BUT THIS HAS TO BE FROM THE DATA THAT AVERAGES OUT THE DIFFERENCES 
%Extract correction factors - 6X

pt30_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt30_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt31_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt31_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt32_ckov_anat_entrance_6_wART_cf1 = ckov_135HU_6./...
    (Pt32_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt35_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt35_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt36_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt36_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt37_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt37_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt39_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt39_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt41_ckov_anat_entrance_6_wART_cf1 = ckov_135HU_6./...
    (Pt41_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt44_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt44_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt45_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt45_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt56_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt56_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt58_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt58_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt59_ckov_anat_entrance_6_cf1 = ckov_135HU_6./...
    (Pt59_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)

% multiply the factors by the raw image stacks
Pt30_artnorm_HU_corr_RPO6 = Pt30_im_th_RPO.*pt30_ckov_anat_entrance_6_cf1;
Pt31_artnorm_HU_corr_RPO6 = Pt31_im_th_RPO.*pt31_ckov_anat_entrance_6_cf1;
Pt32_artnorm_HU_corr_RPO6 = Pt32_im_th_RPO_6.*pt32_ckov_anat_entrance_6_wART_cf1;
Pt35_artnorm_HU_corr_RPO6 = Pt35_im_th_RPO.*pt35_ckov_anat_entrance_6_cf1;
Pt36_artnorm_HU_corr_RPO6 = Pt36_im_th_RPO.*pt36_ckov_anat_entrance_6_cf1;
Pt37_artnorm_HU_corr_RPO6 = Pt37_im_th_RPO.*pt37_ckov_anat_entrance_6_cf1;
Pt39_artnorm_HU_corr_RPO6 = Pt39_im_th_RPO_6.*pt39_ckov_anat_entrance_6_cf1;
Pt41_artnorm_HU_corr_RPO6 = Pt41_im_th_RPO_6.*pt41_ckov_anat_entrance_6_wART_cf1;
Pt44_artnorm_HU_corr_RPO6 = Pt44_im_th_RPO.*pt44_ckov_anat_entrance_6_cf1;
Pt45_artnorm_HU_corr_RPO6 = Pt45_im_th_RPO_6.*pt45_ckov_anat_entrance_6_cf1;
Pt56_artnorm_HU_corr_RPO6 = Pt56_im_th_RPO.*pt56_ckov_anat_entrance_6_cf1;
Pt58_artnorm_HU_corr_RPO6 = Pt58_im_th_RPO.*pt58_ckov_anat_entrance_6_cf1;
Pt59_artnorm_HU_corr_RPO6 = Pt59_im_th_RPO_6.*pt59_ckov_anat_entrance_6_cf1;


%% now for the images

figure(1); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(2); clf; 
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt32_corrected_image_array_RPO_6
for i = 1:size(Pt32_RPO_6X_stack_wART,3)
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt32_RPO_6X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt32 - Uncorrected RPO 6X')
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt32_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt32 - Corrected RPO 6X')
    
    uncorrim = Pt32_RPO_6X_stack_wART(:,:,i);
    Pt32_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt32_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt32_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(1)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(2)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')

figure(3); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(4); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt41_corrected_image_array_RPO_6
for i = 1:size(Pt41_RPO_6X_stack_wART,3)
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt41_RPO_6X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt41 - Uncorrected RPO 6X')
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt41_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt41 - Corrected RPO 6X')
    
    uncorrim = Pt41_RPO_6X_stack_wART(:,:,i);
    Pt41_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt41_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt41_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(3)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(4)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')
% 

figure(5); clf;
[ha, pos] = tight_subplot(3, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(6); clf;
[ha, pos] = tight_subplot(3, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt44_corrected_image_array_RPO_6
for i = 1:size(Pt44_Ckov_RPO_stack,3)
    figure(5)
    subplot('Position', pos{i})
    imagesc(Pt44_Ckov_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt44 - Uncorrected RPO 6X')
    figure(6)
    subplot('Position', pos{i})
    imagesc(Pt44_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt44 - Corrected RPO 6X')
    
    uncorrim = Pt44_Ckov_RPO_stack(:,:,i);
    Pt44_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt44_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt44_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end

% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(5)
% fig = gcf;
% saveas(fig, 'Pt44_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(6)
% fig = gcf;
% saveas(fig, 'Pt44_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')
% 

figure(7); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(8); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt45_corrected_image_array_RPO_6
for i = 1:size(Pt45_RPO_6X_stack,3)
    figure(7)
    subplot('Position', pos{i})
    imagesc(Pt45_RPO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt45 - Uncorrected RPO 6X')
    figure(8)
    subplot('Position', pos{i})
    imagesc(Pt45_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt45 - Corrected RPO 6X')
    
    uncorrim = Pt45_RPO_6X_stack(:,:,i);
    Pt45_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt45_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt45_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(7)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(8)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')
% 

figure(9); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(10); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt56_corrected_image_array_RPO_6
for i = 1:size(Pt56_RPO_stack,3)
    figure(9)
    subplot('Position', pos{i})
    imagesc(Pt56_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt56 - Uncorrected RPO 6X')
    figure(10)
    subplot('Position', pos{i})
    imagesc(Pt56_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt56 - Corrected RPO 6X')
    
    uncorrim = Pt56_RPO_stack(:,:,i);
    Pt56_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt56_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt56_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(9)
% fig = gcf;
% saveas(fig, 'Pt56_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(10)
% fig = gcf;
% saveas(fig, 'Pt56_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')


figure(11); clf;
[ha, pos] = tight_subplot(3, 3,[.01 .01],[.03 .03],[.01 .03]);
figure(12); clf;
[ha, pos] = tight_subplot(3, 3,[.01 .01],[.03 .03],[.01 .03]);
clear Pt58_corrected_image_array_RPO_6
for i = 1:size(Pt58_RPO_stack,3)
    figure(11)
    subplot('Position', pos{i})
    imagesc(Pt58_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt58 - Uncorrected RPO 6X')
    figure(12)
    subplot('Position', pos{i})
    imagesc(Pt58_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt58 - Corrected RPO 6X')
    uncorrim = Pt58_RPO_stack(:,:,i);
    Pt58_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt58_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt58_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(11)
% fig = gcf;
% saveas(fig, 'Pt58_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(12)
% fig = gcf;
% saveas(fig, 'Pt58_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')

figure(13); clf;
[ha, pos] = tight_subplot(1, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(14); clf;
[ha, pos] = tight_subplot(1, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt59_corrected_image_array_RPO_6
for i = 1:size(Pt59_RPO_6X_stack,3)
    figure(13)
    subplot('Position', pos{i})
    imagesc(Pt59_RPO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt59 - Uncorrected RPO 6X')
    figure(14)
    subplot('Position', pos{i})
    imagesc(Pt59_artnorm_HU_corr_RPO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt59 - Corrected RPO 6X')
    uncorrim = Pt59_RPO_6X_stack(:,:,i);
    Pt59_uncorr_final_median_RPO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt59_artnorm_HU_corr_RPO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt59_corr_final_median_RPO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(13)
% fig = gcf;
% saveas(fig, 'Pt59_Ckov_Dose_Norm_RPO_6_Montage_Uncorr.png')
% figure(14)
% fig = gcf;
% saveas(fig, 'Pt59_Ckov_Dose_Norm_RPO_6_Montage_Corr.png')




% COMPUTE STATS for the CORRECTED and UNCORRECTED RPO 6 BEAMS
uncorr_image_median_array_RPO_6 = [Pt32_uncorr_final_median_RPO6, Pt41_uncorr_final_median_RPO6...
    Pt44_uncorr_final_median_RPO6, Pt45_uncorr_final_median_RPO6, Pt56_uncorr_final_median_RPO6...
    Pt58_uncorr_final_median_RPO6];

corr_image_median_array_RPO_6 = [Pt32_corr_final_median_RPO6, Pt41_corr_final_median_RPO6...
    Pt44_corr_final_median_RPO6, Pt45_corr_final_median_RPO6, Pt56_corr_final_median_RPO6...
    Pt58_corr_final_median_RPO6];

mu_uc = mean(uncorr_image_median_array_RPO_6(:))
std_uc = std(uncorr_image_median_array_RPO_6(:))
cov_uc_RPO_6 = std_uc/mu_uc

mu_c = mean(corr_image_median_array_RPO_6(:))
std_c = std(corr_image_median_array_RPO_6(:))
cov_c_RPO_6 = std_c/mu_c

%% EXIT 6X BEAM - IMAGE CORRECTIONS
% DOUBLE CORRECTIONS NOT EMPLOYED

%EMPLOY FINAL TYPE CORRECTIONS: 
%Extract correction factors - LAO 6X

% CHERENKOV CORRECTIONS - HU
pt30_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt30_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt31_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt31_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt32_ckov_anat_exit_6_wART_cf1 = ckov_135HU_6./...
    (Pt32_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt35_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt35_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt36_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt36_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt37_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt37_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt39_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt39_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt41_ckov_anat_exit_6_wART_cf1 = ckov_135HU_6./...
    (Pt41_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt44_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt44_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt45_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt45_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt56_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt56_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt58_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt58_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)
pt59_ckov_anat_exit_6_cf1 = ckov_135HU_6./...
    (Pt59_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)

% multiply the factors by the raw image stacks
Pt30_artnorm_HU_corr_LAO6 = Pt30_im_th_LAO.*pt30_ckov_anat_exit_6_cf1;
Pt31_artnorm_HU_corr_LAO6 = Pt31_im_th_LAO.*pt31_ckov_anat_exit_6_cf1;
Pt32_artnorm_HU_corr_LAO6 = Pt32_im_th_LAO_6.*pt32_ckov_anat_exit_6_wART_cf1;
Pt35_artnorm_HU_corr_LAO6 = Pt35_im_th_LAO.*pt35_ckov_anat_exit_6_cf1;
Pt36_artnorm_HU_corr_LAO6 = Pt36_im_th_LAO.*pt36_ckov_anat_exit_6_cf1;
Pt37_artnorm_HU_corr_LAO6 = Pt37_im_th_LAO.*pt37_ckov_anat_exit_6_cf1;
Pt39_artnorm_HU_corr_LAO6 = Pt39_im_th_LAO_6.*pt39_ckov_anat_exit_6_cf1;
Pt41_artnorm_HU_corr_LAO6 = Pt41_im_th_LAO_6.*pt41_ckov_anat_exit_6_wART_cf1;
Pt44_artnorm_HU_corr_LAO6 = Pt44_im_th_LAO.*pt44_ckov_anat_exit_6_cf1;
Pt45_artnorm_HU_corr_LAO6 = Pt45_im_th_LAO_6.*pt45_ckov_anat_exit_6_cf1;
Pt56_artnorm_HU_corr_LAO6 = Pt56_im_th_LAO.*pt56_ckov_anat_exit_6_cf1;
Pt58_artnorm_HU_corr_LAO6 = Pt58_im_th_LAO.*pt58_ckov_anat_exit_6_cf1;
Pt59_artnorm_HU_corr_LAO6 = Pt59_im_th_LAO_6.*pt59_ckov_anat_exit_6_cf1;


%% now for the images

figure(1); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(2); clf; 
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt32_corrected_image_array_LAO_6
for i = 1:size(Pt32_LAO_6X_stack_wART,3)
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt32_LAO_6X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt32 - Uncorrected LAO 6X')
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt32_artnorm_HU_corr_LAO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt32 - Corrected LAO 6X')
    
    uncorrim = Pt32_LAO_6X_stack_wART(:,:,i);
    Pt32_uncorr_final_median_LAO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt32_artnorm_HU_corr_LAO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt32_corr_final_median_LAO6(i) = median(corrim(corrim~=0));
end
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(1)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_LAO_6_Montage_Uncorr.png')
% figure(2)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_LAO_6_Montage_Corr.png')

figure(3); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(4); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt41_corrected_image_array_LAO_6
for i = 1:size(Pt41_LAO_6X_stack_wART,3)
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt41_LAO_6X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt41 - Uncorrected LAO 6X')
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt41_artnorm_HU_corr_LAO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt41 - Corrected LAO 6X')
    
    uncorrim = Pt41_LAO_6X_stack_wART(:,:,i);
    Pt41_uncorr_final_median_LAO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt41_artnorm_HU_corr_LAO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt41_corr_final_median_LAO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(3)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_LAO_6_Montage_Uncorr.png')
% figure(4)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_LAO_6_Montage_Corr.png')
% 

figure(5); clf;
[ha, pos] = tight_subplot(3, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(6); clf;
[ha, pos] = tight_subplot(3, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt44_corrected_image_array_LAO_6
for i = 1:size(Pt44_Ckov_LAO_stack,3)
    figure(5)
    subplot('Position', pos{i})
    imagesc(Pt44_Ckov_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt44 - Uncorrected LAO 6X')
    figure(6)
    subplot('Position', pos{i})
    imagesc(Pt44_artnorm_HU_corr_LAO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt44 - Corrected LAO 6X')
    
    uncorrim = Pt44_Ckov_LAO_stack(:,:,i);
    Pt44_uncorr_final_median_LAO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt44_artnorm_HU_corr_LAO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt44_corr_final_median_LAO6(i) = median(corrim(corrim~=0));
end

% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(5)
% fig = gcf;
% saveas(fig, 'Pt44_Ckov_Dose_Norm_LAO_6_Montage_Uncorr.png')
% figure(6)
% fig = gcf;
% saveas(fig, 'Pt44_Ckov_Dose_Norm_LAO_6_Montage_Corr.png')
% 

figure(7); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(8); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt45_corrected_image_array_LAO_6
for i = 1:size(Pt45_LAO_6X_stack,3)
    figure(7)
    subplot('Position', pos{i})
    imagesc(Pt45_LAO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt45 - Uncorrected LAO 6X')
    figure(8)
    subplot('Position', pos{i})
    imagesc(Pt45_artnorm_HU_corr_LAO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt45 - Corrected LAO 6X')
    
    uncorrim = Pt45_LAO_6X_stack(:,:,i);
    Pt45_uncorr_final_median_LAO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt45_artnorm_HU_corr_LAO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt45_corr_final_median_LAO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(7)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_LAO_6_Montage_Uncorr.png')
% figure(8)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_LAO_6_Montage_Corr.png')
% 

figure(9); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(10); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt56_corrected_image_array_LAO_6
for i = 1:size(Pt56_LAO_stack,3)
    figure(9)
    subplot('Position', pos{i})
    imagesc(Pt56_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt56 - Uncorrected LAO 6X')
    figure(10)
    subplot('Position', pos{i})
    imagesc(Pt56_artnorm_HU_corr_LAO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt56 - Corrected LAO 6X')
    
    uncorrim = Pt56_LAO_stack(:,:,i);
    Pt56_uncorr_final_median_LAO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt56_artnorm_HU_corr_LAO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt56_corr_final_median_LAO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(9)
% fig = gcf;
% saveas(fig, 'Pt56_Ckov_Dose_Norm_LAO_6_Montage_Uncorr.png')
% figure(10)
% fig = gcf;
% saveas(fig, 'Pt56_Ckov_Dose_Norm_LAO_6_Montage_Corr.png')


figure(11); clf;
[ha, pos] = tight_subplot(3, 3,[.01 .01],[.03 .03],[.01 .03]);
figure(12); clf;
[ha, pos] = tight_subplot(3, 3,[.01 .01],[.03 .03],[.01 .03]);
clear Pt58_corrected_image_array_LAO_6
for i = 1:size(Pt58_LAO_stack,3)
    figure(11)
    subplot('Position', pos{i})
    imagesc(Pt58_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt58 - Uncorrected LAO 6X')
    figure(12)
    subplot('Position', pos{i})
    imagesc(Pt58_artnorm_HU_corr_LAO6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt58 - Corrected LAO 6X')
    uncorrim = Pt58_LAO_stack(:,:,i);
    Pt58_uncorr_final_median_LAO6(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt58_artnorm_HU_corr_LAO6(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt58_corr_final_median_LAO6(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(11)
% fig = gcf;
% saveas(fig, 'Pt58_Ckov_Dose_Norm_LAO_6_Montage_Uncorr.png')
% figure(12)
% fig = gcf;
% saveas(fig, 'Pt58_Ckov_Dose_Norm_LAO_6_Montage_Corr.png')


% COMPUTE STATS for the CORRECTED and UNCORRECTED LAO 6 BEAMS
uncorr_image_median_array_LAO_6 = [Pt32_median_ckov_dosenorm_field_LAO_6_wART, Pt41_median_ckov_dosenorm_field_LAO_6_wART...
    Pt44_median_ckov_dosenorm_field_LAO, Pt45_median_ckov_dosenorm_field_LAO_6,...
    Pt56_median_ckov_dosenorm_field_LAO, Pt58_median_ckov_dosenorm_field_LAO];
uncorr_image_median_array_LAO_6 = [Pt32_uncorr_final_median_LAO6, Pt41_uncorr_final_median_LAO6...
    Pt44_uncorr_final_median_LAO6, Pt45_uncorr_final_median_LAO6, Pt56_uncorr_final_median_LAO6...
    Pt58_uncorr_final_median_LAO6];

corr_image_median_array_LAO_6 = [Pt32_corr_final_median_LAO6, Pt41_corr_final_median_LAO6...
    Pt44_corr_final_median_LAO6, Pt45_corr_final_median_LAO6, Pt56_corr_final_median_LAO6...
    Pt58_corr_final_median_LAO6];

mu_uc = mean(uncorr_image_median_array_LAO_6(:))
std_uc = std(uncorr_image_median_array_LAO_6(:))
cov_uc_LAO_6 = std_uc/mu_uc

mu_c = mean(corr_image_median_array_LAO_6(:))
std_c = std(corr_image_median_array_LAO_6(:))
cov_c_LAO_6 = std_c/mu_c

%% ENTRANCE 10X BEAM

%% entrance 10X BEAM - IMAGE CORRECTIONS
%EMPLOY FINAL TYPE CORRECTIONS: 
%Extract correction factors - RPO 10X

% CHERENKOV CORRECTIONS PART 1 - HU
pt32_ckov_anat_entrance_10_wART_cf1 = ckov_135HU_10./...
    (Pt32_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt39_ckov_anat_entrance_10_cf1 = ckov_135HU_10./...
    (Pt39_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt41_ckov_anat_entrance_10_wART_cf1 = ckov_135HU_10./...
    (Pt41_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt45_ckov_anat_entrance_10_cf1 = ckov_135HU_10./...
    (Pt45_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt59_ckov_anat_entrance_10_cf1 = ckov_135HU_10./...
    (Pt59_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)

% multiply the factors by the raw image stacks
Pt32_artnorm_HU_corr_RPO10 = Pt32_im_th_RPO_10.*pt32_ckov_anat_entrance_10_wART_cf1;
Pt39_artnorm_HU_corr_RPO10 = Pt39_im_th_RPO_10.*pt39_ckov_anat_entrance_10_cf1;
Pt41_artnorm_HU_corr_RPO10 = Pt41_im_th_RPO_10.*pt41_ckov_anat_entrance_10_wART_cf1;
Pt45_artnorm_HU_corr_RPO10 = Pt45_im_th_RPO_10.*pt45_ckov_anat_entrance_10_cf1;
Pt59_artnorm_HU_corr_RPO10 = Pt59_im_th_RPO_10.*pt59_ckov_anat_entrance_10_cf1;

%% now for the images

figure(1); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(2); clf; 
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt32_corrected_image_array_RPO_10
for i = 1:size(Pt32_RPO_10X_stack_wART,3)
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt32_RPO_10X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt32 - Uncorrected RPO 10X')
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt32_artnorm_HU_corr_RPO10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt32 - Corrected RPO 10X')
    
    uncorrim = Pt32_RPO_10X_stack_wART(:,:,i);
    Pt32_uncorr_final_median_RPO10(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt32_artnorm_HU_corr_RPO10(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt32_corr_final_median_RPO10(i) = median(corrim(corrim~=0));
end
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(1)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_RPO_10_Montage_Uncorr.png')
% figure(2)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_RPO_10_Montage_Corr.png')

figure(3); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(4); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt41_corrected_image_array_RPO_10
for i = 1:size(Pt41_RPO_10X_stack_wART,3)
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt41_RPO_10X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt41 - Uncorrected RPO 10X')
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt41_artnorm_HU_corr_RPO10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt41 - Corrected RPO 10X')
    
    uncorrim = Pt41_RPO_10X_stack_wART(:,:,i);
    Pt41_uncorr_final_median_RPO10(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt41_artnorm_HU_corr_RPO10(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt41_corr_final_median_RPO10(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(3)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_RPO_10_Montage_Uncorr.png')
% figure(4)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_RPO_10_Montage_Corr.png')
% 

figure(7); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(8); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt45_corrected_image_array_RPO_10
for i = 1:size(Pt45_RPO_10X_stack,3)
    figure(7)
    subplot('Position', pos{i})
    imagesc(Pt45_RPO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt45 - Uncorrected RPO 10X')
    figure(8)
    subplot('Position', pos{i})
    imagesc(Pt45_artnorm_HU_corr_RPO10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt45 - Corrected RPO 10X')
    
    uncorrim = Pt45_RPO_10X_stack(:,:,i);
    Pt45_uncorr_final_median_RPO10(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt45_artnorm_HU_corr_RPO10(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt45_corr_final_median_RPO10(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(7)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_RPO_10_Montage_Uncorr.png')
% figure(8)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_RPO_10_Montage_Corr.png')


% COMPUTE STATS for the CORRECTED and UNCORRECTED RPO 6 BEAMS
uncorr_image_median_array_RPO_10 = [Pt32_median_ckov_dosenorm_field_RPO_10_wART, Pt41_median_ckov_dosenorm_field_RPO_10_wART...
    Pt45_median_ckov_dosenorm_field_RPO_10];
uncorr_image_median_array_RPO_10 = [Pt32_uncorr_final_median_RPO10, Pt41_uncorr_final_median_RPO10...
    Pt45_uncorr_final_median_RPO10];

corr_image_median_array_RPO_10 = [Pt32_corr_final_median_RPO10, Pt41_corr_final_median_RPO10...
    Pt45_corr_final_median_RPO10];

mu_uc = mean(uncorr_image_median_array_RPO_10(:))
std_uc = std(uncorr_image_median_array_RPO_10(:))
cov_uc_RPO_10 = std_uc/mu_uc

mu_c = mean(corr_image_median_array_RPO_10(:))
std_c = std(corr_image_median_array_RPO_10(:))
cov_c_RPO_10 = std_c/mu_c

%% exit 10X BEAM - IMAGE CORRECTIONS
%EMPLOY FINAL TYPE CORRECTIONS: 
%Extract correction factors - LAO 10X
% CHERENKOV CORRECTIONS PART 1 - HU
pt32_ckov_anat_exit_10_wART_cf1 = ckov_135HU_10./...
    (Pt32_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt41_ckov_anat_exit_10_wART_cf1 = ckov_135HU_10./...
    (Pt41_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt39_ckov_anat_exit_10_cf1 = ckov_135HU_10./...
    (Pt39_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt45_ckov_anat_exit_10_cf1 = ckov_135HU_10./...
    (Pt45_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)
pt59_ckov_anat_exit_10_cf1 = ckov_135HU_10./...
    (Pt59_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)


% multiply the factors by the raw image stacks
Pt32_artnorm_HU_corr_LAO10 = Pt32_im_th_LAO_10.*pt32_ckov_anat_exit_10_wART_cf1;
Pt39_artnorm_HU_corr_LAO10 = Pt39_im_th_LAO_10.*pt39_ckov_anat_exit_10_cf1;
Pt41_artnorm_HU_corr_LAO10 = Pt41_im_th_LAO_10.*pt41_ckov_anat_exit_10_wART_cf1;
Pt45_artnorm_HU_corr_LAO10 = Pt45_im_th_LAO_10.*pt45_ckov_anat_exit_10_cf1;
Pt59_artnorm_HU_corr_LAO10 = Pt59_im_th_LAO_10.*pt59_ckov_anat_exit_10_cf1;



%% now for the images

figure(1); clf;
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
figure(2); clf; 
[ha, pos] = tight_subplot(2, 2,[.01 .01],[.03 .03],[.01 .03]);
clear Pt32_corrected_image_array_LAO_10
for i = 1:size(Pt32_LAO_10X_stack_wART,3)
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt32_LAO_10X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt32 - Uncorrected LAO 10X')
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt32_artnorm_HU_corr_LAO10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt32 - Corrected LAO 10X')
    
    uncorrim = Pt32_LAO_10X_stack_wART(:,:,i);
    Pt32_uncorr_final_median_LAO10(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt32_artnorm_HU_corr_LAO10(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt32_corr_final_median_LAO10(i) = median(corrim(corrim~=0));
end
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(1)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_LAO_10_Montage_Uncorr.png')
% figure(2)
% fig = gcf;
% saveas(fig, 'Pt32_Ckov_Dose_Norm_LAO_10_Montage_Corr.png')

figure(3); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(4); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt41_corrected_image_array_LAO_10
for i = 1:size(Pt41_LAO_10X_stack_wART,3)
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt41_LAO_10X_stack_wART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt41 - Uncorrected LAO 10X')
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt41_artnorm_HU_corr_LAO10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt41 - Corrected LAO 10X')
    
    uncorrim = Pt41_LAO_10X_stack_wART(:,:,i);
    Pt41_uncorr_final_median_LAO10(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt41_artnorm_HU_corr_LAO10(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt41_corr_final_median_LAO10(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(3)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_LAO_10_Montage_Uncorr.png')
% figure(4)
% fig = gcf;
% saveas(fig, 'Pt41_Ckov_Dose_Norm_LAO_10_Montage_Corr.png')
% 

figure(7); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
figure(8); clf;
[ha, pos] = tight_subplot(2, 4,[.01 .01],[.03 .03],[.01 .03]);
clear Pt45_corrected_image_array_LAO_10
for i = 1:size(Pt45_LAO_10X_stack,3)
    figure(7)
    subplot('Position', pos{i})
    imagesc(Pt45_LAO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 4e4]); %colorbar;
    %title('Pt45 - Uncorrected LAO 10X')
    figure(8)
    subplot('Position', pos{i})
    imagesc(Pt45_artnorm_HU_corr_LAO10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 7e4]); %colorbar;
    %title('Pt45 - Corrected LAO 10X')
    
    uncorrim = Pt45_LAO_10X_stack(:,:,i);
    Pt45_uncorr_final_median_LAO10(i) =  median(uncorrim(uncorrim~=0));
    corrim = Pt45_artnorm_HU_corr_LAO10(:,:,i);
    corrim(isnan(corrim)) = 0;
    Pt45_corr_final_median_LAO10(i) = median(corrim(corrim~=0));
end
% 
% cd('E:\Reprocessed_Everything\Most Recent Process')
% figure(7)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_LAO_10_Montage_Uncorr.png')
% figure(8)
% fig = gcf;
% saveas(fig, 'Pt45_Ckov_Dose_Norm_LAO_10_Montage_Corr.png')


% COMPUTE STATS for the CORRECTED and UNCORRECTED LAO 6 BEAMS
uncorr_image_median_array_LAO_10 = [Pt32_median_ckov_dosenorm_field_LAO_10_wART, Pt41_median_ckov_dosenorm_field_LAO_10_wART...
    Pt45_median_ckov_dosenorm_field_LAO_10];
uncorr_image_median_array_LAO_10 = [Pt32_uncorr_final_median_LAO10, Pt41_uncorr_final_median_LAO10...
    Pt45_uncorr_final_median_LAO10];

corr_image_median_array_LAO_10 = [Pt32_corr_final_median_LAO10, Pt41_corr_final_median_LAO10...
    Pt45_corr_final_median_LAO10];

mu_uc = mean(uncorr_image_median_array_LAO_10(:))
std_uc = std(uncorr_image_median_array_LAO_10(:))
cov_uc_LAO_10 = std_uc/mu_uc

mu_c = mean(corr_image_median_array_LAO_10(:))
std_c = std(corr_image_median_array_LAO_10(:))
cov_c_LAO_10 = std_c/mu_c


