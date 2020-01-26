# NATCOMM_Cherenkov_HU
MATLAB script repository for Nature Communications Manuscript NCOMMS-19-33311-T

( 1 ) SYSTEM REQUIREMENTS
Software Dependencies and Operating Systems:
-MATLAB - Commercially Available. Run and tested onVersion: R2018A. Currently Operating on Windows 10. 
No required non-standard hardware.

-C-DOSE- Commerically Available. Run and tested on Windows 10, Lenovo Thinkpad P51
Ensure that your PC meets the minimum specs (16GB ram, 500GB SSD, i7 processor, NVIDIA GTX 1050 Ti or better, Windows 10 Pro 64-bit, USB3).
In order to acquire images, a C-Dose camera, optial fiber and optical repeater will be required to connect to aquisition computer. 


( 2 ) INSTALLATION GUIDE
MATLAB:
- Standard Installation procedure found on MATHWORKS for Windows and OS-X Operating Systems.
- Must Include Image Analysis Toolboxes.
- Typical Install Time ~ 40 minutes.

C-DOSE:
Involves the following steps, but are also detailed in the instructions included with the software.
1. Install the VC redistributable:
2. Install ISG USB3 driver.
3. Install Lightwise Allegro driver (unzip and run the exe):
4. Install Genicam driver:
5. Install C-Dose:


( 3 ) DEMO and ( 4 ) INSTRUCTIONS FOR USE.

File Contents:
(Folder 1)
MATLAB SCRIPTS:
- NOTE: To run correction process script series, load workspace "workspace_09_16_2019.mat"
- Contains all data neccessary. 

1) "Correction_Process_Pt1_Read.m" 
- Reads in patient data from MATLAB .mat image stacks, (or included workspace).
- Displays Cherenkov image, dose images, reflectance images in an image montage. 

2) "Correction_Process_Pt2_HUcorr_wErrorBars.m"
- Plots the correlation between the HU for the patient and the dose-normalized Cherenkov output. 
- Computes Correction Factors and correlation statistics for each trend. (Organized by 6X/10X LAO/RPO beams. (Pearsons, p-value, and R-squared).

3) "Correction_Process_Pt3_Image_Correction.m"
- Applies image corrections by multiplying scalar and patient image stack. 
- Displays in an image montage.
- Computes means and standard deviations for uncorrected and corrected image medians. Compares. 

4) "Correction_Process_Pt4_Take_Save_ROIs_2.m"
- Iterates through each patient and limits the user to drawing approximately the correct number of ROI's per patient without biasing the final trends.
(For example, Patient with only 3 images has 8 ROI's per image but a patient with 6 images gets 4 ROI's per image. 

5) "Correction_Process_Pt5_CompCorr2Dose_New.m"
- Organizes the means collected from script 4 into arrays divied by beam energy (6X/10X) and beam angle (LAO/RPO)
- Plots each Cherenkov mean to respective dose value using an uncorrected version of the images and a corrected version of the images. 
- Computes correlation statistics (Pearsons, p-value, and R-squared).

6) "MS4_MaskOut_Surgical_Scar.m"
- Evaluates case for Pt 45 (Pt 10 in article).
- Draw circle around region with surgical scar. 
- Computes difference between the median intensities of the whole field with and without a surgical scar. 

7) "MS4_Reviewer3_HUCAL.m"
- Transforms the image from the perspective of the camera. 
- Loops through the same image nine times and allows user to draw eight ROI's from the first, meat-containing well to the last. 
- Plots the relationship. 


(Folder 1)
C-DOSE DATA:
1) "Anonymized CT Scan Pt 44"
- Can be copied into C-Dose and assigned the included Cherenkov acquisition so match. 
2) "Sample Dataset Pt. 44"
- Can be copied (dragged) into C-Dose and acquisition can be viewed frame by frame.
- May also be viewed as an image stack in Fiji-Image J.  


(Document 1)
"NATCOMM_SourceFiles.xlsx"
- All Main Article Figures and Supplementary Figures are separated out into an excel file. 

