#!/bin/bash

# escEXT
# Bash shell script that adds an extension or changes the extension of a file sequence.
# 09.21.2011

# Erwin Santacruz, hi@990adjustments.com
# www.990adjustments.com/


SCRIPT=`basename $0`
BADPARAM=165
ADDEXT=0

# Check if arguments are passed.
if [ "$1" == "" ]
then
	echo -e "usage: $SCRIPT [-a] extension [file]
       $SCRIPT old_extension new_extension

use $SCRIPT -h for help"

	exit $BADPARAM
else
	while getopts "a:h" options
	do
    case $options in
      a) EXTARG=$OPTARG
         ADDEXT=1
         ;;

      h) echo; echo -e "\033[1;31m\033[1mNAME\033[0m
      escEXT - add a file extension or change the file extension on a sequence of files.

      \033[1;31m\033[1mSYNOPSIS\033[0m
      \033[1mescEXT\033[0m [\033[1m-a\033[0m] \033[4mext\033[0m \033[4m[file]\033[0m
      \033[1mescEXT\033[0m \033[4mold extension\033[0m \033[4mnew extension\033[0m

      \033[1;31m\033[1mDESCRIPTION\033[0m
      You know those times when you get a file sequence where they
      didn't add the extension to the file and your program doesn't
      understand it's a file sequence? Or when, for some crazy reason,
      the file sequence has the wrong file extension? Yeah, you know
      what I'm talking about. Well, escEXT might save the day. It's a
      basic Bash shell script that adds an extension to a file sequence
      or allows you to change the current extension to a new one.

      A little warning, I didn't add much error checking. I usually test it
      out with a copy of a few of the files I will be changing to make sure
      it behaves correctly. I haven't encountered any problems, but I know
      naming conventions vary so depending on how files are named, it may
      or may not present a problem.

      The following options are available:

      -a    Add and extension to a sequence of files.
      -h    Show this help file.

      First make the script executable. chmod u+x escEXT.sh or
      chmod 755 escEXT.sh. Then add the script to your PATH.

      To add an extension to a sequence of files use the -a option.
      Navigate to the directory where the file sequence is located.
      If there is only one file sequence in the directory you can
      call the script with one argument like so:

      \033[1mescEXT.sh -a \033[4mext\033[0m

      If you have multiple file sequences in the same directory, add the
      name of the file omitting the number padding as a second argument.

      \033[1mescEXT.sh -a \033[4mext\033[0m \033[1m\033[4mfile\033[0m

      Where ext is the extension you want to add and file is the name of
      the file sequence without the number padding. Since the script does
      file globbing, you can enter the first few letters of the file name but
      making sure you omit the the number padding.

      No      escEXT.sh -a c4d file001
      Yes     escEXT.sh -a c4d file

      If the intent is to change the extension on the files, call the script
      within the directory the file sequence is located as such:

      \033[1mescEXT.sh \033[4mold_extension\033[0m \033[1m\033[4mnew_extension\033[0m

      Use escEXT.sh -h for help.

      \033[1;31m\033[1mLEGAL\033[0m
      THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS AS IS AND ANY
      EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
      WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
      DISCLAIMED. IN NO EVENT SHALL 990ADJUSTMENTS OR ERWIN SANTACRUZ AND CONTRIBUTORS
      BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
      DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
      LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
      ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
      SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."

      echo
      exit 0
      ;;

      *) echo "usage: $SCRIPT [-a] extension [file]
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
elif [ $OPTIND -eq 1 ]
then
  if [ $# -eq 2 ]
  then
    for i in *.$1
    do
     # Double brackets not by the older POSIX or BourneShell
     # but allows for regular expression matching
     if [[ $i != *.$1 ]]
     then
       echo "File with extension $1 does not exist"
       exit 1
     else
       #mv $i ${i%.*}.$1
       mv $i ${i%.$1}.$2
     fi
    done
  else
    echo "usage: $SCRIPT [-a] extension [file]
       $SCRIPT old_extension new_extension"
  fi
fi

exit 0

#End
