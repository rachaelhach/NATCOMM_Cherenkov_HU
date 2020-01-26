%% List the HU of the various phantom wells. 
HU_Cal_array = [-174.3 -138.2 -118.2 -75.8 -56.3, -41.0 -34.9 -12.9];

%% read in the checkerboard and transform the images
% registration for tp images 
cd('E:\Exp82_HUCal\checkerboard\2020-01-10 18-03-36-828')

im_checker = read_dovi('meas_s0_cam0.dovi');
im_check = sum(im_checker,3);
im_ch = uint8(double(im_checker)/2500 * 256);
imagesc(im_check)
h=imfreehand();
mask = createMask(h);
close
im_check2 = medfilt2(im_check.*mask, [5 5]);
[imagePoints,boardSize] = detectCheckerboardPoints(im_check2);
%[xpts ypts] = getpts();
xpts = imagePoints(:,1); ypts = imagePoints(:,2);
x_vect = (69/30).*[6 3 0 -3 -6]*100;
y_vect = (69/30).*[-7.5 -4.5 -1.5 1.5 4.5 7.5]*100;
[x_mat, y_mat] = meshgrid(x_vect, y_vect);
x_mat_t = x_mat';
y_mat_t = y_mat';
loc_real = [x_mat_t(:), y_mat_t(:)];
tform = fitgeotrans([xpts ypts], loc_real, 'projective');
figure(3)
imagesc(im_check2);
hold on;
line(xpts, ypts);
hold off;
figure(2)
It = imwarp(im_check2, tform);
imagesc(It)
%save('tf_matrix.mat', 'tform');

%scaling
tform.T(3,3) = 10;

%% Read in the image and transform the image
% 200 MU
cd('E:\Exp82_HUCal\2020-01-10 17-59-01-844')
HU_cal_im = sum(read_dovi('meas_s1_cam0.dovi'),3);
HU_cal_im_t = imwarp(HU_cal_im, tform);
figure(10);
imagesc(HU_cal_im_t); caxis([5e3 4e4]);

%take eight ROI's for only the wells with eat in them. 
for i = 1:8 
    figure(10);
    imagesc(HU_cal_im_t); caxis([5e3 4e4]);
    h = imellipse();
    m = createMask(h);
    close
    roi = HU_cal_im_t.*m;
    HU_cal_ckov_mean(i) = mean(mean(roi(roi~=0)));
    clear roi m 
end

%% read in the dose image
cd('E:\Exp82_HUCal\TPS_HUcal2');
HUcal_dose_im = sum(imread('screenshot.png'),3);
%crop out the legend
figure(20)
imagesc(HUcal_dose_im)
h = imfreehand();
m2 = createMask(h);
close
HUcal_dose_im_m = imresize(m2.*HUcal_dose_im, size(HU_cal_im));
HU_cal_dose_im_t = imwarp(HUcal_dose_im_m, tform);
%second mask
figure(21)
imagesc(HU_cal_dose_im_t);
h = imfreehand();
m3 = createMask(h);
HU_cal_dose_im_t2 = m3.*HU_cal_dose_im_t;
imagesc(HU_cal_dose_im_t2)
maxdose = 2.29; %Gy
HU_cal_dose_im_t2_dn = (HU_cal_dose_im_t2./max(HU_cal_dose_im_t2(:))).*maxdose;

% or just take the roi's
 figure(10);
for i = 1:8 
    figure(10);
    imagesc(HU_cal_dose_im_t2_dn); %caxis([5e3 4e4]);
    h = imellipse();
    m = createMask(h);
    close
    roi = HU_cal_dose_im_t2_dn.*m;
    HU_cal_dose_mean(i) = mean(mean(roi(roi~=0)));
    clear roi m 
end

figure(12)
clf
[fit_obj_hu_ckov_cal gof_hu_ckov_cal] = fit(HU_Cal_array',...
    (HU_cal_ckov_mean./HU_cal_dose_mean)', 'poly1')
xspace = [-200:0.1:0];
HUCKOV_yspace = fit_obj_hu_ckov_cal.p1.*xspace + fit_obj_hu_ckov_cal.p2;
plot(xspace, HUCKOV_yspace, 'LineWidth', 3)
hold on 
sterr_HUcal = gof_hu_ckov_cal.rmse;
e = errorbar(HU_Cal_array',...
    (HU_cal_ckov_mean./HU_cal_dose_mean)', repmat(sterr_HUcal,...
    [1 length(HU_Cal_array)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkGray');

scatter(HU_Cal_array, (HU_cal_ckov_mean./HU_cal_dose_mean), 150, 'black', 'filled',...
    'MarkerFaceAlpha', 0.7, 'MarkerEdgeAlpha', 1);
ax = gca;
ax.FontSize = 20;
xlabel('Radiodensity (HU)')
ylabel('Cherenkov/Dose (cts/Gy)')


[r_HUcal p_HUcal] = corrcoef(HU_Cal_array',...
    (HU_cal_ckov_mean./HU_cal_dose_mean))

    

