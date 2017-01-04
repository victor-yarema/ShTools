(
	set -uC
	Dir="$1"
	FuncNameSuffix="$2"
	find "${Dir}" \
		-not -path '*/.git/*' \
		-not -path '*/*.s/*' \
		-type f \
		-name '*.sh' \
		| sed 's/^\(.*\)\/\([^/]*\)\(\.[^.]*\)$/\2'"${FuncNameSuffix}() { . '"'\1\/\2\3'"'"' "$@" ; }/'
)
