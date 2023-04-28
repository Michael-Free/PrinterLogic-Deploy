# PrinterLogic Agent Installation Script for Ubuntu

This is a bash script that installs the PrinterLogic agent software on an Ubuntu system. 

It checks if the system is 32-bit or 64-bit and installs the appropriate package. 

It also sets the home URL and authorization code using scripts provided by the PrinterLogic agent. The script must be run as root and requires an active internet connection.

## Usage

To use this script, the following configuration variables must be set correctly:

- HOME_URL: The URL of the PrinterLogic server that the client should connect to.
- 32BIT: The filename of the 32-bit package.
- 64BIT: The filename of the 64-bit package.
- AUTH_CODE: The authorization code provided by PrinterLogic.
- URL_SCHEMA: The URL schema to use (e.g., HTTP or HTTPS).

Before running the script, make sure to modify the configuration variables to match your setup. You may also need to modify the paths to the set_home_url.sh and use_authorization_code.sh scripts if they are located in a different directory.

To run the script, open a terminal, navigate to the directory where the script is located, and run the following command:

```
sudo ./install-pl.sh
```

Note that this script must be run as root. It will also perform an apt update and install cups-daemon and wget if they are not already installed.
