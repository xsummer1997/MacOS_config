#!/bin/bash

BACKUP_FILES_LIST=(
    "/Users/xsummer/Desktop/C_prog/second_step/IO.md"
    "/Users/xsummer/.zshrc"
    "/Users/xsummer/.config/nvim/init.vim"
    "/Users/xsummer/nvim_help.md"
    "/Users/xsummer/git_use.md"
    "/Users/xsummer/Desktop/scripts/linux_shell.md"
)

BACKUP_DIR="/Users/xsummer/github/MacOS_config"

function FILE_BP_STATUS
{
    if [ $? -eq "0" ]; then
#        printf %s "$FILE had changed since last time,Backup Successful"
        echo "0"
    else
#        echo "Backup failed,Please check the file"
        echo "1000"
    fi
}

function BP_CMD
{
    cp -f "${BACKUP_DIR}/${BACKUP_FILE}" "${BACKUP_DIR}/oldfiles"
    STATUS=$(FILE_BP_STATUS)
#    echo $STATUS
    if [ "$STATUS" -eq "0" ]; then
        cp -f $FILE ${BACKUP_DIR}
        FILE_BP_STATUS
    else
        exit
    fi
}

for FILE in ${BACKUP_FILES_LIST[@]}
do
    if [ -N "$FILE" ]; then
        BACKUP_FILE=$(basename $FILE)
        echo $BACKUP_FILE
        if [ ! -d "${BACKUP_DIR}/oldfiles" ]; then
            mkdir -p "${BACKUP_DIR}/oldfiles"
            if [ $? -ne "0"]; then
                echo "mdkir ${BACKUP_DIR}/oldfiles failed"
                exit
            fi
            BP_CMD
        else
            BP_CMD
        fi
    fi
done

