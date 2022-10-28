# CUDA_VISIBLE_DEVICES_set_n_least_memory_usage() {
#     local n=${1:-"9999"}
#     echo "GPU Memory Usage:"
#     local FIRST_N_GPU_IDS=$(nvidia-smi --query-gpu=memory.used --format=csv \
#         | tail -n +2 \
#         | nl -v 0 \
#         | tee /dev/tty \
#         | sort -g -k 2 \
#         | awk '{print $1}' \
#         | head -n $n)
#     export CUDA_VISIBLE_DEVICES=$(echo $FIRST_N_GPU_IDS | sed 's/ /,/g')
#     echo "Now CUDA_VISIBLE_DEVICES is set to:"
#     echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
# }

# CUDA_VISIBLE_DEVICES_set_n_least_memory_usage 4

# export CUDA_LAUNCH_BLOCKING=1
python main.py --logdir /tmp/data -t --postfix test -b train_ddp.yaml 
