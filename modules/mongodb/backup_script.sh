#!/bin/bash

# Ensure the script is run as root (or using sudo)
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Step 1: Install AWS CLI
echo "Installing AWS CLI..."
apt update -y
apt install -y awscli

# Step 2: Clone the MongoDB Backup Repository
echo "Cloning mongodb_backup repository from GitHub..."
git clone https://github.com/sysboss/mongodb_backup.git /home/ubuntu/mongodb_backup

# Step 3: Change permissions to make MongoBackup.sh executable
echo "Making MongoBackup.sh executable..."
chmod +x /home/ubuntu/mongodb_backup/MongoBackup.sh

# Step 4: Set permissions on /var/run (make sure it's accessible)
echo "Setting permissions for /var/run..."
chmod +x /var/run

# Step 5: Set up the cron job to run every 5 minutes
echo "Setting up the cron job to run the backup script every 5 minutes..."
crontab -l > /tmp/current_cron
echo "*/5 * * * * /home/ubuntu/mongodb_backup/MongoBackup.sh -b lhav-wiztechexercise-s3-bucket-02 -k 7 >> /home/ubuntu/backup.log 2>&1" >> /tmp/current_cron
crontab /tmp/current_cron
rm /tmp/current_cron

# Step 6: Final message
echo "Setup complete. The cron job is now scheduled to run every 5 minutes."
echo "You can check the output in /home/ubuntu/backup.log."
