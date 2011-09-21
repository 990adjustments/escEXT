escEXT
========

Description
-----------

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

Installation & Usage
--------------------

First make the script executable. `chmod u+x escEXT.sh` or
`chmod 755 escEXT.sh`. Then add the script to your PATH.

To add an extension to a sequence of files use the -a option.
Navigate to the directory where the file sequence is located.
If there is only one file sequence in the directory you can
call the script with one argument like so:

`escEXT.sh -a ext`

If you have multiple file sequences in the same directory, add the
name of the file omitting the number padding as a second argument.

`escEXT.sh -a ext file`

Where `ext` is the extension you want to add and `file` is the name of
the file sequence without the number padding. Since the script does
file globbing, you can enter the first few letters of the file name but
making sure you omit the the number padding.

_No_   `escEXT.sh -a c4d file001`
_Yes_  `escEXT.sh -a c4d file`

If the intent is to change the extension on the files, call the script
within the directory the file sequence is located as such:

`escEXT.sh old_extension new_extension`

Use `escEXT.sh -h` for help.

Legal
-----

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL 990ADJUSTMENTS OR ERWIN SANTACRUZ AND CONTRIBUTORS
BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

------------

Thank you & Peace!

Erwin  
[www.990adjustments.com](http://www.990adjustments.com/)  
[Twitter](http://www.twitter.com/990adjustments/)
