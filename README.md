# rsyncbackup
A simple Backup and Restore system using rsync

so that the script can be run by a user or by cron, add the following with crontab -e<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>RUN_BY_CRON = TRUE

To make the script run at 23:30hrs (11:30pm) Every day, add the following with crontab -e<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>30 23 * * * /home/shared/scripts/rsyncbackup/rsyncbackup.sh >/dev/null 2>&1

Set the required directories<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>yum -y install git<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>mkdir -p /home/shared/scripts/<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>git clone https://github.com/Amber-Marie/rsyncbackup.git /home/shared/scripts/rsyncbackup<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>chmod +x /home/shared/scripts/rsyncbackup/rsyncbackup.sh<br />

Then use the following command to run backup<br />
<&nbsp;><&nbsp;><&nbsp;><&nbsp;>/home/shared/scripts/rsyncbackup/rsyncbackup.sh
