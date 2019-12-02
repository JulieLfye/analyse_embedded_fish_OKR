% test for defining angle

% im = imread('D:\embedded_fish\OKR_acoustic\OKR_fixed\OKR\19-11-18\fish_01\run_02\bout1_bin\bin_0190.pgm');
% im = imread('E:\data\embedded_fish\OKR_acoustic\OKR_fixed\OKR\19-11-18\fish_01\run_02\bout1_bin\bin_0190.pgm');
im = imread('C:\Users\Julie Lafaye\Documents\MATLAB\bout1_bin\bin_0173.pgm');
figure(1)
imshow(im)
% disp('Select the head, no swim bladder')
% rect = round(getrect);

xhead = rect(1)+round(rect(3)/2);
yhead = rect(2)+round(rect(4)/2);
[~,~,n,~] = bwboundaries(im);
% dist = 0;

ims = bwmorph(im,'close');
ims = bwmorph(ims,'thin');
ims = bwmorph(ims,'skel',Inf);
% figure(2)
% imshow(ims)

It = bwmorph(ims,'thin','inf');
B =  bwmorph(It,'branchpoints');
[i,j] = find(bwmorph(It,'endpoints'));
figure(2);
imshow(It);


if n == 1
    D = bwdistgeodesic(It,find(B),'quasi');
    dist = 0;
    for p = 1:numel(i)       
        if D(i(p),j(p)) > dist
            dist = D(i(p),j(p));
            yt = i(p);
            xt = j(p);
        end
    end
    ang = mod(fishangle(xhead,yhead,xt,yt)+180,360);
    
elseif n == 2
    
end
