# rsyncbackup
A simple Backup and Restore system using rsync

so that the script can be run by a user or by cron, add the following with crontab -e<br />
	RUN_BY_CRON = TRUE

To make the script run at 23:30hrs (11:30pm) Every day, add the following with crontab -e<br />
	30 23 * * * /home/shared/scripts/rsyncbackup/rsyncbackup.sh >/dev/null 2>&1

Set the required directories<br />
	yum -y install git<br />
	mkdir -p /home/shared/scripts/<br />
	git clone https://github.com/Amber-Marie/rsyncbackup.git /home/shared/scripts/rsyncbackup<br />
	chmod +x /home/shared/scripts/rsyncbackup/rsyncbackup.sh<br />

Then use the following command to run backup<br />
	/home/shared/scripts/rsyncbackup/rsyncbackup.sh
