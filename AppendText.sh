(
	_FuncBasic || exit $?

	_ValidateParamsNum 3 $# || exit $?

	File="$1"
	Marker="$2"
	Text="$3"

	cat "${File}" | grep -q "^${Marker}"'$' ||
	{
		>&2 echo "${File}"
		>&2 echo "${Marker}"
		>&2 echo 'Config not found. Appending...'
		touch "${File}" &&
		echo $'\n'"${Marker}"$'\n'"${Text}" >> "${File}"
	}
)
