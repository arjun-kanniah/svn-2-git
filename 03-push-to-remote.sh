#!/bin/bash

# define variables
GIT_USER=enter_username
GIT_PASS=enter_password
PROJECT=enter_project_name

while read APP; do
	REPO=$(echo $APP | tr '[:upper:]' '[:lower:]') # convert app name to all lowercase
	cd /path/to/your/repo/staging/directory
	git clone https://$GIT_USER:$GIT_PASS@<your_git_server>.com/scm/$PROJECT/$REPO
	echo "**********Git clone DONE***********"
	cd /path/to/your/cloned/repo/directory/$REPO
	git checkout -b migrate-to-Bitbucket # create a new branch
	cp -r /path/to/your/converted/repo/directory/$APP/* /path/to/your/cloned/repo/directory/$REPO # copy recursively all content from the converted repo folder/directory to the cloned repo folder/directory
	git add .
	git commit -m "Code from SVN"
	git remote set-url origin https://$GIT_USER:$GIT_PASS@<your_git_server>.com/scm/$PROJECT/$REPO
	git push -u origin migrate-to-Bitbucket
	echo "*********************************************************************************************************************************************"
done < sorted-app-list.txt # read from a list of app names