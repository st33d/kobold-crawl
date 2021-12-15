=== entrance
{-> enter | -> returning}

= enter
This is a "depth crawl". You only <i>go deeper</i> into the maze or <i>go back</i>. Each step deeper chooses a room at random, and each step deeper increases the chance of finding the center.

You have {stamina} points of Stamina, be careful not to lose them all.

Sometimes a choice may have a chance of success.
~temp chance = 50
+ [I understand (%{chance})]
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
<h1>\*</h1>
The kobolds of your tribe look like {~humanoid dragons, though three feet tall and without the wings|short scaly dog people}. You are indentured to Maze Builders of Kreik who use your kind to lay their bricks, guard their treasures, and test their traps. Your job is the last of these.
+ [So it goes.]
-
<hr>
<h3>Entrance</h3>
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

= win
You've won.

You left the labyrinth with:
{stamina} stamina point{stamina != 1:s}.
{gold} gold coin{gold != 1:s}.
{
    - inventory ? another_apple:2 golden apples.
    - else: A golden apple.
}
{
    - inventory ? multipass:An all-labyrinths VIP pass.
}
{
    - inventory ? canary:A canary.
}
And was enlightened {wisdom} time{wisdom != 1:s}.

Thank you for playing.
-> END
