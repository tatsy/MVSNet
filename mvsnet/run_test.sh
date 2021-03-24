#!/bin/sh

python test.py \
    --dtu_data_root /data/DTU \
    --dense_folder_list ../datasets/test.txt \
    --pretrained_model_ckpt_path ../pretrain/tf_model_dtu/3DCNNs/model.ckpt \
    --max_w 1600 \
    --max_h 1184 \
    --max_d 256 \
    --interval_scale 0.8 \
    --regularization 3DCNNs

