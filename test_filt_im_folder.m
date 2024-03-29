%% convert movie into binarize movie (0-255)
clear;
clc;

j = 1;
all_file = [];
all_path = [];
n = 0;
while j~= 0
    
    disp('Select the first frame');
    [f,p] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic');
    
    all_file = [all_file '/' f];
    all_path = [all_path '/' p];
    n = n + 1;
    
    j = input('Other file to binarize? yes:1   no:0     ');
end

all_file = [all_file '/'];
all_path = [all_path '/'];

f_file = strfind(all_file,'/');
f_path = strfind(all_path,'/');

tic
for k = 1:n
    file = all_file(f_file(k)+1:f_file(k+1)-1);
    path = all_path(f_path(k)+1:f_path(k+1)-1);
    
    im = imread(fullfile(path,file));
    
    mkdir(path(1:end-6),'movie_filtered3');
    a = fullfile(path(1:end-6),'movie_filtered3');
    imshow(im)
    rect = round(getrect);
    im_name = 'movie_filt_0001.pgm';
    
    w = waitbar(0,sprintf('Conversion, movie %d / %d', k, n));
    imexist = 1;
    nb = 1;
    while imexist == 1
        
        [p, f] = frame_open(file,path,nb);
        if isfile(fullfile(p,f)) == 1
            im = imread(fullfile(p,f));
            d = imnlmfilt(im(rect(2):rect(2)+rect(4)+1,rect(1):rect(1)+rect(3)+1));
            d = imadjust(d);
            T = adaptthresh(d,0.6);
            background = uint8(T*255);
            movie = background-d;
            movie = imadjust(movie);
            
            
            
            m = floor(nb/1000);
            c = floor((nb-m*1000)/100);
            d = floor((nb-m*1000-c*100)/10);
            u = floor(nb-m*1000-c*100-d*10);
            im_name(end-7) = num2str(m);
            im_name(end-6) = num2str(c);
            im_name(end-5) = num2str(d);
            im_name(end-4) = num2str(u);
            imwrite(movie,fullfile(a,im_name));
            nb = nb + 1;
        else
            imexist = 0;
        end
    end
    close(w);
    close all
end
toc