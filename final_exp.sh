#!/bin/bash
set -e

echo "=== 开始执行实验... ==="

# echo "$(date): [步骤 1] 运行 experiments-Reviews-1-2..."
# cd /home/fengxiaoyao/FilterVector/FilterVectorCode
# ./exp.sh experiment_json/experiments-Reviews-1-2.json

echo "$(date): [步骤 0] 运行 experiments-Amazon-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-Amazon-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 1] 运行 experiments-BookReviews-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-BookReviews-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 2] 运行 experiments-Genome-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-Genome-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 3] 运行 experiments-Music-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-Music-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 4] 运行 experiments-Reviews-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-Reviews-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 5] 运行 experiments-Tiktok-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-Tiktok-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 6] 运行 experiments-VariousImg-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-VariousImg-FastSmartRoute-big.json > output.log

echo "$(date): [步骤 7] 运行 experiments-Laion-FastSmartRoute-big..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-big-FastSmartRoute/experiments-Laion-FastSmartRoute-big.json > output.log



echo "$(date): === 所有任务执行完毕。 ==="