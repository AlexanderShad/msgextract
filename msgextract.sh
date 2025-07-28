#!/bin/bash
# Easily extract the contents of MSG email files v.0.4
# https://github.com/AlexanderShad/msgextract
# https://altlinux.space/aleksandershad/msgextract

if [[ -n "$1" ]]; then
	while [[ $# -gt 0 ]]; do
		case "$1" in

			--help|-h)
				echo -e '\e[042;30m --- Easily extract the contents of MSG email files --- \033[0m\n'
				echo ""
				echo "msgextract <file name>.msg"
				echo ""
				echo "--eml, -e - converting to EML"
				echo "--help, -h - show help"
				echo "--version, -v - show version"
				echo ""
				exit 0
			;;

			--version|-v)
				echo "version 0.4"
				exit 0
			;;

			--eml|-e)
				if [[ $2 =~ ".msg" ]]; then

					echo -e '\e[042;30m --- Converting started... --- \033[0m\n'

					if [ -e "$(cd "$(dirname "$2")"; pwd -P)/$(basename "$2")" ] ; then

						echo ''
						echo -e '\e[0;31m* msgconverting...\e[0m'
						echo ''

						msgconvert "$(cd "$(dirname "$2")"; pwd -P)/$(basename "$2")"

						echo -e '\e[042;30m --- Done --- \033[0m\n'

					else
						echo -e '\e[042;30m --- File not found. --- \033[0m\n'
					fi
					exit 0
				else
					echo -e '\e[042;30m --- Unknown argument. --- \033[0m\n'
					exit 0
				fi
			;;

			*)
				if [[ $1 =~ ".msg" ]]; then

					echo -e '\e[042;30m --- Start extraction... --- \033[0m\n'

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
					exit 0
				else
					echo -e '\e[042;30m --- Unknown argument. --- \033[0m\n'
					exit 0
				fi
			;;

		esac
	done
else
	echo -e '\e[042;30m --- No parameters found. --- \033[0m\n'
fi
