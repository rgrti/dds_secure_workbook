@ECHO OFF
Rem execute this script from the dds_secure_workbook\ca\identity\ directory
Rem this will overwrite existing files

ECHO generating private key and placing it in private\cakey.pem
ECHO      openssl ecparam -name secp256k1 -genkey -noout -out private\cakey.pem
openssl ecparam -name secp256k1 -genkey -noout -out private\cakey.pem
ECHO.

ECHO generating certificate signing request (ca.csr) based on private key and openssl.cnf
ECHO      openssl req -new -sha256 -key private\cakey.pem -out ca.csr -config openssl.cnf
openssl req -new -sha256 -key private\cakey.pem -out ca.csr -config openssl.cnf
ECHO.

ECHO generating the CA certificate (cacert.pem) based on the .csr certificate request and private key
ECHO      openssl x509 -req -sha256 -days 3650 -in ca.csr -text -signkey private\cakey.pem -out cacert.pem
openssl x509 -req -sha256 -days 3650 -in ca.csr -text -signkey private\cakey.pem -out cacert.pem
ECHO.

ECHO removing identca.csr file that is no longer needed now that the identity ca is signed
del ca.csr
ECHO.

ECHO copying the public cacert.pem to the deployall directory (..\..\apps\deployall\)
copy cacert.pem ..\..\apps\deployall\

pause