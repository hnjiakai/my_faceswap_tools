curr=$(pwd)
curr_dir=$(dirname "$curr")
faceswap_work_dir="/home/jiakai/face"
echo $curr
echo $curr_dir
parm="$1"
echo "\$1=$parm"
if [ "$parm" != "A" ] &&  [ "$parm" != "B" ];then 
	echo '$1 <>A or B, so exit'
	exit 1;
fi
src_dir="$curr/$parm-src"
desc_dir="$curr/$parm-desc"
#echo "$b_desc_dir"
if [ ! -d "$desc_dir" ];then
	mkdir "$desc_dir"
else
	echo "$desc_dir dir exists"
	#exit 1 ;
fi
cd "$faceswap_work_dir/faceswap-master"
pwd
#mkdir ../zhubo-hillary/hillary-desc
#faceswap.py extract -D s3fd -A fan -M extended -nm none -min 0 -l 0.4 -een 1 -sz 256 -si 0 -L INFO
#args=" -D s3fd -A fan -M vgg-clear -nm hist -l 0.4 -een 1 -sz 256 -si 0 -L INFO  "
args=" -M extended "
#args=""
cmd="python faceswap.py extract -i $src_dir -o $desc_dir $args"
echo $cmd
eval $cmd



