#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH -J "genunity"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o genunity-slurm.%N.%j.out # STDOUT
#SBATCH -e genunity-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
#
#

python -u -c "import PyHipp as pyh; \
import DataProcessingTools as DPT; \
DPT.objects.processDirs(dirs=None, objtype=pyh.Unity, saveLevel=1);"

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:536697258927:awsnotify --message "JobDone"


