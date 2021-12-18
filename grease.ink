=== grease
<- title("Grease", grease)
{-> enter | -> returning}

= enter
You step into this room and begin to slide uncontrollably across the floor. Some kind of magical grease has been cast upon it.
-> opt

= opt
* (stay){stamina > 1}[Try to stay put. (-1 stamina)]
    ~ loseStamina()
    ~ gold++
    Wedging the butt of your spear into a gap in the flagstones, your slide turns into a slow orbit. After {RANDOM(2, 5)} turns trying to brake with your feet turned sideways, you've created a clean spot in the center of the room. You have come to a halt at last.
    Under the grease nearby you spot a gold coin. Reaching out from your clean spot you fish it in with your spear.
    <- opt
    -> navigate
+ {not stay} [Do nothing and slide out out of the room. {dirName()}]
    You continue your slide unabated until you've left the room completely. 
    -> go_direction(1)
* {stay} [Survey the room.]
    ~wisdom++
    Enjoying the advantage of being still you take a look around to see if the room has anything else to offer you. You're almost convinced there is nothing left to find until you look up and see a message carved into the ceiling.
    <i>Bye.</i>
    You hope it's no longer relevant.
    <- opt
    -> navigate
* {not stay && inventory ? multipass}[Brandish your pendant.]
    You hold aloft your pendant to defy the magical grease. Nothing happens and you look a bit silly as you slide out of the room. 
    -> go_direction(1)

= returning
You return to the greasy room, <>
{
    -not stay:instantly you begin to drift across the floor.
        -> opt
    -else:drifting over to the clean spot before coming to a stop.
        <- opt
        -> navigate
}
