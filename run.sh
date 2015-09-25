rm -f *.core 
TESTS="capcmp capret capretaddr init intcap printf smallint stack_cap string va_args va_copy va_die"
PASS_COUNT=0
FAIL_COUNT=0
FAILURES=""
for I in ${TESTS}
do
	echo Running $I 
	./$I
	if [ $? == 0 ]
	then
		echo PASSED: $I
		PASS_COUNT=`expr ${PASS_COUNT} + 1`
	else
		echo FAILED: $I
		FAIL_COUNT=`expr ${FAIL_COUNT} + 1`
		FAILURES="${FAILURES} $I"
	fi
done
echo ${PASS_COUNT} tests passed
if [ ${FAIL_COUNT} != 0 ]
then
	echo ${FAIL_COUNT} tests failed
	echo Failures: ${FAILURES}
fi