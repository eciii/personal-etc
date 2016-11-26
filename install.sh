# Check if the backup folder exists. If not create it
if [ ! -d backup ]; then
	mkdir backup
fi

# Create a backup associated to the actual timestamp
timestamp=$(date +%s)
mkdir backup/"$timestamp"

# Select which "components" will be copied
if [ "$1" ]
then
	arr=("$1" "all")
else
	arr=("all")
fi

# Identify the default shell
shell=${SHELL##*/}

# Copy the respective file in the home directory making first a backup
for item in "${arr[@]}"; do 
	for x in *."$item"; do
		name="${x%\.$item}"
		name="${name//bash/$shell}"
		if [ -f ~/."$name" ]; then
			cp ~/."$name" backup/"$timestamp"/
		fi
		cp "$x" ~/."$name"
	done
done
