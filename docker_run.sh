#!/bin/sh

docker run \
    --gpus 1 \
    -v /home/tatsuya/Desktop/MVSNet/tf_model_dtu:/home/root/MVSNet/tf_model_dtu \
    -v /home/tatsuya/Desktop/MVSNet/output:/home/root/MVSNet/mvsnet/output \
    -v /media/tatsuya/HDD2/DTU:/data/DTU \
    -it mvsnet \
    /bin/bash -c "cd mvsnet && python test.py --dtu_data_root /data/DTU --dense_folder_list ../datasets/test.txt --regularization 3DCNNs --max_w 1152 --max_h 864 --max_d 192 --interval_scale 1.06 --inverse_depth False --pretrained_model_ckpt_path ../tf_model_dtu/3DCNNs/model.ckpt"
