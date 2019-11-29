function[seqtailbin, tail]=ExtractTail(frame, Bkgsm, tailthresh, Xtail1, Ytail1, Xtail2, Ytail2)

seqtail=frame(Ytail1:Ytail2, Xtail1:Xtail2); % frame around the tail
seqtailnorm=(1-double(seqtail)./Bkgsm); %normalized to background
seqtailbin=im2bw(seqtailnorm, tailthresh); %binarized
tail=imresize(seqtailbin, 0.5);

end