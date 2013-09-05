#!/usr/bin/perl
#Author: erdevendra@gmail.com   09/03/13
#
use strict;
use DBI;
use DBD::mysql;

#MySQL connection
my $db_name = "YourDatabase";
my $db_connection = DBI->connect("DBI:mysql:$db_name","username","password") or die "Connection Error: $DBI::errstr\n";

#Execute query that shows the processlist
my $run_query = $db_connection->prepare("SHOW FULL PROCESSLIST");
$run_query->execute or die "SQL Error: $DBI::errstr\n";

#Declare @row array to store each row of above query being executed
my @row;

while (@row=$run_query->fetchrow_array()){
        if ( @row[5] > 300 && @row[4] =~ /Query/ ){
                my $killQuery = "KILL QUERY @row[0]";
                print "Query to be Executed: $killQuery\n";
                print "Process Info: @row[0] @row[1] @row[2]  @row[4] @row[5]\n";

                my $killQueryExecute = $dbh -> prepare($killQuery);
                $killQueryExecute-> execute;
        }
}
