(
	_FuncBasic || exit $?

	_ValidateParamsNum 2 $# || exit $?

	BlockLen="$1"
	Str="$2"

	MsgTmpl_BlockLen_Error='%s. Error. First parameter (BlockLen) should be the number that is greater than or equal to 1. Passed value is "%s".\n'
	[ "${BlockLen}" -ge 1 ] 2>/dev/null ||
	{
		>&2 printf "${MsgTmpl_BlockLen_Error}" "$( _FuncName )" "${BlockLen}"
		exit 1
	}

	Pat='\([^ ]\)\([^ ]\{'"${BlockLen}"'\}\)\( \|$\)' &&
	while ( echo "${Str}" | grep -q "${Pat}" ) ; do
		Str="$( echo "${Str}" | sed "s/${Pat}/\1 \2/" )"
	done &&
	echo "${Str}"
)
