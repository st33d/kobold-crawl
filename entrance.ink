=== entrance
{-> enter | -> returning}

= enter
<hr>
<center><h3>How to Play</h3></center>
This is a "depth crawl". You only <i>go deeper</i> into the maze or <i>go back</i>. Each step deeper chooses a room at random, and each step deeper increases the chance of finding the center.

You have {stamina} points of Stamina, be careful not to lose them all.

Sometimes a choice may have a chance of success.
~temp chance = 50
+ [I understand. (%{chance})]
    <- rollChance(chance)
    {
    - isSuccess:You succeeded at understanding. Let's begin.
     -> story
    - else: -> sure
    }

= sure
You failed. Are you sure you sure you understand?
+ [Yes.]
    You understand. Let's begin.
    -> story

= story
<hr>
<center><h3>Kobolds</h3></center>
The kobolds of your tribe look like {~humanoid dragons, though three feet tall and without the wings|short scaly dog people}. You are indentured to Maze Builders of Kreik who use your kind to lay their bricks, guard their treasures, and test their traps. Your job is the last of these.
+ [So it goes.]
-
<hr>
<center><h3>Entrance</h3></center>
You stand at the entrance of a labyrinth. Your task is to get to the center, take a golden apple from the tree therein, and bring it back. You are allowed to keep any gold or treasures you find along the way as payment. A knapsack hangs from your shoulder to keep them in.
Future victims are expected to be armed, so you have been given a spear to add realism to your death.
-> navigate

= returning
<- title("Entrance", entrance)
You return to the entrance of the labyrinth.
{
    - inventory ? bird: {A small yellow bird flies out of the maze. You watch it disappear into the caverns, not knowing if it will return.|}
}
{
    - inventory ? golden_apple:-> win
    - else:<- sentry
}
-> navigate

= sentry
{
    - advice:The guard gives you a polite nod.
    - else:{A tall kobold wielding an axe stands watch.|The sentry frowns at your return.}
}
-> sentry_opt

= sentry_opt
* "Can I go now?"[] you ask.
    "Not without proof you've solved the labyrinth", they reply. And they rap the floor with the butt of their large axe handle to add punctuation to their command.
    <- sentry_opt
    -> navigate
* (advice)"Any advice?"[] you ask.
    ~ wisdom++
    "Hrmm..." The guard thinks this over, as if unsure it's appropriate. But then they shrug, you are a fellow kobold after all. "Well, you'll end up in trouble if you investigate everything - but you'll find shortcuts between rooms if you do. It will get you to the center quicker."
    The guard taps its snout as it says the last bit.
    <- sentry_opt
    -> navigate
* (extra){advice}"Anything else?"[] you ask once more.
    "Yeah, just one thing", they reply, "the builders said that some stuff in there can make you lucky for a while, at least until the next time your luck is tested."
    <- sentry_opt
    -> navigate
* {extra}"Thanks for the advice[."]", you say.
    The sentry gives you a wink in reply.
    ~ lucky = true
    <- sentry_opt
    -> navigate

= promoted
They spot the tablet hanging from your neck. "Crikey! They gave you a promotion{advice:. Just you remember who helped you on the way up}."
+ {advice}"I will[."]", you reply.
    The guard gives a nod. Satisfied that kobolds look out for one another.->->
+ [Look smug.]
    You beam self-satisfaction at the guard. You've earned it.->->

= win
The sentry outside presents their axe to bar you passage, but you present {inventory ? another_apple:a|the} golden apple. {inventory ? another_apple:(They don't need to know about the other one you're carrying.)}
"Wow, good work!" they say. You sense some racial pride coming through as they appraise you and glance at the foreboding labyrinth. "Was it difficult?"
+ "Yes[."]", you say.
    The guard looks impressed.
+ "No[."]", you say.
    "Well, maybe you got lucky", they say, then they lean closer and add, "or maybe they underestimate kobolds around here." They give you a conspiratorial wink.
+ "Sometimes[."], you say.
    The guard gives you a sympathetic look.
-
{
    - inventory ? multipass:-> promoted ->
}
-
You make your way from the maze back to the caves where your kind eat, rest, and persue merriment.
{
    - gold <= 5:You've not earned much coin, but your conquering the labyrinth should earn you a few favours around here. {inventory ? another_apple:Perhaps you should sell one of these golden apples.}
    - gold <= 12:You're carrying enough coin to go on a sabbatical. Perhaps you could persue a less dangerous line of work when you return.
    - else:Your bag is heavy with gold coins. You could easily retire if you chose to spend it wisely.
}
{
    - inventory ? multipass:And the tablet rests heavy from your neck. Who knows what doors it will open. Perhaps you could start making some changes around here.
}
As you enter the caves another kobold passes you. They hold a spear just like yours and an empty knapsack hangs from their shoulder. You exchange a glance and they look down at your own bulging bag.
They walk onwards to the labyrinth, standing a little taller than before.
{
    - inventory ? bird:As you see them leave a small yellow bird lands on your shoulder.
}
+ [The end.]<center><b>THE END</b></center>
-
<hr>
You left the labyrinth with:
{stamina} stamina point{stamina != 1:s}.
{gold} gold coin{gold != 1:s}.
{
    - inventory ? quaid_coin:(2 of them are quaid doubloons.)
}
{
    - pixel_gold > 0:({pixel_gold} of them are pixelated.)
}
{
    - inventory ? another_apple:2 golden apples.
    - else: A golden apple.
}
{
    - inventory ? multipass:An all-labyrinths VIP pass.
}
{
    - inventory ? bird:A canary.
}
{
    - inventory ? nim_stone:A stone.
}
{
    - inventory ? glass_eye:A lucky glass eye.
}
{
    - inventory ? cursed_ring:A cursed magic ring.
}
{
    - inventory ? falconsloth_blue:A blue-shifted falconsloth feather.
    - inventory ? falconsloth_red:A red-shifted falconsloth feather.
}
{
    - inventory ? pinch_of_salt:A pinch of salt.
}
And was enlightened {wisdom} time{wisdom != 1:s}.
<hr>
Thank you for playing.
+ [Reset Game]
    #RESTART
    -> END
