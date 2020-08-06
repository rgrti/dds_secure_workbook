To use the files in this template directory:

1. Copy the template directory to a new directory for your application:

cd ..
xcopy /E template myapp\

Where "myapp" is your application's name.

2. Change to the new directory:

cd myapp

3. Rename the OpenSSL configuration file to something that matches your app name:

rename appname.cnf myapp.cnf

4. Edit the <myapp>.cnf file and change the fields within it per the comments.
5. Run create_identity.bat file and enter your application name when prompted.
6. Run sign_permissions.bat file and enter your application name when prompted.

./create_identity.sh

7. Edit the appname_permissions.xml file to set the permissions for your application.
   Follow the directions provided in the comments in the XML file.  Save your file.

8. Sign the permissions file:
Run sign_permissions.bat and enter your application name when prompted.

9. Modify USER_QOS_PROFILES.xml to point to your security artifacts and the copy it to the deploy folder
