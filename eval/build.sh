#!/bin/bash

MATLAB_ROOT=/opt/software/MATLAB/R2017b

MEX=$MATLAB_ROOT/bin/mex

$MEX private/edgesNmsMex.cpp  -outdir private
