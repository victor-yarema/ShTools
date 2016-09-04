(
	set -uC
	cd "${ShTools}" ||
	exit $?

	Target="$1"
	rm -f "${Target}"
	find . \
		-not -path '*/.git/*' \
		-type f \
		-name '*.sh' \
		-exec sh -c '
			FileName="$( basename "{}" )" ;
			FuncName="$( echo "${FileName}" | sed "s/\.[^.]*$//g" )" ;
			echo "${FuncName}() { . \"\${ShTools}/${FileName}\" \"\$@\" ; }" >> "'"${Target}"'"
			' \;
)
