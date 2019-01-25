source conf

for i in `cat todolist`
do
	echo ">>>>>>>>>>>>>>>>>>>> $i >>>>>>>>>>>>>>>>>>"
	diff $data_path_pre/$i $dest_path_pre/$i
	echo ">>>>>>>>>>>>>>>>>>>> $i >>>>>>>>>>>>>>>>>>"
	echo "按任意键继续..."
	read
done
