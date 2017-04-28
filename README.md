# rsyncbackup
A simple Backup and Restore system using rsync

so that the script can be run by a user or by cron, add the following
with crontab -e
  RUN_BY_CRON = TRUE
To make the script run at 23:30hrs (11:30pm) Every day, add the following 
with crontab -e
  30 23 * * * /home/shared/scripts/rsyncbackup/rsyncbackup.sh >/dev/null 2>&1
Set the required directories
  yum -y install git
  mkdir -p /home/shared/scripts/
  git clone https://github.com/Amber-Marie/rsyncbackup.git /home/shared/scripts/rsyncbackup
  chmod +x /home/shared/scripts/rsyncbackup/rsyncbackup.sh
