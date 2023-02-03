# Oekofen csv backup

Simple script to run periodically backups of the files generated by your Oekofen boiler.

Tested on two Pellmatic boilers. [Do you have an issue to report?](/issues)

## Install

1. `git clone github.com:siriusnottin/oekofen-csv-backup.git`
2. `chmod +x oekofen_csv_backup.sh`
3. Add it to cron if you want to run it periodically

## Configure

Edit the script and set the following variables:

- BOILER_IP
- DEST_DIRECTORY (optional)
- DEST_DIRECTORY

You'll find more details in the script comments.

## How to use

Every time you execute the script, it will fetch the files on the boiler server and save them locally.

Tags: Oekofen, Okofen, Ökofen