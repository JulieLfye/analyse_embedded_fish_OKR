clc;
close all;
% clear

a = exist('path','var');

if  a == 0
    disp('Select one frame for creating background file')
    [file, path] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic');
    im = imread(fullfile(path,file));
end

rect = getrect;
im2 = im(rect(2):rect(2)+rect(4)+1,rect(1):rect(1)+rect(3)+1);
im2f = imnlfilt(im2);
