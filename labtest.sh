FILE=/home/user/lab.txt
dialog \
	--stdout	\
	--backtitle "test lab"	\
	--title "lab"	\
	--inputbox "name" 0 0 "$(cat $FILE)"	\
	> $FILE
NAME=$(cat $FILE)
if [ ! -z $NAME ]; then
	clear
	curl http://labtest.vm/psql-tests/test.lua?usr=$(cat /etc/hostname)\&lab=$NAME
	echo ""
	read -p "press enter to close window"
fi