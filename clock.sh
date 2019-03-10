#!/bin/bash



	if [ "$1" = "--AMPM" ]
	then
			
		while sleep 1;do
			echo $(clear)
			#for some reason my machine cant detect am or pm so i need to find it manually
			let hour=$(date +"%H")
			
			if [ $hour -gt 11 ]
			then
				echo "$(date +"%r") PM"
			else
				echo "$(date +"%r") AM"		
			fi
		done

	else
		while sleep 1;do
			echo $(clear)
			echo $(date +"%T")
		done
	fi
