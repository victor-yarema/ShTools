{
	_FuncBasic || exit $?

	_ValidateParamsNum 2 $# || exit $?

	Actual="$1"
	Expected="$2"
	[ "${Actual}" = "${Expected}" ] ||
	{
		printf $'Expected "%s", but was "%s".\n' \
			"${Expected}" "${Actual}"
		exit 1
	}
}
