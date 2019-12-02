im = imread('C:\Users\Julie Lafaye\Documents\MATLAB\bout1_bin\bin_0151.pgm');
figure(1)
imshow(im)

ims = bwmorph(im,'close');
ims = bwmorph(ims,'thin');
ims = bwmorph(ims,'skel',Inf);
figure(2)
imshow(ims)
I = ims;

It = bwmorph(I,'thin','inf');
B =  bwmorph(It,'branchpoints');
[i,j] = find(bwmorph(It,'endpoints'));
D = bwdistgeodesic(It,find(B),'quasi');
imshow(ims);
for n = 1:numel(i)
    text(j(n),i(n),[num2str(D(i(n),j(n)))],'color','g');
    D(i(n),j(n));
end

