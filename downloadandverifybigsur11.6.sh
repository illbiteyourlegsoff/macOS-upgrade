#!/bin/bash

#####this will download the installer package and verify its checksum. This will add the installer to applications but not install it. I usually do that as a separate policy. 
cd /tmp

curl -O http://swcdn.apple.com/content/downloads/57/38/071-97382-A_OEKYSXCO6D/97vrhncortwd3i38zfogcscagmpwksdzce/InstallAssistant.pkg



### 256 chksum 11.5.2
chksm=6142d4200f415d1253c437bdfcc7911bfb568ed16de1f0350bbc76299940647a
echo $chksm

verchk=`openssl dgst -sha256 /tmp/InstallAssistant.pkg | awk '{print $NF}'`
echo $verchk 

if [ $chksm == $verchk ]
then
cd /tmp

#curl -O http://swcdn.apple.com/content/downloads/43/16/071-78704-A_U5B3K7DQY9/cj9xbdobsdoe67yq9e1w2x0cafwjk8ofkr/InstallAssistant.pkg

installer -pkg /tmp/InstallAssistant.pkg -target /

else
echo "not fully downloaded or invalid"
exit 0
fi
