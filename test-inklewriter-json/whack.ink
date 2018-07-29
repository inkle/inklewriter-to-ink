// ---- The Whack! ----
// Converted from original inklewriter URL:
// http://writer.inklestudios.com/stories/4vp5
# title: The Whack!
# author: A M Ole
// -----------------------------

VAR whacks = 0
VAR leftside = false
VAR rightside = false
VAR top = false
VAR bottom = false
VAR loopcount = 0

-> Start


==== Start ====
Once upon a time there was a mole, and his name was Graham. He was short, furry, and fat.
  + Tell me more!
        -> heWasTheHappiest 

= heWasTheHappiest
{ loopcount == 0:
    He was the happiest mole there had ever been.
}
    -> Start_turn

==== Chosen_Height ====
{~Through the earth|From high above}, Graham {~feels the gentle vibration|feels the call of cool air} {~that says something is happening|and begins to feel claustrophic}. {~Worms to eat?|The sun is shining?} Perhaps. It is worth a look. He {~begins burrowing|starts to make his way back|begins to tunnel|clambers back} up to the {~surface|grass}...<em></em>
  + Whack!
        -> youSwingTheHamme 

= youSwingTheHamme
  ~ whacks = whacks + 1
<em>You swing the hammer and high and bring it down on the earth with all your might!</em>
  + {loopcount == 1} {leftside} {bottom} What happened?
        -> Hit 
  + {loopcount == 1} {not leftside} What happened?
        -> Miss 
  + {loopcount == 2} {top} {not leftside} {not rightside} What happened?
        -> Hit 
  + {loopcount == 2} {not top} What happened?
        -> Miss 
  + {loopcount == 3} {leftside} {top} What happened?
        -> Hit 
  + {loopcount == 3} {not top} What happened?
        -> Miss 
  + {loopcount == 1} {leftside} {not bottom} What happened?
        -> Miss 
  + {loopcount == 2} {leftside} {top} What happened?
        -> Miss 
  + {loopcount == 3} {top} {not leftside} What happened?
        -> Miss 
  + {loopcount == 2} {top} {rightside} What happened?
        -> Miss 

==== Hit ====
<em>You got him!</em>
In his last moments, Graham the mole considers how he will not return to his moley wife or his two moley children, how he will never complete his novel, how he will never finish reading <em>Finnegans Wake</em>, all because of one fine spring morning when he pushed his nose above ground...
<em>You took {whacks} {whacks > 1:whacks|whack} to get him good!</em>
    -> END

==== Miss ====
<em>You miss! {~Graham|The mole} {~appears|erupts|tunnels up} {not bottom and not top:in|at} the {top:{~bottom edge|middle}|{bottom:{~top edge|middle}|{~top edge|bottom edge}}} of the {leftside:{~right-hand side|middle}|{rightside:{~left-hand side|middle}|{~left-hand|right-hand} side}} of the {~lawn|field|grass}. </em> <>
  ~ leftside = false
  ~ rightside = false
  ~ top = false
  ~ bottom = false
He {~pokes his nose|clambers|throws a heap of dirt} up and {~sniffs the air with glee|grins at you|makes a scratching noise|gobbles down a worm|and turns his little head to the sky}!
{ loopcount == 3:
     ~ loopcount = 1
    
}
<i></i>
    -> Start_turn

==== Start_turn ====
{ loopcount > 0:
    Graham {~the mole|} {~burrows|digs|delves|charges|hurries} {~quickly|happily|merrily|cheerfully} {~back down|away|deep} into the {~earth|ground|mud|soil}{~.|, in a flurry of dirt.|, with a burst of energy.|, rump raised to the sky!}
}
  ~ loopcount = loopcount + 1
{loopcount < 0: NOTE: This is where the loop counter gets increased. }
  + Left side
        -> youMoveOverToThe 
  + Centre
        -> youMoveToTheCent 
  + Right side
        -> youMoveOverToThe1 

= youMoveOverToThe1
  ~ rightside = true
<em>You move over to the right side of the field.</em>
    -> Chosen_Side

= youMoveOverToThe
  ~ leftside = true
<em>You move over to the left side of the field, ready.</em>
    -> Chosen_Side

= youMoveToTheCent
<em>You move to the centre of the field.</em>
    -> Chosen_Side

==== Chosen_Side ====
{ loopcount == 1:
    Graham the mole was happily chewing his way through the topsoil of the garden. Spring was in the air; he could smell the freshness leaking down into his murky subterranean world and it made his whiskers twitch.
}
{ loopcount > 1:
    {~Graham|The mole} {~snuffles|wanders|meanders|moves} {~around|about} {~through the darkness|underground|through the soil|through his catacombs|digging quick new tunnels}.<em></em>
}
  + Top
        -> youCreepIntoPlac 
  + Middle
        -> youCreepIntoPlac1 
  + Bottom
        -> youCreepIntoPlac2 

= youCreepIntoPlac
  ~ top = true
<em>You creep into place {not rightside and not leftside:at the top of the edge of the grass|at the  top of the field}.</em>
    -> Chosen_Height

= youCreepIntoPlac1
<em>You creep into place {not rightside and not leftside:at the middle of the edge of the grass|at the very middle of the field}.</em>
    -> Chosen_Height

= youCreepIntoPlac2
  ~ bottom = true
<em>You creep into place {not rightside and not leftside:at the bottom of the edge of the grass|at the bottom of the field}.</em>
    -> Chosen_Height