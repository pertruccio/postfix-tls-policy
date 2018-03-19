#!/bin/bash

# delete all lines in existing table, they are probably old
echo "TRUNCATE TABLE tlspolicies;"

# for each line in tls_policy-dane file
while read p; do
	if [[ $p != \#* ]]; then
		# if it's not a comment build a sql statement
		stringarray=($p)
		NEW="insert into tlspolicies (domain, policy, params) values ('${stringarray[0]}', '${stringarray[1]}', '${stringarray[2]}');"
		echo $NEW
	fi
done <./tls_policy-dane

# for now this scripts echoes to STDOUT. better put it in file!
