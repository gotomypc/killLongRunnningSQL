killLongRunnningSQL
===================

Prerequisite:
Make sure that you have perl,perl-DBD-mysql, perl-DBI and perl installed. If those package are missing, you can use YaST, YUM, ZYPPER, APT-GET to install those missing packages based on your distro.


killLongRunningSQL.pl is a perl script that finds and kills SQL queries in MySQL that are running over 300 seconds(5 minutes). Normally, if a SQL query runs for a long time, it will chew up CPU resource.




Step1: Place a script file at /usr/local/bin


Step2: Add above script to cronjobs to run every minute

# crontab -e
*/1 * * * * /usr/local/bin/killLongRunningSql.pl > /usr/local/bin/killLongRunningSql.log 2>&1
