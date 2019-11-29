% test for defining angle

im = imread('D:\embedded_fish\OKR_acoustic\OKR_fixed\OKR\19-11-18\fish_01\run_02\bout1_bin\bin_0190.pgm');
imshow(im)
disp('Select the head, no swim bladder')
rect = round(getrect);
xcenter_head = 
ycenter_head = 
cc = bwconncomp(logical(im));
num_object = cc.NumObjects;
