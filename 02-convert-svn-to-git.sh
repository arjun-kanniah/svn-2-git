#!/bin/bash

# define variables
SVN_USER=n067889
SVN_PASS=Summer2

# convert subversion repos to git repos
while read URL; do
    APP=$(echo $URL | awk -F'/' '{split($0,a,"/"); print a[NF-1]}') # extract app name from Subversion URL
	echo $SVN_PASS | git svn clone --username $SVN_USER $SVN_URL /path/to/your/converted/repo/directory/$APP
	sleep 1
	echo "**************************************************************************************************"
done < svn-url-list.txt
