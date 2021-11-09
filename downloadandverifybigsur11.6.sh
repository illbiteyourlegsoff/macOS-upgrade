#!/bin/bash

#####this will download the installer package and verify its checksum. This will add the installer to applications but not install it. I usually do that as a separate policy. 
### This will have to be updated everytime a new update comes out. The checksum and the install
cd /tmp

curl -O http://swcdn.apple.com/content/downloads/43/03/002-23589-A_JLC10H5DJX/7qxktjph49leko1s3jwaqdlh2b3uzyrlfv/InstallAssistant.pkg



### Verify checkSum to make sure legit download from Apple or/and fully downloaded 11.6
chksm=99c77e451667bb8309c0fac2696979410e2f6aad97d46e20c33054955ac64fa2
echo $chksm

verchk=`openssl dgst -sha256 /tmp/InstallAssistant.pkg | awk '{print $NF}'`
echo $verchk 

if [ $chksm == $verchk ]
then
cd /tmp


installer -pkg /tmp/InstallAssistant.pkg -target /

else
echo "not fully downloaded or invalid"
exit 0
fi
