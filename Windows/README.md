# PrinterCloud Client Installation Script

This is a Windows batch script that installs the PrinterCloud client application. It requires administrative privileges to run and relies on the MSI installer file, PrinterInstallerClient.msi, to install the application.

## Usage

1. Clone or download the script to your Windows machine.

2. Open a command prompt with administrator privileges.

3. Navigate to the directory where the script is located.

4. Edit the script and provide the correct values for the HOME_URL and AUTH_CODE variables.

5. Ensure that the PrinterInstallerClient.msi file is present in the same directory as the script or modify the script to specify the correct path to the file.

6. Run the script by entering the command `install-printercloud.bat`.

7. The script will install the PrinterCloud client application with the specified values for HOME_URL and AUTH_CODE.

## Important Notes

- This script should only be run by authorized personnel who have the necessary administrative privileges to install software on the target machine.

- The HOME_URL and AUTH_CODE variables contain sensitive information, and their values should be protected from unauthorized access.

- If the PrinterInstallerClient.msi file is not present in the same directory as the script, the script will fail. Make sure that the file is present or modify the script to specify the correct path to the file.

- The script will run silently without any prompts or user interaction. Ensure that the correct values for HOME_URL and AUTH_CODE are provided before running the script.

