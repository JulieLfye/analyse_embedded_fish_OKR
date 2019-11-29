% clear;
% close all;
% clc;

file = 'tracking.txt';
% disp('Select the folder with the movie to analyze');
% selpath = uigetdir('D:\embedded_fish\OKR_acoustic\');

path = fullfile(selpath,'Tracking_Result');
t = readtable(fullfile(path,file),'Delimiter','\t');
s = table2array(t);

[nb_frame, nb_detected_object, xbody, ybody, ang_body, xtail,...
    ytail, ang_tail] = extract_parameters_from_fast_track(s);