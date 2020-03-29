#! /bin/sh

# Orders my HumbleBundle eBook bundles to import in Calibre
# Put them all in a folder and run this without arguments

for i in `echo *.torrent | cut -d: -f1 | sort -u`
do
	mkdir $i
	mv $i.* $i
done
