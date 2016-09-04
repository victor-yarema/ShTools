(
	. "${ShTools}/_FuncBasic.sh" ||
	return $?

	if [ -z ${FUNCNAME[0]+x} ];
	then
		Stack=("${funcstack[@]}")
	else
		#Stack=(0 "${BASH_SOURCE[@]}")
		Stack=(0 "${FUNCNAME[@]}")
	fi

	MsgTmpl_FuncParamsNum_Error='%s. Error. You should specify exactly %s parameter(s). You have specified %s parameter(s).\n'

	[ $# -eq 2 ] ||
	{
		>&2 printf "${MsgTmpl_FuncParamsNum_Error}" "${Stack[2]}" 2 $#
		return 1
	}

	RequiredParamsNum=$1
	ActualParamsNum=$2

	[ $ActualParamsNum -eq $RequiredParamsNum ] ||
	{
		>&2 printf "${MsgTmpl_FuncParamsNum_Error}" "${Stack[4]}" $RequiredParamsNum $ActualParamsNum
		return 1
	}
)
