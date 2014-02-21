slideshow.sh
============

One time I had to make a presentation and it was scary and uncomfortable
leaving the terminal.  This is my 30 minute attempt at making a presentation
script for the terminal.

## Usage

Put all your slides in a directory.  The slides will be displayed in
alphabetical order.  Subdirectories are ignored (this is useful for storing
extra data).  Executable files will be executed, other files will be displayed
using `present.rb` (it just centers the content in the terminal window).  Press
`q` to go back a slide, press any other key to continue to the next slide.

## "FAQ"

**Q**: Why not use Keynote, or Powerpoint, or LaTeX, or some random web thing?
**A**: Maybe you are the type of person that prefers living in the Terminal.
If not, the ability to run arbitrary programs as slides is real handy.

**Q**: Does it make sense to separate `slideshow.sh` and `present.rb`?
**A**: Uh... probably not.  I hacked this together real quick and it kind of
just happened that way.

## Known Issues

The "previous slide" behavior is real hacky.  If a slide exits with a non-zero
exit code, the slideshow goes back a slide, otherwise it progresses to the next
slide.  Sometimes it can be hard to get a process to exit with a non-zero exit
code when running it, which makes it impossible to go back from that slide.

The only way to quit is to go through the whole slideshow.
