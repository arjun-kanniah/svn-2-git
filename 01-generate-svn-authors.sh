#!/bin/bash

# define variables
SVN_USER=svn_username
SVN_PASS=svn_password

# create authors file
while read SVN_URL; do
        APP_NAME=$(echo $SVN_URL | awk -F'/' '{split($0,a,"/"); print a[NF-1]}') # extract app name from subversion URL
        echo $APP_NAME >> app-list.txt
        java -jar svn-migration-scripts.jar authors $SVN_URL $SVN_USER $SVN_PASS >> authors.txt
done < svn-url-list.txt

# sort and remove duplicates from the authors file and app list file
sort app-list.txt | uniq > sorted-app-list.txt
sort authors.txt | uniq > sorted-authors.txt

# delete unsorted files
rm -rf app-list.txt
rm -rf authors.txt