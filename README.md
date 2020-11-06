# anisoVTApreprocessing
The repo contains instructions and scripts to reproduce the anisotropic VTA estimation method described implemented in 2020 by the Neuromodulation team at Inselspital, Bern, Switzeland

Here you can find the files used to preprocess the diffusion-weighted images to obtain the conduction model in the anisotropic model for VTA estimation in LEAD-DBS.
You can find the detailed Working Instructions in the file WI_VTAanisotropy.pdf.

In order to speed up the process and skip the MRTRIX Image Correction section, the user can run the bash script preprocessing_mrtrix.sh for each acquisition instead. If this is the case, the starting image must be a folder named "DICOM" containing all the information of the speicific acquisition.
