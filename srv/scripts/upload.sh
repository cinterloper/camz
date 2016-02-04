#!/bin/bash
echo $1 >> /var/log/uploader.log
echo scp -o StrictHostKeyChecking=no $1 grant@iowntheinter.net:~/newmotion/ 2>&1 >> /var/log/uploader.log
scp -o StrictHostKeyChecking=no $1 grant@iowntheinter.net:~/newmotion/ 2>&1 >> /var/log/uploader.log
PID=$$
echo $$
disown $$ 
env > /tmp/snapenv
