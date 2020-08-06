@ECHO OFF
Rem this script signs the permissions xml file for each application by the permissions CA
Rem run this script from the apps\appname\ directory

SET appname=none
SET /P appname=Enter the application name:

IF %appname%==none (
ECHO no application name entered, exiting
) ELSE (
ECHO using application name: %appname%
ECHO.

ECHO signing the apps permission file using the permission's CA and saving it to deploy\%appname%_permissions_signed.p7s
ECHO      openssl smime -sign -in %appname%_permissions.xml -text -out deploy/%appname%_permissions_signed.p7s -signer ../../ca/permissions/permissionscacert.pem -inkey ../../ca/permissions/private/permissionscakey.pem
openssl smime -sign -in %appname%_permissions.xml -text -out deploy/%appname%_permissions_signed.p7s -signer ../../ca/permissions/permissionscacert.pem -inkey ../../ca/permissions/private/permissionscakey.pem
)
pause