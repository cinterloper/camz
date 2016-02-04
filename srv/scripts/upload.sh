#!/bin/bash
echo $1 >> /var/log/uploader.log
DSTSVR='user@sshhost.org'
echo scp -o StrictHostKeyChecking=no $1 $DSTSVR:~/newmotion/ 2>&1 >> /var/log/uploader.log
scp -o StrictHostKeyChecking=no $1 $DSTSVR:~/newmotion/ 2>&1 >> /var/log/uploader.log
PID=$$
echo $$
disown $$ 
env > /tmp/snapenv
