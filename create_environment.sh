#!/bin/bash

#Prompt user for a name
read -p "Sawubona(Hello), What's your name? " NAME

# Set base directory
BASE_DIR="submission_reminder_$NAME"

# Make Directories in project
mkdir -p $BASE_DIR/app
mkdir -p $BASE_DIR/modules
mkdir -p $BASE_DIR/assets
mkdir -p $BASE_DIR/config

# Create functions.sh file
cat <<EOF > $BASE_DIR/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    while IFS=, read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOF

# Create reminder.sh file
cat <<EOF > $BASE_DIR/app/reminder.sh
#!/bin/bash

# Source environment and functions
source ./config/config.env
source ./modules/functions.sh

# Submissions file
submissions_file="./assets/submissions.txt"

echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOF

# Create config.env file
cat <<EOF > $BASE_DIR/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create submissions.txt file
cat <<EOF > $BASE_DIR/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
David, Git, submitted
Ebuka, Shell Basics, not submitted
Oyindamola, Shell Navigation, not submitted
Naignon, Shell Basics, not submitted
Mercy, Git, not submitted
Ebuka, Shell Navigation, submitted
EOF

# Create startup.sh file
cat <<EOF > $BASE_DIR/startup.sh
#!/bin/bash

# Load environment and functions
source ./config/config.env
source ./modules/functions.sh

echo "--------------------------------------------"
echo "Welcome to the Submission Reminder App!"
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining: \$DAYS_REMAINING"
echo "--------------------------------------------"

# Run the reminder
./app/reminder.sh
EOF

# Make all scripts executable with chmod
chmod +x $BASE_DIR/app/reminder.sh
chmod +x $BASE_DIR/modules/functions.sh
chmod +x $BASE_DIR/startup.sh

echo "Environment '$BASE_DIR' created successfully. You can now run it with:"
echo "cd $BASE_DIR && ./startup.sh"
