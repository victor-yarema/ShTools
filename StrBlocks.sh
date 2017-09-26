(
	_FuncBasic || exit $?

	_ValidateParamsNum 1 $# || exit $?

	Str="$1"

	StrBlocksGenericLen 3 "${Str}"
)
