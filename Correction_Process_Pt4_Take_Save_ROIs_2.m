%%
% %TAKING ROIS

%PT 30
cmap = inferno(2.^16);
clear Pt30_ROI
for j = 1:7
    figure(250)
    imagesc(Pt30_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt30_ROI(:,:,j) = createMask(h);
    clf
end
 
%PT 31
cmap = inferno(2.^16);
clear Pt31_ROI
for j = 1:3
    figure(250)
    imagesc(Pt31_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt31_ROI(:,:,j) = createMask(h);
    clf
end


%PT 32
cmap = inferno(2.^16);
clear Pt32_ROI
for j = 1:3
    figure(250)
    imagesc(Pt32_im_th_RPO_6(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt32_ROI(:,:,j) = createMask(h);
    clf
end


%PT 35
cmap = inferno(2.^16);
clear Pt35_ROI
for j = 1:4
    figure(250)
    imagesc(Pt35_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt35_ROI(:,:,j) = createMask(h);
    clf
end


%PT 36
cmap = inferno(2.^16);
clear Pt36_ROI
for j = 1:4
    figure(250)
    imagesc(Pt36_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt36_ROI(:,:,j) = createMask(h);
    clf
end

%PT 37
cmap = inferno(2.^16);
clear Pt37_ROI
for j = 1:3
    figure(250)
    imagesc(Pt37_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt37_ROI(:,:,j) = createMask(h);
    clf
end


%PT 39
cmap = inferno(2.^16);
clear Pt39_ROI
for j = 1:2
    figure(250)
    imagesc(Pt39_im_th_RPO_6(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt39_ROI(:,:,j) = createMask(h);
    clf
end


%PT 41
cmap = inferno(2.^16);
clear Pt41_ROI
for j = 1:2
    figure(250)
    imagesc(Pt41_im_th_RPO_6(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt41_ROI(:,:,j) = createMask(h);
    clf
end


%PT 44
cmap = inferno(2.^16);
clear Pt44_ROI
for j = 1:3
    figure(250)
    imagesc(Pt44_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt44_ROI(:,:,j) = createMask(h);
    clf
end


%PT 45
cmap = inferno(2.^16);
clear Pt45_ROI
for j = 1:6
    figure(250)
    imagesc(Pt45_im_th_RPO_6(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt45_ROI(:,:,j) = createMask(h);
    clf
end

%PT 56
cmap = inferno(2.^16);
clear Pt56_ROI
for j = 1:7
    figure(250)
    imagesc(Pt56_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt56_ROI(:,:,j) = createMask(h);
    clf
end

%PT 58
cmap = inferno(2.^16);
clear Pt58_ROI
for j = 1:4
    figure(250)
    imagesc(Pt58_im_th_RPO(:,:,2)); caxis([0 5e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt58_ROI(:,:,j) = createMask(h);
    clf
end


%PT 59
cmap = inferno(2.^16);
clear Pt59_ROI
for j = 1:14
    figure(250)
    imagesc(Pt59_im_th_RPO_6(:,:,2)); caxis([0 2e4]); colormap(cmap); axis off; axis image;
    h = imellipse();
    Pt59_ROI(:,:,j) = createMask(h);
    clf
end


