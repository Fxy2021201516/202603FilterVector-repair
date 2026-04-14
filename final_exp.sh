#!/bin/bash
set -e

echo "=== 开始执行实验... ==="

# echo "$(date): [步骤 1] 运行 experiments-Reviews-1-2..."
# cd /home/fengxiaoyao/FilterVector/FilterVectorCode
# ./exp.sh experiment_json/experiments-Reviews-1-2.json

echo "$(date): [步骤 0] 运行 experiments-Amazon-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-Amazon-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 1] 运行 experiments-BookReviews-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-BookReviews-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 2] 运行 experiments-Genome-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-Genome-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 3] 运行 experiments-Music-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-Music-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 4] 运行 experiments-Reviews-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-Reviews-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 5] 运行 experiments-Tiktok-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-Tiktok-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 6] 运行 experiments-VariousImg-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-VariousImg-SmartRoute_reviesd-small-efs.json > output.log

echo "$(date): [步骤 7] 运行 experiments-Laion-SmartRoute_reviesd-small-efs..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-SmartRoute_reviesd-small-efs/experiments-Laion-SmartRoute_reviesd-small-efs.json > output.log



echo "$(date): === 所有任务执行完毕。 ==="