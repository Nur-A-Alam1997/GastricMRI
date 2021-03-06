function cross_sectional_area = amri_volume_calcPylorusArea(Img,Mask,spatial_resolution)
%{

##amri_volume_calcPylorusArea:
Compute the cross-sectional_area at the pylorus.

##Environment requirement:  
This code was developed under Red Hat Enterprise Linux environment.

##Usage:
cross_sectional_area = amri_volume_calcPylorusArea(Img,Mask)

##Inputs:
Img: 3D image
Mask: segmented GI image
spatial_resolution: spatial resolution of the image

##Output:
cross_sectional_area: cross-sectional area at the pylorus 

##DISCLAIMER AND CONDITIONS FOR USE:
This software is distributed under the terms of the GNU General Public
License v3, dated 2007/06/29 (see http://www.gnu.org/licenses/gpl.html).
Use of this software is at the user's OWN RISK. Functionality is not
guaranteed by creator nor modifier(s), if any. This software may be freely
copied and distributed. The original header MUST stay part of the file and
modifications MUST be reported in the 'HISTORY'-section,
including the modification date and the name of the modifier.

##CREATED:
Oct. 25, 2017
Kun-Han Lu
Electrical and Computer Engineering
Purdue University

##History:
1.00 - 10/25/2017 - KHLU - create the original file

##Version:
1.00

%}

FigHandle1 = figure(1);
set(FigHandle1, 'Position', [150, 250, 640,640],'Name','Please identify the location of the pylorus','NumberTitle','off');
tools_sliceview(Img,Mask,'zoom',0.5);

%-- enter slice numbers that contain the pylorus
x = inputdlg('Enter slice numbers containing the pylorus:   e.g. 6 7 8','Enter slice numbers containing the pylorus', [1 50]);
slice_num = str2num(x{:});

%-- maximum intensity projection of selected slices
pylorus_MIP = max(Mask(:,:,slice_num), [], 3);
FigHandle2 = figure(2);
set(FigHandle2, 'Position', [150, 250, 640,640],'Name','Please draw a line across the pylorus','NumberTitle','off');
tools_sliceview(pylorus_MIP,'zoom',3);

h = imline(FigHandle2.CurrentAxes);
pos = h.getPosition; % pos is a 2-by-2 array [X1 Y1; X2 Y2]

x = [256-pos(1,2),256-pos(2,2)];
y = [pos(1,1),pos(2,1)];

summation = sum(double(Mask(:,:,slice_num)),3);

c = improfile(summation,x,y);
cross_sectional_area = sum(c)*spatial_resolution(1)*spatial_resolution(3);

pause(1);
close all;
end
