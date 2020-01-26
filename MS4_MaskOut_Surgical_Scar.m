% create a mask for Pt45
figure(100)
clf;
[ha, pos] = tight_subplot(2,4,[.002 .002],[.1 .1],[.03 .03]);
figure(101)
clf;
[ha, pos] = tight_subplot(2,4,[.002 .002],[.1 .1],[.03 .03]);

figure(105)
imagesc(Pt45_LAO_6X_stack(:,:,1) + Pt45_LAO_10X_stack(:,:,1) + Pt45_RPO_6X_stack(:,:,1) + Pt45_RPO_10X_stack(:,:,1));
colormap(cmap); axis image; axis off;
h = imfreehand();
m_45_thresh_h = createMask(h);
close
for i = 1:size(Pt45_LAO_10X_stack,3)
    im_total = Pt45_LAO_6X_stack(:,:,i) + Pt45_LAO_10X_stack(:,:,i) +...
        Pt45_RPO_6X_stack(:,:,i) + Pt45_RPO_10X_stack(:,:,i);
    max_im_total = max(im_total(:));
    m_45_thresh_l = imbinarize(im_total, 0.21.*max_im_total);
    
    Pt45_highthresh_masked(:,:,i) = im_total.*imcomplement(m_45_thresh_h).*m_45_thresh_l;
    im_h = im_total.*imcomplement(m_45_thresh_h).*m_45_thresh_l;
    Pt45_median_highthresh(i) = median(im_h(im_h~=0));
    
    Pt45_lowthresh_masked(:,:,i) = im_total.*m_45_thresh_l;
    im_l = im_total.*m_45_thresh_l;
    Pt45_median_lowthresh(i) = median(im_l(im_l~=0));
    
    figure(100)
    subplot('position', pos{i})
    imagesc(Pt45_lowthresh_masked(:,:,i)); colormap(cmap); axis image; axis off; caxis([0 1.3e5]);
    
    figure(101)
    subplot('position', pos{i})
    imagesc(Pt45_highthresh_masked(:,:,i)); colormap(cmap); axis image; axis off; caxis([0 1.3e5]);
    
    Pt45_thresh_difference(i) =(Pt45_median_highthresh(i) - Pt45_median_lowthresh(i))./Pt45_median_lowthresh(i); 
end
