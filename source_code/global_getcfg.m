function cfgMain = global_getcfg

%{

##global_getcfg:
This is the function which defines a matlab structure containing the parameters necessary for the analysis pipeline.

##Environment requirement:  
This code was developed under Red Hat Enterprise Linux environment.

##DISCLAIMER AND CONDITIONS FOR USE:
This software is distributed under the terms of the GNU General Public
License v3, dated 2007/06/29 (see http://www.gnu.org/licenses/gpl.html).
Use of this software is at the user's OWN RISK. Functionality is not
guaranteed by creator nor modifier(s), if any. This software may be freely
copied and distributed. The original header MUST stay part of the file and
modifications MUST be reported in the 'HISTORY'-section,
including the modification date and the name of the modifier.

##CREATED:
Oct. 11, 2017
Kun-Han Lu
Electrical and Computer Engineering
Purdue University

##History:
1.00 - 10/11/2017 - KHLU - create the original file

##Version:
1.00

%}

% amri_volume_main
cfgMain.volume_spatial_resolution = [0.234375 0.234375 1]; % spatial resolution in x, y, z dimension, respectively

cfgMain.volume_smooth = 0; % perform smoothing or not (1: yes/ 2: no)
cfgMain.volume_smooth_lambda = 1/7; % lambda: numerical stability parameter (usually set to 1/7)
cfgMain.volume_smooth_K = 0.05; % K: threshold to shape the g() function
cfgMain.volume_smooth_n = 10; % n: number of iterations
cfgMain.volume_smooth_g = 2; % option: either 1 or 2 for the choice of g()

cfgMain.volume_FCMFuzziness = 3; % fuzziness for fcm clustering
cfgMain.volume_FCMNumClust = 3; % number of clusters for fcm clustering

cfgMain.volume_ACWinSize = 7; % window size for localized active contour
cfgMain.volume_ACLengthPenalty = 0.000001; % penalty coefficient for the length term
cfgMain.volume_ACIteration = 400; % number of iterations for localized active contour
cfgMain.volume_ACEpsilon = 0.3; % parameter for the heaviside function

cfgMain.volume_GIKernel = 6; % kernel size for the morph operation for separating stomach and intestine

% amri_motility_main
cfgMain.motility_spatial_resolution = [0.46875 0.46875 1.5]; % spatial resolution in x, y, z dimension, respectively

cfgMain.motility_motion_correction = 1; % perform motion correction or not (1: yes/ 2: no)

cfgMain.motility_seg_option = 'otsu'; % 'otsu' or 'AC'

cfgMain.motility_FCMFuzziness = 2; % fuzziness for fcm clustering
cfgMain.motility_FCMNumClust = 4; % number of clusters for fcm clustering

cfgMain.motility_ACWinSize = 7; % window size for localized active contour
cfgMain.motility_ACLengthPenalty = 0.1; % penalty coefficient for the length term
cfgMain.motility_ACIteration = 500; % number of iterations for localized active contour
cfgMain.motility_ACEpsilon = 5; % parameter for the heaviside function

% other
cfgMain.plotFigures= 1; % if 1 plots will be displayed if 0 they won't

end
