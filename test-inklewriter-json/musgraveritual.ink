// ---- The Adventure of the Musgrave Ritual ----
// Converted from original inklewriter URL:
// http://writer.inklestudios.com/stories/musgraveritual
# title: The Adventure of the Musgrave Ritual
# author: Sir Arthur Conan Doyle
// -----------------------------

VAR mischevious = 0
VAR burn_papers = false
VAR more_coal = false
VAR stood_up = false
VAR tidy_up = false
VAR bold = 0
VAR lying_about_case = false
VAR okay_attempt = false
VAR wessex_bridge = false
VAR chinese_tailor = false
VAR story_about_failures = false
VAR watson_opens_box = false
VAR seen_items = false
VAR examined_key = false
VAR number_examined = 0
VAR examined_paper = false
VAR examined_peg = false
VAR examined_discs = false
VAR known_from_college = false
VAR impatient = 0

-> Titles


==== Titles ====
<em>From the <strong>Memoirs of Sherlock Holmes</strong>.</em>
  + Part One: A Cold Night in London
        -> Beginning 

==== Beginning ====
# IMAGE: http://upload.wikimedia.org/wikipedia/commons/7/73/Paget_holmes.png
<em></em><strong></strong>Those who have followed my chronicles of the time I spent in the company of the great Sherlock Holmes may be forgiven for imagining that we were constantly about and afoot, hunting this criminal or dogging the heels of that about the foggy streets of London. 
But, in truth, there were many nights like this one, spent sitting in our rooms on Baker Street with winter in full force outside, and watching a roaring fire surrounded by nothing more sinister than the reminders and relics of the many wrongdoers Holmes had brought to justice. 
  + "More coal, Holmes?"
        -> weHadBeenSitting 
  + "We should burn these papers of yours."
        -> whileIWasNeverLe 

= whileIWasNeverLe
  ~ mischevious = mischevious + 1
  ~ burn_papers = true
While I was never less than amazed by the abilities of my good friend, I did find his constant need to surround himself with trophies and reminders a touch wearing: rather like entering the house of a game-hunter who insists on lining his walls with the dead remains of his foes.
    -> burnPapersWeShou

= weHadBeenSitting
  ~ more_coal = true
We had been sitting up the last few hours: he, pasting extracts into his commonplace book while I read through a poor treatise on African diseases recently published by the university, and it was likely we would sit up a while yet, as the hour was still early, despite the heavy dark outside. 
    -> burnPapersWeShou

= burnPapersWeShou
{burn_papers:"We should burn these infernal papers of yours, Holmes. Keep this room warm and put them to some use."|"More coal, Holmes?"}
{burn_papers:"I see the cold has put you in a foul mood this evening." He got himself slowly to his feet, and moved over to the fire. "I'll stoke it up and see if we can't warm up your usual good spirits."|"If you'd be so kind." He waved a narrow hand towards the grate. "I have no energy for the cold this evening."}
{ not burn_papers:
     ~ stood_up = true
    I got to my feet, and scuttled a few more coals onto the embers of the fire. They took quickly and the room began to warm a little. A rogue spark jumped and landed on one of the many piles of papers lying about the room, and I quickly batted it down.
}
  + "You should tidy this place, Holmes."
        -> youShouldTidyThi 
  + "Why do you keep so many papers?"
        -> Room_full_of_paper 

= youShouldTidyThi
  ~ mischevious = mischevious + 1
  ~ tidy_up = true
"You should tidy this place, {burn_papers:at least | Holmes}. I should hardly wonder that our new clients might think we are living in a pawnshop or some dreadfully disorganised sorting house."
    -> Room_full_of_paper

==== Room_full_of_paper ====
{ stood_up:
    I resumed my seat, picking my way back through more bundles of hand-written pages.
}
{ not stood_up:
    Holmes resumed his seat, picking his way across the bundled stacks of manuscripts that littered the floor. 
}
{burn_papers:For such a methodical mind, |Our chambers were always filled with them:} my friend had a horror of destroying documents, especially those connected with past cases, and yet it was only once a year that he would muster the energy to docket and arrange them.
{ not tidy_up:
    "Why do you keep so many papers, Holmes?" I asked as I pulled the blanket back across my knees. "Surely you will never read them through."
}
# IMAGE: http://upload.wikimedia.org/wikipedia/commons/c/c2/Sherlock_Holmes_I.jpg
He smiled at me with mischievious eyes. "My dear boy," he answered. "I have not always had my biographer to tidy up after my work. Plenty of these documents are here to remind me of those many cases I tackled when I worked alone. But I do not need to read them to bring their contents to mind; the simple sight of the pages is enough to recall the details."
  + "But there are hundreds here."
        -> butThereAreHundr 
  + "Then you don't need to keep them."
        -> thenYouDontNeedT 

= butThereAreHundr
"But there are hundreds here," I replied. "You can't possibly remember them all, not in detail. Why," and I snatched at one nearby bundle, "this one here must be seventy pages of close writing. You cannot have it word for word."
    -> tellMeTheTitleHe

= thenYouDontNeedT
"Then you don't need to keep them," I {mischevious > 1:argued|reasoned} in return. "If you can recall their details."
"My dear Watson, I am employing Cicero's <em>method of loci</em>, only here, in my own space. I know every document in this room by how it looks and where it is. Where you see disorder, I see quite a serviceable index."
  + "We shall see about that."
        -> wellThenIReplied 
  + "Then that is quite a feat of memory."
        -> thenThatIsQuiteA 

= tellMeTheTitleHe
"Tell me the title," he replied, steepling his fingers.
  + Read it honestly
        -> ricolettiOfTheCl 
  + Invent something to infuriate him
        -> Attempted_Trick 

= wellThenIReplied
  ~ bold = bold + 1
"Well, then," I replied, lifting a document near by the foot of my chair. "Let us see about that." The bundle I had chosen was no less than seventy pages of close writing. "Why don't you tell me the tale of this case in my hand, word for word?"
    -> holmesLookedBack

= thenThatIsQuiteA
"Then that is quite a feat of memory," I replied, glancing around the many and various piles gathered on the desk and underneath it, and spreading across the floor like a forest fungus. {mischevious > 1:"Even for you."|"There's enough here to fill a small library."}
    -> Cant_expect

= ricolettiOfTheCl
  ~ mischevious = mischevious - 1
"Ricoletti of the club-foot," I announced, looking at the cover of the page. "Tell me, my dear Holmes, if you would - what comes next?"
    -> holmesLookedBack

= holmesLookedBack
Holmes looked back at me, but his eyes were lost in some distant, inner stare. "Ah, Ricoletti," he sighed. "That was a singular affair. The man had the most abominable wife; I should tell you the full details about it some time. But of course that document in your hand begins with the details of how I came by the case: from the mis-shaped footprints in the beds at Kew Gardens, which I discovered quite by chance. Then there was the sixpence buried a thumb's depth below the topsoil..."
  + "Enough." It is correct, of course.
        -> enoughIDropTheBu 
  + "Let me find another."
        -> letMeFindAnother 

= enoughIDropTheBu
  ~ mischevious = mischevious-1
"Enough." I drop the bundle to the carpet. "You are quite right."
    -> Cant_expect

= letMeFindAnother
"Let me find another, then. {mischevious > 1:That one was near the top of the pile and you will have seen it more frequently.|One bout of one is hardly enough to decide a contest.}"
    -> Cant_expect

==== Attempted_Trick ====
  ~ mischevious = mischevious + 1
  ~ lying_about_case = true
Although it pains me to say it, my friend's undeniably excellent mind and powers of deduction have always had, travelling alongside them, their sister quality of compulsion. There are few puzzles that Holmes did not find easy, even tedious in the extreme, but when presented with a challenge he was never capable of restraining himself. And he was usually successful, and very rapidly so. Therefore the opportunity to confound him was so rare - and hence so valuable - as to be difficult to pass by, despite it hardly being proper for a gentlemen to behave in such a way.
"Let me see," I began, readying my imagination for some cruelty. "This document is titled..."
  + "The Affair of the Chinese Tailor"
        -> theAffairOfTheCh 
  + "The Collapse of the Wessex Bridge"
        -> theCollapseOfThe 
  + "The Seven Italians"
        -> theSevenItalians 

= theSevenItalians
  ~ okay_attempt = true
"The Seven Italians." My eye had fallen on a stack of operas in the bookcase by the door to my room.
    -> holmesLookedUpAt

= theCollapseOfThe
  ~ wessex_bridge = true
"The Collapse of the Wessex Bridge."
    -> holmesLookedOver

= theAffairOfTheCh
  ~ okay_attempt = true
  ~ chinese_tailor = true
"The Affair of the Chinese Tailor."
    -> holmesLookedUpAt

= holmesLookedUpAt
Holmes looked up at me with a frown.
    -> reallyWatsonHeDe

= holmesLookedOver
Holmes looked over at me in a flash, eyes narrowed.
    -> reallyWatsonHeDe

= reallyWatsonHeDe
"Really, Watson," he declared {okay_attempt:with evident pleasure|severely}. "You give away your softness of spirit. If you were truly looking to make sport of me, you would choose {okay_attempt:a more commonplace name, the better to confound me|a less patently ridiculous name}."
  + "You are quite right."
        -> youAreQuiteRight 
  + "You do me a disservice."
        -> youDoMeADisservi 

= youDoMeADisservi
  ~ mischevious = mischevious + 1
"You do me a disservice," I protested, returning my eyes to the document in front of me. "I am telling you the name is as I read it, and if you cannot detail the case, then I believe I have won our little wager of a moment ago."
    -> itIsYouWhoDoesMe

= youAreQuiteRight
{ mischevious < 1:
     ~ mischevious = mischevious - 1
    "You are quite right," I sighed. "It was a feeble deception, and I beg that you forgive me."
}
    -> youAreQuiteRight1

= itIsYouWhoDoesMe
"It is <em>you</em> who does <em>me</em> a disservice," Holmes replied, quite sharply now. "My dear Watson,  <>
    -> Cant_expect.youCouldHardlyEx

= youAreQuiteRight1
{ not mischevious < 1:
    "You are quite right," I snapped, with irritation. "Damn you, Holmes, will you never be bested?"
}
    -> Cant_expect.iAmNoFreshYoungW

==== Cant_expect ====
"My dear Watson," Holmes answered {mischevious> 1:somewhat peevishly|sympathetically}, " <>
    -> youCouldHardlyEx

= youCouldHardlyEx
you could hardly expect me to forget the details of the cases that formed my introduction to my profession and the primary occupation of my life. For me to lose those details would be akin to you forgetting which bones make up the human hand, or the correct way to extract a bullet from a shoulder-wound. {wessex_bridge:Otherwise the Wessex Bridges of this world would have me taken in, wouldn't they?}"
  + {mischevious < 3} "I shouldn't doubt you."
        -> iShakeMyHeadAndM 
  + "But those details I have practised since."
        -> butThoseDetailsI 
  + {mischevious >= 3} "You are the most arrogant man alive."
        -> iDoBelieveHolmes 

= iShakeMyHeadAndM
  ~ mischevious = mischevious - 1
I shake my head and {mischevious < 2:laugh|harrumph with annoyance}. "Well, then, Holmes. I have learnt my lesson time and enough, and I suppose I will learn it again. You will not be bested on any matter, I see."
    -> iAmNoFreshYoungW

= iDoBelieveHolmes
  ~ bold = bold + 1
  ~ mischevious = mischevious + 1
"I do believe, Holmes, you are the most arrogant man alive," I told him severely, annoyed {lying_about_case:that my lie had gone so badly|with his ungentlemanly self-satisfaction}. "Will you never be bested?"
    -> iAmNoFreshYoungW

= butThoseDetailsI
"But those details I have practised since," I replied. "They are the tools of my trade. If you asked me instead to remember the face of each man I have treated when shot; well, then I should have a harder time of it."
    -> theExamplesDrawn

= iAmNoFreshYoungW
  ~ story_about_failures = true
"I am no fresh young whippersnapper," he replied, with equal {mischevious < 1:cool|animation}. "You must understand, Watson, I have been studying my subject - the subject of <em>people</em> - for a long time now. And I have not always been as proficient as I am now. Here."
    -> Gets_trunk

= theExamplesDrawn
"The examples drawn from previous cases are my tools{burn_papers: and that is why they must never be <em>burnt </em>like common newspaper, as you so carelessly suggested}," Holmes answered sternly. "A detective must always draw on experience, and reason. Without either of those, he cannot hope to succeed against that most imaginative and creative of beasts, the London criminal."
  + "Just as you say."
        -> justAsYouSayImSu 
  + "I'm sure I could find a case here you have forgotten."
        -> imQuiteSureICoul 

= imQuiteSureICoul
"I'm quite sure I could find a case here you have forgotten, all the same," I reply, somewhat petulantly, looking around the heaped mountains of manuscripts with a view towards choosing one particularly buried and particularly faded.
    -> butHolmesInterru

= justAsYouSayImSu
  ~ mischevious = mischevious-1
"Just as you say, I'm sure." I turned my attention to the fire, {mischevious > 1:somewhat stung|somewhat tired by his inexhaustible intellect}.
"My dear man, there's no need to be so down in the mouth. Here, I know what will interest you. Wait there a moment."  <>
    -> Gets_trunk

= butHolmesInterru
But Holmes interrupted my search. <>
"Do not trouble yourself with that," he remarked, getting to his feet. "Instead, let me interest you with the facts of a case I most certainly do remember. One moment."  <>
    -> Gets_trunk

==== Gets_trunk ====
And with a sudden burst of energy, quite unlike the state of lethargy in which he had been operating for the last few weeks, he disappeared into the bedroom, to return a moment later pulling a large tin box. 
{ more_coal and mischevious < 1:
    "I'm glad you put that extra coal in the grate, Watson," he remarked, rubbing his hands together. "Perfect for a tale such as this one." As he spoke, he slapped the top of the box with a palm.
}
  + "What is that?"
        -> whatIsThatIAsked 
  + "You intend to unpack that here, do you?"
        -> youIntendToUnpac 

= whatIsThatIAsked
"What is that?" I asked, leaning forward with interest. "Records of your early work?"
    -> andNotAllSuccess

= youIntendToUnpac
  ~ mischevious = mischevious + 1
"You intend to unpack that here, do you?" I remarked grudgingly. "Perhaps onto your own chair; it is the only free surface in the room."
    -> nowThenWatsonmis

= andNotAllSuccess
"And not all successes, either. Now here." 
    -> reachingIntoTheT

= nowThenWatsonmis
"Now then, Watson.{mischevious> 1:" His tone was severe; I had clearly irritated him with my sour mood. "} I would have expected my biographer to show more interest in a box filled with my early works. And this one in particular."
    -> reachingIntoTheT

= reachingIntoTheT
Reaching into the trunk he brought up a small wooden box with a sliding lid such as children's toys are kept in, and he offered it over to me.
{ chinese_tailor:
    "Tell me what you think of this. Nothing to do with Chinese tailors, mind," he added with a smile.
}
  + Take it from him
        -> iTookItFromHimIn 
  + Wave him to continue
        -> iAmQuiteComforta 

= iTookItFromHimIn
I took it from him, intrigued {mischevious > 1:despite my churlish state of mind}.
    -> wellThenHeDeclar

= iAmQuiteComforta
  ~ mischevious = mischevious + 1
"I am quite comfortable here," I replied, waving away the box. "Tell your story, if you must, but do not trouble me to get up from under my blanket."
    -> heLookedBackAtMe

= wellThenHeDeclar
  ~ watson_opens_box = true
"Well, then?" he declared, with {mischevious> 2: an air of combative stubbornness | childish excitement}. "Open it, and tell me what you make of the contents." Then he stepped back, grabbed a poker and pushed vigorously at the fresh coals {more_coal: I|he} had previously added, as if by helping them to kindle he was stoking my own enthusiasm for his adventure.
    -> iDidAsInstructed

= heLookedBackAtMe
He looked back at me with {mischevious > 1:a grave nod|some surprise at my cool attitude}. "Very well."  <>
Resuming his seat himself he began to unpack the box.  <>
    -> Open_Box

= iDidAsInstructed
I did as instructed and slid back the lid.  <>
    -> Open_Box

==== Open_Box ====
It contained a crumpled piece of paper, an old-fashioned brass key, a peg of wood with a ball of string attached to it, and three rusty discs of metal.
"Well, my boy?" {not watson_opens_box:  He tipped the box towards me|He waved a hand towards the box}.
  + "It is a curious collection."
        -> Examining_items.iNoddedSlightlyI 
  + "Some kind of game, perhaps?"
        -> someKindOfGameWa 
  + Examine the items
        -> Examining_items 

= someKindOfGameWa
"Some kind of game?" {watson_opens_box:Taking the string and peg from the box, I began attempting to thread the cord around the discs in some fashion.| I leant forward, the better to look into the box in Holmes' hand.}
"No game. Something of far more import, though you could not see it at first glance then, or now." 
    -> The_Musgrave_Ritual

==== Examining_items ====
{ number_examined == 0:
     ~ seen_items = true
    The items themselves did not seem outwardly curious: they were made strange only by their placement alongside each other.
}
  + {not examined_key} {not number_examined >= 3} Examine the key
        -> theKeyWasSimplyA 
  + {not examined_paper} Examine the paper
        -> thePaperWasMostC 
  + {not examined_peg} Examine the peg
        -> theWoodenPegAndS 
  + {number_examined >= 1} {not examined_discs} Examine the discs
        -> lessInterestingW 
  + {number_examined >= 2} "It is a curious collection, no doubt."
        -> iNoddedSlightlyI 

= theKeyWasSimplyA
  ~ examined_key = true
  ~ number_examined = number_examined + 1
The key was simply a key, of no great importance. I am sure Holmes himself could have learnt no more from its shape or size.
    -> Examining_items

= thePaperWasMostC
  ~ examined_paper = true
  ~ number_examined = number_examined + 1
The paper was most curious. Smoothing it out, I read a serious of questions and answers, like some kind of rhyme. Looking up at Holmes to ask him what it meant, he smiled, and waved my question away.
    -> inGoodTimeWatson

= theWoodenPegAndS
  ~ examined_peg = true
  ~ number_examined = number_examined + 1
The wooden peg and string was a curious, home-made contraption. Intended for measuring out a distance, perhaps?
    -> Examining_items

= iNoddedSlightlyI
I nodded slightly. "It is a curious collection{number_examined > 1:, no doubt}."
    -> veryCuriousAndTh

= lessInterestingW
  ~ examined_discs = true
  ~ number_examined = number_examined + 1
Less interesting were the discs. They were too heavily rusted to be examined more closely, but could perhaps once have been coins.
    -> Examining_items

= veryCuriousAndTh
"Very curious, and the story that hangs round it will strike you as being more curious still."
  + "These relics have a history?"
        -> theseRelicsHaveA 
  + "Very well, let's have it."
        -> veryWellThenLets 

= inGoodTimeWatson
"In good time, Watson. In good time."
    -> Examining_items

= theseRelicsHaveA
"These relics have a history, then?"
    -> soMuchSoMyDearWa

= veryWellThenLets
  ~ mischevious = mischevious + 1
"Very well, then. Let's have it."
    -> The_Musgrave_Ritual

= soMuchSoMyDearWa
"So much so, my dear Watson, that they <em>are</em> a history."
"What do you mean by that?"
    -> The_Musgrave_Ritual

==== The_Musgrave_Ritual ====
Sherlock Holmes {watson_opens_box:reached over and} lifted the items out of the box one by one, laying them along the edge of the table. Then he reseated himself in his chair and looked them over with a gleam of satisfaction in his eyes.
# IMAGE: http://upload.wikimedia.org/wikipedia/commons/2/29/Sherlock_rose_Naval_Treaty.JPG
"These," quoth he, "are all that I have left to remind me of the adventure of the Musgrave Ritual."
  + "Tell me more."
        -> tellMeMoreIDeman 
  + {mischevious > 1} "I can't see why you asked me my opinion."
        -> thenICantSeeWhyY 
  + {not mischevious > 1} "I have no idea what that means."
        -> iHaveNoIdeaWhatT 

= iHaveNoIdeaWhatT
"I have no idea what that means," I complained.
    -> andTheresNoReaso

= thenICantSeeWhyY
"Then I can't see why you asked me my opinion, since I have no idea what this Musgrave Ritual of yours is."
    -> holmesNodsQuiteR

= tellMeMoreIDeman
  ~ mischevious = mischevious -1
"Tell me more," I demanded, leaning forward with sudden interest.
    -> itWouldBeAPleasu

= holmesNodsQuiteR
Holmes nods. "Quite right.  <>
    -> forgiveMyTheatri

= itWouldBeAPleasu
"It would be a pleasure," Holmes replied, spreading his hands to the fire.  <>
    -> whenIFirstCameUp

= andTheresNoReaso
"And there's no reason why you should, Watson.  <>
    -> forgiveMyTheatri

= whenIFirstCameUp
"When I first came up to London I had rooms in Montague Street, just round the corner from the British Museum, and there I waited, filling in my too abundant leisure time by studying all those branches of science which might make me more efficient. Now and again cases came my way, and that of the Musgrave Ritual was one such case, and it is to that singular chain of events that I trace my first stride towards the position which I now hold."
  + "Tell me: how did the case begin?"
        -> tellMeHowDidTheC 
  + "A case of importance, then?"
        -> aCaseOfImportanc 

= forgiveMyTheatri
{ not mischevious > 1:
    Forgive my theatrical presentation. I will begin my tale.
}
    -> youreInASorryMoo

= tellMeHowDidTheC
"Tell me: how did the case begin?"
    -> reginaldMusgrave

= youreInASorryMoo
{ mischevious > 1:
    You're in a sorry mood this evening, aren't you, my good man? Well, perhaps you're lacking for mental exercise. Let's see if we can't warm you up a little. Here is my tale: let's see what you make of it, shall we?
}
    -> whenIFirstCameUp

= aCaseOfImportanc
"A case of importance, then?"
  ~ known_from_college = true
"A case with large issues at stake, certainly, although I didn't know that to begin with. At first, I thought nothing more than that I was seeing an old friend from college. Reginald Musgrave, an aristocratic fellow and a scion of one of the very oldest families in the kingdom, established in the Manor House of Hurlstone,  <>
    -> perhapsTheOldest

= reginaldMusgrave
"Reginald Musgrave," Holmes announced. "A man of exceedingly aristocratic type, thin, high-nosed and large-eyed, with languid and yet courtly matters. He was a scion of one of the very oldest families in the kingdom, though his branch was a cadet one which had separated from the northern Musgraves some time in the sixteenth century and had established itself in the Manor House of Hurlstone,  <>
    -> perhapsTheOldest

= perhapsTheOldest
perhaps the oldest inhabited building in the country."
  + "You visited him?"
        -> youVisitedHimInH 
  + "He came to see you."
        -> heCameToSeeYou 

= youVisitedHimInH
"You visited him? In his house?"
    -> youWouldHaveThou

= heCameToSeeYou
"He came to see you."
    -> indeedWatsonQuit

= youWouldHaveThou
"You would have thought so, for a man like that. But no: no, if you consider the matter, there would have been no cause in my life to occasion such a visit. So in fact, it was he came to see me.
    -> iKnowItYourHabit

= indeedWatsonQuit
"Indeed, Watson, quite correct. I had {not known_from_college:known him at college, but } not seen him in four years. And then he came to see me. <>
    -> Entered_room

= iKnowItYourHabit
"I know it your habit to begin tales with the weather and setting - 'It was a hot summer's day...' or 'It was a long autumn morning.' Well, I cannot remember the detail and I will refrain from inventing it. Let us simply say this.  <>
    -> Entered_room

==== Entered_room ====
He walked into my room in Montague Street. He had changed little from the way I remembered him, and was dressed like a young man of fashion - he was always something of a dandy. He preserved the same quiet, suave manner which had formerly distinguished him."
  + "You shook his hand."
        -> youShookHisHand 
  + "You knew why he was there, of course."
        -> youKnewWhyHeWasT 

= youKnewWhyHeWasT
"You knew why he was there, of course, as soon as he entered the room."
    -> noNoNotAtAllHolm

= youShookHisHand
"You shook his hand."
    -> iDidStoodUpFromM

= noNoNotAtAllHolm
"No. No, not at all." Holmes laughed. "This was early in my career and my skills of deduction were still very much being formed.  <>
    -> iWasSurprisedToS

= iDidStoodUpFromM
"I did. Stood up from my chair and welcomed him in. 'How has all gone with you, Musgrave?' I asked.
    -> heOnlyShookHisHe

= iWasSurprisedToS
I was surprised to see him, certainly, and asked after his health. The man looked quite uncertain at the question. 
    -> youHaveProbablyH

= heOnlyShookHisHe
"He only shook his head.
    -> youHaveProbablyH

= youHaveProbablyH
"'You have probably heard of my poor father's death,' quoth he; 'he was carried off about two years ago. Since then I have of course had the Hurlstone estate to manage, and as I am member for my district as well, my life has been a busy one. But... well, Sherlock, we have had some very strange doings at Hurlstone, and the police have been able to throw no light upon the matter.'"
  + "Ah. Now this sounds more like it."
        -> ahNowThisSoundsM 
  + "Go on. I want the facts."
        -> goOnHolmesIUrged 

= goOnHolmesIUrged
  ~ impatient = impatient + 1
"Go on, Holmes," I urged. "I want the facts of it, and to see how these trinkets of yours fit together."
    -> inGoodTimeMyGood

= ahNowThisSoundsM
"Ah. Now this sounds more like it." Going over to the sideboard I poured us both a short tot of brandy to sip by the firelight as we spoke. Holmes accepted his indifferently; he was lost in the telling of his tale.
"You can imagine, Watson, with what eagerness I answered him. In my heart, I already believed I could succeed where others had failed, and here, at last, was the opportunity to test myself. <>
    -> The_details

= inGoodTimeMyGood
"In good time, my good man," Holmes chided. "Though I will be honest, my question to Musgrave was quite the same. <>
    -> The_details

==== The_details ====
'Pray let me have the details,'" I cried.
"Reginald Musgrave sat down opposite me, almost as you are sitting now, and lit a cigarette to begin his tale."
  + Part Two: A Tale is Told
        -> Part_Two 

==== Part_Two ====
<em>To be continued...</em><strong></strong>
    -> END