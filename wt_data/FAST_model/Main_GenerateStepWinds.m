%% Documentation
% Generate step wind files for FAST

%% Initialization
clear all; close all; clc
addpath(genpath('C:/Work/Work/2018-NREL/FAST/matlab-toolbox/'))

%% Parameters
outDir = 'Wind/';
VRated = 11.4;

%% Sweep over the full overating span for powercurve
dt     = 1;
tstep  = 100 ;
% GenStepWindFile([outDir 'StepWindSweep_1mps.wnd'],[3:30],tstep,dt)
WS = [11:-1:3];
GenStepWindFile([outDir 'StepWindSweep_m1mps.wnd'],WS,tstep,dt)
tend=length(WS)*tstep
disp('[ OK ]' )

