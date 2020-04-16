#! /bin/sh

# Orders my HumbleBundle eBook bundles to import in Calibre
# Put them all in a folder and run this without arguments

DIR="/mnt/c/Users/kille/Downloads/ebooks"
EXT="pdf"

if [ -n "$1" ]
then
	DIR=$1
fi

echo "Going to process ebooks from $DIR"

if cd $DIR > /dev/null 2>&1
then
	for i in `echo *.$EXT`
	do
		name=`echo $i | cut -d. -f1 | sort -u`
		echo Processing $name...
		mkdir $name
		mv $name.* $name
	done
else
	echo "$DIR is either missing or not a directory"
	exit 1
fi
