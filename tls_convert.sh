#!/bin/bash
echo "TRUNCATE TABLE tlspolicies;"
while read p; do
	if [[ $p != \#* ]]; then
		stringarray=($p)
		NEW="insert into tlspolicies (domain, policy, params) values ('${stringarray[0]}', '${stringarray[1]}', '${stringarray[2]}');"
		echo $NEW
	fi
done </root/postfix-tls-policy/tls_policy-dane
