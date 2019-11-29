function[moment]=ExtractMoment(seqtailbin, Xtail, taillength)

Npixelon=sum(sum(seqtailbin)); % number of pixels composing tail
seqmom=double(Xtail).*double(seqtailbin)/Npixelon/taillength;
moment=-squeeze(sum(sum(seqmom,1),2))';

end