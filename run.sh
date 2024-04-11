#!/bin/bash

data="data/ARC-Challenge-validation.jsonl"
# data="data/ARC-Easy-validation.jsonl"


# 0
# model="./models/phi-1_5/"
# embedder="./models/bge-small-en-v1.5/"
# prompt="v1.0"
# N=8
# top_k=False
# reverse=False
# save_path="./output"

# 1
# model="./models/phi-1_5/"
# embedder="./models/bge-small-en-v1.5/"
# prompt="v1.0"
# N=8
# top_k=True
# reverse=False
# save_path="./output_1_e"

#2
# model="./models/phi-1_5/"
# embedder="./models/bge-small-en-v1.5/"
# prompt="v1.0"
# N=12
# top_k=True
# reverse=False
# save_path="./output_2_c"

#3
# model="./models/phi-1_5/"
# embedder="./models/bge-small-en-v1.5/"
# prompt="v1.0"
# N=4
# top_k=True
# reverse=False
# save_path="./output_3_e"

#4
# model="./models/phi-1_5/"
# embedder="./models/bge-small-en-v1.5/"
# prompt="v1.0"
# N=4
# top_k=True
# reverse=True
# save_path="./output_4_c"

#5
# model="./models/phi-1_5/"
# embedder="./models/bge-small-en-v1.5/"
# prompt="v2.0"
# N=4
# top_k=True
# reverse=False
# save_path="./output_5_e"

#6
# model="./models/phi-1_5/"
# embedder="./models/bge-large-en-v1.5/"
# prompt="v2.0"
# N=4
# top_k=True
# reverse=False
# save_path="./output_6_c"


#7
# model="./models/phi-2/"
# embedder="./models/bge-large-en-v1.5/"
# prompt="v2.0"
# N=4
# top_k=True
# reverse=False
# save_path="./output_7_e"

#8
# model="./models/phi-2/"
# embedder="./models/bge-large-en-v1.5/"
# prompt="v2.0"
# N=5
# top_k=True
# reverse=False
# save_path="./output_5_e"

#9
# model="./models/phi-2/"
# embedder="./models/bge-large-en-v1.5/"
# prompt="v2.0"
# N=9
# top_k=True
# reverse=False
# save_path="./output_9_e"

#10
# model="./models/phi-2/"
# embedder="./models/bge-large-en-v1.5/"
# prompt="v2.0"
# N=8
# top_k=True
# reverse=False
# save_path="./output_10_c"

#11
# model="./models/phi-2/"
# embedder="./models/bge-large-en-v1.5/"
# prompt="v2.0"
# N=12
# top_k=True
# reverse=False
# save_path="./output_11_e"

#12
model="./models/phi-2/"
embedder="./models/bge-large-en-v1.5/"
prompt="v1.0"
N=12
top_k=True
reverse=False
save_path="./output_12_c"


mkdir $save_path
echo python eval_fewshot.py --data_path $data --device_id "0,1" --model $model --embedder $embedder  --start_index 0 --end_index 9999 --max_len 1024 --output_path $save_path --overwrite False --prompt_type $prompt --N $N --top_k $top_k --top_k_reverse $reverse
python eval_fewshot.py --data_path $data --device_id "0,1" --model $model --embedder $embedder  --start_index 0 --end_index 9999 --max_len 1024 --output_path $save_path --overwrite False --prompt_type $prompt --N $N --top_k $top_k --top_k_reverse $reverse
python acc.py --prediction_path $save_path