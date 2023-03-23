# gnome-study-workspaces
# Workspace Automation Script

This is a Bash script that automates workspace management for Linux environments using the wmctrl package. It enables you to start applications and move them to specific workspaces. It also provides a function to gracefully close all open windows without closing the desktop environment.
# Prerequisites
wmctrl package should be installed. You can install it using the package manager of your Linux distribution. The script assumes that you are using the GNOME desktop environment. You may need to modify the script for other desktop environments.

# How to use

- Download or clone the script to your local machine.
- Open a terminal in the directory where you saved the script.
- Run the script using the command ./.study-script.sh.

# Functions
## start-on-workspace

### This function takes two arguments:

- The target workspace number (starting from 0)
- The command to start the application

The function switches to the target workspace, starts the application, waits until the window list changes, and switches back to the original workspace.
## close-all

This function closes all open windows gracefully without closing the desktop environment. It keeps checking and waiting until all windows are closed.

# Note: 
This code is hardcoded for my personal usage. Feel free to modify code according to your needs. Pull requests for making script more accessible and general to public would be much appreciated
