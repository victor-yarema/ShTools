(
	_FuncBasic || exit $?

	_ValidateParamsNum 1 $# || exit $?

	IsoTime="$1"
	date -d "${IsoTime}" +'%s'
)
