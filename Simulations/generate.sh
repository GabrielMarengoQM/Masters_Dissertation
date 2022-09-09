#!/bin/bash
#$ -cwd           # Set the working directory for the job to the current directory
#$ -pe smp 4	  # Request 4 core
#$ -l h_rt=1:0:0  # Request 1 hour runtime
#$ -l h_vmem=4G   # Request 4GB RAM
#$ -t 1-10

module load java

mkdir /path/to/dir/Simulations${SGE_TASK_ID}
cd /path/to/dir/Simulations${SGE_TASK_ID}
$DIR=/path/to/dir/Simulations${SGE_TASK_ID}

bash /path/to/dir/sim.sh $DIR
