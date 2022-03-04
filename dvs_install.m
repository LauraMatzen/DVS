% This is the install script for the Data Visualization Saliency Model

% Get current directory
pathroot = pwd;

% Add gbvs to path
gbvsPath = [pathroot filesep 'gbvs'];
addpath(genpath(gbvsPath), '-begin');

% Add textSaliency to path
tsPath = [pathroot filesep 'textSaliency'];
addpath(tsPath, '-begin');

% Add dvs to path
addpath(pathroot, '-begin');

% Save new path, so we only have to run this script once
savepath

% Save mypath.mat to gbvs/util as pathroot variable name
pathroot = gbvsPath;
save -mat gbvs/util/mypath.mat pathroot

