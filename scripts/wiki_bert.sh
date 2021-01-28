#!/bin/bash

max_seeds=10
current_seed=0

while(( $current_seed < $max_seeds ))
do
    python run_model.py --do_train --do_lower_case \
        --data_dir ./data/wiki \
        --bert_model bert-base-uncased \
        --max_seq_length 128 \
        --train_batch_size 32 \
        --learning_rate 2e-5 \
        --num_train_epochs 20 \
        --early_stop 5 \
        --output_dir runs/bert-wiki-$current_seed \
        --seed $current_seed \
        --task_name wiki \
        --negative_weight 0.125
    let current_seed++
done
