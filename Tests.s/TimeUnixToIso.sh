(
	FuncName='TimeUnixToIso'
	export TZ=0
	TestAndAssert '0' "${FuncName}" 0 '1970-01-01 00:00:00' '' \
		0 &&
	true
)
