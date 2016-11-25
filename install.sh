# Check if the backup folder exists. If not create it
if [ ! -d backup ]; then
	mkdir backup
fi

# Create a backup associated to the actual timestamp
timestamp=$(date +%s);
mkdir backup/$timestamp;

if [ $1 ]; then
	arr=($1 "all")
else
	arr=("all")
fi

# Copy the files associated to the OS given in the parameters
for item in $arr; do 
	for x in *.$item; do
		name=${x%\.$item};
		if [ -f ~/.$name ]; then
			cp ~/.$name backup/$timestamp/;
		fi
		cp $x ../test/.$name;
	done
done
