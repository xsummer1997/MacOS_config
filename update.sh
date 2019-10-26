#!/bin/bash
if [[ $# -lt 2 || $# -gt 2 ]];
then
    echo "please only input add_name and commit_content" && exit
else
    git add $1 && git commit -m "$2" && git push origin master
fi
