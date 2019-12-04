clear
close all
clc

load('D:\embedded_fish\OKR_acoustic\OKR_fixed\OKR\analyse_OKR2.mat')

% 5dpf
Odir = O.dpf5{1,1};
fish = O.dpf5{1,2};
fun = @(x) x(1);
firstboutdir = cellfun(fun,fish);
t5 = Odir.*firstboutdir;
t5perfish = mean(t5,2,'omitnan');
t5all = reshape(t5,1,[]);


f5 = nan(size(fish));
for i = 1: size(fish,1)
    for j = 1:size(fish,2)
        p = 1;
        while p <= size(fish{i,j},2)
            if fish{i,j}(p) ~= 0
                f5(i,j) = fish{i,j}(p);
                p = size(fish{i,j},2) + 1;
            else
                p = p + 1;
            end
        end
    end
end
r5allrun = Odir.*f5;
r5perfish = mean(r5allrun,2,'omitnan');
r5allrun = reshape(r5allrun,1,[]);

% 6dpf
Odir = O.dpf6{1,1};
fish = O.dpf6{1,2};
firstboutdir = cellfun(fun,fish);
t6 = Odir.*firstboutdir;
t6perfish = mean(t6,2,'omitnan');
t6all = reshape(t6,1,[]);

f6 = nan(size(fish));
for i = 1: size(fish,1)
    for j = 1:size(fish,2)
        p = 1;
        while p <= size(fish{i,j},2)
            if fish{i,j}(p) ~= 0
                f6(i,j) = fish{i,j}(p);
                p = size(fish{i,j},2) + 1;
            else
                p = p + 1;
            end
        end
    end
end
r6allrun = Odir.*f6;
r6perfish = mean(r6allrun,2,'omitnan');
r6allrun = reshape(r6allrun,1,[]);

% 7dpf
Odir = O.dpf7{1,1};
fish = O.dpf7{1,2};
firstboutdir = cellfun(fun,fish);
t7 = Odir.*firstboutdir;
t7perfish = mean(t7,2,'omitnan');
t7all = reshape(t7,1,[]);

f7 = nan(size(fish));
for i = 1: size(fish,1)
    for j = 1:size(fish,2)
        p = 1;
        while p <= size(fish{i,j},2)
            if fish{i,j}(p) ~= 0
                f7(i,j) = fish{i,j}(p);
                p = size(fish{i,j},2) + 1;
            else
                p = p + 1;
            end
        end
    end
end
r7allrun = Odir.*f7;
r7perfish = mean(r7allrun,2,'omitnan');
r7allrun = reshape(r7allrun,1,[]);

% plot r_allrun
plot(4.75:0.5/19:5.25,r5allrun,'bo')
hold on
plot(5,mean(r5allrun,'omitnan'),'bo','LineWidth',2)
plot(5,mean(r5perfish,'omitnan'),'b*','LineWidth',2)
plot(5.75:0.5/19:6.25,r6allrun,'ro')
plot(6,mean(r6allrun,'omitnan'),'ro','LineWidth',2)
plot(6,mean(r6perfish,'omitnan'),'r*','LineWidth',2)
plot(6.75:0.5/19:7.25,r7allrun,'ko')
plot(7,mean(r7allrun,'omitnan'),'ko','LineWidth',2)
plot(7,mean(r7perfish,'omitnan'),'k*','LineWidth',2)
xlim([4.5 7.5])
ylim([-1.1 1.1])
title('First Directional bout')

% plot t_allrun
figure
plot(4.75:0.5/19:5.25,t5all,'bo')
hold on
plot(5,mean(t5all,'omitnan'),'bo','LineWidth',2)
plot(5,mean(t5perfish,'omitnan'),'b*','LineWidth',2)
plot(5.75:0.5/19:6.25,t6all,'ro')
plot(6,mean(t6all,'omitnan'),'ro','LineWidth',2)
plot(6,mean(t6perfish,'omitnan'),'r*','LineWidth',2)
plot(6.75:0.5/19:7.25,t7all,'ko')
plot(7,mean(t7all,'omitnan'),'ko','LineWidth',2)
plot(7,mean(t7perfish,'omitnan'),'k*','LineWidth',2)
xlim([4.5 7.5])
ylim([-1.1 1.1])
title('First bout')