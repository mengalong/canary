#!/bin/bash
source conf
source_path=$1
dest_path=$2
log_file=$3
function gene_it()
{
	arr=('|' '/' '-' '\\')
	index=0
	total_num=`cd $source_path && find . -type f | egrep -v "$ignore" | wc -l`
	batch_num=`echo "$total_num/100" | bc`
	num=0
	bar="#"
	cd $source_path && find . -type f | egrep -v "$ignore" | while read it
	do
		dest_file="${dest_path}/$it"
		if [ ! -f $dest_file ]
		then
			echo "new_file $it" >>$log_file
		else
			new_md5=`md5sum $it | awk '{print $1}'`
			old_md5=`md5sum ${dest_path}/$it | awk '{print $1}'`
			if [ x"$new_md5" != x"$old_md5" ]
			then
				echo "diff_file $it" >>$log_file
			fi
		fi
		((num++))
		let index=num%4
		let batch_ratio=num%batch_num
		ratio=`echo "$num*100/$total_num" | bc`
		if [ $batch_ratio -eq 0 ]
		then
			bar="#"$bar
		fi
		printf "[%-74s][%d%%][%c]\r" $bar $ratio ${arr[$index]}
	done
	echo
}

gene_it
