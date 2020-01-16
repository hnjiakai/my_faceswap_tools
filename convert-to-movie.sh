curr=$(pwd)
parm=$1
work_dir="/home/jiakai/face"

echo "$parm"

if [ "$parm" = "" ];then
   echo 'no parm 1'
   exit 1  ;
fi

cmd1="$work_dir/convert.sh $parm" 

echo $cmd1

eval $cmd1

cd "$curr"

cmd2="$work_dir/to-movie.sh $parm"

echo $cmd2

eval $cmd2


