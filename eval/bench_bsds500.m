addpath ('/opt/work/pytorch_hed/external/BSR/bench/benchmarks')

clear all;close all;clc;

imgDir = '/opt/work/pytorch_hed/external/BSR/BSDS500/data/images/test';
gtDir = '/opt/work/pytorch_hed/external/BSR/BSDS500/data/groundTruth/test';
%inDir = '../BSDS500/ucm2/test';
%outDir = '../BSDS500/ucm2/test_eval';

inDir = '/opt/work/pytorch_hed/test/fuse-nms';
outDir = '/opt/work/pytorch_hed/test/fuse-nms-eval';

mkdir(outDir);

% running all the benchmarks can take several hours.
tic;
%allBench(imgDir, gtDir, inDir, outDir)
boundaryBench(imgDir, gtDir, inDir, outDir);
toc;

plot_eval(outDir);
