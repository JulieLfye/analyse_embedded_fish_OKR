%% convert movie into binarize movie (0-255)
clear;
clc;

j = 1;
all_file = [];
all_path = [];
n = 0;
while j~= 0
    
    disp('Select the first frame');
    %     [f,p] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic');
    [f,p] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic\OKR_fixed\OKR\19-11-18\fish_01\run_02\bout1');
    
    all_file = [all_file '/' f];
    all_path = [all_path '/' p];
    n = n + 1;
    
    %     j = input('Other file to binarize? yes:1   no:0     ');
    j = 0;
end

all_file = [all_file '/'];
all_path = [all_path '/'];

f_file = strfind(all_file,'/');
f_path = strfind(all_path,'/');

tail_angle = nan(1,151);

tic
for k = 1:n
    file = all_file(f_file(k)+1:f_file(k+1)-1);
    path = all_path(f_path(k)+1:f_path(k+1)-1);
    
    im = imread(fullfile(path,file));
    im = im(5:end-5,5:end-5);
    imb = imbinarize(im,12/255);
    imshow(imb)
    rect = round(getrect);
    close
    
    imexist = 1;
    nb = 151;
    im_name = 'bin_0000.pgm';
    while imexist == 1
        
        [p, f] = frame_open(file,path,nb);
        if isfile(fullfile(p,f)) == 1
            im = imread(fullfile(p,f));
            im = im(5:end-5,5:end-5);
            imb = imbinarize(im,12/255);
            imb(rect(2):rect(2)+rect(4)+1,rect(1):rect(1)+rect(3)+1) = 0;
            se = strel('square',2);
            ima = imdilate(imb,se);
            im_bw = bwareaopen(ima,100,4);
            im_bw = imfill(im_bw, 'holes');
            
            m = floor(nb/1000);
            c = floor((nb-m*1000)/100);
            d = floor((nb-m*1000-c*100)/10);
            u = floor(nb-m*1000-c*100-d*10);
            im_name(end-7) = num2str(m);
            im_name(end-6) = num2str(c);
            im_name(end-5) = num2str(d);
            im_name(end-4) = num2str(u);
            imwrite(im_bw,fullfile('D:\embedded_fish\OKR_acoustic\OKR_fixed\OKR\19-11-18\fish_01\run_02\bout1_bin',...
                im_name))
            % return
            nb = nb + 1;
        else
            imexist = 0;
        end
    end
    close all
end
toc