(
	export TZ=0
	AssertEqual "$(TimeUnixToIso 0)" '1970-01-01 00:00:00'
)
