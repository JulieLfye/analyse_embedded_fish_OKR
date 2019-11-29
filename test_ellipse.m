close all;
clc;

a = exist('path','var');

if  a == 0
    disp('Select one frame for creating background file')
    [file, path] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic');
    im = imread(fullfile(path,file));
end

imexist = 1;
nb = 1;
while imexist == 1
    
    [p, f] = frame_open(file,path,nb);
    if isfile(fullfile(p,f)) == 1
        im = imread(fullfile(p,f));
        movie = uint8(frame_process(im)*255);
        
        m = floor(nb/1000);
        c = floor((nb-m*1000)/100);
        d = floor((nb-m*1000-c*100)/10);
        u = floor(nb-m*1000-c*100-d*10);
        s = size(im_name,2);
        im_name(s-7) = num2str(m);
        im_name(s-6) = num2str(c);
        im_name(s-5) = num2str(d);
        im_name(s-4) = num2str(u);
        imwrite(movie,fullfile(a,im_name));
        delete(fullfile(p,f));
        nb = nb + 1;
    else
        imexist = 0;
    end
    
    
    imshow(im)
    imb = imbinarize(im);
    se = strel('square',3);
    imb = imdilate(imb,se);
    imshow(imb)
    
    E = get_ellipse(imb);
    imshow(imb)
    hold on
    draw_ellipse(E, 'color', 'm')