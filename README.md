# submission_reminder_app_david

# SUMMATIVE PROJECT FOR INTRODUCTION TO LINUX & IT TOOLS

- **Project Title:** Submission Reminder App
- **Author:** David Achibiri 
- **Date:** 2025-06-20
- **Description:** A simple command-line application that sends reminders to users about upcoming submissions. The application
 
 ## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/submission_reminder_app_david/submission_reminder_credia.git
   ```

2. Make the setup script executable:
   ```bash
   chmod +x create_environment.sh
   ```

3. Run the setup script:
   ```bash
   ./create_environment.sh
   ```
   - You will be prompted to enter your name
   - The script will create all necessary directories and files

4. Navigate to the created directory:
   ```bash
   cd submission_reminder_{yourname}
   ```

5. Start the application:
   ```bash
   ./startup.sh
   ```

## Directory Structure

```
submission_reminder_{username}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
```

## Files Description

- `reminder.sh`: Main application logic for checking submissions and sending reminders
- `startup.sh`: Script to start the application and handle periodic execution
- `config.env`: Configuration settings for the application
- `functions.sh`: Helper functions used by the application
- `submissions.txt`: Database of student submissions and their status

## Sample Output

```bash
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in ./assets/submissions.txt
Reminder: Aniekan has not submitted the Shell Navigation assignment!
Reminder: Ebuka has not submitted the Shell Navigation assignment!
```

