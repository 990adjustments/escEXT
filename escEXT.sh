#!/bin/bash

# escEXT
# Adds an extension to files or changes file extension.
# 07.13.2005

# Erwin Santacruz, hi@990adjustments.com
# www.990adjustments.com/


SCRIPT=`basename $0`
BADPARAM=165
ADDEXT=0

# Check if arguments are passed.
if [ "$1" == "" ]
then
	echo -e "usage: $SCRIPT [-e] extension [file]
       $SCRIPT old_extension new_extension

use $SCRIPT -h for help"

	exit $BADPARAM
else
	while getopts ":e:h" options
	do
    case $options in
      e) EXTARG=$OPTARG
         ADDEXT=1
         ;;

      h) echo; echo -e "\033[1;31m\033[1mNAME\033[0m
      escEXT - add a file extension or change the file extension on a sequence of files.

      \033[1;31m\033[1mSYNOPSIS\033[0m
      \033[1mescEXT\033[0m [\033[1m-e\033[0m] \033[4mext\033[0m \033[4m[file]\033[0m
      \033[1mescEXT\033[0m \033[4mold extension\033[0m \033[4mnew extension\033[0m

      \033[1;31m\033[1mDESCRIPTION\033[0m
      To add an extension to a sequence of files use the -e option
      ./escEXT.sh -e \033[1m\033[4mext\033[0m \033[1m\033[4mfile\033[0m
      Where \033[1mext\033[0m is the extension you want to add
      and \033[1mfile\033[0m is the file to that will be renamed using
      the extension. You can omit the numbered portion of the file name.

      If the intent is to change the extension on a file, call the script as
      ./escEXT.sh \033[1m\033[4mold extension\033[0m \033[1m\033[4mnew extension\033[0m"

      echo
      exit 0
      ;;

      *) echo "usage: $SCRIPT [-e] extension [file]
       $SCRIPT old_extension new_extension

use $SCRIPT -h for help"
      ;;
    esac
	done
fi

shift $((OPTIND - 1))

# add extension
if [ $ADDEXT -eq 1 ]
then
  for i in $1*
  do
    mv $i ${i}.$EXTARG
  done

# change extension
elif [ $# -eq 2 ]
then
  for i in *
  do
   if [[ $i != *.$1 ]]
   then
     echo "File with extension $1 does not exist"
     exit 1
   else
     mv $i ${i%.$1}.$2
   fi
  done
fi

exit 0

#End
