#!/bin/bash

curr=$(pwd)
curr_dir=$(dirname "$curr")
work_dir="/home/jiakai/face"
echo $curr
echo $curr_dir

bich_size=64

model_name="original"

source "$curr/my_conf.sh"

A_desc="$curr/A-desc"
B_desc="$curr/B-desc"



config="train.ini"

#exit 1;

echo $model_name


#-ala $alignments_file_a -alb $alignments_file_b
alignments_file_a="$curr/A-src/alignments.fsa"
alignments_file_b="$curr/B-src/alignments.fsa"


cd "$work_dir/faceswap-master"
pwd

#exit 1;
#(face)  ubuntu  jiakai@:~/face/zhubo-hillary-full$ echo "train.sh" | cut -d '.' -f 1,2
#
#
model_dir="$curr/model"

if [ ! -d "$model_dir" ];then
        mkdir "$model_dir"
else
        echo "$model_dir dir exists"
        #exit 1 ;
fi

#######
args="-t villain \
	-bs 16 "
#original
#args=" -t $model_name -bs $bich_size  -it $it -s 100 -ss 25000 -ps 200 -w -L INFO -g $gpu_num "

args=" -t $model_name -bs $bich_size -it $it -L INFO -g $gpu_num -w "


#faceswap.py train -t original -bs 64 -it 200000 -s 100 -ss 25000 -ps 100 -w -L INFO
#cmd="python faceswap.py train  -ala $alignments_file_a -alb $alignments_file_b  -A $A_desc  -B $B_desc -m  $model_dir  $args -C $curr/$config " 
cmd="python faceswap.py train  -ala $alignments_file_a -alb $alignments_file_b  -A $A_desc  -B $B_desc -m  $model_dir  $args  " 

echo $cmd
export  CUDA_VISIBLE_DEVICES="$gpus"

eval $cmd
#-nac

