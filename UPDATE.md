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
		[master 1987683] Updated file using Amber-Marie-patch-1 (405e558)
		Committer: root <root@system2.hosted-systems.co.uk>
		Your name and email address were configured automatically based
		on your username and hostname. Please check that they are accurate.
		You can suppress this message by setting them explicitly:
		
		git config --global user.name "Your Name"
		git config --global user.email you@example.com
		
		After doing this, you may fix the identity used for this commit with:
		
		git commit --amend --reset-author
		
		1 file changed, 0 insertions(+), 0 deletions(-)
		mode change 100644 => 100755 rsyncbackup.sh
	git push
	

  
