(
	set -uC
	Dir="$1"
	FuncNameSuffix="$2"
	find "${Dir}" \
		-not -path '*/.git/*' \
		-not -path '*/*.s/*' \
		-type f \
		-name '*.sh' \
		-exec sh -c '
			FileName="$( basename "{}" )" ;
			FuncName="$( echo "${FileName}" | sed "s/\.[^.]*$//g" )" ;
			echo "${FuncName}'"${FuncNameSuffix}() { . '"'{}'"'"' \"\$@\" ; }"
			' \;
)
