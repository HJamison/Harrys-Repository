
function createNewfile { #This functions allows the user to create a new file 
    echo "Please enter a file name without incuding any file extensions "
	read newFileName
	touch $newFileName.txt
	echo "$newFileName.txt created!"
	menuOpt

}
function editFile { #THis function allows the user to edit the text in a file. It also creates a backup file with the uneditied version
	ls -p | grep -v / 
	echo "Please enter the name of the file you wish to edit without including any file extensions"
	read fileToEdit
	while [[ ! -f $fileToEdit ]]
	do
		echo "file does not exist"
		echo "Please enter the name of the file you wish to edit without including any file extensions"
		read fileToEdit
	done
	cp -a  $fileToEdit backUp$fileToEdit.txt
	vi $fileToEdit.txt
	menuOpt
}
function viewBackups { #this function shows a list of all the backup files 
		find . -name "backUp" -print
		echo "Please enter the name of the file from the list that you would like to view without including any file extensions"
		read backupFilename
		vi $backupFilename.txt
		menuOpt
}
function logFile { # this function allows the user to log a file into a repository
		echo "Select the file you would like to log without including any file extensions"
		ls -p | grep -v / 
		read fileName
		while [[ ! -f $fileName ]]
		do
			echo "file does not exist"
			echo "Select the file you would like to log without including any file extensions"
			read fileName
		done
		filePath=$(pwd)
		echo "Select the repo you would like to log the file into"
		moveToDir	
		dirPath=$(pwd)	
		ls -d */
		read repoName
		mv $filePath"/"$fileName.txt $dirPath"/"$repoName
		menuOpt
}
function zipunzip { # this function offers the user the ability to zip and unzip the files 
        echo "press 1 if you want to zip"
        echo "press 2 if you want to unzip"
        read choice
        while [[ ! ${choice} =~ ^[1-2]+$ ]]
        do
		    echo "Please enter in a valid option:"
		    read choice
		done
        if [ $choice -eq 1 ]
        then
            echo "Enter the name of the directory you want to zip"
            ls -d */
            read folderToZip
            zip $folderToZip.zip -r $folderToZip

        elif [ $choice -eq 2 ]
        then
            echo "Enter the name of the zipfile you want to unzip"
            ls
            read folderToUnzip
            while [[ ! -f $folderToUnzip ]]
			do
				echo "Zipfile does not exist"
				echo "Please enter the zipfile"
				read folderToUnzip
			done
            mkdir $folderToUnzip.unzipped
            unzip $folderToUnzip -d /
        fi   
    menuOpt 
}
function compile { # This functions allows the user to compile programs 
	echo -e "\nThis are the files within the directory:\n"
	ls -p | grep -v /
	echo -e "\nPlease enter the full name of the file you want to compile including extensions: "
	read fileToCompile
	while [[ ! -f $fileToCompile ]]
	do
		echo "file does not exist"
		echo "Select the file you would like to compile including extensions"
		read fileToCompile
	done
	gcc $fileToCompile -o $fileToCompile.compiled
	echo "The file $fileToCompile.compiled has been compiled succefully"
	menuOpt
}

function delete { # this function allows the suer to delete a file or a repository from the system
	echo "1.Delete a file "
	echo "2.Delete a directory and contents "
	read option
	if [ $option -eq 1 ]
	then	
	ls
	echo "Please enter the name of the file you wish to delete without incuding any file extensions "
	read fileToDelete
	while [[ ! -f $fileToDelete ]]
	do
		echo "file does not exist"
		echo "Please enter the name of the file you wish to delete including file extensions "
		read fileToDelete
	done
	echo -e "$fileToDelete has been removed\n"
	rm $fileToDelete
	ls
	echo ""
	menuOpt
	elif [ $option -eq 2 ]
	then
	ls
	echo -e "\nPlease enter the name of the directory you wish to delete"
	read dirToDelete
	rm -r $dirToDelete
	ls
	menuOpt
fi
}
function moveToDir { # This function is to allow the user to cycle between directories this is to allow better functionality for other functions
	int=0
	while [ $int=0 ]
	do
		echo $(pwd)
		echo "Is this the directory in which you want to work in?"
		echo "The contents of this directory are:"
		ls
		echo "For Yes- 1"
		echo "For No- 0"
		echo $'\n'
		read int
		
		if [ $int -eq 1 ]
		then
		break

		elif [ $int -eq 0 ]
		then
	    echo "To travel up a directory- 1"
		echo "To travel down a directory- 0"
		read int
			if [ $int -eq 1 ]
			then
			cd ..
			int=0
			elif [ $int -eq 0 ]
			then
			ls -d */
			echo "Please enter the repository from the list you would like to access"
			read repoInput
			cd $repoInput
			int=0	
			echo $'\n'
			fi
		fi
	done
}
function accessRepository { # this functions allows the user to access any repository 
	ls -d */
	echo "Please enter the repository from the list you would like to access"
	read repoInput
	cd $repoInput
	echo "The current files in this repository are:"
	ls 
	accessRepoOptions
}
function accessRepoOptions { # this function is basically just to operate as a menu and to allow the user to access other parts of the system
	echo $'\n'
	echo "1:Create a new file💫"
	echo "2:Edit an exisiting file🖊️"
	echo "3:View backups👀"
	echo "4:Log a file into the repo🚚 "
	echo "5:Zip-unzip🤐"
	echo "6:Compile📚"
	echo "7:Delete a file or directory and all its contents 🗑️"
	echo "8:move directory🏃‍♂️"
	echo "9:Exit"
	echo $'\n'
	read repoMenuInput

	while [[ ! ${repoMenuInput} =~ ^[1-9]+$ ]]; do
        echo "Please enter in a valid option number:"
        read repoMenuInput
    done

	if [ $repoMenuInput -eq 1 ]
	then
		createNewfile
	elif [ $repoMenuInput -eq 2 ]
	then
		editFile
    elif [ $repoMenuInput -eq 3 ]
	then
		viewBackups
    elif [ $repoMenuInput -eq 4 ]
	then
		logFile
    elif [ $repoMenuInput -eq 5 ]
	then
        zipunzip
	elif [ $repoMenuInput -eq 6 ]
	then
        compile
    elif [ $repoMenuInput -eq 7 ]
	then
        delete
    elif [ $repoMenuInput -eq 8 ]
	then
        moveToDir
        menuOpt
    elif [ $repoMenuInput -eq 9 ]
	then
        menuOpt
fi
}
function newRepo { # this function is to create a new repository 
	moveToDir
	echo "Please enter the name of the new repository"
	read newRepoName
	mkdir $newRepoName
	ls
	menuOpt
}

function menuOpt { # this function operates as a menu to allow the user to navigate to their desired part of the system 
echo "1.Access a Repository"
echo "2.Create a new Repository"
echo "3.View Log file"
echo "4.Exit"

read menuInput 
while [[ ! ${menuInput} =~ ^[1-4]+$ ]]; do
    echo "Please enter in a valid option number:"
    read menuInput
done
if [ $menuInput -eq 1 ]
then
	moveToDir
	echo $'\n'
   	accessRepository 

elif [ $menuInput -eq 2 ]
then 
	newRepo
elif [ $menuInput -eq 3 ]
then 
	echo "hey"
elif [ $menuInput -eq 4 ]
then 
	echo "Bye!👋"
fi
}

menuOpt