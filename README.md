# Linux System Alert Script for Discord

Welcome! This project provides a simple, beginner friendly Bash script that monitors your Linux system's health and sends alerts directly to your Discord server. It's perfect for keeping an eye on your server or personal machine without needing complex monitoring software.


![discord bot](https://github.com/user-attachments/assets/33ce41ba-1d2f-46e8-b9ab-cca46585f250)

## Features
- Checks system health (CPU, RAM, Disk usage, etc.).
- Sends automated, formatted messages to a Discord channel.
- Easy to set up and fully automatable.

## Prerequisites
- A computer or server running Linux.
- A Discord account and a server where you have the "Manage Webhooks" permission.

---

## Step by Step Setup Guide

### 1. Get Your Discord Webhook URL
To send messages to Discord, you need a Webhook URL. Think of this as a secret address that allows outside applications to post messages to a specific channel.
1. Open Discord and go to your server.
2. Click the gear icon (**Edit Channel**) next to the text channel where you want to receive alerts.
3. On the left menu, select **Integrations**, then click **Webhooks**.
4. Click **New Webhook**.
5. Give the webhook a name (e.g., "Linux System Monitor") and verify the channel is correct.
6. Click **Copy Webhook URL** and save it somewhere safe for the next steps.

### 2. Download the Script
Open your Linux terminal and clone this repository to your computer:
```bash
git clone https://github.com/nknaleena101/Linux-System-Alert-Script-for-Discord.git
cd Linux-System-Alert-Script-for-Discord
```

### 3. Configure the Script
You need to tell the script where to send the alerts.
1. Open the `health_check.sh` file in a text editor (like `nano`):
   ```bash
   nano health_check.sh
   ```
2. Look for the webhook URL variable inside the script (typically named `WEBHOOK_URL`).
3. Replace the placeholder link with the **Discord Webhook URL** you copied in Step 1.
   *Example:*
   ```bash
   WEBHOOK_URL="https://discord.com/api/webhooks/123456789/ABCDEFG123456"
   ```
4. Save the file and exit (`Ctrl+O`, `Enter`, then `Ctrl+X` if you are using `nano`).

### 4. Make the Script Executable
Before Linux can run the bash script, you have to give it execute permissions:
```bash
chmod +x health_check.sh
```

---

## Automation (Hourly Alerts)
Running it manually is a great start, but automating it is much better! You can use `cron`, a built in time based job scheduler in Linux, to run the script automatically in the background.

1. Open your cron table for editing:
   ```bash
   crontab -e
   ```
2. Scroll to the very bottom of the file and add the following line. 
   *(**Note:** Make sure to replace the path below with the **actual absolute path** to where you saved `health_check.sh` on your own system!)*

   ```bash
   0 * * * * /full/path/to/your/health_check.sh > /dev/null 2>&1
   ```
3. Save and close the editor. You are all set!

### What does the cron command do?
- `0 * * * *` tells cron to run the script at the start of every hour (e.g., exactly at 1:00, 2:00, 3:00).
- `/full/path/to/your/health_check.sh` is the absolute path to your script. Cron needs the full path to know exactly where the file is.
- `> /dev/null 2>&1` quietly suppresses system generated output emails, keeping your system logs clean since warnings are now managed by Discord!

---
### Test the Setup
Run the script manually to confirm everything is working properly:
```bash
./health_check.sh
```
*Check your Discord channel if setup correctly, you should receive a new message with your system alert!*
**💡 Pro Tip: Testing the Alerts**
If your script is configured to only send alerts when usage exceeds 80%, you don't need to actually overload your system to test it! 
- Open `health_check.sh` and temporarily change the threshold limit from `80` to `10`.
- To test the cron job automation quickly, you can temporarily change your cron schedule from `0 * * * *` (hourly) to `* * * * *` (every minute).
*Remember to change them back to normal once you confirm it works!*
---
**Author**: [nknaleena101](https://github.com/nknaleena101)
