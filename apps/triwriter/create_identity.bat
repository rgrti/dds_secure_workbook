@ECHO OFF
Rem this script generates the applications identity certificate and signed permissions file
Rem run this script from the apps\<appname>\ folder

SET appname=none
SET /P appname=Enter the application name:

IF %appname%==none (
ECHO no application name entered, exiting
) ELSE (
ECHO using application name: %appname%
ECHO.

ECHO generating the application's private key and saving it to deploy\private\%appname%key.pem
ECHO      openssl ecparam -name secp256k1 -genkey -noout -out deploy\private\%appname%key.pem
openssl ecparam -name secp256k1 -genkey -noout -out deploy\private\%appname%key.pem
ECHO.

ECHO generating the certificate signing request and saving it to %appname%.csr
ECHO      openssl req -new -sha256 -key deploy\private\%appname%key.pem -out %appname%.csr -config %appname%.cnf
openssl req -new -sha256 -key deploy\private\%appname%key.pem -out %appname%.csr -config %appname%.cnf
ECHO.

ECHO using the identity CA to generate the applications certificate from %appname%.csr and save to %appname%.pem
ECHO      openssl ca -config ..\..\ca\identity\openssl.cnf -days 3650 -in %appname%.csr -out %appname%.pem
openssl ca -config ..\..\ca\identity\openssl.cnf -days 3650 -in %appname%.csr -out deploy\%appname%.pem
ECHO.

ECHO removing %appname%.csr now that it is not needed anymore
del %appname%.csr

ECHO renaming appname_permissions.xml permissions file to %appname%_permissions.xml
move appname_permissions.xml %appname%_permissions.xml
)
pause