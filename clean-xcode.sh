#!/bin/zsh
# Based on the script in this article: https://www.raywenderlich.com/19998365-understanding-and-managing-xcode-space

function CleanXcodeDirectory() {
	if [ -d $1 ]; then
		echo "Cleaning $1";
		Filenames=()
	
		# Get directories in numeric order using (/n): / = directories, n = numeric sort
		Filenames=("$1"/*(/n))
		FileCount=${#Filenames[@]}
	
		echo Directories: $FileCount
	
		if [ $FileCount -gt $2 ]; then
			let "CountToDelete = $FileCount - $2"

			echo Directories to delete: $CountToDelete

			# Directory names are in numeric order so we can just delete <count> - <number-to-keep> directories, knowing that the ones which are not deleted are for the most recent OS releases.
			for ((i = 1; i <= $CountToDelete; i++)); do
				# Move the directory to trash rather than deleting it with rm -rf. This can be undone in the event of a mistake, or for testing.
				osascript -e "tell application \"Finder\" to delete POSIX file \"${Filenames[$i]}\""
			done
		else
			echo No items to delete.
		fi
	fi
}

# Clean Xcode directories - first parameter is the path, second parameter is how many subdirectories to keep.
CleanXcodeDirectory ~/Library/Developer/Xcode/iOS\ DeviceSupport 2
CleanXcodeDirectory ~/Library/Developer/Xcode/watchOS\ DeviceSupport 1
CleanXcodeDirectory ~/Library/Developer/Xcode/tvOS\ DeviceSupport 1

# Remove unavailable simulators
xcrun simctl delete unavailable
