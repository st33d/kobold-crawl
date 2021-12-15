=== center
<- title("The Center", center)
{-> enter | -> returning}

= enter
You enter the center of the labyrinth.
The ground is covered in small flat pebbles, dotted with large smooth boulders that come up to your knees.
As foretold there is a large tree. It is either petrified or carved out of stone, you cannot tell which. Its boughs appear weighed down by its fruit - golden apples. You reach up and pluck one of the fruit with a twist of your hand. You hear a sharp crack as stem of stone breaks. Then you put it in your bag.
There's a stone bench here, of the sort with a back rest that one would see in a park. A metal lunch box sits on it. The bench bears a plaque that says:
<i>Take a break, you've earned it.</i>
You're not entirely sure if this message is for you, or if it's a trick. You open the lunch box, inside you find a cheese sandwich.
~ inventory += golden_apple
<- opt
-> navigate

= returning
You return to the center of the labyrinth. {inventory ? another_apple:{You consider taking a third apple but you're in enough trouble already.|}}
<- opt
-> navigate

= opt
* [Take a break.]-> break_time
* [Take another apple.]
    ~ inventory += another_apple
    ~ changeRooms()
    You reach up and snap another apple from the tree. They said you could keep what you found and there's room in your knapsack for another.
    In the distance you hear the rough grinding of stone. Through the entrance you see the walls shift and lock into a new position. The labyrinth has changed. Perhaps you shouldn't have done that.
    You bag the apple. What's done is done.
    <- opt
    -> navigate

= break_time
You sit down and take a well deserved rest. Even going so far as to eat the cheese sandwich. It's surprisingly good.
{
    - stamina < STAMINA_TOTAL:
        ~ gainStamina(STAMINA_TOTAL)
}
~ inventory += multipass
~ lucky = true
After some minutes pass you're startled by a visitor. A Maze Builder of Kreik emerges from a nearby wall, moving through the stone as if wading through a shallow pool.
Like the others you've seen, this one has two long arms and two shorter arms about its ribs. It stands on two longs legs with two shorter legs emerging from its hips, the latter gently kick the air as it walks. It has red scaly skin and looks down on your with two pairs of eyes.
You feel a bit embarrassed at having been caught slacking off.
* [Apologise.]
    You open your mouth to apologise but the Maze Builder raises a hand to shush you. It's kind look twlls you there is nothing to be sorry for, you made it to the center after all.
* [Present {inventory ? another_apple:a|the} golden apple.]
    You take out {inventory ? another_apple:a|the} golden apple to show the Maze Builder. It raises a hand and gives you a look that says, yes you've gotten to the center.
-
The Maze Builder picks up a handful of pebbles from the floor and they melt in its hand. They reform into an obsidian tablet hanging from what appears to be a lanyard made of grey materials. It hands the object to you.
- (pass)
* [Examine the object.]
    You appraise your gift. The lanyard feels cold, it must be made of stone yet the ribbon moves like cloth. The obsidian tablet has an engraved illustration of a kobold on it. It looks a lot like you. Below it are etched runes that give off a faint red glow.
    The thing oozes authority.
    -> pass
* "Thanks[."]", you say.
    The Maze Builder simply nods. It looks about for a second and breathes a dissappointed sigh. Clearly this maze is not deadly enough.
    -> pass
* ->
-
The creature turns from you then and gestures back into the labyrinth, your task is only half done. Then it walks back into the walls, its lesser arms and legs appearing to pull aside some inner fabric of the rock to allow it to pass.
You're left to alone to plan your route back.
<- opt
-> navigate
