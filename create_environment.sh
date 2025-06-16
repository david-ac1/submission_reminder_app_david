#!/usr/bin/bash
#Let's the software know that it is a script


set -e
#Allow exit if command fails

read -p "Dumelang(Hello), What's your name? " NAME
#read prompt and enable user to prompt


mkdir submission_reminder_$NAME
#Make Directories


mkdir submission_reminder_$NAME/app
mkdir submission_reminder_$NAME/modules
mkdir submission_reminder_$NAME/assets
mkdir submission_reminder_$NAME/config

#Copy files into new foldeers

cp functions.sh submission_reminder_$NAME/modules
cp reminder.sh submission_reminder_$NAME/app
cp submissions.txt submission_reminder_$NAME/assets
cp config.env submission_reminder_$NAME/config

echo "David, Git, submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Ebuka, Shell Basics, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Oyindamola, Shell Navigation, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Naignon, Shell Basics, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Mercy, Git, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Ebuka, Shell Navigation, submittedd" >> submission_reminder_$NAME/assets/submissions.txt

cat <<EOF > submission_reminder_$NAME/startup.sh

#!/bin/bash
#Reads and executes the content of a file in the current shell session.

./app/reminder.sh
EOF

#Enables the file to be executed by using Chmod +X
find submission_reminder_$NAME -type f -name "*sh" -exec chmod +x {} \;
