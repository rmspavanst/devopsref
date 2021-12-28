date ; ps -ef | grep date

## find all file and folders containing specific text
$ find / -exec grep -lR "{test-string}" {} \;

$ find . -type f -exec grep -l "Transfer file from local" {} \;

$ grep -lr example /path/to/directory1/*.txt /path/to/directory2


## Search Single String in All Files
$ grep -rwl “search-string” /path/to/serch/dir


## Search Multiple String in All Files:
$ grep -rlw -e "tecadmin" -e "https"  /var/log

## Search String in Specific Files
$ grep -rlw --include="*.log" -e "tecadmin" /var/log

## Exclude Some Files from Search
$ grep -rlw --exclude="*.txt" -e "tecadmin" /var/log

## Exclude Some Directories from Search
$ grep -rlw --exclude-dir="*http*" -e "tecadmin" /var/log

#to check yum installed list
$ sudo yum list installed # to chceck count | wc -l






