source conf
timestamp=$1
bash update.sh -a rollback -t $timestamp -d $dest_path_pre -l todolist
