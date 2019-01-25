source conf
log_file="`pwd`/xx"
:>$log_file
bash get_change_list.sh $data_path_pre $dest_path_pre $log_file
awk '{print $NF}' $log_file >todolist
