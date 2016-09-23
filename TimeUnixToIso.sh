(
	_FuncBasic || exit $?

	_ValidateParamsNum 1 $# || exit $?

	UnixTime="$1"
	date -d "@${UnixTime}" +'%F %T'
)
