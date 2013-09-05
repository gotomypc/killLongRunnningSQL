killLongRunnningSQL
===================

killLongRunningSQL.pl is a perl script that finds and kills SQL queries in MySQL that are running over 300 seconds(5 minutes). Normally, if a SQL query runs for a long time, it will chew up CPU resource.


Step1: Place a script file at /usr/local/bin


Step2: Add above script to cronjobs to run every minute

 # crontab -l
*/1 * * * * /usr/local/bin/killLongRunningSql.pl > /usr/local/bin/killLongRunningSql.log 2>&1
