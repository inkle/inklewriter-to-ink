// ---- The Intercept ----
// Converted from original URL:
// http://writer.inklestudios.com/stories/theintercept
# title: The Intercept
# author: Jon Ingold
// -----------------------------

VAR evasive = 0
VAR forceful = 0
VAR teacup = false
VAR rudely_awakened = false
VAR drunk_tea = false
VAR talking_to_only_you = false
VAR hooper = false
VAR missing_reel_described = false
VAR admit_theft = false
VAR admit_blackmail = false
VAR lost_temper = false
VAR claim_saw = false
VAR got_hooper_in_custody = false
VAR put_me_in = false
VAR shouted = false
VAR chess_clue = false
VAR clue_to_hut_2_given = false
VAR try_window = false
VAR try_door = false
VAR heard_hooper = false
VAR listened = false
VAR using_a_bucket = false
VAR using_a_shoe = false
VAR using_something_loop = false
VAR looked_at_bucket = false
VAR looked_at_bunk = false
VAR looked_at_pillow = false
VAR looked_at_frame = false
VAR pause_a_moment = false
VAR with_capn = false
VAR no_traitor = false
VAR revealed_hooper_as_culprit = false
VAR piece_returned = false
VAR smashed_glass = false
VAR muddy_shoes = false
VAR got_component = false
VAR considered_escape = false
VAR hoopers_dorm = false
VAR put_component_in_tent = false
VAR thrown_component_away = false
VAR framed_hooper = false
VAR devil_of_a_night = false
VAR clue = false
VAR morning_in_barrack = false
VAR harris_bluff = false
VAR hooper_failed_clue = false
VAR secret_clue = false
VAR suggest_hut_2 = false
VAR admit_young_man = false
VAR brazen = false
VAR long_grass_hooper_frame = false
VAR too_complex = false

-> Intro


==== Intro ====
They have me waiting here. I can hear the guards outside and the door is locked. I don't even have a pen, so I can't do any work. I've got a copy of the morning's intercept in my pocket but just staring at the jumble of letters won't do any good, it would only drive me mad. 
I  rattle my fingers on the field table.
+ Wait -> theyThinkImATrai

= theyThinkImATrai
They think I'm a traitor. They think /=I=/ stole the component from the calculating machine. They're searching my bunk, my bag, the whole barrack right now. Then they'll come back and demand that I talk.
I'm a problem-solver. Good with figures, quick with crosswords, excellent at chess. But in this situation - in this trap - what is the winning play?
+ Co-operate -> cooperationIsThe
+ Dissemble -> thisBattleWillBe
+ Divert -> avoidanceAndDela

= avoidanceAndDela
Avoidance and delay, perhaps? The military machine never fights on a single front. They will have other approaches in play. If I move slowly enough, perhaps the situation will resolve itself some other way with my reputation reasonably intact.
    -> perhapsInFactThe

= cooperationIsThe
Co-operation is the only sensible approach. Anything else will be seen through and will increase their suspicion, and risk contradiction with myself or whatever other sources they might have. I must be transparent, open - and hope they do not ask any questions I do not want to answer.
    -> theyGiveMeTimeEn

= thisBattleWillBe
This battle will be one of misinformation, just as the war raging in Europe and over British skies is more one of plans and messages and interceptions than it is of bullets, guns and planes. My only hope is create a story they prefer to the truth.
    -> theyLeaveMePlent

= theyGiveMeTimeEn
They give me time enough to prepare what those questions might be.  <>
    -> halfAnHourGoesBy

= perhapsInFactThe
Perhaps, in fact, they are playing the same game.  <>
    -> halfAnHourGoesBy

= theyLeaveMePlent
They leave me plenty of time to lay my plans.  <>
    -> halfAnHourGoesBy

= halfAnHourGoesBy
Half an hour goes by before Commander Harris returns to the hut. He seems careful to leave the door open only for a moment, as if worried a loose word or two might slip inside. 
He's brought two cups of tea in metal mugs: he sets them down on the tabletop between us.
"Well then," he begins, a little awkwardly. This is an unseemly situation, it would be appear. He pushes one cup halfway towards me. A small gesture of friendship. Is that enough to give me some hope?
+ Take it -> iTakeTheCupAndRa
+ Don't take it -> iDontTakeItImNot

= iTakeTheCupAndRa
I take the cup, and raise it to my lips, blowing away the steam. It is too hot to drink. He picks his own up and just holds it.
    -> Difficult

= iDontTakeItImNot
I don't take it. I'm not having my time wasted by signs and signals. I've been waiting here for long enough already, after being rudely pulled from my bunk. I touch a fingertip down on the table and look him in the eye.
"What's going on, Harris?"
    -> Difficult

==== Difficult ====
"Quite a difficult situation, this," he begins, cautiously. I've seen him adopting this stiff tone of voice before, but only when talking to brass. "I'm sure you agree."
+ Agree -> awkwardIReply
+ Disagree -> iDontSeeWhyIRepl
+ Lie -> iDontSeeWhyIRepl
+ Evade -> imSureYouveHandl

= iDontSeeWhyIRepl
"I don't see why," I reply,  <>
    -> sippingAtMyTeaAs

= imSureYouveHandl
"I'm sure you've handled worse," I reply casually,  <>
    -> sippingAtMyTeaAs

= awkwardIReply
"Awkward," I reply,  <>
    -> sippingAtMyTeaAs

= sippingAtMyTeaAs
sipping at my tea as if we were the best of friends.
looking him straight in the eye.
His gaze is unexpressive: I've seen Harris broad and full of laughter, but today he is rigid, as much part of the military machine as the devices in Hut 5. 

==== Why_youre_here ====
"I'm sorry to pull you up so roughly," <>
"There really isn't any time to be wasted," <>
 he says. "But you know why you're here, of course."
+ Yes -> ofCourseIDoIAnsw
+ No -> noIDontIveGotWor
+ Evade -> hereAtBletchleyO
+ Lie -> noIDontIveGotWor

= hereAtBletchleyO
"Here at Bletchley? Of course I do {forceful < 0:...}"
    -> hereNowHarrisRep

= ofCourseIDoIAnsw
"Of course I do," I answer. 
    -> Missing_Reel

= noIDontIveGotWor
"No, I don't. I've got work I should be doing tomorrow, and I need my rest..."
"Work that will be difficult for you to do, don't you think?" Harris replies. 
    -> theyllHaveMadeAR

= hereNowHarrisRep
"Here, now," Harris replies firmly. "We're not talking to everyone, you understand. I can imagine you might feel pretty sore about that, old man. I can imagine you feeling picked on. {forceful< 0:You always were a sensitive soul.}"
+ "I'm fine." -> imFineIReplyThis
+ "Damn right." -> Im_sore
+ Be honest -> Im_sore
+ Lie -> imFineIReplyThis

= imFineIReplyThis
"I'm fine," I reply. "This is all some misunderstanding and the quicker we have it cleared up the better."
    -> iCouldntAgreeMor

= theyllHaveMadeAR
"They'll have made a replacement by tomorrow," I reply. "The war doesn't stop over one missing reel."
    -> Missing_Reel

= iCouldntAgreeMor
"I couldn't agree more." And then he comes right out with it, with an accusation.  <>
    -> Missing_Reel.letsGetStraightT

==== Im_sore ====
"Damn right I'm sore. Was it one of the others who put you up to this? Was it Hooper? He's always been jealous of me. He's..."
    -> Admitting_Nothing.theCommanderMous

==== Admitting_Nothing ====
"I don't know what gives you the right to pick on me. {forceful > 0:I demand a lawyer.|Shouldn't I have a lawyer?}"
    -> thisIsTimeOfWarH

= theCommanderMous
The Commander moustache bristles as he purses his lips. "Has he now? Of your achievements, do you think?"  <>
    -> itsDifficultNotT

= thisIsTimeOfWarH
"This is time of war," Harris answers. His tone of voice has fallen down into darkness. "And by God, if I have to shoot you to recover the component or stop it falling into the wrong hands, I will, do you understand me?"
There's an icy silence. {forceful> 2:I've cracked him a little at least.} He's angry{evasive > 2: at my slippery answers}. He waves an impetuous hand across the field table.
    -> Drink_tea_and_talk

= itsDifficultNotT
It's difficult not to shake the sense that he's mocking me.  <>
It's difficult not to shake the sense that he's humouring me. 
"Or of your brain? Or something else?"
+ "Of my genius." -> ofMyGeniusHooper
+ "Of my standing." -> ofMyStandingMyRe
+ Evade -> howShouldIKnowIR

= howShouldIKnowIR
"How should I know?" I reply, defensively. {teacup:I set the teacup back on the table.}  <>
    -> Looking_for_holes

= ofMyGeniusHooper
"Of my genius. Hooper simply can't stand that I'm cleverer than he is. We work so closely together, cooped up in that Hut all day. It drives him to distraction. To worse."
    -> youreSuggestingH

= ofMyStandingMyRe
"Of my standing. My reputation." {forceful > 0:I'm aware of how arrogant I must sound but I plough on all the same.|I don't like to talk of myself like this, but I carry on all the same.} "Hooper simply can't bear knowing that, once all this is over, I'll be the one receiving the knighthood and he..."
"No-one will be getting a knighthood if the Germans invade," Harris answers sharply. He casts a quick eye to the door of the Hut to check the latch is still down, then continues in more of a murmur: "Not you and not Hooper. Now answer me."  <>
    -> forTheFirstTimeS

= youreSuggestingH
"You're suggesting Hooper would sabotage this country's future simply to spite you?" Harris chooses his words like the military man he is, each lining up to create a ring around me.
+ Yes -> forcefulHesPetty
+ No -> noForcefulofCour
+ Evade -> iDontKnowWhatImS

= iDontKnowWhatImS
"I don't know what I'm suggesting. I don't understand what's going on."
    -> butOfCourseYouDo

= forcefulHesPetty
"{forceful > 0:He's petty enough, certainly|I wouldn't put it past him}. He's a creep." {teacup: I set the teacup down.|I wipe a hand across my forehead.} <>
    -> Looking_for_holes

= forTheFirstTimeS
For the first time since the door closed, I wonder what the threat might be if I do /=not=/. 
    -> Missing_Reel.letsGetStraightT

= noForcefulofCour
"No, {forceful>0:of course not|I suppose not}." { teacup:I put the teacup back down on the table|I push the teacup around on its base}.  <>
    -> Looking_for_holes

= butOfCourseYouDo
"But of course you do." Harris narrows his eyes.  <>
    -> Missing_Reel.letsGetStraightT

==== Looking_for_holes ====
"All I can say is, ever since I arrived here, he's been looking to ways to bring me down a peg. I wouldn't be surprised if he set this whole affair up just to have me court-martialled."
"We don't court-martial civilians," Harris replies. "Traitors are simply hung at her Majesty's pleasure."
+ "Quite right." -> quiteRightIAnswe
+ "I'm no traitor." -> imNoTraitorIAnsw
+ Lie -> imNoTraitorIAnsw

= quiteRightIAnswe
"Quite right," I answer smartly.
    -> heStaresBackAtMe

= imNoTraitorIAnsw
"I'm no traitor," I answer smartly.
"For God's sake," I answer, voice quivering. "I'm no traitor."
    -> heStaresBackAtMe

= heStaresBackAtMe
He stares back at me.  <>
    -> Missing_Reel.letsGetStraightT

==== Missing_Reel ====
The reel went missing from the Bombe this afternoon. The four of us were in the Hut at the time, working on the latest intercept. It was Russell who noticed the machine producing strange results and found the gap in its plugboard. But as to who took it - it could have been any of us. 
And indeed, it /=must=/ have been. The machine had been functioning as normal when we began our calculations. And then, a short few hours later, it was gone. We had to stop. There was nothing more we could do until it was replaced. The part was vital, just as the machine was vital, and so were the contents of the message, still unread twenty four hours later.
    -> letsGetStraightT

= letsGetStraightT
"Let's get straight to the point. Do you have the component?" Harris demands. {forceful > 3:He is sweating slightly - of course: this is his command that's on the line.} "Do you know where it is?"
+ "I do." -> yes
+ "I don't." -> noIHaveNoIdea
+ Lie -> noIHaveNoIdea
+ Evade -> theComponent

= theComponent
"The component?"
    -> yesHarrisReplies

= yes
"Yes."
    -> Admitting_Something

= noIHaveNoIdea
"No. I have no idea."
    -> hesTalkingAboutT

= hesTalkingAboutT
He's talking about the missing reel from the Bombe. Russell discovered it this afternoon when the machine began producing strange results. We were all in the Hut when it happened and it had been in place when we sat down to work. The conclusions had been obvious to all four of us immediately, but had gone undiscussed, even after the empty socket was located, the wiring torn on either side.
    -> luckyTheseThings

= yesHarrisReplies
"Yes," Harris replies levelly. "The component{not missing reel described: that went missing this afternoon. I doubt that you've forgotten}."
"Well, as soon as it went missing the machine started to malfunction. We recognised the discrepancies in our results straight away..."
    -> hesTalkingAboutT

= luckyTheseThings
"Lucky these things are easy to replace," Russell had remarked, and that had been that. We had stopped work, sent out for a new part to be machined. And drunk our tea and watched each other.
"Come now," Harris says, quite the reasonable gent. "{talking to only you:As I told you. We're not interviewing everyone. Only you. So.} I think you can be a little more forthcoming."
+ "I know nothing." -> iKnowNothingAbou
+ "I know where it is." -> iKnowWhereItIs
+ Lie -> iKnowNothingAbou
+ Evade -> Admitting_Nothing

= iKnowNothingAbou
"I know nothing about it." My voice is shaking {forceful > 0:with anger} as I try to speak. I'm not accustomed to facing off against the Commander - against any man with a gun in his holster.  <>
    -> Admitting_Nothing

= iKnowWhereItIs
"I know where it is."
    -> Admitting_Something

==== Drink_tea_and_talk ====
"Now, drink your tea and talk."
+ Take the cup -> iLiftTheCupTeacu
+ Drink -> iLiftTheCupTeacu
+ Put the cup down -> iSetTheCupCarefu
+ Don't take the cup -> iLeaveTheCupExac

= iLeaveTheCupExac
I leave the cup exactly where it is.  <>
    -> whyIAskColdlyWha

= iSetTheCupCarefu
I set the cup carefully down on the table once more. <>
    -> whyIAskColdlyWha

= iLiftTheCupTeacu
I lift the cup {teacup:to my lips} and take a sip, {forceful > 1: staring him hard in the eye as I do so|trying to act natural}. He watches as I do so.
    -> lapsangSouchongH

= whyIAskColdlyWha
"Why?" I ask coldly. "What's in it?"
    -> lapsangSouchongH

= lapsangSouchongH
"Lapsang Souchong," he remarks, placing his own cup down on the table with a clink. "Such a curious flavour. It might almost not be tea at all. You might say it hides a multitude of sins. As do you, isn't that correct?"
+ Agree -> Regrets
+ Disagree -> iOpenMyMouthToDi
+ Evade -> iOpenMyMouthToDi
+ Disagree -> iveDoneNothingTh
+ Evade -> noneOfUsAreBlame

= noneOfUsAreBlame
"None of us are blameless, Harris. {forceful > 1:But you're not my priest and I'm not yours|But I've done nothing to deserve this treatment}. Now, please. Let me go. I'll help you find this damn component, of course I will." 
    -> Who_do_you_blame

= iOpenMyMouthToDi
I open my mouth to disagree, but somehow the words will not come out. It is like Harris has taken a screwdriver to the sides of my jaw. My tongue feels thick and heavy.
    -> Regrets

= iveDoneNothingTh
"I've done nothing that I'm ashamed of."
    -> Who_do_you_blame.tellMeThenHeAsks

==== Who_do_you_blame ====
He appears to consider the offer. 
    -> tellMeThenHeAsks

= tellMeThenHeAsks
"Tell me, then," he asks. "What's your theory? You're a smart fellow - as smart as they come around here, and that's saying something. What's your opinion on the missing component? Accident, perhaps? Or do you blame one of the other men? {hooper:Hooper?}"
+ Blame no-one -> anAccidentNatura
+ Blame someone -> Blame_Hooper

= anAccidentNatura
"An accident, naturally." I risk a smile. "That damned machine, Harris; it's made from spare parts and string. Even these huts leak when it rains. It wouldn't take more than one fellow to trip over a cable to shake out a component and have it roll away across the floor. Have you tried looking under the thing?"
Harris doesn't smile. "Do you suppose we haven't? Do you supposed we haven't combed every inch of this place already?"
In a sudden moment I understand that his reply is a threat. 
"Now," he continues. "Are you sure there isn't anything you want to tell me?"
+ Tell him -> allRightWithASig
+ Evade -> onlyThatThisProc

= allRightWithASig
"All right." With a sigh, your defiance collapses. "If you're searched my things then I suppose you've found {evasive > 1:... what you need|my letters. Haven't you? In fact, if you haven't, don't tell me}.
    -> harrisNodsOnce

= onlyThatThisProc
"Only that this process is unreasonable, and I believe you're behaving like a swine."
    -> Loses_temper

= harrisNodsOnce
Harris nods once.  <>
    -> Evidence.iveSeenTheSameSt

==== Loses_temper ====
"You imbecile," Harris replies, with sudden force. He is half out of his chair. "You know the situation as well as I do, so why all this fencing? The Hun are poised like rats, ready to run all over this country. They'll destroy everything, you do understand that, don't you? You're not so locked up inside your crossword puzzles that you don't see that, are you? And this machine we have here - you men - you are the best and only hope this country has. God help her."
I sit back, startled by the force of his outburst. His carefully sculpted expression has curled to angry disgust and there is spit flecking his lips. /=He really does hate me=/, I think. /=He'll have my neck just for the taste of it.=/
+ Calm him -> nowSteadyOnIRepl
+ Oppose him -> iCanImagineHowBe
+ Dismiss him -> thenIllBeGoingOn

= thenIllBeGoingOn
"Then I'll be going, on and getting on with my job of saving her, shall I?" I even rise half to my feet, before he slams the tabletop.
    -> talkHarrisDemand

= iCanImagineHowBe
"I can imagine how being surrounded by clever men is pretty threatening for you, Commander," I reply with a sneer. "They don't train you to think in the Armed Forces."
    -> talkHarrisDemand

= nowSteadyOnIRepl
"Now steady on," I reply, gesturing for him to calm himself.
    -> talkHarrisDemand

= talkHarrisDemand
"Talk," Harris demands. "Talk, now. Tell me where you've hidden it or who you've passed it to. Or God help me, but I'll take your wretched /=pansy=/ body to pieces looking for it, do you understand me?"
    -> hisEyesBoreIntoM

= hisEyesBoreIntoM
His eyes bore into me like drill-bits.
+ Tell him -> youWantMeToTellY
+ Blame someone -> Blame_Hooper
+ Blame someone -> iHaveInMyHeadToB

= iHaveInMyHeadToB
I have in my head to blame Hooper, but somehow I cannot find a way to tell the story. Whatever they put in my tea, it has control of my tongue. {forceful>1: Fighting as hard as I can, it does no good.} I find myself collapsing, desperate to tell him everything, almost weeping with the shame of it.
    -> Explain_Story

= youWantMeToTellY
"You want me to tell you what happened? You'll be disgusted, I'm quite sure."
"All right. I'll tell you what happened." And never mind my shame, I think.
"I can imagine how it starts," he growls.
    -> Explain_Story

==== Regrets ====
"I suppose so," I reply. "I've certainly done things I regret. Things I shouldn't have done." 
    -> Open_to_Blackmail

==== Evidence ====
"It's simple enough," Harris replies.  <>
    -> iveSeenTheSameSt

= iveSeenTheSameSt
"I've seen the same story a hundred times before," he says. "A young man like yourself - clever, somewhat removed from the world. The kind that doesn't go to parties, you might say. Who takes himself a little too seriously, perhaps. Takes things too far. Further than a man should allow a thing to go. That's the story, isn't it? You took things too far, and then you couldn't take them back. And now they have you."
+ Agree -> whatCouldIDoImSh
+ Disagree -> itsNotThatBadICa
+ Lie -> iAlwaysMeantToTe

= iAlwaysMeantToTe
"I always meant to tell you," I tell him. "I thought perhaps I could find out who they were. Lead you to them."
    -> harrisLooksAtMeW1

= whatCouldIDoImSh
"What could I do?" I'm shaking now. The night is cold and the heat-lamp in this hut has been removed, presumably to keep me alert and on edge. "{forceful> 2:I won't|I don't want to} go to prison."
    -> youCommittedACri

= itsNotThatBadICa
"It's not that bad. I can still fix it."
    -> harrisShakesHisH2

= youCommittedACri
"You committed a crime," Harris answers.  <>
    -> ifIHadAnySenseTh

= harrisLooksAtMeW1
Harris looks at me with contempt. "You wretched little man. Don't think your tongue will be able to get you out of trouble. You're going to pay for what you've done, and you're going to pay dearly. If a single man loses his life because of your pride and your perversions then God help your eternal soul. The fact is you committed a crime."  <>
    -> ifIHadAnySenseTh

= harrisShakesHisH2
Harris shakes his head. "This isn't a problem to be cracked. This isn't a puzzle. I'm sorry, but this is bigger than you now. Look. You can go to prison for what you've done, or we can change your identity and move you somewhere where your... indiscretions... can't hurt anyone any more. But right now none of that matters. What happens to you, doesn't matter. All that matters is where that component is.  <>
    -> soIdLikeYouToTel

= soIdLikeYouToTel
So I'd like you to tell me, now. Where is it?"
    -> Loses_temper.hisEyesBoreIntoM

= ifIHadAnySenseTh
If I had any sense that he understood my predicament, and that he felt for my state of being, it collapses like a chain with a broken link. "You thought you could repair it with another, more serious crime?" He shakes his head. "I thought you men were supposed to be clever. But this is the action of a frightened woman.  <>
    -> soIdLikeYouToTel

==== Admitting_Something ====
Harris stares back at me. {evasive = 0:He cannot have expected it to be so easy to break me.}
Harris smiles with satisfaction, as if your willingness to talk was somehow a result of his clever techniques.
"I see." There's a long pause, like the endless delay between feeding in a line of cypher to the Bombe and waiting for its valves and cylinders to heat up enough to being processing. "Would you like to explain?"
+ Explain -> iPauseAMomentTry
+ Don't explain -> theresNothingToE
+ Lie -> Blame_Hooper
+ Evade -> explainWhatYouSh
+ Say nothing -> iFoldMyArmsInten

= iFoldMyArmsInten
I fold my arms, intended firmly to say nothing. But somehow, watching Harris' face, I cannot bring myself to do it. I want to confess. I want to tell him everything I can, to explain myself to him, to earn his forgiveness. The sensation is so strong my will is powerless in the face of it. 
    -> somethingIsWrong

= iPauseAMomentTry
I pause a moment, trying to choose my words. To just come out and say it, after a lifetime of hiding... I wouldn't know how. To put it into words, bluntly and directly: that is a circle I cannot square.
    -> iveDoneThingsIBe

= theresNothingToE
"There's nothing to explain," I reply stiffly.  <>
    -> iKnowWhereYourCo

= explainWhatYouSh
"Explain what you should be doing, do you mean, rather than bullying me? Certainly." I fold my arms.  <>
    -> iKnowWhereYourCo

= somethingIsWrong
Something is wrong with me, I am sure of it. There is a strange, bitter flavour on my tongue. I taste it as words start to form.
    -> iveDoneThingsIBe

= iKnowWhereYourCo
"I know where your component is because it's obvious where your component is. That doesn't mean I took it, just because I can figure out a simple problem, any more than it means I'm a German spy because I can crack their codes."
    -> Who_do_you_blame.tellMeThenHeAsks

= iveDoneThingsIBe
"I've done things," I begin, uncomfortably. "I didn't want to. I tried not to. But in the end, you understand. I had to. It felt like cutting off my own arm not to. Things I know I shouldn't have. Things I perhaps regret."
    -> Open_to_Blackmail

==== Blame_Hooper ====
"I saw Hooper take it."
"Did you?" The worst of his rage is passing; he is now moving into a kind of contemptuous despair. I can imagine him wrapping up our interview soon, leaving the hut, locking the door, and dropping the key down the well in the yard. And why wouldn't he? With my name tarnished they will not let me back to work on the Bombe - if there is the slightest smell of treachery about my name I would be lucky not be locked up for the remainder of the war. <>
"I see." He is starting to lose his temper - I can see it in the creases of his face. I have seen Harris angry a few times, with lackeys and secretaries and the like, usually over things sent late or incorrectly. But never with us. With the "brains" he has always been so cautious, treating us like children. And now I see that, like a father, he wants only to smack us when we disobey him. <>
"I wish you'd stop with your deceptions and get to the truth, man. Every /=minute=/ matters."
+ Persist with this -> iDidIKnowWhatYou
+ Tell the truth -> veryWellISeeTher
+ Persist with this -> iDid

= iDid
"I did."
    -> iHaveBecomeSomeh

= veryWellISeeTher
"Very well. I see there's no point in covering up. You know everything anyway."
    -> harrisNodsAndWai

= iDidIKnowWhatYou
"I did. I know what you're thinking. If I've transgressed once then I must be the guilty man for all the crimes in this compound... But I'm not, I tell you. We were close to cracking the 13th's missive; trying our latest pattern and beginning to see some correlations in the data - and then Hooper disappeared for a moment and the machine went down."
    -> iHaveBecomeSomeh

= iHaveBecomeSomeh
I have become, somehow, an accustomed liar - the words roll easily off my tongue. /=Perhaps I am a traitor=/, I think, /=now that I dissemble as easily as one.=/
    -> goOnHarrisSaysGi

= harrisNodsAndWai
Harris nods, and waits for me to continue.
    -> Explain_Story

= goOnHarrisSaysGi
"Go on," Harris says, giving me no indication of whether he believes my tale./==/
+ "I saw him take it." -> iSawHimTakeItIRe
+ "It couldn't have been anyone else." -> atTheMomentWhenT

= atTheMomentWhenT
"At the moment when the machine halted, Peterson and Jefferies were by the work-table, Collins and Humph were out having a smoke. I was by the front of the machine checking over the dip-switches. Hooper was the only one around the back of the Bombe. No-one else could have done it."
    -> thatsNotQuiteThe

= iSawHimTakeItIRe
"I saw him take it," I reply, stubbornly. "Collins and Humph were outside having a cigarette, I think. The other two men were at the table. But I was at the front of the machine. I saw Hooper go around the side, and lean down, and pull something free. I even challenged him on it. I said, 'What's that? Someone put a nail through somewhere they shouldn't have?' He didn't reply."
    -> weAreLeftWithTwo

= thatsNotQuiteThe
"That's not quite the same as seeing him do it," Harris remarks.
+ "When you have eliminated the impossible..." -> whenYouHaveElimi
+ "You have to believe me." -> weDontHaveToBeli
+ "Ask the others." -> askTheOthersIRep

= weAreLeftWithTwo
"We are left with two possibilities, quite clearly. You, or Hooper." The Commander pauses to smooth down his moustache.  <>
    -> hoopersInHutWith

= whenYouHaveElimi
"When you have eliminated the impossible..." I begin, but Harris cuts me off.
    -> weAreLeftWithTwo

= hoopersInHutWith
"Hooper's in Hut 3 with the Captain, having a similar conversation."
+ "And the other men?" -> andTheOtherMenDo
+ "Then you know I'm right." -> thenYouKnowImRig

= weDontHaveToBeli
"We don't have to believe anyone," Harris replies sternly. "I intend to know the truth and be happy with nothing else. Right now, your story doesn't hold water. It doesn't tie up. We know you've been leaving yourself open to accusations. We've been watching your activities for some time. But we thought you were endangering the reputation of this site with the Government; not risking the country herself. Perhaps I put too much trust in your intellectual pride."
    -> hePausesForAMome

= askTheOthersIRep
"Ask the others," I reply, leaning back. "They'll tell you. If they haven't already, that's only because they're protecting Hooper. Hoping he'll come to his senses and stop being an idiot. I hope he does too. And if you lock him up in a freezing hut like you've done me, I'm sure he will."
    -> weHaveHarrisRepl

= hePausesForAMome
He pauses for a moment, considering something. Then he continues:
    -> itMightHaveBeenH

= andTheOtherMenDo
"And the other men? Do we have a hut each? Surely there aren't enough senior officers to go round."
    -> collinsAndHumphW

= thenYouKnowImRig
"Then you know I'm right. You knew all along. Why did you threaten me?"
    -> weDontKnowAnythi

= weHaveHarrisRepl
"We have," Harris replies simply. 
It's all I can do not to gape.
    -> hoopersInHutWith

= collinsAndHumphW
"Collins and Humph were outside when the theft occurred. Everyone confirms that," Harris replies. "That leaves you, Hooper, and the other two, who vouch for each other and frankly I'm inclined to believe them. But that's all we know.  <>
    -> Every_minute_counts

= weDontKnowAnythi
"We don't know anything, except that we have a traitor, holding the fate of the country in their hands.  <>
    -> Every_minute_counts

= itMightHaveBeenH
"It might have been Hooper. It might have been you.  <>
    -> Every_minute_counts

==== Every_minute_counts ====
No-one here is in the business of guessing, you know that. Our business is to decode. To get to the bottom of whatever's going on. You've not placed yourself beyond suspicion and until you do so..." Harris shrugs. "I'm afraid I have fewer and fewer choices as time goes on. If that component has left these grounds then every minute is critical."
+ Offer to help -> idBeHappyToHelpI
+ Offer nothing -> Wont_Help

= idBeHappyToHelpI
"I'd be happy to help," I answer, sympathetically, leaning forward across the table. "I'm sure there's something I could do."
"Like what, exactly?"
+ "Put me in with Hooper..." -> putMeInWithHoope
+ "Tell Hooper I've confessed..." -> tellHooperIveCon

= tellHooperIveCon
"Tell Hooper I've confessed. In fact, better yet, let him see you march me off in handcuffs. Then let him go, and watch him. Ten to one he'll go straight to wherever he's hidden that component and his game will be up."
    -> harrisNodsSlowly

= putMeInWithHoope
"Put me in with Hooper. Maybe I can get something useful out of him. As his colleague."
    -> harrisShakesHisH3

= harrisNodsSlowly
Harris nods slowly, chewing over the idea. It isn't a bad plan even - except, of course, Hooper has /=not=/ hidden the component, and won't lead them anywhere. But that's a problem I might be able to solve once I'm out of this place; and once they're busy, dogging Hooper's steps from hut to hut.
    -> itsAnInteresting

= harrisShakesHisH3
Harris shakes his head. "He despises you, doesn't he? I don't see why he'd give himself up to you."
+ "Try me. Just me and him." -> tryMeJustMeAndHi
+ "You're right." -> Cant_help

= tryMeJustMeAndHi
"Try me. Just me and him."
    -> Wont_Help.alone

= itsAnInteresting
"It's an interesting idea," the Commander muses. "But I'm not so sure he'll be that stupid. And if he's already passed the part on, well, the whole thing will only be a waste of time."
+ "Trust me. He hasn't." -> trustMeHeHasntIf
+ "You're right. Let me talk to him." -> youreRightLetMeT
+ "You're right." -> Cant_help

= youreRightLetMeT
"You're right. Let me talk to him, then. As a colleague. Maybe I can get something useful out of him."
    -> harrisShakesHisH3

= trustMeHeHasntIf
"Trust me. He hasn't. If I know that man, and I do, he'll have wanted to keep his options open as long as possible. If the component's gone then he's committed and he'll be hung for what he's done. He'll want to wait a week at least, make sure he's escaped suspicion. And then he'll pass it on."
"And if we keep applying pressure to him, you think the component will eventually just turn up?"
+ "Yes." -> yesProbablyUnder
+ "Or be thrown into the river." -> orBeThrownIntoTh

= orBeThrownIntoTh
"Or be thrown into the river."
    -> hmmHarrisChewsHi

= yesProbablyUnder
"Yes. Probably under my bunk."
Harris smiles wryly. "We'll know that for a fake, then. We've looked there already. <>
    -> iDontMindTelling

= hmmHarrisChewsHi
"Hmm." Harris chews his moustache thoughtfully. "Well, that would put us in a spot, seeing as how we'd never know for certain. We'd have to be ready to change our whole approach just in case the part had got through to the Germans.  <>
    -> iDontMindTelling

= iDontMindTelling
I don't mind telling you, this is a disaster, this whole thing. What I want is to find that little bit of mechanical trickery anywhere. I don't care where. In your luncheon box or under Hooper's pillow, whatever. Just somewhere, and within the grounds of this place."
+ "Then let him he think he's off the hook." -> thenLetHimThinkH
+ "Then you'd better get searching." -> thenYoudBetterGe

= thenYoudBetterGe
"Then you'd better get searching," I reply, tiring of his complaining./= A war is a war, you have to expect an enemy. =/ <>
    -> Wont_Help

= thenLetHimThinkH
"Then let him think he's off the hook. Make a show of me. And then you'll get your man."
/=Somehow=/, I think. But that's the part I need to work.
    -> Past_Hooper

==== Past_Hooper ====
Harris gets to his feet. "All right," he says. "I should no better than to trust a clever man, but we'll give it a go." Then, he smiles, with all his teeth, like a wolf.  <>
    -> Leading_you_past_Hooper.especiallySinceT

==== Leading_you_past_Hooper ====
He raps on the door for the guard and gives the man a quick instruction. He returns a moment later with a cool pair of iron cuffs. 
"Put 'em up," Harris instructs, and I do so. The metal closes around my wrists like a trap. I stand and follow Harris willingly out through the door.
    -> butWhateverImDoi

= especiallySinceT
"Especially since this is a plan that involves keeping you in handcuffs. I don't see what I have to lose."
    -> hoopersInHutBein

= butWhateverImDoi
But whatever I'm doing with my body, my mind is scheming. /=Somehow, =/I'm thinking, /=I have to get away from these men long enough to get that component behind Hut 2 and put it somewhere Hooper will go. Or, otherwise, somehow get Hooper to go there himself...=/
    -> harrisMarchesMeO

= hoopersInHutBein
"Hooper's in Hut 3 being debriefed by the Captain. Let's see if we can't get his attention somehow."
    -> Leading_you_past_Hooper

= harrisMarchesMeO
Harris marches me over to Hut 3, and gestures for the guard to stand aside. Pushing me forward, he opens the door nice and wide. 

==== Hut_3 ====
"Captain. Manning talked. If you'd step out for a moment?"/==/
+ Play the part, head down -> fromWhereHesSitt
+ Look inside the hut -> iLookInThroughTh
+ Call to Hooper -> iHaveASingleMome

= fromWhereHesSitt
From where he's sitting, I know Hooper can see me, so I keep my head down and look guilty as sin. The bastard is probably smiling.
    -> theCaptainComesO

= iLookInThroughTh
I look in through the door and catch Hooper's expression. I had half expected him to be smiling be he isn't. He looks shocked, almost hurt. "Iain," he murmurs. "You couldn't..."
    -> theCaptainComesO

= iHaveASingleMome
I have a single moment to shout something to Hooper before the door closes.
"I'll get you Hooper, you'll see!" I cry. Then:
+ "Queen to rook two, checkmate!" -> queenToRookTwoCh
+ "Ask not for whom the bell tolls!" -> askNotForWhomThe
+ "Messy, without one missing cache!" -> messyWithoutOneM

= theCaptainComesO
The Captain comes outside, pulling the door to. "What's this?" he asks. "A confession? Just like that?"
    -> noTheCommanderAd

= queenToRookTwoCh
"Queen to rook two, checkmate!" I call, then laugh viciously, as if I am damning him straight to hell.
    -> iOnlyCatchHooper

= messyWithoutOneM
"Messy, without one missing cache!" I cry, laughing spitefully. It isn't the best clue, hardly worthy of the Times, but it will have to do.
    -> iOnlyCatchHooper

= noTheCommanderAd
"No," the Commander admits, in a low voice. "I'm afraid not. Rather more a scheme. The idea is to let Hooper go and see what he does. If he believes we have Manning here in irons, he'll try to shift the component."
    -> ifHeHasIt

= askNotForWhomThe
"Ask not for whom the bell tolls!"
He stares back at me, as if were a madman and perhaps for a split second I see him shudder.
    -> theCaptainComesO

= iOnlyCatchHooper
I only catch Hooper's reaction for a moment - his eyebrow lifts in surprise and alarm. Good. If he thinks it is a threat then he just might be careless enough to go looking for what it might mean.
    -> theCaptainComesO

= ifHeHasIt
"If he has it."
"Indeed."
The Captain peers at me for a moment, like I was some kind of curious insect.
"Sometimes, I think you people are magicians," he remarks. "Other times you seem more like witches. Very well." 
With that he opens the door to the Hut and goes back inside. The Commander uses the moment to hustle me roughly forward.
"And what was all that shouting about?" he hisses in my ear as we move towards the barracks. "Are you trying to pull something? Or just make me look incompetent?"
"This scheme of yours had better come off," he hisses in my ear. "Otherwise the Captain is going to start having men tailing /=me=/ to see where I go on Saturdays."
+ Reassure -> itWillHoopersRun
+ Dissuade -> theCaptainThough
+ Evade -> wereStillInEarsh
+ Say nothing -> iLetHimHaveHisRa

= itWillHoopersRun
"It will. Hooper's running scared," I reply, hoping I sound more confident than I feel.
    -> justAddingToTheD

= theCaptainThough
"The Captain thought it was a good scheme. You'll most likely get a promotion."
    -> imNotTryingToDoA

= iLetHimHaveHisRa
I let him have his rant. <>
    -> Into_Barracks

= wereStillInEarsh
"We're still in ear-shot if they let Hooper go. Best get us inside and then we can talk, if we must."
    -> iveHadEnoughOfYo

= imNotTryingToDoA
"I'm not trying to do anything except save my neck."
    -> letsHopeThingsWo

= justAddingToTheD
"Just adding to the drama," I tell him, confidently. "I'm sure you can understand that."
    -> iThinkWeveHadEno

= iveHadEnoughOfYo
"I've had enough of your voice for one day," Harris replies grimly. <>
    -> Into_Barracks

= letsHopeThingsWo
"Let's hope things work out," Harris agrees darkly.
    -> Into_Barracks

= iThinkWeveHadEno
"I think we've had enough drama today already," Harris replies. "Let's hope for a clean kill."
    -> Into_Barracks

==== Into_Barracks ====
He hustles me up the steps of the barracks, keeping me firmly gripped as if I had any chance of giving him, a trained military man, the slip. It's all I can do not to fall into the room.
    -> andThenTheySlamT

= andThenTheySlamT
And then they slam the door shut, and it locks. <>
How am I supposed to manage anything from in here?
I can only hope that Hooper bites on my baited hook. If he thinks I'm mad and bitter enough to have framed him somehow, and arrogant enough to have taunted him with a clue to where the damning evidence is hidden... if he hates me enough, and is paranoid enough, then he might unravel my little riddle and go searching around Hut 2. 
Thinking back, I should have wrapped the part from the Bombe in one of his shirts before hiding it, that would have been a clever move. I really do make a terrible spy.
+ Wait -> iSettleDownToWai
+ Try the door -> iWaitAFewMinutes
+ Try the windows -> iGoOverToTheWind

= iGoOverToTheWind
I go over to the window and try to jimmy it open. Not much luck, but in my struggling I notice this window only backs on the thin little brook that runs down the back of the compound. Which means, if I smashed it, I might get away with no-one seeing.
    -> fromOutsideIHear

= iSettleDownToWai
I settle down to wait. 
    -> Night_falls

= iWaitAFewMinutes
I wait a few minutes, to be sure {heard hooper:Hooper and the Captain|the Commander} will have gone, then try the door. It's locked, all right. I'm not really one for picking locks. Never tried it. I don't think I'll be getting out that way.
    -> fromOutsideIHear

= fromOutsideIHear
From outside, I hear a voice. Hooper's. He's haranguing someone, for something.
+ Listen at the keyhole -> iPutMyEarDownToT
+ Try the window -> iGoOverToTheWind
+ Try the door -> iWaitAFewMinutes
+ Smash the window -> theWindowIsMyOnl
+ Wait -> itsUselessTheres

= iPutMyEarDownToT
I put my ear down to the keyhole, but there's nothing now. Probably still a guard outside, of course, but they're keeping mum.
    -> fromOutsideIHear

= itsUselessTheres
It's useless. There's nothing I can do but hope. I sit down on one corner of the bunk to wait.
    -> Night_falls

= theWindowIsMyOnl
The window is my only way out of here. I just need a way to smash it.
+ Punch it -> iSupposeMyFistWo
+ Find something -> iCastAroundTheSm
+ Use something you've got -> iPatDownMyPocket

= iPatDownMyPocket
I pat down my pockets but all I'm carrying is the intercept, which is no good at all.
+ Something you're wearing? -> ahButOfCourseISl
+ Look around instead -> iCastAroundTheSm

= iSupposeMyFistWo
I suppose my fist would do a good enough job. But I'd cut myself to ribbons, most likely. <>
    -> Use_jacket

= iCastAroundTheSm
I cast around the small room. There's a bucket in one corner for emergencies - I suppose I could use that. I pick it up but it's not very easy to heft.  <>
    -> Use_jacket

= ahButOfCourseISl
Ah, but of course! I slip off one shoe and heft it by the toe. The heel will make a decent enough hammer, if I give it enough wallop.
But I'll cut my hand to ribbons doing it. <>
    -> Use_jacket

==== Use_jacket ====
And the noise would be terrible. There must be a way of making this easier. I'm supposed to be a thief now. What would a burglar do?
+ Work slowly -> workCarefullyIts
+ Find something to help -> letMeSeeTheresTh

= letMeSeeTheresTh
Let me see. There's the bunk, {not using a bucket:a bucket,} nothing else. I have my jacket but nothing in the pockets - no handkerchief, for instance.
+ The bunk -> theBunkHasASolid
+ The jacket -> iSlipOffMyJacket
+ The bucket -> theBucketHardlyT

= workCarefullyIts
Work carefully? It's difficult to work carefully when all one's has is {using a bucket:a bucket. It's rather like the sledgehammer for the proverbial nut|{using a shoe:a shoe|nothing but brute force}}. 
+ Just do it -> enoughOfThisTher
+ Look around for something -> letMeSeeTheresTh

= theBucketHardlyT
The bucket? Hardly. The bucket might do some good if I wanted to sweep up the glass afterwards, but it won't help me smash the glass quietly.
    -> letMeSeeTheresTh

= enoughOfThisTher
Enough of this. There isn't any time to lose. Right now they'll be following Hooper as he goes to bed, and goes to sleep; and then that's it. The minute he closes his eyelids and drifts off that's the moment that this trap swings shut on me.
    -> soIPunchOutTheGl

= iSlipOffMyJacket
I slip off my jacket and hold it with one hand over the glass.  <>
    -> Smashing_glass

= theBunkHasASolid
The bunk has a solid metal frame, a blanket, a pillow, nothing more.
+ The frame -> theFrameIsHeavyA
+ The blanket -> theBlanketPerfec
+ The pillow -> thePillowIsFatAn
+ Something else -> letMeSeeTheresTh

= soIPunchOutTheGl
So I punch out the glass with my {using a bucket:bucket|{using a shoe:shoe|fist}} and it shatters with a terrific noise. Then I stop, and wait, to see if anyone will come in through the door.
    -> nothing

= theBlanketPerfec
The blanket. Perfect. I scoop it up off the bed and hold it in place over the window.  <>
    -> Smashing_glass

= thePillowIsFatAn
The pillow is fat and fluffy. I could put it over the window and it would muffle the sound of breaking glass, certainly; but I wouldn't be able to break any glass through it either. 
    -> theBunkHasASolid

= theFrameIsHeavyA
The frame is heavy and solid. I couldn't lift it or shift it without help from another man. And it wouldn't do me any good here anyway. I can reach the window perfectly well.
    -> theBunkHasASolid

= nothing
Nothing.
+ Wait a little longer -> iPauseForAMoment
+ Clear the frame of shards -> withMyJacketWrap

= iPauseForAMoment
I pause for a moment longer. It doesn't do to be too careless...
    -> Caught

= withMyJacketWrap
With my jacket wrapped round my arm, I sweep out the remaining shards of glass. It's not a big window, but I'm not a big man. If I was Harris, I'd be stuffed, but as it is...
    -> Caught

==== Caught ====
Then the door locks turns. The door opens. Then Jeremy - one of the guards, rather - sticks his head through the door. "I thought I heard..." 
He stops. Looks for a moment. {using a bucket:Sees the bucket in my hand.|Sees the broken window.} Then without a moment's further thought he blows his shrill whistles and hustles into the hut, grabbing me roughly by my arms.
I'll never know if I hadn't have waited that extra moment - maybe I still could have got away. But, how far?
I'm hustled into one of the huts. Nowhere to sleep, but they're not interested in my comfort any longer. Harris comes in with the Captain.
"So," Harris remarks. "Looks like your little trap worked. Only it worked to show /=you =/out for what you are."
+ Tell the truth -> pleaseHarrisYouC
+ Lie -> iHadToGetOutHarr
+ Evade -> thisProvesNothin

= iHadToGetOutHarr
"I had to get out, Harris. I had to provoke Hooper into doing something that would incriminate himself fully. He's too clever, you see..."
    -> beQuietManWeKnow

= thisProvesNothin
"This proves nothing," I reply stubbornly. "You still don't have the component and without it, I don't see what you can hope to prove."
    -> beQuietManWeKnow

= pleaseHarrisYouC
"Please, Harris. You can't understand the pressure they put me under. You can't understand what it's like, to be in love but be able to do nothing about it..."
"Harris. They were blackmailing me. They knew about... certain indiscretions. You can understand, can't you, Harris? I was in an impossible bind..."
    -> beQuietManWeKnow

= beQuietManWeKnow
"Be quiet, man. We know all about your and your sordid affairs." The Captain curls his lip. "Don't you know there's a war on? Do you know the kind of place they would have sent you if it haven't had been for that brain of yours? Don't you think you owe it to your country to use it a little more?"
/=Do I=/, I wonder? /=Do I owe this country anything, this country that has spurned who and what am I since the day I became a man?=/
+ Yes -> myAngerDeflatesL
+ No -> ofCourseNotIAmAl
+ Lie -> ofCourseNotIAmAl
+ Evade -> butWhatIsACountr

= ofCourseNotIAmAl
/=Of course not. I am alone; that is what they wanted me to be, because of who and what I love. So I have no nation, no country.=/
    -> Tell_us_where

= butWhatIsACountr
/=But what is a country, after all? A country is not a concept, not an ideal. Every country falls, its borders shift and move, its language disappears to be replaced by another. Neither the Reich nor the British Empire will survive forever, so what use is my loyalty to either? =/
    -> iMayAsWellTheref

= myAngerDeflatesL
My anger deflates like a collapsing equation, all arguments cancelling each other out. The world, of course, owes me nothing; and I owe it everything.
    -> Tell_us_where

= iMayAsWellTheref
/=I may as well, therefore, look after myself. Something I have attempted, but failed miserably, to do.=/
    -> Tell_us_where

==== Tell_us_where ====
"I'm afraid we have only one option, Manning," Harris says. "Please, man. Tell us where the component is."/==/
+ Tell them -> allRightIAmBeate
+ Say nothing -> iSayNothingMyLip

= iSayNothingMyLip
I say nothing, my lips tightly, firmly sealed. It's true I am a traitor, to the very laws of nature. The world has taught me that since a very early age. But not to my country - should the Reich win this war, I would hardly be treated as an honoured hero. I was doomed from the very start.
    -> iExplainNoneOfTh

= allRightIAmBeate
"All right." I am beaten, after all. " <>
    -> theMissingCompon

= theMissingCompon
The missing component of the Bombe computer is hidden in a small cavity in a breeze-block supporting the left rear post of Hut 2. I put in there anticipating a search. <>
    -> iIntendedToPassI

= iExplainNoneOfTh
I explain none of this. How could a man like Harris understand?
    -> theCommanderTake

= iIntendedToPassI
I intended to pass it to Hooper  <>
    -> iIntendedToDispo

= theCommanderTake
The Commander takes one look back from the doorway as he pulls it to.
"It's been a pleasure working with you, Mr Manning," he declares. "You've done a great service to this country. If we come through, I'm sure they'll remember you name. I'm sorry it had to end this way and I'll do my best to keep it quiet. No-one need know what you did."
    -> Alone_about_to_die

= iIntendedToDispo
I intended to dispose of it <>
once the fuss had died down. I suppose I was foolish to think that it might."
    -> indeedYouWereAnd

= indeedYouWereAnd
"Indeed you were. And, Mr Manning: God help you if you're lying to me." 
"I thought as much. I hadn't expected you to give it out so easily, however. You understand, Hooper has said nothing, of course. In fact, he went to Hut 2 directly after we released him and uncovered the component. But he told us you had instructed him where to go. Hence my little double bluff. Frankly, I'll be glad when I'm shot of the lot of you mathematicians."
Harris stands, and slips away smartly.  <>
    -> Alone_about_to_die

==== Smashing_glass ====
This should do it. Then I heft {using a bucket: the bucket - this really is quite a fiddly thing to be doing, and I need far longer arms, especially in cuffs - |{using a shoe: my shoe by its toe, |back my arm, }} and take a strong swing, trying to imagine it's Harris' face on the other side.
The sound of the impact is muffled. With my arm still covered, I sweep out the remaining glass in the frame. I'm ready to escape. The only trouble is - when they look in on me in the morning, there will be no question what has happened. It won't help me one jot with shifting suspicion off my back.
+ Wait -> soPerhapsIShould
+ Slip out -> Out_at_night

= soPerhapsIShould
So perhaps I should wait it out, after all. Who knows? I might have a better opportunity later.
    -> In_room_smashed_glass

==== Out_at_night ====
Moving quickly and quietly, I hoist myself up onto the window-frame and worm my way outside into the freezing night air. Then I'm away, slipping down the paths between the Huts, sticking to the shadows, on my way to Hut 2.
+ Go the shortest way -> theresNoTimeToLo
+ Take a longer route -> inCaseImBeingFol

= inCaseImBeingFol
In case I'm being followed, I divert around the perimeter of the compound. It's a much longer path, and it takes me across some terrain that's difficult to negotiate in the dark - muddy, and thick with thistles and nestles.
    -> stillICanBeConfi

= theresNoTimeToLo
There's no time to lose. Throwing caution to the wind I make my way quickly to Hut 2, and around the back. I don't think I've been followed, or seen but if I have, it's too late. My actions are suspicious enough for anyone's noose. I have no choice but to follow through.
    -> theComponentIsSt

= theComponentIsSt
The component is still there, wrapped in a tea-towel and shoved into a cavity in a breeze-block at the base of the Hut wall.
+ Take it -> quicklyIPullItFr
+ Leave it -> stillThereMeansN

= stillICanBeConfi
Still, I can be confident no-one is following, as I hear nothing. I crouch down behind the rear wall of Hut 2.  <>
    -> theComponentIsSt

= quicklyIPullItFr
Quickly, I pull it free, and slip it into the pocket of my jacket.
    -> Where_now

= stillThereMeansN
Still there means no-one has found it, which means it is probably well-hidden. And short of skipping the compound now, I can afford to leave it hidden there a while longer. So I leave it in place.
    -> Where_now

==== Where_now ====
Where now?
+ Go back to the barracks -> gotComponentTheW
+ Go to Hooper's dorm -> Hoopers_Dorm
+ Escape the compound -> enoughOfThisPlac

= enoughOfThisPlac
Enough of this place. Time for me to get moving. I can get to the train station on foot, catch the postal train to Scotland and be somewhere else before anyone realises that I'm gone.
    -> ofCourseThenThey

= gotComponentTheW
{got component:The weight of the Bombe component safely in my jacket|Satisfied}, I return the short way up the paths between the huts to the barrack block and the broken window. 
It's a little harder getting back through - the window is higher off the ground than the floor inside - but after a decent bit of jumping and hauling I manage to get my elbows up, and then one leg, and finally I collapse inside, quite winded and out breath.
+ Wait -> In_room_smashed_glass
+ Wait -> morningComesSlow

= ofCourseThenThey
Of course, then they'll be looking for me in earnest. {not framed hooper:As a confirmed traitor.|Perhaps not as a traitor - they might take the idea that Hooper was involved with the theft - but certainly as a valuable mind, one containing valuable secrets and all too easily threatened. They will think I am running away because of my indiscretions. I suppose, in fairness, that I am.}
+ Go -> betterToLiveOnTh
+ Don't go -> itsNoGoodThatsOn

= morningComesSlow
Morning comes slowly, but I must fall asleep at some point, because the next thing I know the rooster is calling and a cool, fresh breeze is blowing through the open window. I barely have time to wipe the sleep from my eyes and brush myself down before the door opens and Harris enters.
    -> heTakesOneLookAr

= itsNoGoodThatsOn
It's no good. That's only half a solution. I couldn't be happy with that.
+ Back to the barracks -> gotComponentTheW
+ To Hooper's dorm -> Hoopers_Dorm

= betterToLiveOnTh
Better to live on the run than die on the spit. Creeping around the edge of the compound{got component:, the Bombe component heavy in my pocket}, I make my way to the front gate. As always, it's manned by two guards, but I slip  past their box by crawling on my belly.
And then I'm on the road. Walking, not running. Silent. Free.
    -> End_Run_Away

= heTakesOneLookAr
He takes one look around, and sighs, a deep, wistful sigh.
    -> Piece_Found

==== Hoopers_Dorm ====
{considered escape:Well, then|Next}. To Hooper's dorm. Time to wrap up this little game once and for all.
I creep around the outside of the Huts. All are quiet, steel-grey in the hazy moonlight; a few shining copper from arc-lamps strung from the trees. A few guards patrol the area at night but not many - after all, very few know this place even exists.
Our quarters are arranged away from the House; where we sleep is of less importance than where we work. We each have our own Hut, through some are less permanent than other's. Hooper's is a military issue tent: quite a large canopy, with two rooms inside and a short porch area where he insists people leave their shoes. It's all zipped up for the night and no light shines from inside.
I hang back for a moment. If Harris is keeping to the terms of our deal then someone will be watching this place. But I can see no-one.
+ Open the outer zip -> iCreepForwardToT
+ Look for another opening -> makingAWideCircu
+ Hide the component somewhere -> ifILeaveTheCompo

= ifILeaveTheCompo
If I leave the component here somewhere it should be somewhere I can rely on Hooper finding it, but no-one before Hooper. In particular.
+ Behind the tent -> makingAWideCircu
+ Inside the porch section -> iCreepForwardToT
+ On top of the canvas -> aNeatIdeaStrikes

= makingAWideCircu
Making a wide circuit I creep around the tent. It has plenty of other flaps and openings, tied down with Gordian complexity. But nothing afford itself to slipping the component inside.
+ Try the porch zip -> iCreepForwardToT
+ Try on top of the tent -> aNeatIdeaStrikes
+ Give up -> itsNoGoodNothing

= iCreepForwardToT
I creep forward to the tent, intent on lifting the zip to the front porch area just a little - enough to slip the component inside, and without the risk of the noise waking Hooper from his snoring.
    -> theWorkIsCareful

= aNeatIdeaStrikes
A neat idea strikes me. If I could place it on top of the canvas, somewhere in the middle where it would bow the cloth inwards, then it would be invisible to anyone passing by. But to Hooper, it would be above him: a shadow staring him in the face as he awoke. What could be more natural than getting up, coming out, and looking to see what had fallen on him during the night?
    -> GoingToStashComponent

= theWorkIsCareful
The work is careful, and more than little fiddly - Hooper has tied the zips down on the inside, the fastidious little bastard! - but after a little work I manage to make a hole large enough for my hand.
+ Slip in the component -> iSlideTheCompone
+ No, some other way -> thenPauseThisIsT

= itsNoGoodNothing
It's no good. Nothing I can do will be any less than obvious - something appearing where something was not there before. The men watching Hooper will know it is a deception and Hooper's protestations will be taken at face value.
    -> ifICantFindAWayF

= thenPauseThisIsT
Then pause. This is too transparent. Too blatant. If I leave it here, like this, Hooper will never be seen to go looking for it: he will stumble over it in plain sight, and the men watching will wonder why it was not there when he went to bed.
    -> noIMustTrySometh

= iSlideTheCompone
I slide the component into the tent, work the zip closed, and move quickly away into the shadows. It takes a few minutes for my breath to slow, and my heart to stop hammering, but I see no other movement. If anyone is watching Hooper's tent, they are asleep at their posts.
    -> Where_now.gotComponentTheW

= ifICantFindAWayF
If I can't find a way for Hooper to pick the component up, as if from a hiding place of his own devising, and be caught doing it, then I have no plan at all.
+ Return to my barrack -> Where_now.gotComponentTheW
+ Escape the compound -> Where_now.betterToLiveOnTh
+ Toss the component into the bushes -> iTossTheComponen

= noIMustTrySometh
No, I must try something else - or nothing at all.
+ On top of the tent -> aNeatIdeaStrikes
+ Throw the component into the long grass -> fromInspirationO
+ Give up -> thereIsNothingTo

= iTossTheComponen
I toss the component away into the bushes behind Hooper's tent and return to my barrack, wishing myself a long sleep followed by a morning, free of this business.
    -> Where_now.gotComponentTheW

= thereIsNothingTo
There is nothing to be gained here. I have the component now; maybe it will be of some value tomorrow.
+ Return to my barrack -> Where_now.gotComponentTheW
+ Escape the compound -> Where_now.betterToLiveOnTh

= fromInspirationO
From inspiration - or desperation, I am not certain - a simple approach occurs to me.  <>
    -> iTossTheComponen

==== Piece_Found ====
"Things just get worse and worse for you, Manning," he remarks. "You are your own worst enemy."
+ Agree -> iveThoughtSoBefo
+ Disagree -> rightNowIThinkYo
+ Evade -> imLookingForward

= rightNowIThinkYo
"Right now, I think you take that role, Harris," I reply coolly.
    -> veryDrollHeRepli

= imLookingForward
"I'm looking forward to having a wash and a change of clothes; which should make a little less evil to be around."
    -> veryDrollHeRepli

= iveThoughtSoBefo
"I've thought so before." {admit blackmail:Certainly in the matter of getting blackmailed.}
    -> letMeTellYouWhat

= veryDrollHeRepli
"Very droll," he replies. "Let me tell you what happened this morning, and see if it takes the smile off your face.  <>
    -> ourMenWatchingHo

= letMeTellYouWhat
"Let me tell you what happened this morning.  <>
    -> ourMenWatchingHo

= ourMenWatchingHo
Our men watching Hooper's tent saw Hooper wake up, get dressed, clamber out of his tent and then remark with surprise as, while looking for his shoes, he stumbled on something just at the entrance of his tent."
+ Be interested -> youMeanHeDidntEv
+ Be dismissive -> soHesAnIdiotAndH
+ Say nothing -> iSayQuietListeni

= youMeanHeDidntEv
"You mean he didn't even hide it? Just put it in his shoe?"
    -> noHarrisRepliesT

= soHesAnIdiotAndH
"So he's an idiot, and he hid it in his shoe."
    -> noHarrisRepliesT

= iSayQuietListeni
I say quiet, listening, not sure how this will go.
    -> inCaseImNotMakin

= noHarrisRepliesT
"No," Harris replies. "That isn't really what I mean.  <>
    -> iMeanHeManagedTo

= inCaseImNotMakin
"In case I'm not making myself clear," Harris continues, " <>
    -> iMeanHeManagedTo

= iMeanHeManagedTo
I mean, he managed to find it, by accident, somewhere where it wasn't the night before. And at the same time, you're sitting here with your window broken. So, I rather think you've played your last hand and lost. There's no way Hooper stole that component and then just left it lying around in the doorway of his tent. No way at all. So I came to tell you that the game is up for you."
He nods and gets to his feet. <>
    -> Alone_about_to_die

==== GoingToStashComponent ====
It's the work of a moment. I was once an excellent bowler for the second XI back at school. This time I throw underarm, of course, but I still land the vital missing component exactly where I want it to go. 
For a second I hold my breath, but nothing and no-one stirs.  <>
    -> Where_now.gotComponentTheW

==== End_Run_Away ====
For the moment, at least.
    -> END

==== Framed_Hooper ====
"Well, you should enjoy it.  <>
    -> Framed_Hooper

==== In_room_smashed_glass ====
The rest of the night passes slowly. I sleep a little, dozing mostly. Then I'm woken by the rooster in the yard. The door opens, and Harris comes in. He takes one look at the broken window and frowns with puzzlement.
"What happened there?"
+ Admit doing it -> iBrokeItIReplyTh
+ Deny doing it -> imNotSureIWasAsl
+ Show him the component -> someoneThrewThis

= iBrokeItIReplyTh
"I broke it," I reply. There doesn't seem any use in trying to lie. "I thought I could escape. But I couldn't get myself through."
    -> theCommanderLaug

= imNotSureIWasAsl
"I'm not sure. I was asleep: I woke up when someone broke the window. I looked out to see who it was, but they were already gone."
    -> harrisLooksAtMeW

= someoneThrewThis
"Someone threw this in through the window over night," I reply, and open my jacket to reveal the component from the Bombe. "I couldn't see who, it was too dark. But I know what it is."
    -> heReachesOutAndT

= harrisLooksAtMeW
Harris looks at me with puzzlement. "Someone came by to break the window, and then ran off? That's absurd. That's utterly absurd. Admit it, Manning. You tried to escape and you couldn't get through."
+ Admit it -> allRightAllRight
+ Deny it -> ifIWantedToEscap
+ Deny it -> iTellYouSomeoneB

= theCommanderLaug
The Commander laughs.  <>
    -> shameHeRemarksIS

= heReachesOutAndT
He reaches out and takes it. "Well, I'll be damned," he murmurs. "That's it all right. And you didn't have it on you when we put you in here. But it can't have been Hooper - I had men watching him all night. And there's no-one else it could have been." 
    -> heTurnsTheCompon

= shameHeRemarksIS
"Shame," he remarks. "I should have left that window open and put a guard on you. Might have been interesting to see where you went. Anyway, I'm glad you're still here, even if you do smell like a dog."
+ Be optimistic -> Not_saved.imLookingForward2
+ Be pessimistic -> Not_saved.soWouldYouAfterT
+ Be optimistic -> imLookingForward1
+ Be pessimistic -> iImagineIllSmell

= allRightAllRight
"All right. All right. That's exactly what happened."
    -> shameHeRemarksIS

= heTurnsTheCompon
He turns the component over in his hands, bemused.
+ Suggest something -> perhapsHooperHad
+ Suggest nothing -> iShrugEloquently

= ifIWantedToEscap
"If I wanted to escape, I would have made damn sure that I could," I tell him sternly. 
    -> Not_saved.wellImAfraidItIs

= iTellYouSomeoneB
"I tell you, someone broke it. Someone wanted to threaten me, I think."
    -> harrisShakesHisH1

= iImagineIllSmell
"I imagine I'll smell worse after another couple of days of this."
    -> thatWontBeNecess

= harrisShakesHisH1
Harris shakes his head. "Well, we can look into that matter later. For now, you probably want to hear the more pressing news.  <>
    -> Framed_Hooper

= iShrugEloquently
I shrug, eloquently.
    -> Returned_Component

= perhapsHooperHad
"Perhaps Hooper had an accomplice. Someone else who works on site."
    -> harrisShakesHisH

= imLookingForward1
"I'm looking forward to having a bath."
    -> Framed_Hooper

= thatWontBeNecess
"That won't be necessary. <>
    -> Framed_Hooper

= harrisShakesHisH
Harris shakes his head, distractedly. "That doesn't make sense," he says. "Why go to all the trouble of stealing it only to give it back? And why like this?"
+ Suggest something -> perhapsTheAccomp
+ Suggest nothing -> iShrugEloquently

= perhapsTheAccomp
"Perhaps the accomplice thought it was Hooper being kept in here. Maybe they saw the guard..."
    -> Returned_Component

==== Framed_Hooper ====
We found the missing component. Or rather, Hooper found it for us. He snuck out of his tent first thing in the morning and retrieved it from on top. Of all the damnest places - you would never have known it was there. He acted all surprised about it when we jumped him, of course, as you might expect - but it was good enough for me."
+ Be glad -> iCantTellYouEnou
+ Be dismissive -> heNeverCouldBeTr

= heNeverCouldBeTr
"He never could be trusted. You should never have hired him. A below average intelligence can't cope with the pressures in this place."
    -> harrisRollsHisEy

= iCantTellYouEnou
"I can't tell you enough, I'm glad to hear it. I've had a devil of a night, as you can imagine."
His gaze flicks to the broken window, but only for a moment. I think he genuinely cannot believe I could have done it.
    -> harrisRollsHisEy

= harrisRollsHisEy
Harris rolls his eyes, but he might almost be smiling. "You'd better get along, {devil of a night:and work through your devils|Mr Intelligent}. There's a 24-hour-out-of-date message to be tackled and we're a genius short. So you'd better be ready to work twice as hard."
+ Thank him -> illEnjoyItThankY
+ Argue with him -> illWorkAsHardAsI

= illWorkAsHardAsI
"I'll work as hard as I work."
    -> getOutHarrisGrow

= illEnjoyItThankY
"I'll enjoy it. Thank you for helping me clear this up."
"Don't thank me yet. There's still a war to fight. Now get a move on."
    -> iNodAndHurryOutO

= getOutHarrisGrow
"Get out," Harris growls. "Before I decide to arrest you as an accessory."
I do as he says. Outside the barrack, the air has never smelt sweeter. 
    -> Outside_possibly_free.iHeadForMyDormIn

= iNodAndHurryOutO
I nod, and hurry out of the door. The air outside has never tasted fresher and more invigorating.  <>
    -> Outside_possibly_free.iHeadForMyDormIn

==== Night_falls ====
Night falls. The clockwork of the heavens keeps turning, whatever state I might be in. No-one can steal the components that make the sun go down and the stars come out. I watch it performing its operations. I can't sleep.
Has Hooper taken my bait?
+ Look of out the window -> iPeerOutOfTheWin
+ Listen at the door -> iPutMyEarToTheKe
+ Wait -> thereIsNothingIC

= thereIsNothingIC
There is nothing I can do to speed up time.  <>
    -> theNightDrawsOnA

= iPeerOutOfTheWin
I peer out of the window, but it looks out onto the little brook at the back of the compound, with no view of the other huts or the House. Who knows if there are men up, searching the base of Hut 2, following one another with flashlights...
    -> perhapsHooperIsT

= iPutMyEarToTheKe
I put my ear to the keyhole but can make out nothing. Are there still guards posted? {clue to hut 2 given:Perhaps, if Hooper has managed to incriminate himself, the guards have been removed?|Perhaps the component has been found and the crisis is over.}
    -> perhapsTheDoorIs

= perhapsHooperIsT
Perhaps Hooper is there, in the dark, trying to help me after all?
    -> theNightDrawsOnA

= perhapsTheDoorIs
Perhaps the door is unlocked and they left me to sleep? I try the handle. No such luck.
    -> theNightDrawsOnA

= theNightDrawsOnA
The night draws on at its own pace. I suppose by morning I will know my fate.
+ Wait -> Hooper_now_arrested
+ Wait -> Not_saved

==== Not_saved ====
Morning comes with the call of a rooster from the yard of the House. I must have slept after all. I pull myself up off the bunk, shivering slightly. There is condensation on the inside of the window. I have probably given myself a chill.
It's not long after that Harris enters the hut. He closes the door behind him, careful as ever, then takes a chair across from me.
"You smell like a dog," he remarks.
+ Be optimistic -> imLookingForward2
+ Be pessimistic -> soWouldYouAfterT

= soWouldYouAfterT
"So would you after the night I've had."
    -> wellImAfraidItIs

= imLookingForward2
"I'm looking forward to a long bath," I reply. "And getting back to work."
    -> wellImAfraidItIs

= wellImAfraidItIs
"Well, I'm afraid it is going to get worse for you," Harris replies soberly. "We followed Hooper, and he took himself neatly to bed and slept like a boy scout. Which puts us back to square one, and you firmly in the frame. And I'm afraid I don't have time for any more games. I want you to tell me where that component is, or we will hang you as a traitor."
    -> Wont_Help.heGetsToHisFeetA

==== Hooper_now_arrested ====
Morning comes. I'm woken by a rooster calling from the yard behind the House. I must have slept after all. I pull myself up from the bunk, shivering slightly. There is condensation on the inside of the window. I have probably given myself a chill.
The door handle turns and without knocking, Harris comes inside. "You're up," he remarks, and then, "You smell like an animal."
+ Be friendly -> iSupposeIDoRathe
+ Be cold -> soWouldYouIReply

= soWouldYouIReply
"So would you," I reply tartly. Harris raises an eyebrow.
    -> iveBeenThroughWo

= iSupposeIDoRathe
"I suppose I do rather." I laugh, but Harris does not.
"This damn business gets worse and worse," he says, talking as he goes over to unlock and throw open the window.  <>
    -> hoopersConfessed

= iveBeenThroughWo
"I've been through worse than this," he replies matter-of-factly. "It's hardly my fault if you sleep in your clothes."
I glare back at him.
    -> heGoesOverToTheW

= hoopersConfessed
"Hooper's confessed, you know."
+ Be eager -> heHasIKnewHeWoul
+ Be cautious -> ohYes

= heHasIKnewHeWoul
"He has? I knew he would. The worm."
    -> steadyNowMatters

= ohYes
"Oh, yes?"
    -> yesForWhatThatsW

= heGoesOverToTheW
He goes over to the window, unlocks it and throws it open, relishing the fresh air from outside.  <>
    -> hoopersConfessed

= steadyNowMatters
"Steady now. Matters aren't over yet.  <>
    -> theresStillTheIs

= yesForWhatThatsW
"Yes. For what that's worth.  <>
    -> theresStillTheIs

= theresStillTheIs
There's still the issue of the component. It hasn't turned up. He didn't lead us to it. I guess he figured you must have had something on him. I don't know."
He looks quite put out by the whole affair. He is not the kind of man to deal well with ambiguities and probabilities, far preferred the clarity of fact and falsehood.
+ Be interested -> youMeanHeConfess
+ Be disinterested -> wellImGladHisCon

= wellImGladHisCon
"Well, I'm glad his conscience finally caught up with him," I reply dismissively.
    -> theCaptainWentBa

= youMeanHeConfess
"You mean he confessed of his own accord? You didn't catch him?"
    -> theCaptainWentBa

= theCaptainWentBa
"The Captain went back into that hut and he confessed immediately. We were so surprised we didn't let you go." He wrinkles his nose. "I'm rather sorry about that now, but I suppose we'll let you go know. I suggest you have a wash."
And with that he gestures to the doorway.
+ Go -> Not_Confessing.curiouserAndCuri
+ Wait -> iHangBackAMoment

= iHangBackAMoment
I hang back a moment. Something does not seem quite right. After all, Hooper did not steal the component. He has no reason to confess to anything. Perhaps this is another trap?
"Well?" Harris asks. "What are you waiting for? Please don't tell me /=you =/want to confess now as well, I don't think my head could stand it."
+ Confess -> afterAChanceLike
+ Don't confess -> Not_Confessing

= afterAChanceLike
After a chance like this? A chance - however real - to save my neck? To hand it over - what, to save Hooper's worthless skin?
+ Confess -> iSeePerhapsYouTh
+ Don't confess -> Not_Confessing

= iSeePerhapsYouTh
I see. Perhaps you think I bullied the man into giving himself up. Perhaps he understood my little clue far enough to know it was a threat against him, but not well enough to understand where he should look to find it. So he took the easy route out and folded. Gave me the hand.
Hardly sporting, is that it?
+ Confess -> iSupposeThisMust
+ Don't confess -> Not_Confessing

= iSupposeThisMust
I suppose this must be what it feels like to have a conscience, then. Very well.
"Harris, sir. I don't know what Hooper's playing at, sir. But I can't let him do this."
"Do what?"
"Take the rope for this. I took it, sir. 
    -> Tell_us_where.theMissingCompon

==== Outside_possibly_free ====
Of course, however, there is only one way to be certain that Harris is telling the truth, and that is to find a quiet moment and check the breeze-block at the back of Hut 2.
+ Check -> Goes_to_check
+ Don't check -> plentyOfTimeForT

= plentyOfTimeForT
Plenty of time for that later. If there is nothing there, then Hooper discovered the component after all and Harris' men will have swooped on him, and the story about his confession is just a ruse to test me out. And if the component is still there - well. It will be just as valuable to my young man in the village in a week's time, and his deadline of the 31st is not quite upon us.
    -> iHeadForMyDormIn

= iHeadForMyDormIn
I head for my dorm, intent on a bath, breakfast, a glance at the crossword before the other men get to it, and then on with work. They should have replaced the component in the Bombe by now. We will be back to it, only a day behind.
And everything will proceed as before. The component will mean nothing to the Germans - this is the one fact I could never have explained to a man like Harris despite the fact that the principle behind the Bombe is the same as the principle behind an army. The individual pieces - the men, the components - do not matter. They are quite identical. It is how they are arranged that counts. The structures and patterns that they form.
I bump into Russell in the dorm hut. "Did you hear?" he whispers. "Terrible news about Hooper. Absolutely terrible."
+ Yes -> quiteTerribleIWo
+ No -> heardWhat
+ Lie -> iDontKnowWhatYou
+ Evade -> ifYoullExcuseMeR

= iDontKnowWhatYou
"I don't know what you're talking about."
    -> hoopersBeenTaken

= heardWhat
"Heard what?"
    -> hoopersBeenTaken

= ifYoullExcuseMeR
"If you'll excuse me, Russell. I was about to take a bath."
    -> ohOfCourseWellYo

= quiteTerribleIWo
"Quite terrible. I would never have guessed."
    -> wellRussellHarru

= hoopersBeenTaken
"Hooper's been taken away. They caught him, uncovering that missing Bombe component from a hiding place somewhere, apparently about to take it to his contact." Russell harrumphs.   <>
    -> quinceWasSayingT

= ohOfCourseWellYo
"Oh, of course. Well, you'll hear soon enough. Can hardly hide the fact there'll only be three of us from now on."
    -> iWaveToHimAndMov

= wellRussellHarru
"Well." Russell harrumphs.  <>
    -> quinceWasSayingT

= quinceWasSayingT
"Quince was saying this morning, apparently his grandfather was German. So perhaps it's to be expected. See you there?"
    -> iWaveToHimAndMov

= iWaveToHimAndMov
I wave to him and move away, my thoughts turning to the young man in the village. My lover. My contact. My blackmailer. Hooper may have taken the fall for the missing component, but  {not framed hooper:if it was his recovering it from Hut 2 then | its recovery does mean}  I have nothing to sell to save my reputation{admit young man:, if I have any left}. 
If he didn't, of course, and Harris was telling the truth about his sudden confession, then I will be able to buy my freedom once and for all.
+ Get the component -> Goes_to_check
+ Leave it -> iWillHaveToLeave
+ Act normal -> noChoiceThen

= iWillHaveToLeave
I will have to leave that question for another day. To return there now, when they're probably watching my every step, would be suicide. After all, if Hooper {secret clue:followed|understood} my clue, he will have explained it to them to save his neck. They won't believe him - but they won't quite disbelieve him either. We're locked in a cycle now, him and me, of half-truth and probability. There's nothing either of us can do to put the other entirely into blame.
    -> nothingThatIsExc

= noChoiceThen
No choice, then.  <>
    -> nothingThatIsExc

= nothingThatIsExc
Nothing, that is, except to act as if there is no game being played. I'll have a bath, then start work as normal. I've got a week to find something to give my blackmailer{admit young man: - or give him nothing: it seems my superiors know about my indiscretions now already}. Something will turn up.
+ Definitely -> itAlwaysDoesAnOp
+ Unlikely -> hmmAroundHereMay
+ Lie -> inAWeeksTimeThis
+ Evade -> iveMoreImportant

= itAlwaysDoesAnOp
It always does. An opportunity will present itself, and more easily too, now that Hooper is out of the way and not dogging my every step.
    -> butForNowTheresY

= iveMoreImportant
I've more important problems to think about now. There's still yesterday's intercept to be resolved.  <>
    -> End_Scot_Free

= inAWeeksTimeThis
In a week's time, this whole affair will be in the past and quite forgotten. I'm quite sure of that.
    -> iveMoreImportant

= hmmAroundHereMay
Hmm. Around here? Maybe not. I might have no option but to hand my young blackmailer over my superiors for the spy he is and let him wreak what damage he can.
    -> perhapsThatWould

= butForNowTheresY
But for now, there's yesterday's intercept to be resolved.  <>
    -> End_Scot_Free

= perhapsThatWould
Perhaps that would be the moral thing to do, even, and not just the most smart. But not today. Today, there's an intercept to resolve. <>
    -> End_Scot_Free

==== End_Scot_Free ====
The Bombe needs to be set up once more and set running. 
It's time I tackled a problem I can <i>solve</i>.
    -> END

==== Goes_to_check ====
It won't take a moment to settle the matter. I can justify a walk past Hut 2 as part of my morning stroll. It will be obvious in a moment if the component is still there.
On my way across the paddocks, between the huts and the House, I catch sight of young Miss Lyon, arriving for work on her bicycle. She giggles as she sees me and waves.
+ Wave back -> iWaveCheerilyBac
+ Ignore her -> iGiveNoReactionS

= iWaveCheerilyBac
I wave cheerily back and she giggles, almost drops her bicycle, then dashes away inside the House. Judging by the clock on the front gable, she's running a little late this morning.
    -> iTurnTheCornerOf

= iGiveNoReactionS
I give no reaction. She sighs to herself, as if this kind of behaviour is normal, and trots away inside the House to begin her duties.
    -> iTurnTheCornerOf

= iTurnTheCornerOf
I turn the corner of Hut 3 and walk down the short gravel path to Hut 2. It was a good spot to choose - Hut 2 is where the electricians work, and they're generally focussed on what they're doing. They don't often come outside to smoke a cigarette so it's easy to slip past the doorway unnoticed.
+ Check inside -> iHopUpTheStepsAn
+ Go around the back -> iHeadOnAroundThe

= iHeadOnAroundThe
I head on around the back of the hut. The breeze-block with the cavity is on the left side.
+ Check -> noTimeToWasteIDr
+ Look around -> iPauseToGlanceAr

= iHopUpTheStepsAn
I hop up the steps and put my head inside all the same. Nobody about. Still too early in the AM for sparks, I suppose.
    -> iHeadOnAroundThe

= iPauseToGlanceAr
I pause to glance around, and catch a glimpse of movement. Someone ducking around the corner of the hut. Or a canvas sheet flapping in the light breeze. Impossible to be sure.
+ Check the breeze-block -> noTimeToWasteIDr
+ Check around the side of the hut -> butTooImportantT

= noTimeToWasteIDr
No time to waste. I drop to my knees and check the breeze-block. Sure enough, there's nothing there. /=Hooper took the bait.=/
Suddenly, there's a movement behind me. I look up to see, first a snub pistol, and then, Harris./==/
    -> chessClueQueenTo

= butTooImportantT
But too important to guess. I move back around the side of the hut.
Harris is there, leaning in against the wall. He holds a stub pistol in his hand.
    -> chessClueQueenTo

= chessClueQueenTo
"{chess clue:Queen to rook two|Messy without one missing whatever it was}," he declares. "I wouldn't have fathomed it but Hooper did. Explained it right after we sprung him doing what you're doing now. We weren't sure what to believe but now, you seem to have resolved that for us."
"Hooper said you'd told him where to look. I didn't believe him. Or, well. I wasn't sure what to believe. Now I rather think you've settled it."
+ Agree -> iHaveRatherIPutM
+ Lie -> iSpokeToRussellH
+ Evade -> harrisYoudBetter

= iHaveRatherIPutM
"I have, rather." I put my hands into my pockets. "I seem to have done exactly that."
    -> imAfraidMyLittle

= harrisYoudBetter
"Harris, you'd better watch out. He's planted a time-bomb here."
    -> harrisStaresAtMe

= iSpokeToRussellH
"I spoke to Russell. He said he saw Hooper doing something round here. I wanted to see what it was."
    -> enoughHarrisGest

= enoughHarrisGest
"Enough." Harris gestures for me to start walking. "This story couldn't be simpler. You took it to cover your back. You hid it. You lied to get Hooper into trouble, and when you thought you'd won, you came to scoop your prize. A good hand but ultimately, {secret clue:if it hadn't have been you who hid the component, then you wouldn't be here now|you told Hooper where to look with your little riddle}."
    -> End_Caught_in_AM

= harrisStaresAtMe
Harris stares at me for a moment, then laughs. "Oh, goodness. That's rich."
    -> iAlmostWishIHadA

= imAfraidMyLittle
"I'm afraid my little story about Hooper confessing wasn't true. I wanted to see if you'd go to retrieve the part." Harris gestures me to start walking. "You were close, Manning, I'll give you that. I wanted to believe you. But I'm glad I didn't."
    -> End_Caught_in_AM

= iAlmostWishIHadA
I almost wish I had a way to make the hut explode, but of course I don't.
    -> enoughHarrisGest

==== End_Caught_in_AM ====
He leads me across the yard. Back towards Hut 5 to be decoded, and taken to pieces, once again.
    -> END

==== Not_Confessing ====
"I certainly don't. But still, I'm surprised. I had Hooper down for a full-blown double agent, a traitor. He knows he'll face the rope, doesn't he?"
"Don't ask me to explain why he did what he did," Harris sighs. "Just be grateful that he did, and you're now off the hook."
Curiouser and curiouser. I nod once to Harris and slip outside into the cold morning air.
Hooper's confession only makes sense in one fashion{hooper failed clue:, and that is his being dim-witted and slow| - if I successfully implied to him that I had him framed, but he did not unpack my little clue well enough to go looking for the component. Well, I had figured him for a more intelligent opponent, but a resignation from the game will suffice}. Or perhaps he knew he would be followed if he went to check, and decided he would be doomed either way.
Hooper's confession only makes sense in one way - and that's that he believed me, and reasoned that he would be followed. So to try and uncover the component would have got him arrest, to confess was just the same. He simply caved, and threw in his hand.
    -> Outside_possibly_free

==== GoingToSeeHooper ====
"We'll be outside the door," Harris replies, seriously. "The first sign of any funny business and we'll have you both on the floor in minutes. You understand? The country needs your brain, but it's not too worried about your legs. Remember that."
Then he gets to his feet, and opens the door, and marches me out and across the yard. The evening is drawing in and there's a chill in the air. My mind is racing. I have one opportunity here - a moment in which to put the fear of God into Hooper and make him do something foolish to place himself in harm's way. But how to achieve it?
"You ready?" Harris demands.
+ Yes -> absolutely
+ No -> no
+ Lie -> absolutely

= absolutely
"Absolutely."
    -> harrisOpensTheDo

= no
"No."
    -> tooBad

= harrisOpensTheDo
Harris opens the door and pushes me inside. "Captain," he calls. "Could I have a moment?"
    -> theCaptainLookin

= tooBad
"Too bad."  <>
    -> harrisOpensTheDo

= theCaptainLookin
The Captain, looking puzzled, steps out. The door is closed. Hooper stares at me, open-mouthed, about to say something. I probably have less than a minute before the Captain storms back in and declares this plan to be bunkum.
+ Threaten him -> listenToMeHooper
+ Bargain with him -> hooperIllMakeADe
+ Plead with him -> pleaseHooperYouD

= hooperIllMakeADe
"Hooper, I'll make a deal with you. We both know what happened in that hut this afternoon. I know because I did it, and you know because you know you didn't. But once this is done I'll be rich, and I'll split that with you. I'll let you have the results, too. Your name on the discovery of the Bombe. And it won't hurt the war effort - you know as well as me that the component on its own is worthless, it's the wiring of the Bombe, the usage, that's what's valuable. So how about it?"
    -> hooperLooksBackA

= pleaseHooperYouD
"Please, Hooper. You don't understand what's at stake. They have information on me. What I've done. I don't need to tell you what I've done, you know. I know you do. And I know you think it's wrong, but please man, have a soul. They were going to ruin me. And the component - it's nothing. It's not the secret of the Bombe, or even of what we're doing here. It's just a part. The German's think it's a weapon - a missile component or a detonator. Let them have it! Please, man. Just help me."
    -> helpYouHooperSta

= listenToMeHooper
"Listen to me, Hooper. We were the only men in that hut today, so we know what happened. But I want you to know this. I put the component inside a breeze-block in the foundations of Hut 2, wrapped in one of your shirts. They're going to find it eventually, and that's going to be what tips the balance. And there's nothing you can do to stop any of that from happening."
His eyes bulge with terror. "What did I do, to you? What did I ever do?"
+ Tell the truth -> youTreatedMeLike
+ Lie -> nothingIReplyYou
+ Evade -> itDoesntMatterJu

= helpYouHooperSta
"Help you?" Hooper stares, as I have gone mad. "Help you? You're a traitor, Iain. You're a traitor. A snake in the grass. And you're /=queer=/."
+ Deny it -> imNoTraitorDamnI
+ Accept it -> iAmWhatIAmIReply
+ Evade it -> thatsNotImportan

= hooperLooksBackA
Hooper looks back at me, appalled. "You're asking me to commit treason?"
+ Yes -> yesPerhapsButAls
+ No -> noItsNotTreasonI
+ Lie -> imSuggestingYouS
+ Evade -> imSuggestingYouS

= imSuggestingYouS
"I'm suggesting you save your own skin. I've wrapped that component in one of your shirts, Hooper. They'll be searching this place top to bottom. They'll find it eventually, and when they do, that's the thing that will swing it against you. So take my advice now."
    -> ifYouThinkIllDoT

= nothingIReplyYou
"Nothing," I reply. "You're just the other man in the room. One of us has to get the blame."
    -> iGetToMyFeetAndO

= iAmWhatIAmIReply
"I am what I am," I reply. "I'm the way nature made me. But they're going to hang me unless you help me, Hooper. Don't let them hang me."
    -> assumingIWantedT

= itDoesntMatterJu
"It doesn't matter. Just remember what I said. I've beaten you, Hooper. Remember that."
    -> iGetToMyFeetAndO

= youTreatedMeLike
"You treated me like vermin. Like something abhorrent."
    -> youAreSomethingA

= imNoTraitorDamnI
"I'm no traitor, damn it. You /=know =/I'm not. How much work have I done here? Against the Germans? Cracking their codes? Understanding their secrets? I've given it my all! And you know as well as I do, if the Reich were to invade, I would be a dead man for being what I am. So please, Hooper. I'm not doing any of this lightly. But I'm in a jam!"
    -> assumingIWantedT

= yesPerhapsButAls
"Yes, perhaps. But also to ensure your name goes down in the annals of mathematics. <>
    -> allYouHaveToDoIs

= thatsNotImportan
"That's not important now. What matters is what you do, this evening.  <>
    -> allYouHaveToDoIs

= noItsNotTreasonI
"No. It's not treason. It's a trade, plain and simple."
    -> ifYouThinkIllDoT

= allYouHaveToDoIs
All you have to do is go to the back of Hut 2. There's a breeze-block with a cavity. That's where I've put it. I'll be locked up overnight, I should think. But you can pick it up and pass it to my contact. He'll be at the south fence around two AM."
    -> ifYouThinkIllDoT

= ifYouThinkIllDoT
"If you think I'll do that then you're crazy," Hooper replies. 
    -> atThatMomentTheD

= iGetToMyFeetAndO
I get to my feet and open the door of the Hut. The Captain storms back inside and I'm quickly thrown out.  <>
    -> To_Barracks

= assumingIWantedT
"Assuming I wanted to help you," he replies, carefully. "Which I don't. What would I do?"
    -> nothingAlmostNot

= youAreSomethingA
"You are something abhorrent."
    -> iWasntNotWhenICa

= nothingAlmostNot
"Nothing. Almost nothing. 
    -> allYouHaveToDoIs

= iWasntNotWhenICa
"I wasn't. Not when I came here. And I won't be, once you're gone."
    -> iGetToMyFeetAndO

= atThatMomentTheD
At that moment the door flies open and the Captain comes storming back inside.
    -> To_Barracks

==== To_Barracks ====
Harris hustles me over to the barracks. "I hope that's the end of it," he mutters as he pushes me up the steps.
"Just be sure to let him out," I reply. "And then see where he goes."
    -> Into_Barracks.andThenTheySlamT

==== Cant_help ====
"You're right." I shake my head. "You're right. I don't see how I can help you after all. So, there's only one conclusion."
"Oh, yes? And what's that?"
    -> Wont_Help

==== Open_to_Blackmail ====
"I see," Harris answers. "You've left yourself open. To pressure. Is that what you're saying?"
+ Yes -> thatsExactlyItIS
+ No -> imNotSayingAnyth
+ Evade -> youreTheOneApply
+ That's not it -> iShakeMyHeadViol

= youreTheOneApply
"You're the one applying pressure here," I answer {forceful> 1:smartly|somewhat miserably}. "I'm just waiting until you tell me what is really going on."
    -> Evidence

= imNotSayingAnyth
"I'm not saying anything of the sort," I snap back. "What is this, Harris? You're accusing me of treachery but I don't see a shred of evidence for it! Why don't you put your cards on the table?"
    -> Evidence

= iShakeMyHeadViol
I shake my head violently, to say no, that's not it, but whatever is wrong with tongue is wrong with neck too. I look across at the table at Harris' face and realise with a start how sympathetic he is. Such a kind, generous man. How can I hold anything back from him?
    -> iTakeAnotherMout

= thatsExactlyItIS
"That's exactly it," I say quietly. "Harris. You understand. There are some things... which can get a man into a lot of trouble. Things one shouldn't do."
Harris, to his credit, doesn't stiffen. He doesn't lean away, or remove his hands from the table-top as though my condition might be infectious. I thought they trained them in the army to shoot my kind on sight but he does not. 
    -> ofCourseHeDoesNo

= iTakeAnotherMout
I take another mouthful of the bitter, strange-tasting tea before answering.
    -> thatsExactlyItIS

= ofCourseHeDoesNo
Of course, he does not offer any sympathy either. He only nods, once. The understanding that has passed between us here is a mere turning cog in his calculations, with no meaning or righteousness to it.
    -> Evidence.iveSeenTheSameSt

==== Explain_Story ====
"There was a young man, Harris. I met him in the town. A few months ago now. We got to talking - not about work{forceful < 2:, you understand}. I said I was an accountant for a firm, just as I was supposed to. Although he seemed to know that wasn't true. That got me wondering if he wasn't one of us."
Harris is not letting me off any more. "You seriously considered that possibility?"
+ Yes -> yesIConsideredIt
+ No -> noNotForMoreThan
+ Lie -> iWasQuiteCertain

= noNotForMoreThan
"No. Not for more than a moment, of course. Everyone here is marked out by how little we would be willing to say about it."
    -> onlyYouToldThisY

= yesIConsideredIt
"Yes, I considered it.  <>
    -> heSeemedToKnowAl

= iWasQuiteCertain
"I was quite certain, after a while. After we'd been talking.  <>
    -> heSeemedToKnowAl

= onlyYouToldThisY
"Only you told this young man more than a little, didn't you?"
    -> iNod

= heSeemedToKnowAl
He seemed to know all about me. He... he indicated he was quite enchanted by my achievements."
The way Harris is staring at me I almost expect him to strike me, but he does not. He replies, "I can see how that must have been attractive to you," with such plain-spokeness I almost have to ask him to repeat it.
    -> ofCourseThereIsN

= iNod
I nod. " <>
    -> heSeemedToKnowAl

= ofCourseThereIsN
Of course, there is no-one else in the hut to hear the remark. He will no doubt deny it later.
+ Yes -> yesSomethingLike
+ No -> iShiftInMySeatNo
+ Lie -> iShiftInMySeatNo
+ No -> noHarrisIDontThi

= yesSomethingLike
"Yes. Something like that. It's a very lonely life otherwise. And the work we do - well. It only makes it worse. There's barely a moment to oneself."
    -> thatsHowItIsInTh

= noHarrisIDontThi
"No, Harris. I don't think you can understand."
    -> goOnWithYourConf

= iShiftInMySeatNo
I shift in my seat. "Not really. The boy was a simpleton, obviously. My intellectual inferior. His good opinion meant nothing to be. Harris, please do not misunderstand me. I was simply after his body."
    -> harrisToHisCredi1

= thatsHowItIsInTh
"That's how it is in the Service," Harris answers. "I know you didn't sign up for it but, well. There's plenty of other men who didn't who are serving now, too. Now, go on with your confession."
    -> thatGivesMePause

= harrisToHisCredi1
Harris, to his credit, doesn't flinch. Well, perhaps not: but he'll have nightmares of this moment tonight. I'm almost tempted to reach out and try to take his hand to worsen it for him, but I hold back.
    -> goOnWithYourConf

= goOnWithYourConf
"Go on with your confession," he replies.  <>
    -> thatGivesMePause

= thatGivesMePause
That gives me pause, for a moment. I hadn't thought of it as such. But I suppose that's what this is. I am about to admit what I did, after all.
I shrug. 
"There's not much else to say. I took the part from Bombe computing device. You seem to know that already. I had to. He was going to expose me if I didn't."

==== So_blackmail ====
"This young man was blackmailing you over your affair?"
As Harris speaks I find myself suddenly sharply aware, as if waking from a long sleep. The table, the corrugated walls of the hut, everything seems suddenly more tangible than a moment before. /=Perhaps whatever it was they put in my drink is wearing off?=/
+ Say yes -> yesISupposeHeWas
+ No, that's not right -> noHarrisTheYoung
+ Tell the truth -> yesISupposeHeWas
+ Lie -> noHarrisTheYoung

= yesISupposeHeWas
"Yes. I suppose he was their agent. I should have realised but I didn't. Then he threatened to tell you. I thought you would have me locked up: I couldn't bear the thought of it. I love working here. I've never been so happy, so successful, anywhere before. I didn't want to lose it."
    -> soWhatDidYouDoWi

= noHarrisTheYoung
"No, Harris. The young man wasn't blackmailing me." I take a deep breath. "It was Hooper."
"Hooper!" Harris exclaims, in surprise.
    -> nowLookHereHarri

= soWhatDidYouDoWi
"So what did you do with the component?" Harris talks urgently. He grips his gloves tightly in one hand, perhaps prepared to lift them and strike if it is required. "Have you passed it to this man already? Have you left it somewhere for him to find?" 
+ I still have it -> iStillHaveItNotO
+ I don't have it -> iDontHaveItAnyMo
+ Lie -> iDontHaveItAnyMo
+ Tell the truth -> iStillHaveItNotO

= iStillHaveItNotO
"I still have it. Not on me, of course.  <>
    -> Tell_us_where.theMissingCompon

= nowLookHereHarri
"Now look here," Harris interrupts. "Don't start that again."
    -> ItsTheTruthHarri

= iDontHaveItAnyMo
"I don't have it any more. I passed it through the fence to my contact straight after taking it, before it was discovered to be missing. It would have been idiocy to do differently. It's long gone, I'm afraid."
"You fool, Manning," Harris curses, getting quickly to his feet. "You utter fool. Do you suppose you will be any better off living under Hitler? It's men like you who will get us all killed. Men too feeble, too weak in their hearts to stand up and take a man's responsibility for the world. You're happier to stay a child all your life and play with your little childish toys."
+ Answer back -> reallyCommanderI
+ Say nothing -> iSayNothingItsTr

= ItsTheTruthHarri
 "It's the truth, Harris. If I'm going to jail, then so be it, but I won't hang at Traitor's Gate. Hooper was the one who told the boy about our work. Hooper put the boy on to me. {forceful < 2:I should have realised, of course. These things don't happen by chance. I was a fool to think they might.} And then, once he had me compromised, he demanded I steal the part from the machine."
    -> whichYouDidHarri

= reallyCommanderI
"Really, Commander," I reply. "It rather sounds like you want to spank me."
    -> forGodsSakeHeDec

= whichYouDidHarri
"Which you did." Harris leans forward. "And then what? You still have it? You put it somewhere?"
+ Yes -> yesIDidntHaveLon
+ No -> noIPassedItOnToH
+ Lie -> noIPassedItOnToH
+ Evade -> iCantRemember

= iSayNothingItsTr
I say nothing. It's true, isn't it? I can't deny that I know there is a world out there, a complicated world of pain and suffering. And I can't deny that I don't think about it a moment longer than I have to. What use is thinking on a problem that cannot be solved? It is precisely our ability to avoid such endless spirals that makes us human and not machine.
    -> godHaveMercyOnYo

= noIPassedItOnToH
"No. I passed it on to Hooper."
    -> iSeeAndWhatDidHe

= forGodsSakeHeDec
"For God's sake," he declares with thick disgust, then swoops away out of the room.  <>
    -> Alone_about_to_die

= yesIDidntHaveLon
"Yes. I didn't have long, but I had long enough.  <>
    -> Tell_us_where.theMissingCompon

= iCantRemember
"I can't remember."
    -> heDrawsHisGunAnd

= godHaveMercyOnYo
"God have mercy on your soul," Harris says finally, as he gets to his feet and heads for the door. "I fear no-one else will."  <>
    -> Alone_about_to_die

= iSeeAndWhatDidHe
"I see. And what did he do with it?"
+ Evade -> iDontKnow
+ Tell the truth -> iDontThinkHooper
+ Lie -> imSureISawHimThi

= heDrawsHisGunAnd
He draws his gun and lays it lightly on the field table.
    -> imSorryToThreate

= iDontKnow
"I don't know."
    -> youCanDoBetterTh

= iDontThinkHooper
"I don't think Hooper could have planned this in advance. So he'd need to get word to whoever he's working with, and that would take time. So I think he would have hidden it somewhere, and be waiting to make sure I soundly take the fall. That way, if anything goes wrong, he can arrange for the part to be conveniently re-found."
    -> makesSenseHarris

= imSorryToThreate
"I'm sorry to threaten you, friend. But His Majesty needs that brain of yours, and that brain alone. There are plenty of other parts to you that our country could do better without. Now I'll ask you again. Did you hide the component?"
+ Yes -> yesIDidntHaveLon
+ No -> veryWellThenISwa
+ Lie -> veryWellThenISwa
+ Evade -> iDontHaveItAnyMo

= imSureISawHimThi
"I'm sure I saw him this evening, talking to someone by the fence on the woodland side of the compound. He's probably passed it on already. You'll have to ask him."
    -> Wont_Help.harrisHarrumphsH

= veryWellThenISwa
"Very well then." I swallow nervously, to make it look more genuine.  <>
    -> noIPassedItOnToH

= youCanDoBetterTh
"You can do better than that. Remember, there's a hangman's noose waiting for traitors."
+ Theorise -> wellThenIAnswerN
+ Shrug -> Wont_Help

= makesSenseHarris
"Makes sense," Harris agrees, cautiously. {evasive> 1:I can see he's still not entirely convinced by my tale, as well he might not be - I've hardly been entirely straight with him.|I can see he's still not certain whether he can trust me.} "Which means the question is, what can we do to rat him out?"
+ Offer to help -> maybeICanHelpWit
+ Don't offer to help -> iLeanBack

= wellThenIAnswerN
"Well, then," I answer, nervously. "What would he do? Either get rid of it straight away - or if that wasn't possible, which it probably wouldn't be, since he'd have to arrange things with his contacts - so most likely, he'd hide it somewhere and wait, until you had the rope around my neck and he could be sure he was safe."
    -> makesSenseHarris

= iLeanBack
I lean back.  <>
    -> Wont_Help

= maybeICanHelpWit
"Maybe I can help with that."
"Oh, yes? And how, exactly?"
+ "I'll talk to him." -> illTalkToHim
+ "We'll fool him." -> wellFoolHimHesWa

= wellFoolHimHesWa
"We'll fool him. He's waiting to be sure that I've been strung up for this, so let's give him what he wants. If he sees me taken away, clapped in irons - he'll go straight to that component and set about getting rid of it."
    -> Past_Hooper

= illTalkToHim
"I'll talk to him."
"What?"
    -> Every_minute_counts.putMeInWithHoope

==== Wont_Help ====
"It's your problem. Your security breach. So much for your careful vetting process." I lean back in my chair and fold my arms so the way they shake will not be visible. "You'd better get on with solving it, instead of wasting your time in here with me."
    -> harrisHarrumphsH

= harrisHarrumphsH
Harris harrumphs. He's thinking it all over.
+ Wait -> allRightHeDeclar
+ Wait -> noHarrisDeclares

= noHarrisDeclares
"No," Harris declares, finally. "I think you're lying about Hooper. I think you're a clever, scheming young man - that's why we hired you - and you're looking for the only reasonable out this situation has to offer. But I'm not taking it. We know you were in the room with the machine, we know you're of a perverted persuasion, we know you have compromised yourself. There's nothing more to say here. Either you tell me what you've done with that component, or we will hang you and search just as hard. It's your choice."
    -> heGetsToHisFeetA

= allRightHeDeclar
"All right," he declares, gruffly. "We'll try it. But if this doesn't work, I might just put the both of you in front of a firing squad and be done with these games. Worse things happen in time of war, you know."
"Alone," I add.
    -> alone

= heGetsToHisFeetA
He gets to his feet, and gathers his gloves from the table top.
He passes a hand across his eyes with a long look of despair.
    -> imGoingToGoOutsi

= alone
"Alone?"
    -> alone1

= imGoingToGoOutsi
"I'm going to go outside and organise a rope. That'll take about twelve minutes. That's how long you have to decide."
+ Protest -> youCantDoThisICr
+ Confess -> iNodIDontNeedTwe
+ Stay silent -> Tell_us_where.iSayNothingMyLip
+ Show him the component -> iDontNeedTwelveM
+ Confess -> iDontNeedTwelveM1
+ Frame Hooper -> lookIKnowWhereIt

= alone1
"Alone."
    -> harrisConsidersI

= iDontNeedTwelveM1
"I don't need twelve minutes. The component is in the long grass behind Hooper's tent. I threw it there hoping to somehow frame him, but now I see that won't be possible. I was naive, I suppose."
    -> Tell_us_where.indeedYouWereAnd

= iNodIDontNeedTwe
I nod. "I don't need twelve minutes.  <>
    -> Tell_us_where.theMissingCompon

= youCantDoThisICr
"You can't do this!" I cry. "It's murder! I demand a trial, a lawyer; for God's sake, man, you can't just throw me overboard, we're not barbarians...!"
    -> youLeaveMeNoChoi

= harrisConsidersI
Harris considers it. I watch his eyes, flicking backwards and forwards over mine, like a ribbon-reader trying to load in its program.
+ "Well?" -> well
+ "For God's sake, man, what do you have to lose?" -> forGodsSakeManWh

= lookIKnowWhereIt
"Look, I know where it is. The missing piece of the Bombe is in the long grasses behind Hooper's tent. I saw him throw it there right after we finished work. He knew you'd scour the camp but I suppose he thought you'd more obvious places first. I suppose he was right about that. Look there. That /=proves=/ his guilt."
    -> thatDoesntProveA

= iDontNeedTwelveM
"I don't need twelve minutes. Here it is."
    -> iOpenMyJacketAnd

= well
"Well?"
    -> GoingToSeeHooper

= thatDoesntProveA
"That doesn't prove anything," Harris returns sharply. "But we'll check what you say, all the same." He gets to his feet and heads out of the door.
    -> Alone_about_to_die

= iOpenMyJacketAnd
I open my jacket and pull the Bombe component out of my pocket. Harris takes it from me, whistling, curious.
    -> wellIllBeThatsIt

= youLeaveMeNoChoi
"You leave me no choice," Harris snaps back, eyes cold as gun-metal. "You and your damn cyphers. Your damn clever problems. If men like you didn't exist, if we could just all be /=straight=/ with one another." He gets to his feet and heads for the door. "I fear for the future of this world, with men like you in. Reich or no Reich, Mr Manning, people like you simply /=complicate=/ matters."
    -> Alone_about_to_die

= forGodsSakeManWh
"For God's sake, man, what do you have to lose?"
    -> GoingToSeeHooper

= wellIllBeThatsIt
"Well, I'll be. That's it all right."
"That's it."
"But you didn't have it on you yesterday."
+ Explain -> iClimbedOutOfThe
+ Don't explain -> noIDidnt

= iClimbedOutOfThe
"I climbed out of the window overnight," I explain. "I went and got this from where it was hidden, and brought it back here."
    -> Returned_Component

= noIDidnt
"No. I didn't."
    -> Returned_Component

==== Returned_Component ====
"This is all too far-fetched," Harris says. "I'm glad to have this back, but I need to think."
Getting to his feet, he nods once. "You'll have to wait a little longer, I'm afraid, Manning."
Then he steps out of the door, muttering to himself.
+ Make your peace -> Alone_about_to_die.iHaveNoGodToMake

==== Alone_about_to_die ====
{with capn:The Commander holds the door for his superior, and follows him out.} Then the door closes. I am alone again, as I have been for most of my short life.
+ Make your peace -> iHaveNoGodToMake

= iHaveNoGodToMake
I have no God to make peace with. I find it difficult to believe in goodness of any kind, in a world such as this. 
But I am no traitor. At least, not to my country. To my sex, perhaps. But how could I support the Reich? If it were to come to power, I would be worse off than under the already dire circumstances of my existence.
In truth, it is men like Harris who are complex, not men like me. I live to make things ordered, systematic. I like my pencils sharpened and lined up in a row. I do not deal in difficult borders, or uncertainties, or alliances. If I could, I would reduce the world to something easier to understand, something finite. But of course, I cannot, not even here, in this little micro-world, this safe haven from the horrors of the war.
I have no place here. No way to fit. I am the intercept - caught, in the middle, cryptic and understood only thinly, through devices and machines.  
+ You seem very calm -> Hanging_Epilogue
+ You should try to escape! -> noIAmContent

= noIAmContent
No, I am content.  <>

==== Hanging_Epilogue ====
I suppose I do not believe they will hang me. They will lock me up and continue to use my brain, if they can. I wonder what they will tell the world - perhaps that I have taken my own life. That would be simplest. The few who know me would believe it.
Well, then. Not a bad existence, in prison. Removed from temptation. A kind of imposed monasticism, with plenty more problems to solve, and more mysteries to fathom. 
I wonder what else I might yet unravel before I'm done?
+ The door is opening -> thatIsHarrisRetu

= thatIsHarrisRetu
That is Harris returning. Our little computation here is complete. {not piece returned:I only hope one of the others will be able to explain to him that the part I stole will mean nothing to the Germans.}
That is the true secret of the calculating engine, and the source of its power: not in the components themselves, but in how they are wired together. The diversity of patterns and structures they can form. Much like people - it is how they connect that determines our victories and tragedies, and not their genius.
Which makes me wonder. Should I give {admit young man:up my beautiful young man|the young man who put me in this spot} to them as well as myself?
+ Yes -> butOfCourseIWill
+ No -> noWhatWouldBeThe
+ Lie -> noWhyWouldIHeIsN
+ Evade -> itDependsPerhaps

= noWhatWouldBeThe
No. What would be the use? He will be long gone, and the name he told me is no doubt hokum. No: I was alone before in guilt, and I am thus alone again.
    -> End_in_Cuffs

= butOfCourseIWill
But of course I will. {forceful > 2:Perhaps I can persuade them to put him in my cell.|A little vengeance, disguised as doing something good.}
    -> End_in_Cuffs

= itDependsPerhaps
It depends, perhaps, on what his name his worth. If it were to prove valuable, well; perhaps I can concoct a few more such lovers with which to ease my later days.
    -> hooperPerhapsHeW

= noWhyWouldIHeIsN
No. Why would I? He is no doubt an innocent himself, trapped by some dire circumstance. Forced to act the way he did. I have every sympathy for him.
Of course I do.
    -> End_in_Cuffs

= hooperPerhapsHeW
Hooper, perhaps. He wouldn't like /=that=/.
    -> End_in_Cuffs

==== End_in_Cuffs ====
Harris put the cuffs around my wrists. "I still have the intercept in my pocket," I remark. "Wherever we're going, could I have a pencil?"
"We recovered the part, just where you said it was," Harris reports, as he puts the cuffs around my wrists. "Of course, a couple of the men swear blind they searched there yesterday, so I'm afraid, what with the broken window... we've formed a perfectly good theory which doesn't bode well for you."
"I see." It doesn't seem worth arguing any further. "I still have the intercept in my pocket," I remark. "Wherever we're going, could I have a pencil?"
He looks me in the eye.
"Certainly. And one of your computing things, if I get my way. And when we're old, and smoking pipes together in The Rag like heroes, I'll explain to you the way that decent men have affairs.  <>
"I'll give you a stone to chisel notches in the wall. And that's all the calculations you'll be doing. And as you sit there, pissing into a bucket and growing a beard down to your toes, you have a think about how a /=smart=/ man would conduct his illicit affairs. With a bit of due decorum you could have learnt off any squaddie. <>
You scientists." He drags me up to my feet. "You think you have to re-invent everything."
With that, he hustles me out of the door and I can't help thinking that, with a little more strategy, I could still have won the day. But too late now, of course.
    -> END