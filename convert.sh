curr=$(pwd)
curr_dir=$(dirname "$curr")
work_dir="/home/jiakai/face"

echo $curr
echo $curr_dir

source "$curr/my_conf.py"

model_dir="model"

convert_name="$1"
if [ "$convert_name" == "" ];then
	echo "please enter convert_name "
	exit 1 ;
fi


converted_dir="$curr/converted-$convert_name"
if [ ! -d "$converted_dir" ];then
	mkdir $converted_dir
fi


cd  "$work_dir/faceswap-master"

#args=" -c seamless-clone \
#      -g 2 \
#      -j 0 \
#
#      "
      #-c avg-color \
      #-c match-hist \
#export CUDA_VISIBLE_DEVICES='3'      
args=" -g 2 -j 0 "
#-M extended

args=" -w opencv -osc 100 -l 0.4 -j 0 -L INFO"
args=" -c seamless-clone -w opencv -j 0 -L INFO"
# -c match-hist -M extended
# -m dfl_full

#args=" -c seamless-clone -M predicted -w opencv -osc 100 -l 0.4  -j 0 -L INFO"
args=" -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"
#args=" -c seamless-clone -M extended -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"
#-M蒙版需要、这样效果会好些,有蒙版专注关键区域

#args=" -c seamless-clone -M extended -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"
#args=" -M extended -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"
#args=" -c seamless-clone -M extended -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"
#args=" -c manual-balance -M extended -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"

####args=" -c match-hist -M predicted -sc none -w opencv -osc 100 -l 0.4 -j 0 -L INFO"

args=" -c seamless-clone -M extended "

#args=" " 

cmd="python faceswap.py convert -i $curr/A-src -o $converted_dir -m $curr/$model_dir $args  "

echo $cmd

#export  CUDA_VISIBLE_DEVICES="3"

eval $cmd

