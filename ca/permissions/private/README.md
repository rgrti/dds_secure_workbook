This directory contains the private key for the Permissions CA.  A real CA would 
likely be disconnected from the Internet.  It is critical in a real CA that
the CA's private key be protected as anyone with the key can generate 
identities and sign artifacts that appear to be valid to anyone else relying 
on the Permissions CA as their root of trust.