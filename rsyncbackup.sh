#!/bin/bash
# Branch to add monthly check
# Edited on the website
# Edited on the computer
vDay=$(date +"%u-%A")
vDateDiff=1
vDayMinusOne=$(date --date="${vDay} -${vDateDiff} day" +%u-%A)
vRunDate=$(date +"%A %d %m %Y")
vWeek=$(date +"WEEK-%W[%d-%b-%Y]")
mkdir -p /home/shared/log_files/
mkdir -p /home/shared/rbackup/daily/
mkdir -p /home/shared/rbackup/weekly/
vLogFile="/home/shared/log_files/rsyncbackup.log"

roptions="-aAXHvq"
rsource="/"
rdest="/home/shared/rbackup/daily/$vDay"
rsnapshot="/home/shared/rbackup/daily/0-snapshot"
weekDest="/home/shared/rbackup/weekly"
weekSource="/home/shared/rbackup/daily"

pause()
{
read -n1 -r -p "Press any key to continue..." key
if [ "$key" = '' ]; then
	main
fi
}

check()
{
if [ "$RUN_BY_CRON" == "TRUE" ] ; then
	if [ "$vDay" == "1-Monday" ]; then
		echo "$vRunDate" >> $
		2>&1
	    	echo " Moving Sundays files to weekly" >> $vLogFile 2>&1
	    	RUNTIME=$(date +"%H%M")
	    	echo " Start Time: $RUNTIME hrs" >> $vLogFile 2>&1
	    	echo "  using: mkdir -p $weekDest/$vWeek" >> $vLogFile 2>&1
	    	mkdir -p $weekDest/$vWeek
            	echo "         cp -r $weekSource/$vDayMinusOne/* $weekDest/$vWeek" >> $vLogFile 2>&1
            	cp -r  $weekSource/$vDayMinusOne/* $weekDest/$vWeek
            	RUNTIME=$(date +"%H%M")
            	echo " End Time: $RUNTIME hrs" >> $vLogFile 2>&1
            	echo "" >> $vLogFile 2>&1
	fi
	RUNTIME=$(date +"%H%M")
        echo "$vRunDate" >> $vLogFile 2>&1
        echo "Start Time: $RUNTIME hrs" >> $vLogFile 2>&1
        echo "Daily backup ran by cron" >> $vLogFile 2>&1
        echo 'Using: /usr/bin/rsync '$roptions' --exclude={"/home/shared/Backups/*","/home/shared/oldstuff/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/shared/rbackup/*","/home/shared/CentOS/*","/home/shared/iars/*","/home/shared/log_files/*","/home/shared/oars/*","/home/shared/opensim_terrains/*","/home/shared/opensim_terrain_textures/*","/home/shared/run_files/*","/home/grid/gridservers/bin/assetcache/*","/home/shared/rbackup/daily/*","/home/shared/bookupload/*"} --delete '$rsource' '$rdest'' >> $vLogFile 2>&1
        /usr/bin/rsync $roptions --exclude={"/home/shared/Backups/*","/home/shared/oldstuff/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/shared/rbackup/*","/home/shared/CentOS/*","/home/shared/iars/*","/home/shared/log_files/*","/home/shared/oars/*","/home/shared/opensim_terrains/*","/home/shared/opensim_terrain_textures/*","/home/shared/run_files/*","/home/grid/gridservers/bin/assetcache/*","/home/shared/rbackup/daily/*","/home/shared/calibre_library/*","/home/shared/bookupload/*"} --delete --delete-excluded $rsource $rdest
	/usr/bin/touch $rdest
        du -sh $rdest >> $vLogFile 2>&1
        RUNTIME=$(date +"%H%M")
        echo "End Time: $RUNTIME hrs" >> $vLogFile 2>&1
        echo "" >> $vLogFile 2>&1
	exit
else
	main
fi
}

main()
{
clear
echo "rsyncbackup.sh including monthly check"
PS3='Backup (1), Restore (2), or Quit (3): '
mainmenu=("Backup" "Restore" "Quit")
select mmopt in  "${mainmenu[@]}"
do
	case $mmopt in
		"Backup")
		backup
		;;
		"Restore")
		restore
		;;
		"Quit")
		clear
		exit
		;;
		*)
		echo Invalid Option
		;;
	esac
done
}

backup()
{
clear
PS3='Choose Daily (1), Snapshot (2) or Main Menu (3): '
backupmenu=("Daily" "Snapshot" "Quit")
select backupopt in "${backupmenu[@]}"
do
	case $backupopt in
		"Daily")
			RUNTIME=$(date +"%H%M")
			echo "$vRunDate" >> $vLogFile 2>&1
			echo "Start Time: $RUNTIME hrs" >> $vLogFile 2>&1
			echo "Daily backup ran by hand" >> $vLogFile 2>&1
			echo 'Using: /usr/bin/rsync '$roptions' --exclude={"/home/shared/Backups/*","/home/shared/oldstuff/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/shared/rbackup/*","/home/shared/CentOS/*","/home/shared/iars/*","/home/shared/log_files/*","/home/shared/oars/*","/home/shared/opensim_terrains/*","/home/shared/opensim_terrain_textures/*","/home/shared/run_files/*","/home/grid/gridservers/bin/assetcache/*","/home/shared/rbackup/daily/*","/home/shared/calibre_library/*","/home/shared/bookupload/*"} --delete '$rsource' '$rdest'' >> $vLogFile 2>&1
			/usr/bin/rsync $roptions --exclude={"/home/shared/Backups/*","/home/shared/oldstuff/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/shared/rbackup/*","/home/shared/CentOS/*","/home/shared/iars/*","/home/shared/log_files/*","/home/shared/oars/*","/home/shared/opensim_terrains/*","/home/shared/opensim_terrain_textures/*","/home/shared/run_files/*","/home/grid/gridservers/bin/assetcache/*","/home/shared/rbackup/daily/*","/home/shared/calibre_library/*","/home/shared/bookupload/*"} --delete --delete-excluded $rsource $rdest >> $vLogFile 2>&1
			/usr/bin/touch $rdest
			du -sh $rdest >> $vLogFile 2>&1
			RUNTIME=$(date +"%H%M")
			echo "End Time: $RUNTIME hrs" >> $vLogFile 2>&1
			echo "" >> $vLogFile 2>&1
			pause
		;;
  		"Snapshot")
			RUNTIME=$(date +"%H%M")
			echo "$vRunDate" >> $vLogFile 2>&1
			echo "Start Time: $RUNTIME hrs" >> $vLogFile 2>&1
			echo "Snapshot ran by hand" >> $vLogFile 2>&1
			echo 'Using: /usr/bin/rsync '$roptions' --exclude={"/home/shared/Backups/*","/home/shared/oldstuff/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/shared/rbackup/*","/home/shared/CentOS/*","/home/shared/iars/*","/home/shared/log_files/*","/home/shared/oars/*","/home/shared/opensim_terrains/*","/home/shared/opensim_terrain_textures/*","/home/shared/run_files/*","/home/grid/gridservers/bin/assetcache/*","/home/shared/rbackup/daily/*","/exc_dir/*","/home/shared/calibre_library/*","/home/shared/bookupload/*"} --delete '$rsource' '$rsnapshot'' >> $vLogFile 2>&1
			/usr/bin/rsync $roptions --exclude={"/home/shared/Backups/*","/home/shared/oldstuff/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/shared/rbackup/*","/home/shared/CentOS/*","/home/shared/iars/*","/home/shared/log_files/*","/home/shared/oars/*","/home/shared/opensim_terrains/*","/home/shared/opensim_terrain_textures/*","/home/shared/run_files/*","/home/grid/gridservers/bin/assetcache/*","/home/shared/rbackup/daily/*","/home/shared/exc_dir/*","/home/shared/calibre_library/*","/home/shared/bookupload/*"} --delete --delete-excluded $rsource $rsnapshot
			/usr/bin/touch $rsnapshot
			du -sh $rsnapshot >> $vLogFile 2>&1
			RUNTIME=$(date +"%H%M")
			echo "End Time: $RUNTIME hrs" >> $vLogFile 2>&1
			echo "" >> $vLogFile 2>&1
			pause
		;;
		"Quit")
			main
		;;
		*)
			echo "Invalid option, please try again."
		;;
	esac
done
}

restore()
{
clear
PS3='Choose Restore (1) or Main Menu (2): '
restoreoptions=("Restore" "Quit")
select restoreopt in "${restoreoptions[@]}"
do
	case $restoreopt in
		"Restore")
			PS3='Choose file or Quit: '
                	while IFS= read -r -d $'\0' f; do
                    	restorenewoptions[i++]="$f"
                	done < <(find /home/shared/rbackup/daily -maxdepth 1 -type d -name "*-*" -print0 )
                	select nropt in "${restorenewoptions[@]}" "Quit"
                	do
				case $nropt in
					*-*)
						echo "Restore of directory $nropt selected"
						echo "/usr/bin/rsync $roptions --exclude=$rexclude --delete /home/shared/rbackup/daily/$nropt /"
						pause
					;;
					"Quit")
						pause
					;;
					*)
						echo "This is not a valid option, please try agin"
					;;
				esac
			done
			;;
			"Quit")
				pause
			;;
			*)
				echo  "This is not a valid option, please try agin"
			;;
	esac
done
}
echo "rsyncbackup.sh with monthly check - Work in Progress"
check
RUN_BY_CRON="FALSE"
exit
