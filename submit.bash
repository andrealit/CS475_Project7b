#!/bin/bash

#SBATCH -J AutoCorr
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH -N 14 # number of nodes
#SBATCH -n 14 # number of tasks
#SBATCH --constraint=ib
#SBATCH -o autocorr.out
#SBATCH -e autocorr.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tongsaka@oregonstate.edu
module load openmpi
mpic++ proj7.cpp -o autocorr -lm
mpiexec -mca btl self,tcp -np 10 ./autocorr
