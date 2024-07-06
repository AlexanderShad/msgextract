#!/bin/bash

echo -e '\033[44m --- Start extraction...--- \033[0m\n'

if [ -n "$1" ] ; then

 cp "$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" "$(cd "$(dirname "$1")"; pwd -P)/tfile.msg"

 msgconvert "$(cd "$(dirname "$1")"; pwd -P)/tfile.msg"
 munpack "$(cd "$(dirname "$1")"; pwd -P)/tfile.eml"

 rm "$(cd "$(dirname "$1")"; pwd -P)/tfile.eml"
 rm "$(cd "$(dirname "$1")"; pwd -P)/tfile.msg"

 echo -e '\033[44m --- Extracted--- \033[0m\n'
 
else
 echo -e '\033[44m --- No parameters found. --- \033[0m\n'
fi




