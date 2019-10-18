if [ -f log_file.log ]
then
	date > log_file.log
	source FileManagementSystem.sh | tee -a log_file.log

else 
	touch log_file.log
	date > log_file.log
	source FilemanagementSystem.sh | tee -a log_file.log
	
fi

