=== mist
<- title("Mist", mist)
{-> enter | -> returning}

= enter
In this room hangs a smoky green mist. It stays its position in a lazy cyclone that bids you walk through it to progress.-> opt

= opt
~ chance_1 = 60
+ {stamina > 1} [Try to blow or fan the mist away. (-1 stamina)]-> clear_mist
+ [Hold your breath and walk through mist. (%{chance_1})]-> hold_breath
+ [{backtrack()}]-> go_direction(-1)
+ {inventory ? multipass}[Brandish your pendant.]
    You hold up the pendant the Maze Builder gave you. The mist seems to flow away from  it. {You're able to walk through the room in your own personal bubble of clean air.|}
    -> navigate

= returning
{
    - clear_mist:
        You return to the room you cleared the green mist from. {It has an unpleasant smell but appears to be safe.|It seems that no trace of the mist remains.}
        <- clear_mist_opt
        -> navigate
    - else:
        You return to the room with the green mist.
        -> opt
}

= hold_breath
You take a deep breath and step into the mist.
<- rollChance(chance_1)
{
- isSuccess:You're lucky enough to walk into a gap in the swirling cloud. You keep pace with it and exit the room without suffering harm.
- else:
    ~ loseStamina()
    {
        - stamina > 0:Your eyes water and you feel an unpleasant tingle across your skin. You had best exit this room swiftly.
        - else:Unfortunately there is a tickling sensation in your snout before you're forced to let out a great sneeze. You take a breath afterwards before realising your mistake and begin to choke. Your lungs and throat burn as you collapse to the floor. Foaming drool escapes your lips as the poisonous mist saps the rest of your life from you.
            -> THE_END
    }
}
-> navigate

= clear_mist
~ loseStamina()
~ gold++
You huff and puff and swipe at the air with your hands. Eventually you manage to clear the room of the noxious gas - or at least disperse it enough to remove any threat.
In the not so misty room you notice a gold coin on the floor. You pick it up.
<- clear_mist_opt
-> navigate

= return_clear_mist
You return to the room you cleared the green mist from. {It has an unpleasant smell but appears to be safe.|It seems that no trace of the mist remains.}
<- clear_mist_opt
-> navigate

= clear_mist_opt
* [Inspect the room.]
    ~wisdom++
    On the ceiling around the edges of the room you can see a gap. Standing under it you feel a gentle breeze. This must be how the room kept the mist in place.
    A lot of effort seems to have gone into making each room its own dedicated experience. The better to use them as building blocks. The Maze Builders are very economical.
    -> navigate
