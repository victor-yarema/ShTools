(
	set -uC
	Dir="$1"
	Suffix="_Tests"
	eval "$( . "${Dir}/__GenFuncs.sh" \
		"${Dir}" '' )"
	eval "$( . "${Dir}/__GenFuncs.sh" \
		"${Dir}/Tests.s" "${Suffix}" )"
	eval "$( . "${Dir}/__GenFuncs.sh" \
		"${Dir}/Tests.s/Helpers.s" '' )"
	eval "$( . "${Dir}/Tests.s/Helpers.s/_GenAllTests.sh" \
		"${Dir}/Tests.s" "${Suffix}" )"
)
