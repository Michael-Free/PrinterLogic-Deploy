#!/bin/bash
#
# Date: April 4, 2023
# By: Michael Free
#
# This script installs the PrinterLogic agent software on an Ubuntu system.
# It checks if the system is 32-bit or 64-bit, installs the appropriate package,
# and sets the home URL and authorization code using scripts provided by the
# PrinterLogic agent. The script must be run as root and requires
# an active internet connection.
#
# Usage: sudo ./install-pl.sh
#
# Note: Before running this script, make sure that the configuration variables
#       at the top of the script match your setup. You may also need to modify
#       the paths to the set_home_url.sh and use_authorization_code.sh scripts
#       if they are located in a different directory.
#

# Configuration variables
HOME_URL="https://<MY_SUBDOMAIN_HERE>.printercloud15.com/client/setup/"
32BIT="printerinstallerclient_i386.deb"
64BIT="printerinstallerclient_amd64.deb"
AUTH_CODE="<MY_AUTH_CODE>"
URL_SCHEMA="HTTPS"

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Perform an apt update
apt update

# Install cups-daemon if not already installed
if ! dpkg -s cups-daemon >/dev/null 2>&1; then
    apt install -y cups-daemon
fi

# Install wget if not already installed
if ! dpkg -s wget >/dev/null 2>&1; then
    apt install -y wget
fi

# Check if the system is i386 or amd64
if [ "$(uname -m)" = "i686" ]; then
    # Install the 32-bit version
    dpkg -i "$32BIT" || apt -f install
    /opt/PrinterInstallerClient/bin/./set_home_url.sh "$URL_SCHEMA" "$HOME_URL"
    /opt/PrinterInstallerClient/bin/use_authorization_code.sh "$AUTH_CODE"
elif [ "$(uname -m)" = "x86_64" ]; then
    # Install the 64-bit version
    dpkg -i "$64BIT" || apt -f install
    /opt/PrinterInstallerClient/bin/./set_home_url.sh "$URL_SCHEMA" "$HOME_URL"
    /opt/PrinterInstallerClient/bin/use_authorization_code.sh "$AUTH_CODE"
else
    echo "Unsupported system architecture: $(uname -m)"
    exit 1
fi
