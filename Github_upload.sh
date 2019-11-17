#!/bin/bash
#author : xsummer
#date : 2019.11.17

COMMIT_FILE=commit.txt
PS3="请选择要上传到GitHub的文件："
select FILE in `ls -al . | awk '{if($2==1)print $9}'`
do
    if [[ ! -f $COMMIT_FILE ]]; then
        echo "\033[33m请在当前目录下创建一个commit.txt文件\033[0m"
        exit
    else
        PS3="请选择想要提交的commit："
        select COMMIT in `cat ./commit.txt`
        do
            COMMIT_C=`echo $COMMIT | sed -n 's/_/ /gp'`
            git add $FILE && git commit -m "${COMMIT_C}" && git push origin master
            if [[ "$?" == "0" ]]; then
                echo -e "\033[032m上传文件成功!\033[0m"
                exit
            fi
        done
    fi
done
