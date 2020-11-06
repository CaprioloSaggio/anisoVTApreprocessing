#!/bin/bash

# MRTRIX image correction
mrconvert DICOM dti_raw.mif
mrinfo dti_raw.mif -export_grad_fsl bvecs bvals
dwidenoise dti_raw.mif dti_den.mif
mrdegibbs dti_den.mif dti_den_unr.mif -axes 0,1
mrconvert dti_den_unr.mif dti_biased.nii

echo ""
echo "Removing bias"
fslmaths dti_biased.nii -Tmean dti_biased_m.nii
bet dti_biased_m.nii dti_biased_brain -m
mrconvert dti_biased_brain_mask.nii.gz dti_biased_brain_mask.mif
dwibiascorrect ants dti_den_unr.mif dti_debiased.mif -mask dti_biased_brain_mask.mif -fslgrad bvecs bvals -ants.b [100,3] -ants.c [1000,0.0] -ants.s 4
mrconvert dti_debiased.mif dti_mrtrix_corrected.nii
