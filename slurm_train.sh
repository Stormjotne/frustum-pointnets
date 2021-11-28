#!/bin/bash
#SBATCH --job-name=frustum-pointnets-train
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000mb
#SBATCH --partition=gpu
#SBATCH --gpu:1
#SBATCH --time=12:00:00

srun -p dgx2q -N 1 -n 8 --gres=gpu:1 --pty /bin/bash --login

module purge
module load cuda10.0/toolkit/10.0.130

srun python ./train/train.py --gpu 0 --model frustum_pointnets_v1 --log_dir train/log_v1 --num_point 1024 --max_epoch 1 --batch_size 32 --decay_step 800000 --decay_rate 0.5

