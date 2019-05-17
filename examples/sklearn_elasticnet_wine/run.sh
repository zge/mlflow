#!/bin/bash
#
# Setup series of runs of train.py to tune hyper-parameters
#
# Usage: 
#  ./run.sh <refresh>
#  refresh is by default false
#  if true, exisited runs in 'mfruns' dir will be removed
#
# Zhemhao Ge, 2019-05-16

refresh=${1:-"false"}
logdir=mlruns
if [ -d ${logdir} ] && [ ${refresh} = true ]; then
  rm -rf ${logdir}
  echo "removed exisited ${logdir}"
fi  

# setup hyper-parameters to loop with
alphas=(1 0.5 0)
l1_ratios=(1 0.5 0.2 0)

for alpha in ${alphas[@]}; do
  for l1_ratio in ${l1_ratios[@]}; do
    echo "running train.py with alpha ${alpha} & l1_ratio ${l1_ratio} ..."
    python train.py ${alpha} ${l1_ratio}
  done
done
