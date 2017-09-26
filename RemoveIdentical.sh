(
	_FuncBasic || exit $?

	_ValidateParamsNum 1 $# || exit $?

	RedundantFilesDir="$1"

	RedundantFilesDir="$( echo "${RedundantFilesDir}/" | sed 's|//$|/|' )" &&

	find . \
		-mindepth 1 \
		-type f \
		-exec "${SHELL}" -c "
			. '${HOME}/.Sys/ShTools' &&"'
			RemoveIdenticalFile "$0" "$1"
			' "${RedundantFilesDir}" {} \;
)
