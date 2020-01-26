% CORRECTION PROCESS: PART 1 -- READ IN DATA FROM STACKS AND CALC MEANS

cd('E:\Reprocessed_Everything')
%load in all the stacks. 

%% PT 30

%Pt30_HU_av = -77.88; % 5mm
Pt30_HU_av = -88.85; % 10mm

%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
[ha, pos] = tight_subplot(2,3,[.01 .01],[.0001 .0001],[.0001 0.01]);
figure(1)
clf;
figure(2)
clf;
figure(101)
clf;
figure(102)
clf;
for i = 2:size(Pt30_RPO_stack,3)
    im_RPO = Pt30_RPO_stack(:,:,i);
    im_LAO = Pt30_LAO_stack(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.21*max4bin_LAO);
    Pt30_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt30_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt30_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt30_registered_tp_LAO.*binim_LAO;
    Pt30_Ckov_DoseNorm_th_RPO(:,:,i) = Pt30_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt30_Ckov_DoseNorm_th_LAO(:,:,i) = Pt30_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt30_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt30_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt30_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt30_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    figure(1)
    subplot('Position', pos{i-1})
    %subplot(3, ceil(size(Pt30_RPO_stack,3)/3), i)
    imagesc(Pt30_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i-1})
    imagesc(Pt30_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i-1})
    imagesc(Pt30_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 8e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i-1})
    imagesc(Pt30_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 8e4]); %colorbar;
    
end

%now take field medians
for i = 2:size(Pt30_RPO_stack,3);
    im_med_RPO = Pt30_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt30_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt30_median_ckov_dosenorm_field_RPO(i-1) = median(im_med_nonzero_RPO(:));
    Pt30_median_ckov_dosenorm_field_LAO(i-1) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end



%% PT 31

%Pt31_HU_av = -96.43; % 5mm
Pt31_HU_av = -95.76; % 10mm

%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1)
clf;
figure(2)
clf;
figure(101)
clf;
figure(102)
clf;
[ha, pos] = tight_subplot(2,5,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt31_RPO_stack,3)
    im_RPO = Pt31_RPO_stack(:,:,i);
    im_LAO = Pt31_LAO_stack(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.21*max4bin_LAO);
    Pt31_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt31_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt31_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt31_registered_tp_LAO.*binim_LAO;
    Pt31_Ckov_DoseNorm_th_RPO(:,:,i) = Pt31_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt31_Ckov_DoseNorm_th_LAO(:,:,i) = Pt31_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt31_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt31_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt31_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt31_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    figure(1)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt31_RPO_stack,3)/3), i)
    imagesc(Pt31_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt31_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    axis off;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt31_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 8e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt31_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 8e4]); %colorbar;
    
end

%now take field medians
for i = 1:size(Pt31_RPO_stack,3);
    im_med_RPO = Pt31_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt31_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt31_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt31_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end


%% PT 32

%Pt32_HU_av = -69.86; % 5mm
Pt32_HU_av = -68.76; % 10mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1)
clf;
figure(2);
clf;
figure(3)
clf;
figure(4)
clf;
figure(101)
clf;
figure(102);
clf;
figure(103)
clf;
figure(104)
clf;
figure(105)
clf;


Pt32_RPO_6X_stack_wART = Pt32_RPO_6X_stack(:,:,[7 8 9 10]);
Pt32_LAO_6X_stack_wART = Pt32_LAO_6X_stack(:,:,[7 8 9 10]);
Pt32_RPO_10X_stack_wART = Pt32_RPO_10X_stack(:,:,[7 8 9 10]);
Pt32_LAO_10X_stack_wART = Pt32_LAO_10X_stack(:,:,[7 8 9 10]);

for i = 1:size(Pt32_RPO_6X_stack,3)
    im_RPO_6 = Pt32_RPO_6X_stack(:,:,i);
    im_LAO_6 = Pt32_LAO_6X_stack(:,:,i);
    im_RPO_10 = Pt32_RPO_10X_stack(:,:,i);
    im_LAO_10 = Pt32_LAO_10X_stack(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.21*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.21*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.21*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.21*max4bin_LAO_10);
    
    Pt32_im_th_RPO_6(:,:,i) = im_RPO_6.*binim_RPO_6;
    Pt32_im_th_LAO_6(:,:,i) = im_LAO_6.*binim_LAO_6;
    Pt32_im_th_RPO_10(:,:,i) = im_RPO_10.*binim_RPO_10;
    Pt32_im_th_LAO_10(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt32_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt32_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt32_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt32_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt32_Ckov_DoseNorm_th_RPO_6(:,:,i) = Pt32_im_th_RPO_6(:,:,i)./tp_th_RPO_6;
    Pt32_Ckov_DoseNorm_th_LAO_6(:,:,i) = Pt32_im_th_LAO_6(:,:,i)./tp_th_LAO_6;
    Pt32_Ckov_DoseNorm_th_RPO_10(:,:,i) = Pt32_im_th_RPO_10(:,:,i)./tp_th_RPO_10;
    Pt32_Ckov_DoseNorm_th_LAO_10(:,:,i) = Pt32_im_th_LAO_10(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt32_Ckov_DoseNorm_th_RPO_6(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt32_Ckov_DoseNorm_th_LAO_6(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt32_Ckov_DoseNorm_th_RPO_10(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt32_Ckov_DoseNorm_th_LAO_10(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt32_Ckov_DoseNorm_th_c_RPO_6(:,:,i) = dose_norm_im_RPO_6;
    Pt32_Ckov_DoseNorm_th_c_LAO_6(:,:,i) = dose_norm_im_LAO_6;
    Pt32_Ckov_DoseNorm_th_c_RPO_10(:,:,i) = dose_norm_im_RPO_10;
    Pt32_Ckov_DoseNorm_th_c_LAO_10(:,:,i) = dose_norm_im_LAO_10;
    
    figure(1)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt32_RPO_stack,3)/3), i)
    imagesc(Pt32_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt32_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt32_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt32_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt32_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;

    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt32_RPO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt32_LAO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(103)
    subplot('Position', pos{i})
    imagesc(Pt32_RPO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(104)
    subplot('Position', pos{i})
    imagesc(Pt32_RPO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
   
end

%now take field medians
for i = 1:size(Pt32_RPO_6X_stack,3);
    im_med_RPO_6 = Pt32_Ckov_DoseNorm_th_c_RPO_6(:,:,i);
    im_med_LAO_6 = Pt32_Ckov_DoseNorm_th_c_LAO_6(:,:,i);
    im_med_RPO_10 = Pt32_Ckov_DoseNorm_th_c_RPO_10(:,:,i);
    im_med_LAO_10 = Pt32_Ckov_DoseNorm_th_c_LAO_10(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt32_median_ckov_dosenorm_field_RPO_6(i) = median(im_med_nonzero_RPO_6(:));
    Pt32_median_ckov_dosenorm_field_LAO_6(i) = median(im_med_nonzero_LAO_6(:));
    Pt32_median_ckov_dosenorm_field_RPO_10(i) = median(im_med_nonzero_RPO_10(:));
    Pt32_median_ckov_dosenorm_field_LAO_10(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end

clear im_RPO_6 im_LAO_6 im_RPO_10 im_LAO_10
clear im_th_RPO_6 im_th_RPO_10 im_th_LAO_6 im_th_LAO_10
clear dose_norm_im_RPO_6 dose_norm_im_RPO_10 dose_norm_im_LAO_6 dose_norm_im_LAO_10
% READ IN ONLY THE ACQUISITIOND CORRESPONDING TO REFLECTANCE DATA
[ha, pos] = tight_subplot(2,2,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt32_RPO_6X_stack_wART,3)
    im_RPO_6 = Pt32_RPO_6X_stack_wART(:,:,i);
    im_LAO_6 = Pt32_LAO_6X_stack_wART(:,:,i);
    im_RPO_10 = Pt32_RPO_10X_stack_wART(:,:,i);
    im_LAO_10 = Pt32_LAO_10X_stack_wART(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.15*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.15*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.15*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.15*max4bin_LAO_10);
    
    im_th_RPO_6(:,:,i) = im_RPO_6.*binim_RPO_6;
    im_th_LAO_6(:,:,i) = im_LAO_6.*binim_LAO_6;
    im_th_RPO_10(:,:,i) = im_RPO_10.*binim_RPO_10;
    im_th_LAO_10(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt32_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt32_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt32_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt32_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt32_Ckov_DoseNorm_th_RPO_6_wART(:,:,i) = im_th_RPO_6(:,:,i)./tp_th_RPO_6;
    Pt32_Ckov_DoseNorm_th_LAO_6_wART(:,:,i) = im_th_LAO_6(:,:,i)./tp_th_LAO_6;
    Pt32_Ckov_DoseNorm_th_RPO_10_wART(:,:,i) = im_th_RPO_10(:,:,i)./tp_th_RPO_10;
    Pt32_Ckov_DoseNorm_th_LAO_10_wART(:,:,i) = im_th_LAO_10(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt32_Ckov_DoseNorm_th_RPO_6(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt32_Ckov_DoseNorm_th_LAO_6(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt32_Ckov_DoseNorm_th_RPO_10(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt32_Ckov_DoseNorm_th_LAO_10(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt32_Ckov_DoseNorm_th_c_RPO_6_wART(:,:,i) = dose_norm_im_RPO_6;
    Pt32_Ckov_DoseNorm_th_c_LAO_6_wART(:,:,i) = dose_norm_im_LAO_6;
    Pt32_Ckov_DoseNorm_th_c_RPO_10_wART(:,:,i) = dose_norm_im_RPO_10;
    Pt32_Ckov_DoseNorm_th_c_LAO_10_wART(:,:,i) = dose_norm_im_LAO_10;
    
    im_ART = pt32_art_bksub_stack(:,:,i).*binim_LAO_10;
    Pt32_im_th_ART(:,:,i) = im_ART;
    Pt32_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt32_median_ART(i) = median(im_ART(im_ART~=0));
    
%     figure(1)
%     subplot('Position', pos{i})
%     imagesc(Pt32_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
%     figure(2)
%     subplot('Position', pos{i})
%     imagesc(Pt32_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
%     figure(3)
%     subplot('Position', pos{i})
%     imagesc(Pt32_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
%     figure(4)
%     subplot('Position', pos{i})
%     imagesc(Pt32_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(105)
    subplot('Position', pos{i})
    imagesc(Pt32_im_th_ART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e5]); %colorbar;

end

clear im_med_RPO_6 im_med_RPO_10 im_med_LAO_6 im_med_LAO_10
%now take field medians
for i = 1:4
    im_med_RPO_6 = Pt32_Ckov_DoseNorm_th_c_RPO_6_wART(:,:,i);
    im_med_LAO_6 = Pt32_Ckov_DoseNorm_th_c_LAO_6_wART(:,:,i);
    im_med_RPO_10 = Pt32_Ckov_DoseNorm_th_c_RPO_10_wART(:,:,i);
    im_med_LAO_10 = Pt32_Ckov_DoseNorm_th_c_LAO_10_wART(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt32_median_ckov_dosenorm_field_RPO_6_wART(i) = median(im_med_nonzero_RPO_6(:));
    Pt32_median_ckov_dosenorm_field_LAO_6_wART(i) = median(im_med_nonzero_LAO_6(:));
    Pt32_median_ckov_dosenorm_field_RPO_10_wART(i) = median(im_med_nonzero_RPO_10(:));
    Pt32_median_ckov_dosenorm_field_LAO_10_wART(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end
Pt32_im_th_RPO_6_wART = Pt32_im_th_RPO_6(:,:,[7 8 9 10]);
Pt32_im_th_LAO_6_wART = Pt32_im_th_LAO_6(:,:,[7 8 9 10]);
Pt32_im_th_RPO_10_wART = Pt32_im_th_RPO_10(:,:,[7 8 9 10]);
Pt32_im_th_LAO_10_wART = Pt32_im_th_LAO_10(:,:,[7 8 9 10]);

%% PT 35

%Pt35_HU_av = -104.95; % 5mm
Pt35_HU_av = -110.04; % 10mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1);
clf;
figure(2)
clf;
figure(101);
clf;
figure(102)
clf;

[ha, pos] = tight_subplot(2,3,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt35_LAO_stack_int_shift,3)
    im_RPO = Pt35_RPO_stack_int_shift(:,:,i);
    im_LAO = Pt35_LAO_stack_int_shift(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.21*max4bin_LAO);
    Pt35_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt35_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt35_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt35_registered_tp_LAO.*binim_LAO;
    Pt35_Ckov_DoseNorm_th_RPO(:,:,i) = Pt35_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt35_Ckov_DoseNorm_th_LAO(:,:,i) = Pt35_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt35_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt35_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt35_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt35_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt35_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt35_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt35_RPO_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt35_LAO_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;

end

%now take field medians
for i = 1:size(Pt35_LAO_stack_int_shift,3);
    im_med_RPO = Pt35_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt35_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt35_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt35_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    
    Pt35_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt35_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end

%% PT 36

%Pt36_HU_av = -86.18; % 5mm
Pt36_HU_av = -99.43; % 10mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1);
clf;
figure(2)
clf;
figure(101);
clf;
figure(102)
clf;
[ha, pos] = tight_subplot(2,3,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt36_LAO_stack_int_shift,3)
    im_RPO = Pt36_RPO_stack_int_shift(:,:,i);
    im_LAO = Pt36_LAO_stack_int_shift(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.21*max4bin_LAO);
    Pt36_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt36_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt36_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt36_registered_tp_LAO.*binim_LAO;
    Pt36_Ckov_DoseNorm_th_RPO(:,:,i) = Pt36_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt36_Ckov_DoseNorm_th_LAO(:,:,i) = Pt36_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt36_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt36_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt36_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt36_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt36_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt36_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt36_RPO_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt36_LAO_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;


end

%now take field medians
for i = 1:size(Pt36_LAO_stack_int_shift,3);
    im_med_RPO = Pt36_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt36_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt36_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt36_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end

%% PT 37

%Pt37_HU_av = -97.8; % 5mm
Pt37_HU_av = -100.71; % 10mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
[ha, pos] = tight_subplot(3,4,[.01 .01],[.0001 .0001],[.0001 0.01]);
figure(1) 
clf;
figure(2)
clf;
figure(101) 
clf;
figure(102)
clf;
for i = 1:size(Pt37_LAO_stack_int_shift,3)
    im_RPO = Pt37_RPO_stack_int_shift(:,:,i);
    im_LAO = Pt37_LAO_stack_int_shift(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.21*max4bin_LAO);
    Pt37_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt37_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt37_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt37_registered_tp_LAO.*binim_LAO;
    Pt37_Ckov_DoseNorm_th_RPO(:,:,i) = Pt37_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt37_Ckov_DoseNorm_th_LAO(:,:,i) = Pt37_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt37_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt37_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt37_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt37_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt37_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt37_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt37_RPO_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt37_LAO_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
end

%now take field medians
for i = 1:size(Pt37_LAO_stack_int_shift,3);
    im_med_RPO = Pt37_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt37_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt37_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt37_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end

%% PT 39

%Pt39_HU_av = -79.494; % 5mm
Pt39_HU_av = -90.478; % 10mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1)
clf;
figure(2)
clf;
figure(3)
clf;
figure(4)
clf;

figure(101)
clf;
figure(102)
clf;
figure(103)
clf;
figure(104)
clf;


[ha, pos] = tight_subplot(4,4,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt39_LAO_6X_stack_int_shift,3)
    im_RPO_6 = Pt39_RPO_6X_stack_int_shift(:,:,i);
    im_LAO_6 = Pt39_LAO_6X_stack_int_shift(:,:,i);
    im_RPO_10 = Pt39_RPO_10X_stack_int_shift(:,:,i);
    im_LAO_10 = Pt39_LAO_10X_stack_int_shift(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.21*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.21*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.21*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.21*max4bin_LAO_10);
    
    Pt39_im_th_RPO_6(:,:,i) = im_RPO_6.*binim_RPO_6;
    Pt39_im_th_LAO_6(:,:,i) = im_LAO_6.*binim_LAO_6;
    Pt39_im_th_RPO_10(:,:,i) = im_RPO_10.*binim_RPO_10;
    Pt39_im_th_LAO_10(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt39_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt39_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt39_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt39_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt39_Ckov_DoseNorm_th_RPO_6(:,:,i) = Pt39_im_th_RPO_6(:,:,i)./tp_th_RPO_6;
    Pt39_Ckov_DoseNorm_th_LAO_6(:,:,i) = Pt39_im_th_LAO_6(:,:,i)./tp_th_LAO_6;
    Pt39_Ckov_DoseNorm_th_RPO_10(:,:,i) = Pt39_im_th_RPO_10(:,:,i)./tp_th_RPO_10;
    Pt39_Ckov_DoseNorm_th_LAO_10(:,:,i) = Pt39_im_th_LAO_10(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt39_Ckov_DoseNorm_th_RPO_6(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt39_Ckov_DoseNorm_th_LAO_6(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt39_Ckov_DoseNorm_th_RPO_10(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt39_Ckov_DoseNorm_th_LAO_10(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt39_Ckov_DoseNorm_th_c_RPO_6(:,:,i) = dose_norm_im_RPO_6;
    Pt39_Ckov_DoseNorm_th_c_LAO_6(:,:,i) = dose_norm_im_LAO_6;
    Pt39_Ckov_DoseNorm_th_c_RPO_10(:,:,i) = dose_norm_im_RPO_10;
    Pt39_Ckov_DoseNorm_th_c_LAO_10(:,:,i) = dose_norm_im_LAO_10;
    
    figure(1)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt39_RPO_stack,3)/3), i)
    imagesc(Pt39_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt39_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt39_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt39_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
   
    figure(101)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt39_RPO_stack,3)/3), i)
    imagesc(Pt39_RPO_6X_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt39_LAO_6X_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(103)
    subplot('Position', pos{i})
    imagesc(Pt39_RPO_10X_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(104)
    subplot('Position', pos{i})
    imagesc(Pt39_LAO_10X_stack_int_shift(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
end

%now take field medians
for i = 1:size(Pt39_LAO_6X_stack_int_shift,3);
    im_med_RPO_6 = Pt39_Ckov_DoseNorm_th_c_RPO_6(:,:,i);
    im_med_LAO_6 = Pt39_Ckov_DoseNorm_th_c_LAO_6(:,:,i);
    im_med_RPO_10 = Pt39_Ckov_DoseNorm_th_c_RPO_10(:,:,i);
    im_med_LAO_10 = Pt39_Ckov_DoseNorm_th_c_LAO_10(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt39_median_ckov_dosenorm_field_RPO_6(i) = median(im_med_nonzero_RPO_6(:));
    Pt39_median_ckov_dosenorm_field_LAO_6(i) = median(im_med_nonzero_LAO_6(:));
    Pt39_median_ckov_dosenorm_field_RPO_10(i) = median(im_med_nonzero_RPO_10(:));
    Pt39_median_ckov_dosenorm_field_LAO_10(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end

%% PT 41

Pt41_HU_av = -118.421; % 10mm
%Pt41_HU_av = -123.139; % 5mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1)
clf;
figure(2)
clf;
figure(3)
clf;
figure(4)
clf; 
figure(101)
clf;
figure(102)
clf;
figure(103)
clf;
figure(104)
clf; axis off;

[ha, pos] = tight_subplot(5,4,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt41_RPO_6X_stack,3)
    im_RPO_6 = Pt41_RPO_6X_stack(:,:,i);
    im_LAO_6 = Pt41_LAO_6X_stack(:,:,i);
    im_RPO_10 = Pt41_RPO_10X_stack(:,:,i);
    im_LAO_10 = Pt41_LAO_10X_stack(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.21*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.21*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.21*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.21*max4bin_LAO_10);
    
    Pt41_im_th_RPO_6(:,:,i) = im_RPO_6.*binim_RPO_6;
    Pt41_im_th_LAO_6(:,:,i) = im_LAO_6.*binim_LAO_6;
    Pt41_im_th_RPO_10(:,:,i) = im_RPO_10.*binim_RPO_10;
    Pt41_im_th_LAO_10(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt41_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt41_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt41_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt41_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt41_Ckov_DoseNorm_th_RPO_6(:,:,i) = Pt41_im_th_RPO_6(:,:,i)./tp_th_RPO_6;
    Pt41_Ckov_DoseNorm_th_LAO_6(:,:,i) = Pt41_im_th_LAO_6(:,:,i)./tp_th_LAO_6;
    Pt41_Ckov_DoseNorm_th_RPO_10(:,:,i) = Pt41_im_th_RPO_10(:,:,i)./tp_th_RPO_10;
    Pt41_Ckov_DoseNorm_th_LAO_10(:,:,i) = Pt41_im_th_LAO_10(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt41_Ckov_DoseNorm_th_RPO_6(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt41_Ckov_DoseNorm_th_LAO_6(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt41_Ckov_DoseNorm_th_RPO_10(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt41_Ckov_DoseNorm_th_LAO_10(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt41_Ckov_DoseNorm_th_c_RPO_6(:,:,i) = dose_norm_im_RPO_6;
    Pt41_Ckov_DoseNorm_th_c_LAO_6(:,:,i) = dose_norm_im_LAO_6;
    Pt41_Ckov_DoseNorm_th_c_RPO_10(:,:,i) = dose_norm_im_RPO_10;
    Pt41_Ckov_DoseNorm_th_c_LAO_10(:,:,i) = dose_norm_im_LAO_10;
    
    figure(1)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt41_RPO_stack,3)/3), i)
    imagesc(Pt41_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt41_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt41_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt41_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt41_RPO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt41_LAO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(103)
    subplot('Position', pos{i})
    imagesc(Pt41_RPO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(104)
    subplot('Position', pos{i})
    imagesc(Pt41_LAO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;

end

%now take field medians
for i = 1:size(Pt41_RPO_6X_stack,3);
    im_med_RPO_6 = Pt41_Ckov_DoseNorm_th_c_RPO_6(:,:,i);
    im_med_LAO_6 = Pt41_Ckov_DoseNorm_th_c_LAO_6(:,:,i);
    im_med_RPO_10 = Pt41_Ckov_DoseNorm_th_c_RPO_10(:,:,i);
    im_med_LAO_10 = Pt41_Ckov_DoseNorm_th_c_LAO_10(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt41_median_ckov_dosenorm_field_RPO_6(i) = median(im_med_nonzero_RPO_6(:));
    Pt41_median_ckov_dosenorm_field_LAO_6(i) = median(im_med_nonzero_LAO_6(:));
    Pt41_median_ckov_dosenorm_field_RPO_10(i) = median(im_med_nonzero_RPO_10(:));
    Pt41_median_ckov_dosenorm_field_LAO_10(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end



%NOW READING IN ONLY ACQUISITIONS WITH REFLECTANCE
cmap = inferno(2.^16);
figure(1)
clf;
figure(2)
clf;
figure(3)
clf;
figure(4)
clf;
figure(5)
clf; 
[ha, pos] = tight_subplot(3,3,[.01 .01],[.0001 .0001],[.0001 0.01]);
Pt41_RPO_6X_stack_wART = Pt41_RPO_6X_stack(:,:,[6 8 9 13 14 15 16 17]);
Pt41_LAO_6X_stack_wART = Pt41_LAO_6X_stack(:,:,[6 8 9 13 14 15 16 17]);
Pt41_RPO_10X_stack_wART = Pt41_RPO_10X_stack(:,:,[6 8 9 13 14 15 16 17]);
Pt41_LAO_10X_stack_wART = Pt41_LAO_10X_stack(:,:,[6 8 9 13 14 15 16 17]);
clear im_RPO_6 im_LAO_6 im_RPO_10 im_LAO_10
clear im_th_RPO_6 im_th_RPO_10 im_th_LAO_6 im_th_LAO_10
clear dose_norm_im_RPO_6 dose_norm_im_RPO_10 dose_norm_im_LAO_6 dose_norm_im_LAO_10
for i = 1:size(Pt41_Ckov_RPO_6X_w_ART_stack,3)
    im_RPO_6 = Pt41_Ckov_RPO_6X_w_ART_stack(:,:,i);
    im_LAO_6 = Pt41_Ckov_LAO_6X_w_ART_stack(:,:,i);
    im_RPO_10 = Pt41_Ckov_RPO_10X_w_ART_stack(:,:,i);
    im_LAO_10 = Pt41_Ckov_LAO_10X_w_ART_stack(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.21*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.21*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.21*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.21*max4bin_LAO_10);
    
    Pt41_im_th_RPO_6_wART(:,:,i) = im_RPO_6.*binim_RPO_6;
    Pt41_im_th_LAO_6_wART(:,:,i) = im_LAO_6.*binim_LAO_6;
    Pt41_im_th_RPO_10_wART(:,:,i) = im_RPO_10.*binim_RPO_10;
    Pt41_im_th_LAO_10_wART(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt41_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt41_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt41_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt41_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt41_Ckov_DoseNorm_th_RPO_6_wART(:,:,i) = Pt41_im_th_RPO_6_wART(:,:,i)./tp_th_RPO_6;
    Pt41_Ckov_DoseNorm_th_LAO_6_wART(:,:,i) = Pt41_im_th_LAO_6_wART(:,:,i)./tp_th_LAO_6;
    Pt41_Ckov_DoseNorm_th_RPO_10_wART(:,:,i) = Pt41_im_th_RPO_10_wART(:,:,i)./tp_th_RPO_10;
    Pt41_Ckov_DoseNorm_th_LAO_10_wART(:,:,i) = Pt41_im_th_LAO_10_wART(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt41_Ckov_DoseNorm_th_RPO_6_wART(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt41_Ckov_DoseNorm_th_LAO_6_wART(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt41_Ckov_DoseNorm_th_RPO_10_wART(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt41_Ckov_DoseNorm_th_LAO_10_wART(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt41_Ckov_DoseNorm_th_c_RPO_6_wART(:,:,i) = dose_norm_im_RPO_6;
    Pt41_Ckov_DoseNorm_th_c_LAO_6_wART(:,:,i) = dose_norm_im_LAO_6;
    Pt41_Ckov_DoseNorm_th_c_RPO_10_wART(:,:,i) = dose_norm_im_RPO_10;
    Pt41_Ckov_DoseNorm_th_c_LAO_10_wART(:,:,i) = dose_norm_im_LAO_10;
    
    im_ART = Pt41_ART_BKSub_stack(:,:,i).*binim_RPO_10;
    Pt41_im_th_ART(:,:,i) = im_ART;
    Pt41_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt41_median_ART(i) = median(im_ART(im_ART~=0));
    
%     figure(1)
%     subplot('Position', pos{i})
%     imagesc(Pt41_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
%     figure(2)
%     subplot('Position', pos{i})
%     imagesc(Pt41_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
%     figure(3)
%     subplot('Position', pos{i})
%     imagesc(Pt41_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
%     figure(4)
%     subplot('Position', pos{i})
%     imagesc(Pt41_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(105)
    subplot('Position', pos{i})
    imagesc(Pt41_im_th_ART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e5]); %colorbar;

end

%now take field medians
for i = 1:size(Pt41_ART_BKSub_stack,3);
    im_med_RPO_6 = Pt41_Ckov_DoseNorm_th_c_RPO_6(:,:,i);
    im_med_LAO_6 = Pt41_Ckov_DoseNorm_th_c_LAO_6(:,:,i);
    im_med_RPO_10 = Pt41_Ckov_DoseNorm_th_c_RPO_10(:,:,i);
    im_med_LAO_10 = Pt41_Ckov_DoseNorm_th_c_LAO_10(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt41_median_ckov_dosenorm_field_RPO_6_wART(i) = median(im_med_nonzero_RPO_6(:));
    Pt41_median_ckov_dosenorm_field_LAO_6_wART(i) = median(im_med_nonzero_LAO_6(:));
    Pt41_median_ckov_dosenorm_field_RPO_10_wART(i) = median(im_med_nonzero_RPO_10(:));
    Pt41_median_ckov_dosenorm_field_LAO_10_wART(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end


%% PT 44

Pt44_HU_av = -68.810; % 10mm
%Pt44_HU_av = -77.034; % 5mm

cmap = inferno(2.^16);
[ha, pos] = tight_subplot(3,4,[.01 .01],[.0001 .0001],[.0001 0.01]);
figure(1) 
clf;
figure(2)
clf;
figure(105)
clf;

for i = 1:size(Pt44_Ckov_RPO_stack,3)
    im_RPO = Pt44_Ckov_RPO_stack(:,:,i);
    im_LAO = Pt44_Ckov_LAO_stack(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.21*max4bin_LAO);
    Pt44_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt44_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt44_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt44_registered_tp_LAO.*binim_LAO;
    Pt44_Ckov_DoseNorm_th_RPO(:,:,i) = Pt44_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt44_Ckov_DoseNorm_th_LAO(:,:,i) = Pt44_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt44_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt44_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt44_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt44_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    
    im_ART = Pt44_ART_BKSub_stack(:,:,i).*binim_RPO;
    Pt44_im_th_ART(:,:,i) = im_ART;
    Pt44_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt44_median_ART(i) = median(im_ART(im_ART~=0));
    
    
    figure(1)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt44_RPO_stack,3)/3), i)
    imagesc(Pt44_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt44_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt44_im_th_ART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e5]); %colorbar;
 
end

%now take field medians
for i = 1:size(Pt44_Ckov_RPO_stack,3);
    im_med_RPO = Pt44_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt44_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt44_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt44_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end





%% PT 45

Pt45_HU_av = -101.257; % 10mm
%Pt45_HU_av = -98.861; % 5mm

%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1)
clf;
figure(2)
clf;
figure(3)
clf;
figure(4)
clf;

figure(101)
clf;
figure(102)
clf;
figure(103)
clf;
figure(104)
clf;


figure(105)
clf;
[ha, pos] = tight_subplot(3,3,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt45_RPO_6X_stack,3)
    im_RPO_6 = Pt45_RPO_6X_stack(:,:,i);
    im_LAO_6 = Pt45_LAO_6X_stack(:,:,i);
    im_RPO_10 = Pt45_RPO_10X_stack(:,:,i);
    im_LAO_10 = Pt45_LAO_10X_stack(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.21*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.21*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.21*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.21*max4bin_LAO_10);
    
    Pt45_im_th_RPO_6(:,:,i) = im_RPO_6.*binim_RPO_6;
    Pt45_im_th_LAO_6(:,:,i) = im_LAO_6.*binim_LAO_6;
    Pt45_im_th_RPO_10(:,:,i) = im_RPO_10.*binim_RPO_10;
    Pt45_im_th_LAO_10(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt45_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt45_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt45_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt45_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt45_Ckov_DoseNorm_th_RPO_6(:,:,i) = Pt45_im_th_RPO_6(:,:,i)./tp_th_RPO_6;
    Pt45_Ckov_DoseNorm_th_LAO_6(:,:,i) = Pt45_im_th_LAO_6(:,:,i)./tp_th_LAO_6;
    Pt45_Ckov_DoseNorm_th_RPO_10(:,:,i) = Pt45_im_th_RPO_10(:,:,i)./tp_th_RPO_10;
    Pt45_Ckov_DoseNorm_th_LAO_10(:,:,i) = Pt45_im_th_LAO_10(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt45_Ckov_DoseNorm_th_RPO_6(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt45_Ckov_DoseNorm_th_LAO_6(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt45_Ckov_DoseNorm_th_RPO_10(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt45_Ckov_DoseNorm_th_LAO_10(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt45_Ckov_DoseNorm_th_c_RPO_6(:,:,i) = dose_norm_im_RPO_6;
    Pt45_Ckov_DoseNorm_th_c_LAO_6(:,:,i) = dose_norm_im_LAO_6;
    Pt45_Ckov_DoseNorm_th_c_RPO_10(:,:,i) = dose_norm_im_RPO_10;
    Pt45_Ckov_DoseNorm_th_c_LAO_10(:,:,i) = dose_norm_im_LAO_10;
    
    im_ART = Pt45_art_bksub_stack(:,:,i).*binim_LAO_10;
    Pt45_im_th_ART(:,:,i) = im_ART;
    Pt45_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt45_median_ART(i) = median(im_ART(im_ART~=0));
    
    
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt45_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt45_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt45_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt45_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt45_RPO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt45_LAO_6X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(103)
    subplot('Position', pos{i})
    imagesc(Pt45_RPO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(104)
    subplot('Position', pos{i})
    imagesc(Pt45_LAO_10X_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    
    figure(105)
    subplot('Position', pos{i})
    imagesc(Pt45_im_th_ART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e5]); %colorbar;

end



%now take field medians
for i = 1:size(Pt45_RPO_6X_stack,3);
    im_med_RPO_6 = Pt45_Ckov_DoseNorm_th_c_RPO_6(:,:,i);
    im_med_LAO_6 = Pt45_Ckov_DoseNorm_th_c_LAO_6(:,:,i);
    im_med_RPO_10 = Pt45_Ckov_DoseNorm_th_c_RPO_10(:,:,i);
    im_med_LAO_10 = Pt45_Ckov_DoseNorm_th_c_LAO_10(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt45_median_ckov_dosenorm_field_RPO_6(i) = median(im_med_nonzero_RPO_6(:));
    Pt45_median_ckov_dosenorm_field_LAO_6(i) = median(im_med_nonzero_LAO_6(:));
    Pt45_median_ckov_dosenorm_field_RPO_10(i) = median(im_med_nonzero_RPO_10(:));
    Pt45_median_ckov_dosenorm_field_LAO_10(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end




%% PT 56

Pt56_HU_av = -53.36; % 10mm
%Pt56_HU_av = -60.36; % 5mm
  
cmap = inferno(2.^16);
[ha, pos] = tight_subplot(2,2,[.01 .01],[.0001 .0001],[.0001 0.01]);
figure(1) 
clf;
figure(2) 
clf;
figure(3)
clf;

for i = 1:size(Pt56_RPO_stack,3)
    im_RPO = Pt56_RPO_stack(:,:,i);
    im_LAO = Pt56_LAO_stack(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.15*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.15*max4bin_LAO);
    Pt56_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt56_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt56_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt56_registered_tp_LAO.*binim_LAO;
    Pt56_Ckov_DoseNorm_th_RPO(:,:,i) = Pt56_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt56_Ckov_DoseNorm_th_LAO(:,:,i) = Pt56_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt56_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt56_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt56_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt56_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    
    im_ART = Pt56_ART_BKSub_stack(:,:,i).*binim_RPO;
    Pt56_im_th_ART(:,:,i) = im_ART;
    Pt56_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt56_median_ART(i) = median(im_ART(im_ART~=0));
    
    
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt56_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt56_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt56_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt56_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(105)
    subplot('Position', pos{i})
    imagesc(Pt56_im_th_ART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e5]); %colorbar;
 
end
% 
% Pt56_ART_BKSub_stack2 = Pt56_ART_BKSub_stack(:,:,2:end);
% Pt56_ART_BKSub_stack = Pt56_ART_BKSub_stack2;
% save('Pt56_ART_BKSub_stack.mat', 'Pt56_ART_BKSub_stack')

% Pt56_RPO_stack = Pt56_RPO_stack(:,:,2:end);
% save('Pt56_RPO_stack.mat', 'Pt56_RPO_stack')
% 
% Pt56_LAO_stack = Pt56_LAO_stack(:,:,2:end);
% save('Pt56_LAO_stack.mat', 'Pt56_LAO_stack')

%now take field medians
for i = 1:size(Pt56_RPO_stack,3);
    im_med_RPO = Pt56_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt56_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt56_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt56_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end

%% PT 58

Pt58_HU_av = -93.684; % 10mm
%Pt58_HU_av = -104.475; % 5mm

%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
[ha, pos] = tight_subplot(2,5,[.01 .01],[.0001 .0001],[.0001 0.01]);
figure(1) 
clf;
figure(2)
clf;
figure(3)
clf;

for i = 1:size(Pt58_RPO_stack,3)
    im_RPO = Pt58_RPO_stack(:,:,i);
    im_LAO = Pt58_LAO_stack(:,:,i);
    max4bin_RPO = max(im_RPO(:));
    max4bin_LAO = max(im_LAO(:));
    binim_RPO = imbinarize(im_RPO, 0.21*max4bin_RPO);
    binim_LAO = imbinarize(im_LAO, 0.15*max4bin_LAO);
    Pt58_im_th_RPO(:,:,i) = im_RPO.*binim_RPO;
    Pt58_im_th_LAO(:,:,i) = im_LAO.*binim_LAO;
    tp_th_RPO = Pt58_registered_tp_RPO.*binim_RPO;
    tp_th_LAO = Pt58_registered_tp_LAO.*binim_LAO;
    Pt58_Ckov_DoseNorm_th_RPO(:,:,i) = Pt58_im_th_RPO(:,:,i)./tp_th_RPO;
    Pt58_Ckov_DoseNorm_th_LAO(:,:,i) = Pt58_im_th_LAO(:,:,i)./tp_th_LAO;
    dose_norm_im_RPO = Pt58_Ckov_DoseNorm_th_RPO(:,:,i);
    dose_norm_im_RPO(dose_norm_im_RPO == Inf) = 0;
    dose_norm_im_LAO = Pt58_Ckov_DoseNorm_th_LAO(:,:,i);
    dose_norm_im_LAO(dose_norm_im_LAO == Inf) = 0;
    
    Pt58_Ckov_DoseNorm_th_c_RPO(:,:,i) = dose_norm_im_RPO;
    Pt58_Ckov_DoseNorm_th_c_LAO(:,:,i) = dose_norm_im_LAO;
    
    im_ART = Pt58_ART_BKSub_stack(:,:,i).*binim_RPO;
    Pt58_im_th_ART(:,:,i) = im_ART;
    Pt58_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt58_median_ART(i) = median(im_ART(im_ART~=0));
    
    
    figure(1)
    subplot('Position', pos{i})
    imagesc(Pt58_Ckov_DoseNorm_th_c_RPO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt58_Ckov_DoseNorm_th_c_LAO(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    figure(101)
    subplot('Position', pos{i})
    imagesc(Pt58_RPO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(102)
    subplot('Position', pos{i})
    imagesc(Pt58_LAO_stack(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    
    
    figure(105)
    subplot('Position', pos{i})
    imagesc(Pt58_im_th_ART(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e5]); %colorbar;
 
end

%now take field medians
for i = 1:size(Pt58_RPO_stack,3);
    im_med_RPO = Pt58_Ckov_DoseNorm_th_c_RPO(:,:,i);
    im_med_LAO = Pt58_Ckov_DoseNorm_th_c_LAO(:,:,i);
    %first need to isolate all NaN's and make them 0's
    im_med_RPO(isnan(im_med_RPO)) = 0;
    im_med_LAO(isnan(im_med_LAO)) = 0;
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO= im_med_RPO(im_med_RPO~=0);
    im_med_nonzero_LAO= im_med_LAO(im_med_LAO~=0);
    Pt58_median_ckov_dosenorm_field_RPO(i) = median(im_med_nonzero_RPO(:));
    Pt58_median_ckov_dosenorm_field_LAO(i) = median(im_med_nonzero_LAO(:));
    clear median im_med_nonzero im_med 
end

% save('Pt58_median_ckov_dosenorm_field_RPO.mat', 'Pt58_median_ckov_dosenorm_field_RPO')
% save('Pt58_median_ckov_dosenorm_field_LAO.mat', 'Pt58_median_ckov_dosenorm_field_LAO')
% save('Pt58_median_ART.mat', 'Pt58_median_ART')

%% PT 59

Pt59_HU_av = -83.64; % 10mm
%Pt59_HU_av = -84.567; % 5mm


%may need to look into exploring the Cherenkov dependence per HU of
%multiple patients.  
cmap = inferno(2.^16);
figure(1)
clf;
figure(2)
clf;
figure(3)
clf;
figure(4)
clf; axis off;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.0001 .0001],[.0001 0.01]);
for i = 1:size(Pt59_RPO_6X_stack,3)
    im_RPO_6 = Pt59_RPO_6X_stack(:,:,i);
    im_LAO_6 = Pt59_LAO_6X_stack(:,:,i);
    im_RPO_10 = Pt59_RPO_10X_stack(:,:,i);
    im_LAO_10 = Pt59_LAO_10X_stack(:,:,i);
    
    max4bin_RPO_6 = max(im_RPO_6(:));
    max4bin_LAO_6 = max(im_LAO_6(:));
    max4bin_RPO_10 = max(im_RPO_10(:));
    max4bin_LAO_10 = max(im_LAO_10(:));
    
    binim_RPO_6 = imbinarize(im_RPO_6, 0.21*max4bin_RPO_6);
    binim_LAO_6 = imbinarize(im_LAO_6, 0.21*max4bin_LAO_6);
    binim_RPO_10 = imbinarize(im_RPO_10, 0.21*max4bin_RPO_10);
    binim_LAO_10 = imbinarize(im_LAO_10, 0.21*max4bin_LAO_10);
    
    Pt59_im_th_RPO_6(:,:,i) = im_RPO_6.*binim_RPO_6;
    Pt59_im_th_LAO_6(:,:,i) = im_LAO_6.*binim_LAO_6;
    Pt59_im_th_RPO_10(:,:,i) = im_RPO_10.*binim_RPO_10;
    Pt59_im_th_LAO_10(:,:,i) = im_LAO_10.*binim_LAO_10;
    
    tp_th_RPO_6 = Pt59_registered_tp_RPO_6.*binim_RPO_6;
    tp_th_LAO_6 = Pt59_registered_tp_LAO_6.*binim_LAO_6;
    tp_th_RPO_10 = Pt59_registered_tp_RPO_10.*binim_RPO_10;
    tp_th_LAO_10 = Pt59_registered_tp_LAO_10.*binim_LAO_10;
    
    Pt59_Ckov_DoseNorm_th_RPO_6(:,:,i) = Pt59_im_th_RPO_6(:,:,i)./tp_th_RPO_6;
    Pt59_Ckov_DoseNorm_th_LAO_6(:,:,i) = Pt59_im_th_LAO_6(:,:,i)./tp_th_LAO_6;
    Pt59_Ckov_DoseNorm_th_RPO_10(:,:,i) = Pt59_im_th_RPO_10(:,:,i)./tp_th_RPO_10;
    Pt59_Ckov_DoseNorm_th_LAO_10(:,:,i) = Pt59_im_th_LAO_10(:,:,i)./tp_th_LAO_10;
    
    dose_norm_im_RPO_6 = Pt59_Ckov_DoseNorm_th_RPO_6(:,:,i);
    dose_norm_im_RPO_6(dose_norm_im_RPO_6 == Inf) = 0;
    
    dose_norm_im_LAO_6 = Pt59_Ckov_DoseNorm_th_LAO_6(:,:,i);
    dose_norm_im_LAO_6(dose_norm_im_LAO_6 == Inf) = 0;
    
    dose_norm_im_RPO_10 = Pt59_Ckov_DoseNorm_th_RPO_10(:,:,i);
    dose_norm_im_RPO_10(dose_norm_im_RPO_10 == Inf) = 0;
    
    dose_norm_im_LAO_10 = Pt59_Ckov_DoseNorm_th_LAO_10(:,:,i);
    dose_norm_im_LAO_10(dose_norm_im_LAO_10 == Inf) = 0;
    
    Pt59_Ckov_DoseNorm_th_c_RPO_6(:,:,i) = dose_norm_im_RPO_6;
    Pt59_Ckov_DoseNorm_th_c_LAO_6(:,:,i) = dose_norm_im_LAO_6;
    Pt59_Ckov_DoseNorm_th_c_RPO_10(:,:,i) = dose_norm_im_RPO_10;
    Pt59_Ckov_DoseNorm_th_c_LAO_10(:,:,i) = dose_norm_im_LAO_10;
    
    im_ART = Pt59_ART_BKSub_stack(:,:,i).*binim_LAO_10;
    Pt59_im_th_ART(:,:,i) = im_ART;
    Pt59_mean_ART(i) = mean(im_ART(im_ART~=0));
    Pt59_median_ART(i) = median(im_ART(im_ART~=0));
    
    figure(1)
    subplot('Position', pos{i})
    %subplot(3, ceil(size(Pt59_RPO_stack,3)/3), i)
    imagesc(Pt59_Ckov_DoseNorm_th_c_RPO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(2)
    subplot('Position', pos{i})
    imagesc(Pt59_Ckov_DoseNorm_th_c_LAO_6(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(3)
    subplot('Position', pos{i})
    imagesc(Pt59_Ckov_DoseNorm_th_c_RPO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
    figure(4)
    subplot('Position', pos{i})
    imagesc(Pt59_Ckov_DoseNorm_th_c_LAO_10(:,:,i)); axis image; axis off; colormap(cmap); caxis([0 5.5e4]); %colorbar;
end

%now take field medians
for i = 1:size(Pt59_RPO_6X_stack,3);
    im_med_RPO_6 = Pt59_Ckov_DoseNorm_th_c_RPO_6(:,:,i);
    im_med_LAO_6 = Pt59_Ckov_DoseNorm_th_c_LAO_6(:,:,i);
    im_med_RPO_10 = Pt59_Ckov_DoseNorm_th_c_RPO_10(:,:,i);
    im_med_LAO_10 = Pt59_Ckov_DoseNorm_th_c_LAO_10(:,:,i);
    
    %first need to isolate all NaN's and make them 0's
    im_med_RPO_6(isnan(im_med_RPO_6)) = 0;
    im_med_LAO_6(isnan(im_med_LAO_6)) = 0;
    im_med_RPO_10(isnan(im_med_RPO_10)) = 0;
    im_med_LAO_10(isnan(im_med_LAO_10)) = 0;
    
    %then take all zeros and make sure they're not accounted for in the
    %median.
    im_med_nonzero_RPO_6 = im_med_RPO_6(im_med_RPO_6~=0);
    im_med_nonzero_LAO_6 = im_med_LAO_6(im_med_LAO_6~=0);
    im_med_nonzero_RPO_10 = im_med_RPO_10(im_med_RPO_10~=0);
    im_med_nonzero_LAO_10 = im_med_LAO_10(im_med_LAO_10~=0);
    Pt59_median_ckov_dosenorm_field_RPO_6(i) = median(im_med_nonzero_RPO_6(:));
    Pt59_median_ckov_dosenorm_field_LAO_6(i) = median(im_med_nonzero_LAO_6(:));
    Pt59_median_ckov_dosenorm_field_RPO_10(i) = median(im_med_nonzero_RPO_10(:));
    Pt59_median_ckov_dosenorm_field_LAO_10(i) = median(im_med_nonzero_LAO_10(:));
    clear median im_med_nonzero im_med 
end


