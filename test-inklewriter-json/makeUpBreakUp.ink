// ---- Make-up or Break-up? ----
// Converted from original inklewriter URL:
// http://writer.inklestudios.com/stories/zrbj
# title: Make-up or Break-up?
# author: inkle
// -----------------------------

VAR dont_trust = false

-> Start


==== Start ====
"I'm glad you could make it. I didn't think... I didn't think you were coming."
  + ["Of course I was coming."] -> yeahYoureRightIS
  + ["I'm sorry, I know I'm late."] -> thatsOkayYoureHe

= yeahYoureRightIS
"Yeah, you're right. I shouldn't have worried. Only,  <>
    -> iKnowIYoureAngry

= thatsOkayYoureHe
"That's okay. You're here now. I just...  <>
    -> iKnowIYoureAngry

= iKnowIYoureAngry
I know... I you're angry with me. And it's all a misunderstanding. You know that, right? All of this is one big mistake. I know what you heard but it isn't true. I've never been unfaithful to you. You've got to believe that's true."
  + ["Of course it is."] -> youThinkSoNoYouD
  + ["I'm not sure of that at all."] -> Dont_trust_me
  + ["You can certainly talk, can't you?"] -> whatDoYouMeanWha

= youThinkSoNoYouD
"You think so? No, you don't. You're just saying that. You'd say whatever to make sure I don't cry, wouldn't you? That's why you wanted to meet here. Somewhere <em>public</em>, so I wouldn't cry. Well, bad luck. If you're horrible to me I won't be able to stop myself and then everyone in this bar will be looking at you like you're a criminal."
  + ["I'm not the one who's done anything wrong."] -> Dont_trust_me
  + ["You can cry all you like."] -> ohGodHowDidIEndU
  + ["I won't be horrible. I just need to know the truth."] -> Dont_trust_me

= whatDoYouMeanWha
"What do you mean? What else can I do?"
  + ["You can tell me the truth."] -> Dont_trust_me
  + ["There's nothing you can do."] -> Dont_trust_me

= ohGodHowDidIEndU
"Oh, God. How did I end up like this? I should never have let myself get dependent on you. I had a good job, I had friends, and now what have I got? You've broken me in two, and now you don't even trust me."
  + ["I do trust you."] -> doYouYouShouldYo
  + ["You're too good a liar."] -> amIIGuessIllHave

= amIIGuessIllHave
"Am I? I guess I'll have to be happy with that, won't I? It's the closest thing to compliment I'm likely to get here. But you know what? You're paranoid.  <>
    -> Dont_trust_me.NothingHappenedN

= doYouYouShouldYo
"Do you? You should, you know.  <>
    -> Dont_trust_me.NothingHappenedN

==== Dont_trust_me ====
  ~ dont_trust = true
"So you don't trust me. After everything, you still don't. How long have we known each other? How long were we... I don't know. Is there anything I could have done to make you trust me?"
  + ["You could have kept that trust."] -> iDidIDidOnlyYouD
  + ["You could have told me yourself."] -> toldYouWhatThere
  + ["I don't know. I just don't know."] -> iNeverWantedToHu

= iDidIDidOnlyYouD
"I did. I did, only you don't believe me. Please. Look me in the eyes.  <>
    -> NothingHappenedN

= iNeverWantedToHu
"I never wanted to hurt you. You must know that, at least."
  + ["I can't be sure."] -> How_could_you_ever_know
  + ["Then at least apologise."] -> iCantApologiseIC
  + ["I believe you."] -> youDoMaybeYouDoI

= toldYouWhatThere
"Told you what? There's nothing to tell. <>
    -> NothingHappenedN

= iCantApologiseIC
"I can't apologise. I can't, because I didn't do anything wrong."
  + ["I believe you."] -> youDoMaybeYouDoI
  + ["How can I know that for sure?"] -> How_could_you_ever_know

= NothingHappenedN
 Nothing happened. Nothing!"
  + ["I can't be sure of that."] -> How_could_you_ever_know
  + ["I believe you."] -> youDoMaybeYouDoI

= youDoMaybeYouDoI
"You do? Maybe you do. I can't tell any better than you can tell about me. <>
    -> How_could_you_ever_know.thatsTheStupidTh

==== How_could_you_ever_know ====
"How could you <em>ever</em> know for sure? Of course you can't.  <>
    -> thatsTheStupidTh

= thatsTheStupidTh
That's the stupid thing about all this. You can't ever know for certain, no matter what anyone tells you. There's no way to prove what happened in that room. There never will be. 
"It all comes down to <em>now</em>. What you see when you look in my eyes. Do you see a liar and a cheat, or do you see your friend? Your very best friend? Look me in the eyes, now. Tell me what you see."
  + ["Don't make this about me."] -> butItIsAboutYouI
  + ["I see..."] -> whatDoYouSeeLook

= whatDoYouSeeLook
"What do you see? Look. What do you see?"
  + ["I see you'd say anything."] -> dontSayThatDontS
  + ["You must be telling the truth."] -> Precious
  + ["It doesn't matter what I see."] -> How_could_it_not_matter

= butItIsAboutYouI
"But it <em>is</em> about you. It's about whether you trust me, or not. That's /=all=/ it's about. It's not even about what I've done. I haven't done anything, but that doesn't matter. All that matters is what you believe about me."
  + ["I believe you'd say anything."] -> dontSayThatDontS
  + {not dont_trust} ["I trust you."] -> Precious
  + ["We're over. It's as simple as that."] -> Over
  + ["How can I trust you?"] -> iDontKnowIDontKn

= iDontKnowIDontKn
"I don't know. I don't know how anyone can trust anyone. You just have to try, I suppose. You have to want to. Do you want to?"
  + ["Yes."] -> Precious
  + ["No."] -> Over
  + ["That's not enough."] -> whatDoYouMean

= dontSayThatDontS
"Don't say that. Don't say that. If you say that, I can't ever change your mind. You won't ever be able to trust me again."
  + ["That doesn't matter."] -> How_could_it_not_matter
  + ["No, I won't."] -> Over

= whatDoYouMean
"What do you mean?"
  + ["We're over. I'm here to tell you that."] -> Over
  + ["You have to be more careful."] -> youreRightYoureR

= youreRightYoureR
"You're right. You're right, I suppose. If you can't know what I've done... then I have to be more than good. I have to appear to be good as well. And so do you. We can try, can't we? Try to be honest, and look honest, at the same time?"
  + ["It's too much to ask."] -> Over
  + ["We can try."] -> Precious

==== Over ====
"I see. I see. Well, it seems your mind is made up. Thank you for coming to tell me yourself."
  + ["You won't see me again."] -> thenThisIsHowYou
  + ["I had to see you once more."] -> thenThisIsHowYou

= thenThisIsHowYou
"Then this is how you can remember me. As someone you didn't know. That you never really knew, and you never trusted. I hope you enjoy the memory."
  + [...] -> The_End

==== How_could_it_not_matter ====
"How could it not matter?"
  + ["We're over. It's that simple. I came to say goodbye."] -> Over
  + ["I can't ever know. I'll just have to trust you."] -> butYouWillIMeanY

= butYouWillIMeanY
"But you will? I mean, you'll try?"
  + ["I'll try."] -> allRightThatsThe
  + ["I do. It's too late for me."] -> Precious

= allRightThatsThe
"All right. That's the best we can do. And I'll try too.  <>
    -> My_Darling

==== My_Darling ====
My darling. 
    -> Precious.whereWouldIBeWit

==== Precious ====
"Oh. Precious. Okay. Okay. I'll live up to that, I will. I mean, I'll try to, but I will. Oh, God. I thought maybe you would go. I thought maybe you'd made your mind up to go already..."
  + ["Not today."] -> dontSayThatSayNe
  + ["Never."] -> never

= never
"Never.  <>
    -> My_Darling

= dontSayThatSayNe
"Don't say that. Say <em>never</em>.  <>
    -> My_Darling

= whereWouldIBeWit
"Where would I be without you?"
  + [Don't answer that] -> aSilentSmileANod
  + [Answer] -> aFingerOnYourLip

= aFingerOnYourLip
<em>A finger on your lips.</em>
    -> shhDontSpoilIt

= aSilentSmileANod
<em>A silent smile. A nod.</em>
    -> goodIdeaDontSpoi

= shhDontSpoilIt
"Shh. Don't spoil it."<em></em>
  + [...] -> The_End

= goodIdeaDontSpoi
"Good idea. Don't spoil it."<em></em>
  + [...] -> The_End

==== The_End ====
<em>Curtain falls</em>
    -> END