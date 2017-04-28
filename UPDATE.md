To update the version you have previously downloaded, type in
	git status
		# On branch master
		# Changes not staged for commit:
		#   (use "git add <file>..." to update what will be committed)
		#   (use "git checkout -- <file>..." to discard changes in working directory)
		#
		#       modified:   rsyncbackup.sh
		#
		no changes added to commit (use "git add" and/or "git commit -a")
This shows that the file rsyncbackup.sh is ready to be updated.

Type in
	git add rsyncbackup.sh
	git status
		# On branch master
		# Changes to be committed:
		#   (use "git reset HEAD <file>..." to unstage)
		#
		#       modified:   rsyncbackup.sh
		#
This now shows that the modified file is ready to be pulled down to
the working directory using
	git commit
  
