# pytorch_hed

## Disclaimer
* This repo forks from https://github.com/BinWang-shu/pytorch_hed
* The implementation of hed using pytorch.


## Steps to take

1. clone this repo
```bash
git clone https://github.com/zchrissirhcz/pytorch_hed
```

2. Get vgg16.pth
```bash
wget https://download.pytorch.org/models/vgg16-397923af.pth
```

3. Get BSDS data
```bash
wget http://vcl.ucsd.edu/hed/HED-BSDS.tar
tar -xvf HED-BSDS.tar
```
You may need to change HED-BSDS folder's path in `config.py`.
`utils/dataset.py`'s BSDS500 and BSDS500_TEST class provide default HED-BSDS path but may be not consistent with yours.

4. Begin training

Without log file:
```
python train.py
```
 
With log file:
```
tmux new -s pytorch_hed_train
./scripts/train.sh

Ctrl-B + D  # Detatch

# Then in any terminal
tailf log.txt
```

I've trained with default parameters on a 1080Ti GPU with Ubuntu16.04, PyTorch 0.4.
See `https://github.com/zchrissirhcz/pytorch_hed/blob/master/log/train_log.2018.07.09` for my training result.


5. Tesing
```bash
python test.py
```

6. Evaluation

This step is based on the result of previous step. In `eval` folder there are some MATLAB and Cpp files ported from related open-source projects.

```bash
cd eval
bash build.sh
```

Then open MATLAB and run `edge_nms.m`. (You may need to change paths in this script)

Then prepare [`BSR`](http://www.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/BSR/BSR_full.tgz) and [`toolbox`](https://github.com/pdollar/toolbox), put them or create soft link in `external` folder.

Then in MATLAB run `bench_bsds500.m`. (You may again need to change paths in this script, and this script takes several hours for BSDS500 edge detection evalution).


## TodoList

0. Train the model with default hyper-parameters

1. Add evaluation on BSDS500 benchmark

2. Manifest if this implementation is in consistent with official HED paper

3. Implement Richer Convolution Features for Edge Detection (RCF, CVPR2017)

4. WeBox

## Misc
<del>I have got ODS=0.771 on BSDS500 dataset with Adam.</del>

## Change Log
2018/7/9    first commit, forks and configured HED's used BSDS500 dataset

2018/7/10   add training log file with default hyper-parameter settings

2018/7/11   add evalution code and related generated files
