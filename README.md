# postfix-tls-policy
## fork for personal use and adjustment

I have added a bash script "convert_list_to_sql.sh" which converts the generated TLS Policy Data for Postfix by csware to importable SQL Insert Statements.
My Mailserver uses a MySQL Database (vmail) with the following columns:

**domain, policy, params**

Reference: https://thomas-leister.de/mailserver-unter-ubuntu-16.04/ (German)

It only uses the DANE policies because my Mailserver uses DNSSEC. But it is easy to change.

It generates a temporary file which includes
```SQL
TRUNCATE TABLE tlspolicies;
```
to clear the table before inserting the new entries. This is because they are probably outdated.

After generating the SQL INSERT Statements you can easily import them by using the mysql client:

e.g. Bash:

```Shell
mysql -u USER -p vmail < temp_file_generated_by_script
```
