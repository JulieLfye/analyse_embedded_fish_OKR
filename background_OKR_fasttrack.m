clc;
close all;
clear

a = exist('path','var');

if  a == 0
    disp('Select one frame for creating background file')
    [file, path] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic');
    im = imread(fullfile(path,file));
end

T = adaptthresh(im,0.8);
imshow(T)
background = uint8(T*255);
imshow(background)
d = background-im;
imshow(d)

return

p = 'D:\embedded_fish\OKR_acoustic\background';
% p = [p, path(end-30:end-22)]; % for movie
% p = [p, path(end-39:end-31)]; % for movie_filtered
p = [p, path(end-40:end-32)]; % for movie_filtered2


if isfolder(p) == 0
    mkdir(p)
end

% im_name = ['background_',path(end-20:end-14),'.pgm']; % for movie
% im_name = ['background_',path(end-29:end-23),'.pgm']; % for movie_filtered
im_name = ['background4_',path(end-30:end-24),'.pgm']; % for movie_filtered2

imwrite(test,fullfile(p,im_name));

close all
clear