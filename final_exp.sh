#!/bin/bash
set -e

echo "=== 开始执行实验... ==="

# echo "$(date): [步骤 1] 运行 experiments-Reviews-1-2..."
# cd /home/fengxiaoyao/FilterVector/FilterVectorCode
# ./exp.sh experiment_json/experiments-Reviews-1-2.json

echo "$(date): [步骤 0] 运行 experiments-Amazon-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-Amazon-pf-mixed-len.json > output.log

echo "$(date): [步骤 1] 运行 experiments-BookReviews-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-BookReviews-pf-mixed-len.json > output.log

echo "$(date): [步骤 2] 运行 experiments-Genome-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-Genome-pf-mixed-len.json > output.log

echo "$(date): [步骤 3] 运行 experiments-Music-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-Music-pf-mixed-len.json > output.log

echo "$(date): [步骤 4] 运行 experiments-Reviews-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-Reviews-pf-mixed-len.json > output.log

echo "$(date): [步骤 5] 运行 experiments-Tiktok-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-Tiktok-pf-mixed-len.json > output.log

echo "$(date): [步骤 6] 运行 experiments-VariousImg-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-VariousImg-pf-mixed-len.json > output.log

echo "$(date): [步骤 7] 运行 experiments-Laion-pf-mixed-len..."
cd /home/fengxiaoyao/FilterVector/FilterVectorCode
./exp.sh experiment_json/202603-pf-mixed-len/experiments-Laion-pf-mixed-len.json > output.log



echo "$(date): === 所有任务执行完毕。 ==="