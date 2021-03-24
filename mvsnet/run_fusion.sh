#!/bin/sh

python depthfusion.py \
    --fusibile_exe_path ../../fusibile/build/fusibile \
    --prob_threshold 0.8 \
    --dense_folder output \
    --all
