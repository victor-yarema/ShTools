(
	set -uC
	Dir="$1"
	FuncNameSuffix="$2"
	cd "${Dir}" ||
	exit $?
	find . \
		-not -path '*/.git/*' \
		-type f \
		-name '*.sh' \
		-exec sh -c '
			FileName="$( basename "{}" )" ;
			FuncName="$( echo "${FileName}" | sed "s/\.[^.]*$//g" )" ;
			echo "${FuncName}'"${FuncNameSuffix}() { . '${Dir}"'/${FileName}'"'"' \"\$@\" ; }"
			' \;
)
