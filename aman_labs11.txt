names='nisnahth saravana ganesh kiran vinod quit'
ps3='select'
select var in $names
do
	if [ $var == 'quit' ]
	then
		break
	fi
	echo " hello $var "
done
