dname=$(date "+%Y%m%d-%H%M%S")

convert_name=$1

if [ "$1" == ""  ];then
	echo "enter convert_name"
	exit 1;
fi

cmd="ffmpeg -i ./converted-$convert_name/img_%0d.png -c:v libx264 -vf "fps=25,format=yuv420p" convert-movie-$convert_name-$dname.mp4"

eval $cmd

