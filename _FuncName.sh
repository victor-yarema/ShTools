(
	if [ -z ${FUNCNAME[0]+x} ];
	then
		Stack=("${funcstack[@]}")
	else
		#Stack=(0 "${BASH_SOURCE[@]}")
		Stack=(0 "${FUNCNAME[@]}")
	fi

	echo "${Stack[4]}"
)
