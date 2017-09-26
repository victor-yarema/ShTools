(
	FuncName='StrBlocksGenericLen'
	TestAndAssert 'Invalid BlockLen (0)' "${FuncName}" 1 '' "${FuncName}. Error. First parameter (BlockLen) should be the number that is greater than or equal to 1. Passed value is \"0\"." \
		0 '' &&
	TestAndAssert 'Invalid BlockLen (-1)' "${FuncName}" 1 '' "${FuncName}. Error. First parameter (BlockLen) should be the number that is greater than or equal to 1. Passed value is \"-1\"." \
		-1 '' &&
	TestAndAssert 'Invalid BlockLen (empty string)' "${FuncName}" 1 '' "${FuncName}. Error. First parameter (BlockLen) should be the number that is greater than or equal to 1. Passed value is \"\"." \
		'' '' &&
	TestAndAssert 'Invalid BlockLen (a)' "${FuncName}" 1 '' "${FuncName}. Error. First parameter (BlockLen) should be the number that is greater than or equal to 1. Passed value is \"a\"." \
		'a' '' &&
	TestAndAssert 'Empty string' "${FuncName}" 0 '' '' \
		1 '' &&
	TestAndAssert '1a' "${FuncName}" 0 'a' '' \
		1 'a' &&
	TestAndAssert '1ab' "${FuncName}" 0 'a b' '' \
		1 'ab' &&
	TestAndAssert '1abc' "${FuncName}" 0 'a b c' '' \
		1 'abc' &&
	TestAndAssert '2a' "${FuncName}" 0 'a' '' \
		2 'a' &&
	TestAndAssert '2ab' "${FuncName}" 0 'ab' '' \
		2 'ab' &&
	TestAndAssert '2abc' "${FuncName}" 0 'a bc' '' \
		2 'abc' &&
	TestAndAssert '2abcd' "${FuncName}" 0 'ab cd' '' \
		2 'abcd' &&
	TestAndAssert '2abcde' "${FuncName}" 0 'a bc de' '' \
		2 'abcde' &&
	TestAndAssert '3a' "${FuncName}" 0 'a' '' \
		3 'a' &&
	TestAndAssert '3ab' "${FuncName}" 0 'ab' '' \
		3 'ab' &&
	TestAndAssert '3abcde' "${FuncName}" 0 'ab cde' '' \
		3 'abcde' &&
	TestAndAssert '3abcdefgh' "${FuncName}" 0 'ab cde fgh' '' \
		3 'abcdefgh' &&
	true
)
