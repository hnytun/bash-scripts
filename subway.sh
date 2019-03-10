#!/bin/bash

	#hello



	#first we create a variable with all our needed data for the task of getting subway times
	#forskningsparken stopid = 3010370
	#blindern stopid = 3010360
	#ullevål stopid = 3012210

	#give different true-time pages for departure times depending on what parameter the user gives
	if [ "$1" == "Forskningsparken" ] || [ "$1" == "" ] ;then
	page="$(w3m -dump http://mon.ruter.no/SisMonitor/Refresh?stopid=3010370\&computerid=acba4167-b79f-4f8f-98a6-55340b1cddb3\&isOnLeftSide=true\&blocks=\&rows=6\&test=\&stopPoint=)"	
	elif [ "$1" == "Blindern" ];then
	page="$(w3m -dump http://mon.ruter.no/SisMonitor/Refresh?stopid=3010360\&computerid=acba4167-b79f-4f8f-98a6-55340b1cddb3\&isOnLeftSide=true\&blocks=\&rows=6\&test=\&stopPoint=)"
	elif [ "$1" == "Ullevål" ];then
	page="$(w3m -dump http://mon.ruter.no/SisMonitor/Refresh?stopid=3012210\&computerid=acba4167-b79f-4f8f-98a6-55340b1cddb3\&isOnLeftSide=true\&blocks=\&rows=6\&test=\&stopPoint=)"
	fi
	


	#find westbound train times if given respective argument, the direction-argument may be the first argument ($1), but can also
	#be the second, depending on whether the user specified the station first
	if [ "$1" == "--W" ] || [ "$2" == "--W" ];then
		echo "----------WESTBOUND TRAINS----------"
		printf '%s\n' "$page" | while IFS= read -r line
			do	
				#find the last word in line and print all lines ending with the position 2(westbound)
   				direction=${line##* }
				if [ "$direction" == "2" ];then
					echo $line	
				fi
			done
	#find eastbound train times if given respective argument
	elif [ "$1" == "--E" ] || [ "$2" == "--E" ];then
		echo "----------EASTBOUND TRAINS----------"
		printf '%s\n' "$page" | while IFS= read -r line
                	do
                        	direction=${line##* }
                        	if [ "$direction" == "1" ];then
                        		echo $line      
                        	fi
               		done
	#otherwise if given no argument then we print out all directions(6 different trains)
	else
		echo "$page"
	fi
	


	
