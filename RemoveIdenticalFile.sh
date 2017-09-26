(
	_FuncBasic || exit $?

	_ValidateParamsNum 2 $# || exit $?

	RedundantFilesDir="$1"
	FileA="$2"

	FileCommon="$( echo "${FileA}" | sed "s|^\\./||" )" &&
	FileB="${RedundantFilesDir}${FileCommon}" &&
	[ ! -f "${FileB}" ] &&
	{
		echo "Not found ${FileB}"
		exit 1
	}

	cmp -s "${FileA}" "${FileB}"
	Res=$?
	[ $Res -ne 2 ] &&
	{
		{
			[ $Res -eq 0 ] &&
			rm -v "${FileB}"
			[ $Res -eq 0 ]
		} ||
		echo "Not equal \"${FileA}\" \"${FileB}\""
	} ||
	echo "Error \"${FileA}\" \"${FileB}\""
)
