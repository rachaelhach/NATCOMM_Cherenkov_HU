%% CORRECTION PROCESS PT 2: EMPLOY ANATOMICAL CORRECTIONS

%% %% EXP 71-X DEPLOY ANATOMICAL CORRECTIONS
%Using correction factor constant scheme.
figure(100)
clf
[ha, pos] = tight_subplot(1, 2,[.09 .07],[.16 .08],[.08 .03]);
subplot('Position', pos{1})

%write arrays and establish fits
clear HU array ckov_array_RPO_6X
HU_array = [Pt30_HU_av Pt31_HU_av Pt32_HU_av Pt35_HU_av Pt36_HU_av...
    Pt37_HU_av Pt39_HU_av Pt41_HU_av,...
    Pt44_HU_av, Pt45_HU_av, Pt56_HU_av, Pt58_HU_av, Pt59_HU_av];
ckov_array_RPO_6X = [mean(Pt30_median_ckov_dosenorm_field_RPO(:)), mean(Pt31_median_ckov_dosenorm_field_RPO(:))...
    mean(Pt32_median_ckov_dosenorm_field_RPO_6(:)), mean(Pt35_median_ckov_dosenorm_field_RPO(:))...
    mean(Pt36_median_ckov_dosenorm_field_RPO(:)), mean(Pt37_median_ckov_dosenorm_field_RPO(:))...
    mean(Pt39_median_ckov_dosenorm_field_RPO_6(:)), mean(Pt41_median_ckov_dosenorm_field_RPO_6(:))...
    mean(Pt44_median_ckov_dosenorm_field_RPO(:)), mean(Pt45_median_ckov_dosenorm_field_RPO_6(:))...
    mean(Pt56_median_ckov_dosenorm_field_RPO(:)), mean(Pt58_median_ckov_dosenorm_field_RPO(:))...
    mean(Pt59_median_ckov_dosenorm_field_RPO_6(:))];
clear fit_obj_6X_RPO gof_6X_RPO
[fit_obj_6X_RPO gof_6X_RPO] = fit(HU_array', ckov_array_RPO_6X', 'poly1')
xspace = -135:1:10;
yspace_6X_RPO = fit_obj_6X_RPO.p1.*xspace + fit_obj_6X_RPO.p2;
%plot(xspace,yspace_6X_RPO,'LineWidth', 3, 'Color', rgb('DarkGray'))
sterr_ckov_array_RPO_6X = gof_6X_RPO.rmse;
e = errorbar(HU_array, ckov_array_RPO_6X, repmat(sterr_ckov_array_RPO_6X,...
    [1 length(HU_array)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkGray');

% statistics for Uncorrected RPO 6X
[r p] = corrcoef(HU_array', ckov_array_RPO_6X'')
u = mean(ckov_array_RPO_6X)
sig = std(ckov_array_RPO_6X)
cov = sig/u

hold on
%ENTRANCE 6X - UNCORRECTED
scatter(Pt30_HU_av, mean(Pt30_median_ckov_dosenorm_field_RPO(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
hold on
scatter(Pt31_HU_av, mean(Pt31_median_ckov_dosenorm_field_RPO(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt32_HU_av, mean(Pt32_median_ckov_dosenorm_field_RPO_6(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2,'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt35_HU_av, mean(Pt35_median_ckov_dosenorm_field_RPO(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt36_HU_av, mean(Pt36_median_ckov_dosenorm_field_RPO(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt37_HU_av, mean(Pt37_median_ckov_dosenorm_field_RPO(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt39_HU_av, mean(Pt39_median_ckov_dosenorm_field_RPO_6(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt41_HU_av, mean(Pt41_median_ckov_dosenorm_field_RPO_6(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt44_HU_av, mean(Pt44_median_ckov_dosenorm_field_RPO(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt45_HU_av, mean(Pt45_median_ckov_dosenorm_field_RPO_6(:)), 'filled',...
     'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt56_HU_av, mean(Pt56_median_ckov_dosenorm_field_RPO(:)), 'filled',...
     'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt58_HU_av, mean(Pt58_median_ckov_dosenorm_field_RPO(:)), 'filled',...
     'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt59_HU_av, mean(Pt59_median_ckov_dosenorm_field_RPO_6(:)), 'filled',...
     'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))

 ax = gca;
ax.FontSize = 26;
ax.FontName = 'Times New Roman';
xlim([-135 -40])
ylim([0 4.25e4])
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}')



%EXIT 6X - UNCORRECTED
hold on
%FITS
clear HU array ckov_array_LAO_6
HU_array = [Pt30_HU_av Pt31_HU_av Pt32_HU_av Pt35_HU_av...
    Pt36_HU_av Pt37_HU_av Pt39_HU_av Pt41_HU_av,...
    Pt44_HU_av, Pt45_HU_av, Pt56_HU_av, Pt58_HU_av, Pt59_HU_av];
ckov_array_LAO_6 = [mean(Pt30_median_ckov_dosenorm_field_LAO(:)), mean(Pt31_median_ckov_dosenorm_field_LAO(:)),...
    mean(Pt32_median_ckov_dosenorm_field_LAO_6(:)), mean(Pt35_median_ckov_dosenorm_field_LAO(:)),...
    mean(Pt36_median_ckov_dosenorm_field_LAO(:)), mean(Pt37_median_ckov_dosenorm_field_LAO(:)),...
    mean(Pt39_median_ckov_dosenorm_field_LAO_6(:)), mean(Pt41_median_ckov_dosenorm_field_LAO_6(:)),...
    mean(Pt44_median_ckov_dosenorm_field_LAO(:)), mean(Pt45_median_ckov_dosenorm_field_LAO_6(:)),...
    mean(Pt56_median_ckov_dosenorm_field_LAO(:)), mean(Pt58_median_ckov_dosenorm_field_LAO(:))...
    mean(Pt59_median_ckov_dosenorm_field_LAO_6(:))];
clear fit_obj_6X_LAO gof_6X_LAO
[fit_obj_6X_LAO gof_6X_LAO] = fit(HU_array', ckov_array_LAO_6', 'poly1')
xspace = [-135:1:10];
yspace_6X_LAO = xspace.*fit_obj_6X_LAO.p1 + fit_obj_6X_LAO.p2;
figure(100)
subplot('Position', pos{1})
hold on
%plot(xspace,yspace_6X_LAO,'LineWidth', 3, 'Color', rgb('DarkSlateBlue'))
sterr_ckov_array_LAO_6X = gof_6X_LAO.rmse;
e = errorbar(HU_array, ckov_array_LAO_6, repmat(sterr_ckov_array_LAO_6X,...
    [1 length(HU_array)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkSlateBlue');

% statistics for Uncorrected LAO 6X
[r p] = corrcoef(HU_array', ckov_array_LAO_6')
u = mean(ckov_array_LAO_6)
sig = std(ckov_array_LAO_6)
cov = sig/u

%SCATTER PLOT
scatter(Pt30_HU_av, mean(Pt30_median_ckov_dosenorm_field_LAO(:)), 'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt31_HU_av, mean(Pt31_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt32_HU_av, mean(Pt32_median_ckov_dosenorm_field_LAO_6(:)), 'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2,'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt35_HU_av, mean(Pt35_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt36_HU_av, mean(Pt36_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2,'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt37_HU_av, mean(Pt37_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt39_HU_av, mean(Pt39_median_ckov_dosenorm_field_LAO_6(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt41_HU_av, mean(Pt41_median_ckov_dosenorm_field_LAO_6(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt44_HU_av, mean(Pt44_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt45_HU_av, mean(Pt45_median_ckov_dosenorm_field_LAO_6(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt56_HU_av, mean(Pt56_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt58_HU_av, mean(Pt58_median_ckov_dosenorm_field_LAO(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt59_HU_av, mean(Pt59_median_ckov_dosenorm_field_LAO_6(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
ax = gca;
ax.FontSize = 26;
xlim([-135 -50])
ylim([0 4.5e4])
ax.FontName = 'Times New Roman';
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}')



%write arrays and establish fits, separated only by energy, not by gantry
%angle.
HU_array = [Pt30_HU_av Pt31_HU_av Pt32_HU_av Pt35_HU_av Pt36_HU_av...
    Pt37_HU_av Pt39_HU_av Pt41_HU_av, Pt44_HU_av, Pt45_HU_av, Pt56_HU_av, Pt58_HU_av, Pt59_HU_av];
ckov_array_6X = [mean([Pt30_median_ckov_dosenorm_field_RPO, Pt30_median_ckov_dosenorm_field_LAO]),...
    mean([Pt31_median_ckov_dosenorm_field_RPO, Pt31_median_ckov_dosenorm_field_LAO]),...
    mean([Pt32_median_ckov_dosenorm_field_RPO_6, Pt32_median_ckov_dosenorm_field_LAO_6]),...
    mean([Pt35_median_ckov_dosenorm_field_RPO, Pt35_median_ckov_dosenorm_field_LAO]),...
    mean([Pt36_median_ckov_dosenorm_field_RPO, Pt36_median_ckov_dosenorm_field_LAO]),...
    mean([Pt37_median_ckov_dosenorm_field_RPO, Pt37_median_ckov_dosenorm_field_LAO]),...
    mean([Pt39_median_ckov_dosenorm_field_RPO_6, Pt39_median_ckov_dosenorm_field_LAO_6]),...
    mean([Pt41_median_ckov_dosenorm_field_RPO_6, Pt41_median_ckov_dosenorm_field_LAO_6]),...
    mean([Pt44_median_ckov_dosenorm_field_RPO, Pt44_median_ckov_dosenorm_field_LAO]),...
    mean([Pt45_median_ckov_dosenorm_field_RPO_6, Pt45_median_ckov_dosenorm_field_LAO_6]),...
    mean([Pt56_median_ckov_dosenorm_field_RPO, Pt56_median_ckov_dosenorm_field_LAO]),...
    mean([Pt58_median_ckov_dosenorm_field_RPO, Pt58_median_ckov_dosenorm_field_LAO]),...
    mean([Pt59_median_ckov_dosenorm_field_RPO_6, Pt59_median_ckov_dosenorm_field_LAO_6])];
clear fit_obj_6X gof_6X
[fit_obj_6X gof_6X] = fit(HU_array', ckov_array_6X', 'poly1')
xspace = -135:1:10;
yspace_6X = fit_obj_6X.p1.*xspace + fit_obj_6X.p2;
plot(xspace,yspace_6X,'LineWidth', 3, 'Color', rgb('Black'))

% statistics for Uncorrected RPO 6X
[r p] = corrcoef(HU_array', ckov_array_6X'')
u = mean(ckov_array_6X)
sig = std(ckov_array_6X)
cov = sig/u
hold off

%% CORRECTIONS - 6X

%CORRECTIONS ENTRANCE BEAM 6X
ckov_135HU_6 = -135*fit_obj_6X.p1+fit_obj_6X.p2
pt30_ckov_corr_anat_entrance_6_cf  = (Pt30_median_ckov_dosenorm_field_RPO./...
    (Pt30_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt31_ckov_corr_anat_entrance_6_cf = (Pt31_median_ckov_dosenorm_field_RPO./...
    (Pt31_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt32_ckov_corr_anat_entrance_6_cf = (Pt32_median_ckov_dosenorm_field_RPO_6./...
    (Pt32_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt32_ckov_corr_anat_entrance_6_wART_cf = (Pt32_median_ckov_dosenorm_field_RPO_6_wART./...
    (Pt32_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt35_ckov_corr_anat_entrance_6_cf = (Pt35_median_ckov_dosenorm_field_RPO./...
    (Pt35_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt36_ckov_corr_anat_entrance_6_cf = (Pt36_median_ckov_dosenorm_field_RPO./...
    (Pt36_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt37_ckov_corr_anat_entrance_6_cf = (Pt37_median_ckov_dosenorm_field_RPO./...
    (Pt37_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt39_ckov_corr_anat_entrance_6_cf = (Pt39_median_ckov_dosenorm_field_RPO_6./...
    (Pt39_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt41_ckov_corr_anat_entrance_6_cf = (Pt41_median_ckov_dosenorm_field_RPO_6./...
    (Pt41_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt41_ckov_corr_anat_entrance_6_wART_cf = (Pt41_median_ckov_dosenorm_field_RPO_6_wART./...
    (Pt41_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt44_ckov_corr_anat_entrance_6_cf = (Pt44_median_ckov_dosenorm_field_RPO./...
    (Pt44_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt45_ckov_corr_anat_entrance_6_cf = (Pt45_median_ckov_dosenorm_field_RPO_6./...
    (Pt45_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt56_ckov_corr_anat_entrance_6_cf = (Pt56_median_ckov_dosenorm_field_RPO./...
    (Pt56_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt58_ckov_corr_anat_entrance_6_cf = (Pt58_median_ckov_dosenorm_field_RPO./...
    (Pt58_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt59_ckov_corr_anat_entrance_6_cf = (Pt59_median_ckov_dosenorm_field_RPO_6./...
    (Pt59_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6

%ENTRANCE 6X - Corrected using the new technique
figure(100)
%hold on
subplot('Position', pos{2})
%FITS
clear HU array mean_pt_ckov_array_RPO_6_HU_av_corr_cf
HU_array = [Pt30_HU_av Pt31_HU_av Pt32_HU_av...
    Pt35_HU_av Pt36_HU_av Pt37_HU_av Pt39_HU_av...
    Pt41_HU_av, Pt44_HU_av, Pt45_HU_av, Pt56_HU_av, Pt58_HU_av, Pt59_HU_av];
mean_pt_ckov_array_RPO_6_HU_av_corr_cf = [mean(pt30_ckov_corr_anat_entrance_6_cf(:)), mean(pt31_ckov_corr_anat_entrance_6_cf(:)),...
    mean(pt32_ckov_corr_anat_entrance_6_cf(:)), mean(pt35_ckov_corr_anat_entrance_6_cf(:)),...
    mean(pt36_ckov_corr_anat_entrance_6_cf(:)), mean(pt37_ckov_corr_anat_entrance_6_cf(:)),...
    mean(pt39_ckov_corr_anat_entrance_6_cf(:)), mean(pt41_ckov_corr_anat_entrance_6_cf(:)),...
    mean(pt44_ckov_corr_anat_entrance_6_cf(:)), mean(pt45_ckov_corr_anat_entrance_6_cf(:)),...
    mean(pt56_ckov_corr_anat_entrance_6_cf(:)), mean(pt58_ckov_corr_anat_entrance_6_cf(:)),...
    mean(pt59_ckov_corr_anat_entrance_6_cf(:))];
clear fit_obj_HU_av_corr_6 gof_HU_av_corr_6
[fit_obj_HU_av_corr_RPO_6 gof_HU_av_corr_RPO_6] = fit(HU_array', mean_pt_ckov_array_RPO_6_HU_av_corr_cf', 'poly1')
xspace = [-135:1:10];
yspace_HU_av_corr_RPO_6 = xspace.*fit_obj_HU_av_corr_RPO_6.p1 + fit_obj_HU_av_corr_RPO_6.p2;
figure(100)
subplot('Position', pos{2})
%plot(xspace, yspace_HU_av_corr_RPO_6, 'LineWidth', 3, 'Color', rgb('DarkGray'))
%hold on
sterr_ckov_array_corr_RPO_6X = gof_HU_av_corr_RPO_6.rmse;
e = errorbar(HU_array, mean_pt_ckov_array_RPO_6_HU_av_corr_cf , repmat(sterr_ckov_array_corr_RPO_6X,...
    [1 length(HU_array)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkGray');

% statistics for Corrected RPO 6X
[r p] = corrcoef(HU_array', mean_pt_ckov_array_RPO_6_HU_av_corr_cf)
u = mean(mean_pt_ckov_array_RPO_6_HU_av_corr_cf)
sig = std(mean_pt_ckov_array_RPO_6_HU_av_corr_cf)
cov = sig/u

%SCATTER PLOTS
hold on
scatter(Pt30_HU_av, mean(pt30_ckov_corr_anat_entrance_6_cf(:)), 'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
hold on
scatter(Pt31_HU_av, mean(pt31_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt32_HU_av, mean(pt32_ckov_corr_anat_entrance_6_cf(:)), 'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt35_HU_av, mean(pt35_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt36_HU_av, mean(pt36_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt37_HU_av, mean(pt37_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt39_HU_av, mean(pt39_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt41_HU_av, mean(pt41_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt44_HU_av, mean(pt44_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt45_HU_av, mean(pt45_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt56_HU_av, mean(pt56_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt58_HU_av, mean(pt58_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt59_HU_av, mean(pt59_ckov_corr_anat_entrance_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
ax = gca;
ax.FontSize = 26;
xlim([-135 -50])
ylim([0 6e4])
ax.FontName = 'Times New Roman';
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}')


% CORRECTIONS - EXIT BEAM 6X
pt30_ckov_corr_anat_exit_6_cf  = (Pt30_median_ckov_dosenorm_field_LAO./...
    (Pt30_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt31_ckov_corr_anat_exit_6_cf = (Pt31_median_ckov_dosenorm_field_LAO./...
    (Pt31_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt32_ckov_corr_anat_exit_6_cf = (Pt32_median_ckov_dosenorm_field_LAO_6./...
    (Pt32_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt32_ckov_corr_anat_exit_6_wART_cf = (Pt32_median_ckov_dosenorm_field_LAO_6_wART./...
    (Pt32_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt35_ckov_corr_anat_exit_6_cf = (Pt35_median_ckov_dosenorm_field_LAO./...
    (Pt35_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt36_ckov_corr_anat_exit_6_cf = (Pt36_median_ckov_dosenorm_field_LAO./...
    (Pt36_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt37_ckov_corr_anat_exit_6_cf = (Pt37_median_ckov_dosenorm_field_LAO./...
    (Pt37_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt39_ckov_corr_anat_exit_6_cf = (Pt39_median_ckov_dosenorm_field_LAO_6./...
    (Pt39_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt41_ckov_corr_anat_exit_6_cf = (Pt41_median_ckov_dosenorm_field_LAO_6./...
    (Pt41_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt41_ckov_corr_anat_exit_6_wART_cf = (Pt41_median_ckov_dosenorm_field_LAO_6_wART./...
    (Pt41_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt44_ckov_corr_anat_exit_6_cf = (Pt44_median_ckov_dosenorm_field_LAO./...
    (Pt44_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt45_ckov_corr_anat_exit_6_cf = (Pt45_median_ckov_dosenorm_field_LAO_6./...
    (Pt45_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt56_ckov_corr_anat_exit_6_cf = (Pt56_median_ckov_dosenorm_field_LAO./...
    (Pt56_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt58_ckov_corr_anat_exit_6_cf = (Pt58_median_ckov_dosenorm_field_LAO./...
    (Pt58_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6
pt59_ckov_corr_anat_exit_6_cf = (Pt59_median_ckov_dosenorm_field_LAO_6./...
    (Pt59_HU_av.*fit_obj_6X.p1+fit_obj_6X.p2)).*ckov_135HU_6


%EXIT 6X - Corrected using the new technique
subplot('Position', pos{2})
% FITS
clear HU_array mean_pt_ckov_array_LAO_6_HU_av_corr_cf
HU_array = [Pt30_HU_av Pt31_HU_av Pt32_HU_av Pt35_HU_av Pt36_HU_av...
    Pt37_HU_av Pt39_HU_av Pt41_HU_av,...
    Pt44_HU_av, Pt45_HU_av, Pt56_HU_av, Pt58_HU_av, Pt59_HU_av];
mean_pt_ckov_array_LAO_6_HU_av_corr_cf = [mean(pt30_ckov_corr_anat_exit_6_cf(:)), mean(pt31_ckov_corr_anat_exit_6_cf(:)),...
    mean(pt32_ckov_corr_anat_exit_6_cf(:)), mean(pt35_ckov_corr_anat_exit_6_cf(:)),...
    mean(pt36_ckov_corr_anat_exit_6_cf(:)), mean(pt37_ckov_corr_anat_exit_6_cf(:)),...
    mean(pt39_ckov_corr_anat_exit_6_cf(:)), mean(pt41_ckov_corr_anat_exit_6_cf(:)),...
    mean(pt44_ckov_corr_anat_exit_6_cf(:)), mean(pt45_ckov_corr_anat_exit_6_cf(:))...
    mean(pt56_ckov_corr_anat_exit_6_cf(:)), mean(pt58_ckov_corr_anat_exit_6_cf(:)),...
    mean(pt59_ckov_corr_anat_exit_6_cf(:))];
clear fit_obj_HU_av_corr_LAO_6 gof_HU_av_corr_LAO_6
[fit_obj_HU_av_corr_LAO_6 gof_HU_av_corr_LAO_6] = fit(HU_array', mean_pt_ckov_array_LAO_6_HU_av_corr_cf', 'poly1')
xspace = [-135:1:10];
yspace_HU_av_corr_LAO_6 = xspace.*fit_obj_HU_av_corr_LAO_6.p1 + fit_obj_HU_av_corr_LAO_6.p2;
figure(100)
subplot('Position', pos{2})
%plot(xspace, yspace_HU_av_corr_LAO_6, 'LineWidth', 3, 'Color', rgb('DarkSlateBlue'))
sterr_ckov_array_corr_LAO_6X = gof_HU_av_corr_LAO_6.rmse;
e = errorbar(HU_array, mean_pt_ckov_array_LAO_6_HU_av_corr_cf , repmat(sterr_ckov_array_corr_LAO_6X,...
    [1 length(HU_array)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkSlateBlue');

hold on
% statistics for Corrected LAO 6X
[r p] = corrcoef(HU_array', mean_pt_ckov_array_LAO_6_HU_av_corr_cf')
u = mean(mean_pt_ckov_array_LAO_6_HU_av_corr_cf)
sig = std(mean_pt_ckov_array_LAO_6_HU_av_corr_cf)
cov = sig/u

%SCATTER PLOTS
scatter(Pt30_HU_av, mean(pt30_ckov_corr_anat_exit_6_cf(:)), 'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
hold on
scatter(Pt31_HU_av, mean(pt31_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt32_HU_av, mean(pt32_ckov_corr_anat_exit_6_cf(:)), 'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt35_HU_av, mean(pt35_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt36_HU_av, mean(pt36_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt37_HU_av, mean(pt37_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt39_HU_av, mean(pt39_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt41_HU_av, mean(pt41_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt44_HU_av, mean(pt44_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt45_HU_av, mean(pt45_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt56_HU_av, mean(pt56_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt58_HU_av, mean(pt58_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt59_HU_av, mean(pt59_ckov_corr_anat_exit_6_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
ax = gca;
ax.FontSize = 26;
xlim([-135 -50])
ylim([0 6e4])
ax.FontName = 'Times New Roman';
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}')

subplot('Position', pos{2})
hold on
% FITS
clear HU_array mean_pt_ckov_array_LAO_6_HU_av_corr_cf
HU_array = [Pt30_HU_av Pt31_HU_av Pt32_HU_av Pt35_HU_av Pt36_HU_av...
    Pt37_HU_av Pt39_HU_av Pt41_HU_av,...
    Pt44_HU_av, Pt45_HU_av, Pt56_HU_av, Pt58_HU_av, Pt59_HU_av];
mean_pt_ckov_array_6_HU_av_corr_cf = [mean([pt30_ckov_corr_anat_entrance_6_cf, pt30_ckov_corr_anat_exit_6_cf]),...
    mean([pt31_ckov_corr_anat_entrance_6_cf, pt31_ckov_corr_anat_exit_6_cf]),...
    mean([pt32_ckov_corr_anat_entrance_6_cf, pt32_ckov_corr_anat_exit_6_cf]),...
    mean([pt35_ckov_corr_anat_entrance_6_cf, pt35_ckov_corr_anat_exit_6_cf]),...
    mean([pt36_ckov_corr_anat_entrance_6_cf, pt36_ckov_corr_anat_exit_6_cf]),...
    mean([pt37_ckov_corr_anat_entrance_6_cf, pt37_ckov_corr_anat_exit_6_cf]),...
    mean([pt39_ckov_corr_anat_entrance_6_cf, pt39_ckov_corr_anat_exit_6_cf]),...
    mean([pt41_ckov_corr_anat_entrance_6_cf, pt41_ckov_corr_anat_exit_6_cf]),...
    mean([pt44_ckov_corr_anat_entrance_6_cf, pt44_ckov_corr_anat_exit_6_cf]),...
    mean([pt45_ckov_corr_anat_entrance_6_cf, pt45_ckov_corr_anat_exit_6_cf]),...
    mean([pt56_ckov_corr_anat_entrance_6_cf, pt56_ckov_corr_anat_exit_6_cf]),...
    mean([pt58_ckov_corr_anat_entrance_6_cf, pt58_ckov_corr_anat_exit_6_cf]),...
    mean([pt59_ckov_corr_anat_entrance_6_cf, pt59_ckov_corr_anat_exit_6_cf])];
clear fit_obj_HU_av_corr_LAO_6 gof_HU_av_corr_LAO_6
[fit_obj_HU_av_corr_6 gof_HU_av_corr_6] = fit(HU_array', mean_pt_ckov_array_6_HU_av_corr_cf', 'poly1')
xspace = [-135:1:10];
yspace_HU_av_corr_6 = xspace.*fit_obj_HU_av_corr_6.p1 + fit_obj_HU_av_corr_6.p2;
figure(100)
subplot('Position', pos{2})
plot(xspace, yspace_HU_av_corr_6, 'LineWidth', 3, 'Color', rgb('Black'))
% sterr_ckov_array_corr_LAO_6X = gof_HU_av_corr_LAO_6.rmse;
% e = errorbar(HU_array, mean_pt_ckov_array_LAO_6_HU_av_corr_cf , repmat(sterr_ckov_array_corr_LAO_6X,...
%     [1 length(HU_array)]), 'LineStyle','none', 'LineWidth', 3)
% e.Color = rgb('DarkSlateBlue');

hold on
% statistics for Corrected LAO 6X
[r p] = corrcoef(HU_array', mean_pt_ckov_array_6_HU_av_corr_cf')
u = mean(mean_pt_ckov_array_6_HU_av_corr_cf)
sig = std(mean_pt_ckov_array_6_HU_av_corr_cf)
cov = sig/u


%% EXP 71-10X DEPLOY ANATOMICAL CORRECTIONS
%Using correction factor constant scheme.

%ENTRANCE 10X - UNCORRECTED
figure(101)
clf
[ha, pos] = tight_subplot(1, 2,[.09 .07],[.16 .08],[.08 .03]);
subplot('Position', pos{1})
%FITS
HU_array_2 = [Pt32_HU_av Pt39_HU_av Pt41_HU_av, Pt45_HU_av, Pt59_HU_av];
ckov_array_RPO_10X = [mean(Pt32_median_ckov_dosenorm_field_RPO_10(:)),...
    mean(Pt39_median_ckov_dosenorm_field_RPO_10(:)),...
    mean(Pt41_median_ckov_dosenorm_field_RPO_10(:))...
    mean(Pt45_median_ckov_dosenorm_field_RPO_10(:)),...
    mean(Pt59_median_ckov_dosenorm_field_RPO_10(:))]
clear fit
[fit_obj_10X_RPO gof_10X_RPO] = fit(HU_array_2', ckov_array_RPO_10X', 'poly1')
xspace = -135:1:10;
yspace_10X_RPO = fit_obj_10X_RPO.p1.*xspace + fit_obj_10X_RPO.p2;
%plot(xspace,yspace_10X_RPO,'LineWidth', 3, 'Color', rgb('DarkGray'))
%hold on
sterr_ckov_array_RPO_10X = gof_10X_RPO.rmse;
e = errorbar(HU_array_2, ckov_array_RPO_10X, repmat(sterr_ckov_array_RPO_10X,...
    [1 length(HU_array_2)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkGray');

% statistics for Corrected LAO 6X
[r p] = corrcoef(HU_array_2', ckov_array_RPO_10X')
u = mean(ckov_array_RPO_10X)
sig = std(ckov_array_RPO_10X)
cov = sig/u

hold on
%PLOT THE SCATTER POINTS
scatter(Pt32_HU_av, mean(Pt32_median_ckov_dosenorm_field_RPO_10(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2,'MarkerFaceColor', rgb('DarkGray'))
hold on
scatter(Pt39_HU_av, mean(Pt39_median_ckov_dosenorm_field_RPO_10(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt41_HU_av, mean(Pt41_median_ckov_dosenorm_field_RPO_10(:)), 'filled',...
    'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt45_HU_av, mean(Pt45_median_ckov_dosenorm_field_RPO_10(:)), 'filled',...
     'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt59_HU_av, mean(Pt59_median_ckov_dosenorm_field_RPO_10(:)), 'filled',...
     'SizeData', 500, 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
ax = gca;
ax.FontSize = 26;
ax.FontName = 'Times New Roman';
xlim([-135 0-50])
ylim([0 4.5e4])
xlabel('Average HU')
ylabel('Median Cherenkov cGy^{-1}')



%EXIT 10X - UNCORRECTED
%FITS
ckov_array_LAO_10 = [mean(Pt32_median_ckov_dosenorm_field_LAO_10(:)),...
    mean(Pt39_median_ckov_dosenorm_field_LAO_10(:)), mean(Pt41_median_ckov_dosenorm_field_LAO_10(:)),...
    mean(Pt45_median_ckov_dosenorm_field_LAO_10(:)), mean(Pt59_median_ckov_dosenorm_field_LAO_10(:))];
clear fit 
[fit_obj_10X_LAO gof_10X_LAO] = fit(HU_array_2', ckov_array_LAO_10', 'poly1')
xspace = [-135:1:10];
yspace_10X_LAO = xspace.*fit_obj_10X_LAO.p1 + fit_obj_10X_LAO.p2;
figure(101)
subplot('Position', pos{1})
%plot(xspace,yspace_10X_LAO,'LineWidth', 3, 'Color', rgb('DarkSlateBlue'))
%hold on
sterr_ckov_array_LAO_10X = gof_10X_LAO.rmse;
e = errorbar(HU_array_2, ckov_array_LAO_10, repmat(sterr_ckov_array_LAO_10X,...
    [1 length(HU_array_2)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkSlateBlue');

%metrics 
[r p] = corrcoef(HU_array_2', ckov_array_LAO_10')
u = mean(ckov_array_LAO_10)
sig = std(ckov_array_LAO_10)
cov = sig/u

hold on

%SCATTER PLOT
scatter(Pt32_HU_av, mean(Pt32_median_ckov_dosenorm_field_LAO_10(:)), 'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2,'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt39_HU_av, mean(Pt39_median_ckov_dosenorm_field_LAO_10(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt41_HU_av, mean(Pt41_median_ckov_dosenorm_field_LAO_10(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt45_HU_av, mean(Pt45_median_ckov_dosenorm_field_LAO_10(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt59_HU_av, mean(Pt59_median_ckov_dosenorm_field_LAO_10(:)),'filled',...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'SizeData', 500, 'MarkerFaceColor', rgb('DarkSlateBlue'))
ax = gca;
ax.FontSize = 26;
xlim([-135 -50])
ylim([0 4.5e4])
ax.FontName = 'Times New Roman';
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}') 




%write arrays and establish fits, separated only by energy, not by gantry
%angle.
HU_array_2 = [Pt32_HU_av Pt39_HU_av Pt41_HU_av, Pt45_HU_av, Pt59_HU_av];
ckov_array_10X = [mean([Pt32_median_ckov_dosenorm_field_RPO_10, Pt32_median_ckov_dosenorm_field_LAO_10]),...
    mean([Pt39_median_ckov_dosenorm_field_RPO_10, Pt39_median_ckov_dosenorm_field_LAO_10]),...
    mean([Pt41_median_ckov_dosenorm_field_RPO_10, Pt41_median_ckov_dosenorm_field_LAO_10]),...
    mean([Pt45_median_ckov_dosenorm_field_RPO_10, Pt45_median_ckov_dosenorm_field_LAO_10]),...
    mean([Pt59_median_ckov_dosenorm_field_RPO_10, Pt59_median_ckov_dosenorm_field_LAO_10])]

clear fit_obj_10X gof_10X
[fit_obj_10X gof_10X] = fit(HU_array_2', ckov_array_10X', 'poly1')
xspace = -135:1:10;
yspace_10X = fit_obj_10X.p1.*xspace + fit_obj_10X.p2;
plot(xspace,yspace_10X,'LineWidth', 3, 'Color', rgb('Black'))

% statistics for Uncorrected RPO 10X
[r p] = corrcoef(HU_array_2', ckov_array_10X'')
u = mean(ckov_array_10X)
sig = std(ckov_array_10X)
cov = sig/u



%% 
% CORRECTIONS 
% entrance BEAM 10X
ckov_135HU_10 = -135*fit_obj_10X.p1+fit_obj_10X.p2
pt32_ckov_corr_anat_entrance_10_cf = (Pt32_median_ckov_dosenorm_field_RPO_10./...
    (Pt32_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10
pt32_ckov_corr_anat_entrance_10_wART_cf = (Pt32_median_ckov_dosenorm_field_RPO_10_wART./...
    (Pt32_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10
pt39_ckov_corr_anat_entrance_10_cf = (Pt39_median_ckov_dosenorm_field_RPO_10./...
    (Pt39_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10
pt41_ckov_corr_anat_entrance_10_cf = (Pt41_median_ckov_dosenorm_field_RPO_10./...
    (Pt41_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10
pt41_ckov_corr_anat_entrance_10_wART_cf = (Pt41_median_ckov_dosenorm_field_RPO_10_wART./...
    (Pt41_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10
pt45_ckov_corr_anat_entrance_10_cf = (Pt45_median_ckov_dosenorm_field_RPO_10./...
    (Pt45_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10
pt59_ckov_corr_anat_entrance_10_cf = (Pt59_median_ckov_dosenorm_field_RPO_10./...
    (Pt59_HU_av.*fit_obj_10X.p1+fit_obj_10X.p2)).*ckov_135HU_10


%entrance 10X - Corrected using the new technique
figure(101)
subplot('Position', pos{2})
%FITS
mean_pt_ckov_array_RPO_10_HU_av_corr_cf = [mean(pt32_ckov_corr_anat_entrance_10_cf(:)),...
    mean(pt39_ckov_corr_anat_entrance_10_cf(:)), mean(pt41_ckov_corr_anat_entrance_10_cf(:)),...
    mean(pt45_ckov_corr_anat_entrance_10_cf(:)), mean(pt59_ckov_corr_anat_entrance_10_cf(:))];
clear fit
[fit_obj_HU_av_corr_RPO_10 gof_HU_av_corr_RPO_10] = fit(HU_array_2', mean_pt_ckov_array_RPO_10_HU_av_corr_cf', 'poly1')
xspace = [-135:1:10];
yspace_HU_av_corr_RPO_10 = xspace.*fit_obj_HU_av_corr_RPO_10.p1 + fit_obj_HU_av_corr_RPO_10.p2;
figure(101)
subplot('Position', pos{2})
%plot(xspace, yspace_HU_av_corr_RPO_10, 'LineWidth', 3, 'Color', rgb('DarkGray'))
%hold on
sterr_ckov_array_RPO_10_HU_av_corr_cf = gof_HU_av_corr_RPO_10.rmse;
e = errorbar(HU_array_2, mean_pt_ckov_array_RPO_10_HU_av_corr_cf, repmat(sterr_ckov_array_RPO_10_HU_av_corr_cf,...
    [1 length(HU_array_2)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkGray');


%metrics
[r p] = corrcoef(HU_array_2', mean_pt_ckov_array_RPO_10_HU_av_corr_cf')
u = mean(mean_pt_ckov_array_RPO_10_HU_av_corr_cf')
sig = std(mean_pt_ckov_array_RPO_10_HU_av_corr_cf')
cov = sig/u

hold on

%SCATTER
scatter(Pt32_HU_av, mean(pt32_ckov_corr_anat_entrance_10_cf(:)), 'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt39_HU_av, mean(pt39_ckov_corr_anat_entrance_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt41_HU_av, mean(pt41_ckov_corr_anat_entrance_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt45_HU_av, mean(pt45_ckov_corr_anat_entrance_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
scatter(Pt59_HU_av, mean(pt59_ckov_corr_anat_entrance_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkGray'))
ax = gca;
ax.FontSize = 26;
xlim([-135 -50])
ylim([0 6e4])
ax.FontName = 'Times New Roman';
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}')


% CORRECTIONS 
% exit BEAM 10X
ckov_135HU_LAO10 = -135*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2
pt32_ckov_corr_anat_exit_10_cf = (Pt32_median_ckov_dosenorm_field_LAO_10./...
    (Pt32_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10
pt32_ckov_corr_anat_exit_10_wART_cf = (Pt32_median_ckov_dosenorm_field_LAO_10_wART./...
    (Pt32_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10
pt39_ckov_corr_anat_exit_10_cf = (Pt39_median_ckov_dosenorm_field_LAO_10./...
    (Pt39_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10
pt41_ckov_corr_anat_exit_10_cf = (Pt41_median_ckov_dosenorm_field_LAO_10./...
    (Pt41_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10
pt41_ckov_corr_anat_exit_10_wART_cf = (Pt41_median_ckov_dosenorm_field_LAO_10_wART./...
    (Pt41_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10
pt45_ckov_corr_anat_exit_10_cf = (Pt45_median_ckov_dosenorm_field_LAO_10./...
    (Pt45_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10
pt59_ckov_corr_anat_exit_10_cf = (Pt59_median_ckov_dosenorm_field_LAO_10./...
    (Pt59_HU_av.*fit_obj_10X_LAO.p1+fit_obj_10X_LAO.p2)).*ckov_135HU_LAO10

%exit 10X - Corrected using the new technique
%FITS
subplot('Position', pos{2})
mean_pt_ckov_array_LAO_10_HU_av_corr_cf = [mean(pt32_ckov_corr_anat_exit_10_cf(:)),...
    mean(pt39_ckov_corr_anat_exit_10_cf(:)), mean(pt41_ckov_corr_anat_exit_10_cf(:)),...
    mean(pt45_ckov_corr_anat_exit_10_cf(:)), mean(pt59_ckov_corr_anat_exit_10_cf(:))];
clear fit
[fit_obj_HU_av_corr_LAO_10 gof_HU_av_corr_LAO_10] = fit(HU_array_2', mean_pt_ckov_array_LAO_10_HU_av_corr_cf', 'poly1')
xspace = [-135:1:10];
yspace_HU_av_corr_LAO_10 = xspace.*fit_obj_HU_av_corr_LAO_10.p1 + fit_obj_HU_av_corr_LAO_10.p2;
sterr_ckov_array_LAO_10_HU_av_corr_cf = gof_HU_av_corr_LAO_10.rmse;
e = errorbar(HU_array_2, mean_pt_ckov_array_LAO_10_HU_av_corr_cf, repmat(sterr_ckov_array_LAO_10_HU_av_corr_cf,...
    [1 length(HU_array_2)]), 'LineStyle','none', 'LineWidth', 3)
e.Color = rgb('DarkSlateBlue');

%metrics
[r p] = corrcoef(HU_array_2', mean_pt_ckov_array_LAO_10_HU_av_corr_cf')
u = mean(mean_pt_ckov_array_LAO_10_HU_av_corr_cf')
sig = std(mean_pt_ckov_array_LAO_10_HU_av_corr_cf')
cov = sig/u



subplot('Position', pos{2})
%plot(xspace, yspace_HU_av_corr_LAO_10, 'LineWidth', 3, 'Color', rgb('DarkSlateBlue'))

hold on
scatter(Pt32_HU_av, mean(pt32_ckov_corr_anat_exit_10_cf(:)), 'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt39_HU_av, mean(pt39_ckov_corr_anat_exit_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt41_HU_av, mean(pt41_ckov_corr_anat_exit_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt45_HU_av, mean(pt45_ckov_corr_anat_exit_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
scatter(Pt59_HU_av, mean(pt59_ckov_corr_anat_exit_10_cf(:)),'filled', 'SizeData', 500,...
    'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.2, 'MarkerFaceColor', rgb('DarkSlateBlue'))
ax = gca;
ax.FontSize = 26;
xlim([-135 -50])
ylim([0 6e4])
ax.FontName = 'Times New Roman';
xlabel('CT Attenuation (HU)')
ylabel('Median Cherenkov Gy^{-1}')

figure(101)
subplot('Position', pos{2})
hold on
% FITS
clear HU_array mean_pt_ckov_array_10_HU_av_corr_cf
mean_pt_ckov_array_10_HU_av_corr_cf = [
    mean([pt32_ckov_corr_anat_entrance_10_cf, pt32_ckov_corr_anat_exit_10_cf]),...
    mean([pt39_ckov_corr_anat_entrance_10_cf, pt39_ckov_corr_anat_exit_10_cf]),...
    mean([pt41_ckov_corr_anat_entrance_10_cf, pt41_ckov_corr_anat_exit_10_cf]),...
    mean([pt45_ckov_corr_anat_entrance_10_cf, pt45_ckov_corr_anat_exit_10_cf]),...
    mean([pt59_ckov_corr_anat_entrance_10_cf, pt59_ckov_corr_anat_exit_10_cf])];
clear fit_obj_HU_av_corr_10 gof_HU_av_corr_10
[fit_obj_HU_av_corr_10 gof_HU_av_corr_10] = fit(HU_array_2', mean_pt_ckov_array_10_HU_av_corr_cf', 'poly1')
xspace = [-135:1:10];
yspace_HU_av_corr_10 = xspace.*fit_obj_HU_av_corr_10.p1 + fit_obj_HU_av_corr_10.p2;
figure(101)
subplot('Position', pos{2})
plot(xspace, yspace_HU_av_corr_10, 'LineWidth', 3, 'Color', rgb('Black'))
% sterr_ckov_array_corr_LAO_10X = gof_HU_av_corr_LAO_10.rmse;
% e = errorbar(HU_array, mean_pt_ckov_array_LAO_10_HU_av_corr_cf , repmat(sterr_ckov_array_corr_LAO_10X,...
%     [1 length(HU_array)]), 'LineStyle','none', 'LineWidth', 3)
% e.Color = rgb('DarkSlateBlue');

hold on
% statistics for Corrected LAO 6X
[r p] = corrcoef(HU_array_2', mean_pt_ckov_array_10_HU_av_corr_cf')
u = mean(mean_pt_ckov_array_10_HU_av_corr_cf)
sig = std(mean_pt_ckov_array_10_HU_av_corr_cf)
cov = sig/u


