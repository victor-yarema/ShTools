_FuncBasic() {
	set -uC
	set -o pipefail
}

_ValidateParamsNum() (
	_FuncBasic

	MsgTmpl_FuncParamsNum_Error='Error. You should specify exactly %s parameter(s). You have specified %s parameter(s).\n'

	RequiredParamsNum=$1
	ActualParamsNum=$2

	[ $ActualParamsNum -eq $RequiredParamsNum ] ||
	{
		>&2 printf "${MsgTmpl_FuncParamsNum_Error}" $RequiredParamsNum $ActualParamsNum
		exit 1
	}
)

Main() (
	_ValidateParamsNum 2 $# || exit $?

	Dir="$1" &&
	SysDir="$2" &&

	mkdir -p "${Dir}" &&
	cd "${Dir}" &&
	git clone https://victor-yarema@github.com/victor-yarema/ShTools . &&
	git config core.fileMode false &&
	eval "$( . "${Dir}/__GenFuncs.sh" "${Dir}" '' )" &&
	mkdir -p "${SysDir}" &&
	AppendText "${SysDir}/ShTools" '# Ref' "ShToolsDir='${Dir}'"$'\n' &&
	AppendText "${SysDir}/ShTools" '# Run' \
		'eval "$( . "${ShToolsDir}/__GenFuncs.sh" "${ShToolsDir}" '"''"$' )"\n'
)

Main "$@" ||
exit 1
