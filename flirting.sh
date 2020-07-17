#!/bin/bash

cd /projects/buic227/dhet/anat
for sub in 04 05 06 07 08 10 11 12 14 15 16 17 18 19 
do

flirt -in sub${sub}_anat -ref /projects/buic227/dhet/FLIRT/MNI152_T1_2mm_brain -out /projects/buic227/dhet/FLIRT/sub${sub}_anat_MNI -omat sub${sub}_anat2MNI.mat -dof 12

convert_xfm -omat sub${sub}_MNI2anat.mat -inverse sub${sub}_anat2MNI.mat

flirt -in /projects/buic227/dhet/FLIRT/MNI152_T1_2mm_brain -ref /projects/buic227/dhet/anat/sub${sub}_anat -applyxfm -init sub${sub}_MNI2anat.mat -o /projects/buic227/dhet/FLIRT/sub${sub}_MNIinanat

flirt -in /projects/buic226/MNImasks/SensorimotorMask.nii.gz -ref sub04_anat.nii -applyxfm -init sub04_MNI2anat.mat -out /projects/buic227/dhet/FLIRT/masking/sub${sub}_masked

done





