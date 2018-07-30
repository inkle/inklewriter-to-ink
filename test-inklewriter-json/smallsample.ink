// ---- Untitled Story ----
// Converted from original inklewriter URL:
// http://writer.inklestudios.com/stories/3mq4
# title: Untitled Story
# author: Anonymous
// -----------------------------

VAR x = 0
VAR y_is_four = false
VAR one_marker = false
VAR second_marker = false

-> onceUponATime


==== onceUponATime ====
Once upon a time...
  + choice
        -> hellou 
  + unlinked choice
      TODO: This choice is a loose end.

= hellou
  ~ x = 5
  ~ y_is_four = true
hellou
  ~ one_marker = true
  ~ second_marker = true
world
Hello <strong>bold</strong> world. This is <em>italic</em>.
    -> END

= textConnectedToU
Text connected to unused section.
    -> END

= thisIsAnUnusedSt
This is an unused stitch
And this stitch links to the unused one.
  + Choice on unused stitch
        -> textConnectedToU 