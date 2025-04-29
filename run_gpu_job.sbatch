#!/bin/bash
#SBATCH -J gpu_job                  # Job name
#SBATCH -p 96x24gpu4               # Partition with GPUs
#SBATCH --gres=gpu:1               # Request 1 GPU (adjust if more needed)
#SBATCH -n 1                       # 1 MPI task
#SBATCH --cpus-per-task=4         # Number of CPU cores per task
#SBATCH --mem=16G                 # Memory per node
#SBATCH -t 02:00:00               # Time limit (hh:mm:ss)
#SBATCH -o logs/%x_%j.out         # Stdout log file
#SBATCH -e logs/%x_%j.err         # Stderr log file
#SBATCH --mail-user=<your_cruzid>@ucsc.edu
#SBATCH --mail-type=END,FAIL

# Activate your conda environment
module load miniconda3
conda activate myenv

# Optional: Print info
echo "Running on node: $SLURM_NODELIST"
echo "Job ID: $SLURM_JOB_ID"

# Run your script
python3 scripts/train_soe.py -config sample_configs/soe/aggregation_baseline.json


