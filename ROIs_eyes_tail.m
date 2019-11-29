% Get ROIs eyes and tail for real-time acquisition
% disp('Select one frame for creating background file')
% [file, path] = uigetfile('*.pgm',[],'D:\embedded_fish\OKR_acoustic');
% im = imread(fullfile(path,file));
imref = im;

%% get the background by detouring the fish
imshow(imref); 
caxis auto;
disp('outline the tail including air bladder, double-click')
[BW,xi,yi]=roipoly();
Bkg = double(regionfill(imref,xi,yi)); % Background image
Bkgsm = imfilter(Bkg,G,'symmetric');

% %% get the ROI of the tail and set background
% disp('define ROI for the tail, including air bladder');
% h = imrect;
% posreg=getPosition(h);
% Xtail1 = round(posreg(1));
% Ytail1 = round(posreg(2));
% Xtail2 = round(Xtail1 + posreg(3));
% Ytail2 = round(Ytail1 + posreg(4));
% %seqroi=seq(Ytail1:Ytail2, Xtail1:Xtail2,:);
% 
% seqtail = imref(Ytail1:Ytail2, Xtail1:Xtail2);
% Bkgsm = Bkgsm(Ytail1:Ytail2, Xtail1:Xtail2);
% seqtailnorm = (1-double(seqtail)./Bkgsm);
% tailthresh=graythresh(seqtailnorm);
% n = tailthresh;
% while n ~= 0
%     binim = im2bw(seqtailnorm, tailthresh);
%     imshow(binim);
%     disp(n);
%     n = input('Enter a number: ');
%     if ne(n,0)
%         tailthresh=n;
%     end
% end
% disp(tailthresh);
% Npixelon = sum(sum(binim));
% 
% % get taillength
% disp('determine tail length (trace line from rostral part of air bladder to caudal p. of the tail)');
% h = imline;
% wait(h);
% tc = getPosition(h);
% taillength = sqrt((max(tc(1,1),tc(2,1))-min(tc(1,1),tc(2,1)))^2 + (max(tc(1,2),tc(2,2))-min(tc(1,2),tc(2,2)))^2);
% disp(taillength);
% % used to be :
% % taillength=0.85*(Xtail2-Xtail1);
% 
% %%
% 
% win=5; % window size in pixel for image smoothing
% G = fspecial('gaussian',[win win],2);
% % calculate the X center of mass of the tail
% seqtail = seq(Ytail1:Ytail2, Xtail1:Xtail2,:);
% seqtail = imfilter(seqtail,G,'symmetric');
% seqtailnorm = (1-bsxfun(@rdivide,double(seqtail),Bkgsm));
% meanseqtailnorm = mean(seqtailnorm,3); %mean of all the sequence of images
% prof=squeeze(mean(meanseqtailnorm,2));
% profmean = mean(prof,2); % UNNECESSARY ??
% xcenter = mean((1:length(profmean))*profmean)/sum(profmean); 
% [Xtail] = meshgrid(1:size(seqtail,1),1:size(seqtail,2));% create matrix distance to axis
% Xtail = Xtail'-xcenter;