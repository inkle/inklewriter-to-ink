// ---- Neighbourhood Predators ----
// Converted from original inklewriter URL:
// http://writer.inklestudios.com/stories/neighbourhoodpredators
# title: Neighbourhood Predators
# author: Jon Ingold
// -----------------------------


-> Sitting


==== Sitting ====
My cat is sitting by the window of my house, looking for something. You can never quite tell what; it's like she doesn't know until she sees it. But when she sees it, well; then she knows.
  + [So what did she see?] -> todaySheSawABird 

= todaySheSawABird
Today she saw a bird, and leapt up onto the windowsill to sing to it. She likes to sing to birds, although she doesn't sing very well. Her voice is croaky and harsh. She's like a witch in a fairy-story, cooing at a girl she wants to eat.
  + [She does want to eat the bird] -> shhDontSayThatTo 
  + [She just wants to play] -> thatsTrueReallyI 

= shhDontSayThatTo
Shh. Don't say that too loudly, or the bird will hear and tell all its friends.
    -> Cant_reach

= thatsTrueReallyI
That's true. Really, in her heart, she's a kind animal that only wants to befriend the birds. But somehow, that friendship always goes wrong.
    -> Cant_reach

==== Cant_reach ====
She can't get the bird, of course. There's a window in the way.
  + [She knows that, right?] -> ohYesWellIThinkS 
  + [She'll have a plan for that] -> undoubtedlyButIC 

= ohYesWellIThinkS
Oh, yes. Well. I think she does. Sometimes she gets startled by her reflection in the glass, but that's different. After all, that cat is <em>looking </em>at her.
    -> Bolts_to_her_feet

= undoubtedlyButIC
Undoubtedly, but I couldn't tell you what it was. I doubt she could either, until she's done it.
    -> Bolts_to_her_feet

==== Bolts_to_her_feet ====
My cat jumps to her feet, quite suddenly, and bolts out of the room.
  + [Follow her] -> wellWhenISayBolt 
  + [What's she seen?] -> imNotSureShesHea 

= wellWhenISayBolt
Well; when I say, "bolts out of the room", what I mean is, "bolts out through the cat-flap". So I can't exactly follow her. Not without going and getting the back-door key off the hook first.
  + [So what are you waiting for?] -> allRightThenHold 
  + [What startled her anyway?] -> imNotSureShesHea 

= imNotSureShesHea
I'm not sure. She's heard a noise, probably, rather than seen anything. Her hearing is much better than mine. She will always race to the front door a few seconds before the doorbell goes: she knows the sound of shoes crunching down the gravel in the pathway.
But I can't hear anything - or see anything through the window, either. What's startled her is a mystery to me.
  + [Well, she's only a cat] -> sheIsShesFascina 
  + [You should go and look] -> youreRightIShoul 

= allRightThenHold
All right, then. Hold on a moment.
    -> Outside

= sheIsShesFascina
She is. She's fascinated by flies, and gets startled by the fridge when it starts to hum. There's no reason to let what startles her get me up off the sofa. If I did, I'd be spending my whole life dashing around the house.
    -> A_noise

= youreRightIShoul
You're right, I should. I'll go through into the kitchen and get the key for this door.
    -> Outside

==== A_noise ====
Wait a moment. What was that?
  + [What?] -> aNoiseSoundedLik 
  + [I can't hear from here, obviously] -> sorryOfCourseYou 

= sorryOfCourseYou
Sorry, of course you can't. It was, well. A noise. It sounded like something on the gravel outside.
    -> somethingBig

= aNoiseSoundedLik
A noise. Sounded like something on the gravel outside.
    -> somethingBig

= somethingBig
Something big.
Something really rather big.
  + [Take a look?] -> Noise_is_getting_louder.iCouldYoureRight 
  + [Looks like the cat was right after all] -> itDoesMaybeIdBet 

= itDoesMaybeIdBet
It does, maybe. I'd better follow her. Where's that back-door key now?
  + [In the kitchen?] -> yesOfCourseOnThe 
  + [In your pocket?] -> idKnowIfItWasInM 

= idKnowIfItWasInM
I'd know if it was in my pocket. I might have a cat but I haven't lost all my marbles quite yet thank-you.
  + [Try the kitchen, then] -> yesOfCourseOnThe 
  + [Try the desk drawer] -> goodIdeaTheresAL 

= yesOfCourseOnThe
Yes, of course. On the hook. One moment.
    -> Outside

= goodIdeaTheresAL
Good idea. There's a lot of junk here, I might have dropped my keys in the last time I was tidying things away.
    -> Noise_is_getting_louder

==== Noise_is_getting_louder ====
That noise is getting louder, you know. A sort of pacing noise. I really can't imagine what it might be.
  + [You could peek through the curtain] -> iCouldYoureRight 

= iCouldYoureRight
I could, you're right. Wait a moment. I'll go into the front room. You might lose me when I do - the reception in there can be really bad. Limestone walls, you know. A solidly built house this, but they weren't thinking about mobile phones back in the 1800s.
So if I cut out, don't...
  + [Don't what?] -> silence 
  + [Hello?] -> helloImBackNowAn 

= silence
<em>[silence]</em>
  + [Hello?] -> helloImBackNowAn 

= helloImBackNowAn
Hello? I'm back now. And I'll tell you something else, I'm finding that back-door key and I'm finding it now.
  + [Why? What did you see?] -> illTellYouWhenIm 
  + [I thought I'd lost you there] -> youDontKnowTheHa 

= youDontKnowTheHa
You don't know the half of it.
    -> Outside_scared

= illTellYouWhenIm
I'll tell you when I'm not in the house any more.
    -> Outside_scared

==== Outside_scared ====
There. That's better. I'm outside.
  + [So where's the cat?] -> imNotSureOhThere 
  + [Are you going to tell me what you saw?] -> iSupposeIBetterH 

= imNotSureOhThere
I'm not sure. Oh - there she is. Up the top of the willow tree. I've no idea how she did that: perhaps she convinced her friend the bird to give her a lift up.
  + [Seems unlikely] -> yesISupposeSoPer 

= iSupposeIBetterH
I suppose I better had. Though I'm not sure you'll believe me.
  + [Of course I will] -> thatsGoodOfYouTo 
  + [We'll see about that] -> imQuiteCertainYo 

= yesISupposeSoPer
Yes, I suppose so. Perhaps it's simply that, when there's a dinosaur coming up the path, you can pretty much climb anything.
  + [A dinosaur?] -> A_dinosaur 
  + [That'll be hard to test] -> notAsHardAsYouMi 

= thatsGoodOfYouTo
That's good of you to say so, but honestly, <>
    -> imQuiteCertainYo

= imQuiteCertainYo
I'm quite certain you won't. If our situations were reversed and you were about to tell me that there's a dinosaur crunching up the gravel path outside <em>your</em> house, I wouldn't believe <em>you</em>.
  + [A dinosaur?] -> A_dinosaur 
  + [You're right, I don't believe you] -> iThoughtYouWould 

= iThoughtYouWould
I thought you wouldn't. But I'm not making it up. <>
    -> A_dinosaur

= notAsHardAsYouMi
Not as hard as you might imagine. There's one on the front path as we speak.
  + [I don't believe you] -> iThoughtYouWould 
  + [A real one?] -> wellIWouldntKnow 

= wellIWouldntKnow
Well, I wouldn't know the difference between a real one and a fake one, would I? But it looks like a dinosaur to me. 
    -> A_dinosaur.aSmallOneYouKnow

==== A_dinosaur ====
A dinosaur. <>
    -> aSmallOneYouKnow

= aSmallOneYouKnow
A small one - you know, about the size of a horse. Teeth. Scales. Actually, more like feathers. In fact, I'm surprised the cat isn't more interested in it.
  + [I'm not] -> yesWellICanSeeWh 
  + [How does a dinosaur get to be there?] -> imNotAtAllSureUn 

= imNotAtAllSureUn
I'm not at all sure. Unless. Well.
  + [Well?] -> I_know 
  + [Sounds like you know] -> I_know 

= yesWellICanSeeWh
Yes. Well, I can see what you mean.
Ah, now.That's given me an idea as to what's going on here. Just an idea. I mean, <>
    -> I_know

==== I_know ====
I might know. I <em>might</em>. But it's hardly a sure thing.
  + [Just tell me] -> itsLikeThisSomet 

= itsLikeThisSomet
It's like this. Sometimes, when my cat sits on the window-sill watching the birds and calling to them, hoping they'll be her friends, well sometimes...
  + [Yes?] -> iveSatWithHerAnd 

= iveSatWithHerAnd
I've sat with her and looked out, and seen in the window of the house across the street...
  + [Yes? Get on with it...] -> anotherPairOfEye 

= anotherPairOfEye
Another pair of eyes. A pair of eyes looking back at me. And calling to <em>me</em>.
  + [Just wanting to be "friends"?] -> exactlyHungryYel 
  + [That's your reflection] -> iThinkICanTellTh 

= exactlyHungryYel
Exactly. Hungry yellow lizard eyes <>
    -> thatWantToMakeFr

= iThinkICanTellTh
I think I can tell the difference between my reflection and a pair of hungry yellow lizard eyes<>
    -> thatWantToMakeFr

= thatWantToMakeFr
that want to make friends with me.
  + [Who lives there?] -> imNotSureIveNeve 
  + [Have you ever been over there?] -> justOnceTheCatTh 

= justOnceTheCatTh
Just once. The cat - the cat again - wandered into their garden and got stuck up a tree. <>
    -> Went_over_there

= imNotSureIveNeve
I'm not sure. I've never seen the owner. But then, the only time I've ever been anywhere near it was when I went to rescue my cat. It had wandered into their garden and got stuck up a tree.<>
    -> Went_over_there

==== Went_over_there ====
Got frightened by something I suppose. She couldn't get down. So I went over, and scrambled up, and helped her down.
Cut myself as I climbed, as I remember. Just a little scrape on my hand.
  + [You left a scent of blood?] -> ohDearOhDearOhDe 
  + [Was there a lizard there then?] -> iDidntSeeOneButI 

= ohDearOhDearOhDe
Oh dear. Oh dear, oh dear. You might be right. Oh dear. I think I might be in trouble.
Serious trouble.
    -> Help_me

= iDidntSeeOneButI
I didn't see one. But I guess, now I come to think about it, I did hear something breathing when I was leaving.
  + [You're in trouble, I think] -> youMakeThatSound 
  + [You should call someone] -> whoWouldICallImC 

= whoWouldICallImC
Who would I call? I'm calling you right now. <>
    -> Help_me

= youMakeThatSound
You make that sound like it's very serious. <>
    -> Help_me

==== Help_me ====
You'll help me, won't you?
  + [I can't see how] -> ohComeOnItsOnlyA 
  + [Not really, no] -> thatsGenerosityF 
  + [You want the Army, not me] -> doYouReallyThink 
  + [I can try] -> thankYouIWontFor 

= doYouReallyThink
Do you really think it takes the Army to deal with one little dinosaur? You make it sound like they aren't common.
  + [They aren't] -> wellISeeYourPoin 
  + [Are they?] -> wellISeeYourPoin 

= thatsGenerosityF
That's generosity for you. I mean, really. It's only a small one. <>
    -> Teeth

= thankYouIWontFor
Thank you. I won't forget this.
  + [Assuming you make it out alive] -> iWasRatherAssumi 
  + [That's no problem] -> thankYouIMeanItA 

= ohComeOnItsOnlyA
Oh, come on. It's only a small one. <>
    -> Teeth

= iWasRatherAssumi
I was rather assuming that, yes. I mean, it is only a small one. <>
    -> Teeth

= wellISeeYourPoin
Well, I see your point. Still, it's only a small one. <>
    -> Teeth

= thankYouIMeanItA
Thank you. I mean it. And it shouldn't be too much of a problem, it really shouldn't. It's only a small one. <>
    -> Teeth

==== Teeth ====
With disproportionate teeth, of course.
  + [You'd better hide] -> Escape.rightWellImInABo 
  + [You'd better escape] -> Escape 
  + [You'd better find a way to kill it] -> Kill_it 

==== Escape ====
All right.<>
    -> Fence

= rightWellImInABo
Right. Well, I'm in a box garden, and I don't even have a shed. There aren't too many options.
  + [Follow the cat up the tree] -> imNotSureICanDoT 
  + [You're right. Escape, then] -> Escape 

= imNotSureICanDoT
I'm not sure I can do that. You see, the cat has claws. I barely even have fingernails; I've been chewing them down while we speak.
  + [Escape, then] -> Escape 
  + [Time to stand up to it the beast] -> Kill_it 

==== Safe ====
Hello? Hello. No, I'm all right. I just came down... rather ungracefully. But I'm here now. On the other side of the fence.
  + [Well done] -> thankYouImRather 
  + [Where can you go from here?] -> wellIGuessIKnock 

= wellIGuessIKnock
Well, I guess I knock on their French windows and see if they won't mind me going through their living room. I'll wipe my shoes, I'm sure it will be all right. They'll understand.
  + [Maybe don't say about the creature] -> rightSoYouWantMe 
  + [Tell them you've lost your cat] -> doYouThinkSoImNo 

= thankYouImRather
Thank you. I'm rather proud of myself, to be honest.
    -> waitAMomentWhats

= doYouThinkSoImNo
Do you think so? I'm not sure that's very normal, losing a cat and then tracking it into someone else's living room.
  + [More normal than hungry lizards] -> maybeInYourUnive 
  + [Fair point. Maybe don't say anything] -> rightSoYouWantMe 

= rightSoYouWantMe
Right. So you want me just to stroll through their living room without speaking. Good idea. Maybe they'll mistake me for a ghost.
    -> waitAMomentWhats

= waitAMomentWhats
Wait a moment. What's that sound now?
  + [Close or far away?] -> veryCloseOnTheOt 

= veryCloseOnTheOt
Very close. On the other side of the fence, in fact.
  + [Don't worry...] -> ohYesYoureRight 
  + [Better start running...] -> youreProbablyRig 

= maybeInYourUnive
Maybe in <em>your</em> universe. But not in mine, as current evidence rather shows, doesn't it?
    -> waitAMomentWhats

= ohYesYoureRight
Oh - yes, you're right. <>
    -> Followed_by_cat

= youreProbablyRig
You're probably right. All right, straight through the neighbour's living room, so long as they've left their back door open...
Oh, no. It's all right. 
    -> Followed_by_cat

==== In_the_garden ====
Yes, I rather think that might be it.<>
    -> In_the_garden_2

==== Followed_by_cat ====
It's only the cat.
  + [Phew!] -> illSayVeryImpres 
  + [She climbed the fence?] -> yesYoureRightTha 

= illSayVeryImpres
I'll say. Very impressive of her, too, considering how she normally is with climbing. I can't imagine she'd have done it without provocation.
  + [You think the thing is in the garden now?] -> In_the_garden 

= yesYoureRightTha
Yes, you're right, that is unusual. She was quite safe up her tree.
Unless...
  + [Unless the thing is in the garden now] -> In_the_garden 
  + [Unless the thing is getting taller] -> unlessTheThingIs 

= unlessTheThingIs
Unless the thing is... oh, now, come on. You're just trying to frighten me. If I didn't know better I'd say you were enjoying this. Do you think this is some kind of game? I'm being forcibly evicted from my home by something from the Cretaceous period and you're placing bets?
  + [You're not the favourite] -> notWithYouAsMyVo 
  + [Of course not. Calm down] -> calmDownYouSay 

= notWithYouAsMyVo
Not with you as my voice of reason I'm not, certainly.
    -> In_the_garden_2

= calmDownYouSay
Calm down, you say?
    -> In_the_garden_2

==== In_the_garden_2 ====
I can hear it. It's really close now. On the other side of the fence, sniffing around. <>
    -> scratching

= scratching
Scratching.
  + [I think you're going to be eaten] -> goodnessMeButIRa 
  + [I still don't understand...] -> whyTheresALizard 
  + [I've got one last idea] -> lessOfTheLastIfY 

= whyTheresALizard
Why there's a lizard living across the street from me? I don't know. The man who used to live there was rather strange. Often up in the middle of the night. The sort that buys things by mail-order and doesn't ever mow his lawn. The sort that ends up with two or three plumbers vans outside his house, because so many plumbers go in but so few come out.
  + [So maybe it's not a lizard] -> maybeItsAMonster 

= lessOfTheLastIfY
Less of the "last", if you don't mind.
  + [All right, I've got an idea] -> imGladToHearIt 
  + [We'll see about that] -> iWillIllHaveToWa 

= goodnessMeButIRa
Goodness me, but I rather think you're right. <>
    -> imRatherOutOfOpt

= iWillIllHaveToWa
I will. I'll have to watch if the thing starts chomping on my leg. You'll be fine. You'll only get the audio.
  + [Don't give up] -> imRatherOutOfOpt 
  + [That's horrible] -> imGladYouveCaugh 

= maybeItsAMonster
Maybe it's a monster made from plumbers? Well, maybe. It's a possibility I'll bear in mind as it chomps down on my leg.
  + [Don't give up!] -> imRatherOutOfOpt 

= imRatherOutOfOpt
I'm rather out of options here...
  + [I've got a plan] -> imGladToHearIt 
  + [Just run for it] -> Run_where 

= imGladToHearIt
I'm glad to hear it.
  + [Just run for it] -> Run_where 

= imGladYouveCaugh
I'm glad you've caught up with me on that now. <>
    -> imRatherOutOfOpt

==== Kill_it ====
Yes. Goodness, that sounds rather drastic. But I suppose you're right. There's not much else I could do.
I suppose it's not really that surprising. The world is full of things eating other things, and things killing things to stop themselves being eaten. I don't know why I should be surprised about it.
  + [It's not often you being eaten] -> hasntBeenSoFarTh 
  + [You're in shock right now] -> yesISupposeIProb 

= yesISupposeIProb
Yes, I suppose I probably am.
    -> didYouHearThatCr

= hasntBeenSoFarTh
Hasn't been so far, that's true.
    -> didYouHearThatCr

= didYouHearThatCr
Did you hear that crash? That'll be the front door going. It's inside my house now... So whatever we're going to do, we'd better do it now...
  + [Go back inside] -> inThereWithThatT 
  + [Find a defensive position] -> whatInThisGarden 

= whatInThisGarden
What, in this garden? And it's not like I can ambush it, I don't have any kind of weapon. I'm not really sure you're advice is going to help, if this is the standard.
  + [You're right. Go inside and tool up] -> inThereWithThatT 
  + [You'd better run for it, then] -> goodThatsTheAdvi 

= inThereWithThatT
In there? With that thing? Are you sure?
  + [Go to the kitchen, get a knife] -> imAfraidMyKnives 
  + [Go to your tool chest and get a hammer] -> rightAbsolutelyB 
  + [Turn on the TV and distract it] -> thatsTheWorstAdv 

= imAfraidMyKnives
I'm afraid my knives are mostly cooking knives, and not so much the cutlasses you might be hoping for. I'm not sure what damage I could do a horse-sized lizard wielding a potato peeler.
    -> Reached_the_back_door

= goodThatsTheAdvi
Good. That's the advice I wanted to hear. 
    -> Fence

= thatsTheWorstAdv
That's the worst advice I've ever heard. You want me to distract a lizard that's got my scent in its murderous nostrils by turning on daytime television? Are you trying to make me into lunch?
  + [Trust me] -> thatsItICantTake 
  + [Good point] -> wellImGladWeveGo 

= rightAbsolutelyB
Right. Absolutely. Because a hammer is exactly the weapon I need when face with a horse-sized lizard with teeth like cutlasses. I could doubly arm myself, hammer in one hand, screwdriver in the other. Then I'd be twice as invincible - which is to say, still very <em>vincible </em>indeed.
    -> Reached_the_back_door

= wellImGladWeveGo
Well, I'm glad we've got a review process for our decisions here. I'm thinking I need fire. I'll go to the kitchen and set fire to a tea-towel. Maybe I can wave it at the thing and make it run away.
  + [Good idea] -> thanksAtLeastOne 
  + [Or you could grab a knife] -> imAfraidMyKnives 

= thatsItICantTake
That's it. I can't take any more. I'm going for the fence.
    -> Fence.silenceOccasiona

= thanksAtLeastOne
Thanks. At least one of us has my safety at heart.
    -> Reached_the_back_door

==== Reached_the_back_door ====
Uh-oh. It's reached the back door. I can see its eyes, leering out at me, like two sticky boiled sweets that have been too long down the side of something.
I can hear it working on the handle. <>
    -> In_the_garden_2.scratching

==== Run_where ====
Run where? It's bigger than me, faster than me. I bet it can climb better than I can.
  + [Anywhere!] -> allRightWellIllJ 

= allRightWellIllJ
All right. Well, I'll just run anywhere, and I tell you what, I'll do it <em>anywhen</em> too. That will sort me out, I'm sure.
  + [I mean it, run!] -> andIMeanItImTrap 
  + [I'm only trying to help] -> wellThankGoodnes 

= andIMeanItImTrap
And I mean it: <em>I'm trapped</em>.
    -> andYesThereItIsT

= wellThankGoodnes
Well, thank goodness you aren't trying to <em>hinder</em> me, I'm not sure how I'd cope.
    -> andYesThereItIsT

= andYesThereItIsT
And yes. There it is. There it is. It's right here. 
  + [You can see it] -> iCouldTouchIt 

= iCouldTouchIt
I could touch it. <>
My goodness. It's huge. Covered in stumpy little feathers, not scales at all. It looks like... well...
  + [Horrible?] -> definitely 
  + [Terrifying?] -> wellImTerrifiedC 
  + [Absurd?] -> exactly 

= exactly
Exactly. <>
    -> Chicken

= definitely
Definitely. <>
    -> Chicken

= wellImTerrifiedC
Well, I'm terrified, certainly, but not because of how it looks. Because it looks like a bird. <>
    -> Chicken

==== Chicken ====
Like a gigantic chicken.
Wait a minute. What's that sound?
  + [What now?] -> itsTheCatTheCats 

= itsTheCatTheCats
It's the cat. The cat's calling to it...
  + [She thinks...] -> itsABird 
  + [She's trying to help...] -> Bird 

= itsABird
...it's a bird. <>
    -> Bird

==== Bird ====
You're right. She's stupid enough to think this thing is just a gigantic bird...
  + [Go cat!] -> iCantBelieveItSh 

= iCantBelieveItSh
I can't believe it. She's singing to it. She's purring and calling and cawing in that horrible voice of hers and...
  + [The monster's going to eat her?] -> noNotQuite 
  + [What's happening?] -> Sleepy 

= noNotQuite
No, not quite. <>
    -> Sleepy

==== Sleepy ====
The monster's going... yes... the monster's going to sleep..!
  + [Quick, kill it!] -> iCantKillItNowNo 
  + [A happy ending?] -> forNowAtLeastPer 

= forNowAtLeastPer
For now, at least. Perhaps today no-one will get eaten.
  + [That would be nice] -> wouldntItAlthoug 

= iCantKillItNowNo
I can't kill it now. Not when it's asleep. This can just end peacefully. <>
    -> forNowAtLeastPer

= wouldntItAlthoug
Wouldn't it? Although, that said, the cat looks like she's going to try and take a bite. If that doesn't wake it up then nothing...
<em>[silence]</em>
  + [Hello?] -> lineDead 

= lineDead
<em>[line dead]</em>
    -> END

==== Fence ====
The fence is the only way; I can climb over that into my neighbour's garden. Just a question of getting my foot in here, and my hand there...
  + [It would probably be easier if...] -> yes 
  + [You're doing well, keep going!] -> thanksIAppreciat 

= thanksIAppreciat
Thanks. I appreciate the encouragement.
Actually, even better than encouragement would be having both hands free. Hold a moment.
    -> silenceOccasiona

= yes
Yes?
  + [If you put the phone down] -> ohGoodPointAllRi 

= ohGoodPointAllRi
Oh, good point. All right. Hold on a moment.
    -> silenceOccasiona

= silenceOccasiona
<em>[silence. Occasional grunting.]</em>
  + [Hello? How's it going?] -> silence2 

= silence2
<em>[silence.]</em>
  + [Hello? Are you there?] -> aScream 

= aScream
<em>[A scream]</em>
  + [Are you all right?] -> Safe 
  + [Is it the monster?] -> Safe 

==== Outside ====
There. Now I'm outside. You might be able to hear me better now, the reception inside the house can be terrible sometimes.
  + [So where's the cat?] -> imNotSureICantSe 
  + [I can hear you fine] -> goodGoodImGladNo 

= imNotSureICantSe
I'm not sure. I can't see her anywhere.
  + [She'll have wandered off somewhere] -> yesProbablyIDont 
  + [She'll have climbed something] -> unlikelyForHerOh 

= goodGoodImGladNo
Good, good. I'm glad. Now let me see. There's the cat. <>
    -> goodnessShesGotU

= unlikelyForHerOh
Unlikely for her. Oh, no, actually; you're right. <>
    -> goodnessShesGotU

= goodnessShesGotU
Goodness, she's got up into the tree. I wonder how she managed that? She's normally no good at climbing: she runs at things headlong and then bounces off them again. She's not a very clever cat, and all the running into things tends to make her stupider, I fancy.
  + [Poor thing] -> didIMentionEarli 
  + [Are you going to follow her up there?] -> chanceWouldBeAFi 

= yesProbablyIDont
Yes, probably. I don't know why I'm following her around anyway. It'd be a terrible thing if I had to admit that my cat's life is more exciting than my own, wouldn't it?
Oh, now I see her. <>
    -> goodnessShesGotU

= chanceWouldBeAFi
Chance would be a fine thing. It'd take some doing to get <em>me</em> up into the branches!
    -> Heard_something

= didIMentionEarli
Did I mention earlier she sometimes runs into window. She sometimes runs into windows as well.
    -> Heard_something

==== Heard_something ====
Wait a moment. I heard something.
  + [What kind of something?] -> somethingBigSome 
  + [Your cat calling for help?] -> noThatsNotIt 

= somethingBigSome
Something big. Something crunching on the gravel on the front path.
  + [You'd better take a look] -> idHaveToGoBackIn 
  + [Is there a back way out of here?] -> outOfTheGarden 

= noThatsNotIt
No, that's not it. <>
    -> somethingBigSome

= outOfTheGarden
Out of the garden? <>
    -> Climb_the_fence

= idHaveToGoBackIn
I'd have to go back inside for that, and whatever it is, it's starting head-butting the front door. So if it's all the same to you, I might stay out here.
  + [Are you saying you're trapped?] -> Climb_the_fence 

==== Climb_the_fence ====
Not exactly: not unless you count climbing the wall, which the cat could do at a push, I suppose, but I'd be in trouble.
  + [Brick wall, or fence?] -> fenceISupposeYou 
  + [I'm sure it won't come to that] -> youHaventHeardWh 

= youHaventHeardWh
You haven't heard what I've heard. <>
    -> soundsLikeTheres

= fenceISupposeYou
Fence. I suppose you're right: bricks would be more challenging. The fence has horizontal slats, and there are quite a few places I could use as finger-holds. I might be able to get up it. If it comes to it.
  + [I'm sure it won't] -> youHaventHeardWh 
  + [I'd get practising if I were you] -> youveGotABadFeel 

= youveGotABadFeel
You've got a bad feeling about all this, do you? I can't think why. You can't hear what I can hear. 
As for me, with what I can hear? I've got a <em>really</em> bad feeling. <>
    -> soundsLikeTheres

= soundsLikeTheres
Sounds like there's something prowling around out there. It sounds like it's digging.
  + [You think it's a creature?] -> iCantThinkWhatEl 
  + [I'm sure it's the postman] -> ifItsThePostmanT 

= ifItsThePostmanT
If it's the postman, then it sounds like he's decided to get a parcel delivered by rushing the front door.
    -> Safe_out_here

= iCantThinkWhatEl
I can't think what else would be rushing the front door. The scrabble of feet on the gravel then a thump.
    -> Safe_out_here

==== Safe_out_here ====
I'm glad I'm out here. There's no side-path, it'll have to get into the house and back out again before it reaches me.
  + [But what is it?] -> imNotSureNotCert 
  + [What makes you so sure it's bad?] -> well 

= well
Well, <>
    -> imNotSureNotCert

= imNotSureNotCert
I'm not sure. Not certain at all. But...
  + [But?] -> well1 

= well1
Well, <>
    -> I_know