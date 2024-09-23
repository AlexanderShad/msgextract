#!/bin/bash
# Easily extract the contents of MSG email files v.0.2
# https://github.com/AlexanderShad/msgextract

echo -e '\e[042;30m --- Start extraction... --- \033[0m\n'

if [ -n "$1" ] ; then

	if [ -e "$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" ] ; then

		echo ''
		echo -e '\e[0;31m* creating temp file...\e[0m'
		echo ''

		cp "$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")" "$(cd "$(dirname "$1")"; pwd -P)/tfile.msg"

		echo ''
		echo -e '\e[0;31m* msgconverting...\e[0m'
		echo ''
		
	 	msgconvert "$(cd "$(dirname "$1")"; pwd -P)/tfile.msg"
	 	
	 	echo ''
		echo -e '\e[0;31m* munpacking...\e[0m'
		echo ''
 		munpack "$(cd "$(dirname "$1")"; pwd -P)/tfile.eml"

		echo ''
		echo -e '\e[0;31m* deleting temp files...\e[0m'
		echo ''
	 	rm "$(cd "$(dirname "$1")"; pwd -P)/tfile.eml"
 		rm "$(cd "$(dirname "$1")"; pwd -P)/tfile.msg"

	 	echo -e '\e[042;30m --- Extracted --- \033[0m\n'

	else
 		echo -e '\e[042;30m --- File not found. --- \033[0m\n'	
 	fi
 	
else

 echo -e '\e[042;30m --- No parameters found. --- \033[0m\n'
 
fi




