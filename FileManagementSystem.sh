echo "1.Access a Repository"
echo "2.Create a new Repository"
echo "3.View Log file"
echo "4"
function accessRepository {
	ls -d */
	echo "Please enter the repository from the list you would like to access"
	read repoInput
	cd $repoInput
	echo "The current files in this repository are:"
	ls 
	accessRepoOptions
	
}
function accessRepoOptions {
	echo "1:Would you like to Create a new file:"
	echo "2:Edit an exisiting file "
	echo "3:View backups"
	echo "4:Log a file into the repo"
	echo "5:Exit"
	read repoMenuInput
	if [ $repoMenuInput -eq 1 ]
	then
                echo "Please enter a file name "
		read newFileName
		touch $newFileName.txt
		ls
	elif [ $repoMenuInput -eq 2 ]
	then
		ls
		echo "Please enter the name of the file you wish to edit"
		read fileToEdit
		cp -a  $fileToEdit backUp$fileToEdit.txt
		vi $fileToEdit.txt
	elif [ $repoMenuInput -eq 3 ]
	then
		find . -name "*backUp*" -print
		echo "Please enter the name of the file from the list that you would like to view"
		read backupFilename
		vi $backupFilename.txt
	elif [ $repoMenuInput -eq 4 ]
	then
		echo "Select the repo you would like to log the file into"
		ls -d */
		read repoName
		echo "Select the file you would like to log "
		ls
		read fileName
		cd ..
		mv $repoName $fileName.txt

fi
}
function newRepo {
	echo "Please enter the name of the new repository"
	read newRepoName
	mkdir $newRepoName
	ls
}
read -p "Please enter a number: " menuInput 
if [ $menuInput -eq 1 ]
	then
	       	accessRepository 
	elif [ $menuInput -eq 2 ]
then 
	newRepo


	else
	        echo "it hasnt :("	
	fi


