(
	set -uC
	Dir="$1"
	FuncNameSuffix="$2"
	cd "${Dir}" ||
	exit $?
	find . \
		-not -path '*/.git/*' \
		-not -path '*/*.s/*' \
		-type f \
		-name '*.sh' \
		-exec sh -c '
			FileName="$( basename "{}" )" ;
			FuncName="$( echo "${FileName}" | sed "s/\.[^.]*$//g" )" ;
			echo ">&2 echo \"Testing ${FuncName} ...\" &&"
			echo "${FuncName}'"${FuncNameSuffix}"' &&"
			' \;
	echo $'echo \'All tests passes.\''
)
