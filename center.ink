=== center
<- title("The Center", center)
{-> enter | -> returning}

= enter
You enter the center of the labyrinth.
The ground is covered in small flat pebbles, dotted with large smooth boulders that come up to your knees.
As foretold there is a large tree. It is either petrified or carved out of stone, you cannot tell which. Its boughs appear weighed down by its fruit - golden apples. You reach up and pluck one of the fruit with a twist of your hand. You hear a sharp crack as stem of stone breaks. Then you put it in your bag.
There's a stone bench here, of the sort with a back rest that one would see in a park. A metal lunch box sits on it. The bench bears a plaque that says:
<i>Take a break, you've earned it.</i>
You're not entirely sure if this message is for you, or if it's a trick. You open the lunch box and inside you find a cheese sandwich and what looks like a healing potion.
~ inventory += golden_apple
<- opt
-> navigate

= returning
You return to the center of the labyrinth.
<- opt
-> navigate

= opt
* [Take a break.]-> break_time
* [Take the potion.]
    ~ inventory += potion
    You pick up the potion and examine it further, uncorking it and testing it with a claw. After tasting a tiny bit you're sure it's a healing potion.
    You put it in your bag.
    <- opt
    -> navigate

= break_time
You sit down and take a well deserved rest. Even going so far as to eat the cheese sandwich. It's surprisingly good.
{
    - stamina < STAMINA_TOTAL:
        ~ gainStamina(STAMINA_TOTAL)
}
After some minutes pass you are startled by a visitor. A Maze Builder of Kreik emerges from a nearby wall, moving through the stone as if wading through a shallow pool.
Like the others you've seen, this one has two long arms and two shorter arms about its ribs. It stands on two longs legs with two shorter legs emerging from its hips, the latter gently kick the air as it walks. It has red scaly skin and looks down on your with two pairs of eyes.
You feel a bit embarrassed at having been caught slacking off.
* [Apologise.]
    You open your mouth to apologise but the Maze Builder raises a hand to shush you. It's kind look twlls you there is nothing to be sorry for- you made it to the center after all.
* [Present the golden apple.]
    You take out the 
-
-> navigate