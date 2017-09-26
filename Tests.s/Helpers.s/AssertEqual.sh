(
	_FuncBasic || exit $?

	_ValidateParamsNum 3 $# || exit $?

	Title="$1"
	Actual="$2"
	Expected="$3"
	[ "${Actual}" = "${Expected}" ] ||
	{
		printf $'%s mismatch.\n\tExpected: "%s"\n\tActual__: "%s"\n' \
			"${Title}" \
			"$( echo "${Expected}" | sed 's/\"/\\"/g' )" \
			"$( echo "${Actual}" | sed 's/\"/\\"/g' )"
		exit 1
	}
)
