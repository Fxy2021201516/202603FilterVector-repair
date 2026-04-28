import os
import glob
import re
import csv

# ================= 配置区域 =================
BASE_DIR = "/home/fengxiaoyao/FilterVector/FilterVectorResults"
DATASETS = ["Amazon","BookReviews","Genome","Music","Reviews", "Tiktok","VariousImg","Laion"] # "Amazon","BookReviews","Genome","Music","Reviews", "Tiktok","VariousImg","Laion"
ALGORITHMS = ["SmartRoute", "SmartRoute+"]
OUTPUT_CSV = "/home/fengxiaoyao/FilterVector/FilterVectorResults/SelectModels_summary/cache_hit_rates_summary.csv"
# ============================================

def get_hit_rate(filepath, keyword):
    """
    通过正则从日志中提取特定指标的未命中率 (Miss Rate) 并计算命中率 (Hit Rate)
    """
    try:
        with open(filepath, 'r') as f:
            content = f.read()
            # 匹配模式，例如: "    10,453,298,721      cache-misses:u            #    4.754 % of all cache refs"
            pattern = rf"{keyword}.*?#\s+([\d.]+)\s*%"
            match = re.search(pattern, content)
            if match:
                miss_rate = float(match.group(1))
                hit_rate = 100.0 - miss_rate
                return f"{hit_rate:.2f}%"
    except Exception as e:
        return f"Error: {e}"
    return "N/A"

def main():
    results = []
    
    # 表头设计
    headers = ["Dataset", "Algorithm", "L1 D-Cache Hit Rate", "LLC Hit Rate", "Overall Cache Hit Rate"]
    results.append(headers)
    
    # 打印终端表头
    print(f"{headers[0]:<15} | {headers[1]:<15} | {headers[2]:<20} | {headers[3]:<15} | {headers[4]:<25}")
    print("-" * 100)

    for dataset in DATASETS:
        for algo in ALGORITHMS:
            # 动态构建路径，使用 * 作为通配符匹配长参数文件夹
            search_pattern = os.path.join(
                BASE_DIR,
                dataset,
                "Results",
                algo,
                "Index*_GT*_Search*",
                "others",
                f"{dataset}_perf_stat.log"
            )
            
            # 使用 glob 查找所有匹配的文件路径
            matched_files = glob.glob(search_pattern)
            
            # --- 新增的过滤逻辑 ---
            valid_files = []
            for f in matched_files:
                # 条件: 包含 query_select_200，且不包含 len，且不包含 ppass
                if "query_select_200" in f and "len" not in f and "ppass" not in f:
                    valid_files.append(f)
            
            if not valid_files:
                # 如果过滤后找不到文件
                print(f"{dataset:<15} | {algo:<15} | {'No Valid File Found':<20} | {'-':<15} | {'-':<25}")
                results.append([dataset, algo, "N/A", "N/A", "N/A"])
                continue
            
            # 过滤后，理论上应该只有一个准确的目标文件，取第一个
            log_file = valid_files[0]
            
            # 提取各项缓存指标
            l1_hit = get_hit_rate(log_file, "L1-dcache-load-misses:u")
            llc_hit = get_hit_rate(log_file, "LLC-load-misses:u")
            overall_hit = get_hit_rate(log_file, "cache-misses:u")
            
            # 打印到终端
            print(f"{dataset:<15} | {algo:<15} | {l1_hit:<20} | {llc_hit:<15} | {overall_hit:<25}")
            results.append([dataset, algo, l1_hit, llc_hit, overall_hit])

    # 导出到 CSV 文件
    with open(OUTPUT_CSV, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(results)
    
    print("-" * 100)
    print(f"✅ 统计完成！结果已导出至: {OUTPUT_CSV}")

if __name__ == "__main__":
    main()