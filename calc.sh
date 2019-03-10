#!/bin/bash


	declare -i sum=0
	declare -i product=1
	declare -i max=0
	declare -i min=0
	operation=$1
	
	echo "operation = $operation"


	if [ "$operation" = "S" ] #SUM
	then
		for i in ${@:2}
		do		
		sum=$((sum+i))
		done
	echo "$sum"
	elif [ "$operation" = "P" ] #PRODUCT
	then
		for i in ${@:2}
		do
		product=$((product*i))
		done
	echo "$product"
	elif [ "$operation" = "M" ] # MAX
	then	
		max=$2 #set biggest to our first argument until bigger is found
		for i in ${@:2}
		do
			if [ $i -gt $max ]
			then
				max=$((i))
			fi
		done	
	echo "$max"
	elif [ "$operation" = "m" ]
	then	
		min=$2 #set biggest to our first argument until bigger is found
		for i in ${@:2}
		do
			if [ $i -lt $min ]
			then
				min=$((i))
			fi
		done	
	echo "$min"
	fi




	








