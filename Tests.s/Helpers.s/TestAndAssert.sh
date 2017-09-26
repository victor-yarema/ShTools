(
	_FuncBasic || exit $?

	MsgTmpl_ParamsNum_Error='%s. Error. Function expects at least 5 parameters. Received only %s.\n'
	[ $# -ge 5 ] 2>/dev/null ||
	{
		>&2 printf "${MsgTmpl_ParamsNum_Error}" "$( _FuncName )" $#
		exit 1
	}

	TestCaseName="$1" ; shift
	FuncName="$1" ; shift
	ExpectedRetCode="$1" ; shift
	ExpectedStdOut="$1" ; shift
	ExpectedStdErr="$1" ; shift

	MsgTmpl_FuncNameParam_Error='%s. Error. Function expects function name as the second parameter. Received value "%s".\n'
	typeset -f "${FuncName}" > /dev/null ||
	{
		>&2 printf "${MsgTmpl_FuncNameParam_Error}" "$( _FuncName )" "${FuncName}"
		exit 1
	}

	Cmd="${FuncName}"
	while (( $# )); do
		Cmd+=' "'"$( echo "$1" | sed 's/\"/\\"/g' )"'"'
		shift
	done

	ActualStdOut="$( eval "${Cmd}" 2> /dev/null )"
	ActualRetCode=$?
	ActualStdErr="$( eval "${Cmd} > /dev/null" 2>&1 )"
	AssertEqual "${FuncName}. ${TestCaseName}. RetCode" "${ActualRetCode}" "${ExpectedRetCode}"
	RetCodeAssertRes=$?
	AssertEqual "${FuncName}. ${TestCaseName}. StdOut" "${ActualStdOut}" "${ExpectedStdOut}"
	StdOutAssertRes=$?
	AssertEqual "${FuncName}. ${TestCaseName}. StdErr" "${ActualStdErr}" "${ExpectedStdErr}"
	StdErrAssertRes=$?
	[ $RetCodeAssertRes -eq 0 ] &&
	[ $StdOutAssertRes -eq 0 ] &&
	[ $StdErrAssertRes -eq 0 ]
)
