(
	FuncName='StrBlocks'
	TestAndAssert 'No params' "${FuncName}" 1 '' "${FuncName}. Error. You should specify exactly 1 parameter(s). You have specified 0 parameter(s)." \
		&&
	TestAndAssert '2 params' "${FuncName}" 1 '' "${FuncName}. Error. You should specify exactly 1 parameter(s). You have specified 2 parameter(s)." \
		'' '' &&
	TestAndAssert 'Empty string' "${FuncName}" 0 '' '' \
		'' &&
	TestAndAssert 'a' "${FuncName}" 0 'a' '' \
		'a' &&
	TestAndAssert 'ab' "${FuncName}" 0 'ab' '' \
		'ab' &&
	TestAndAssert 'abc' "${FuncName}" 0 'abc' '' \
		'abc' &&
	TestAndAssert 'abcd' "${FuncName}" 0 'a bcd' '' \
		'abcd' &&
	TestAndAssert 'abcde' "${FuncName}" 0 'ab cde' '' \
		'abcde' &&
	TestAndAssert 'abcdef' "${FuncName}" 0 'abc def' '' \
		'abcdef' &&
	TestAndAssert 'abcdefg' "${FuncName}" 0 'a bcd efg' '' \
		'abcdefg' &&
	TestAndAssert 'abcdefgh' "${FuncName}" 0 'ab cde fgh' '' \
		'abcdefgh' &&
	true
)
