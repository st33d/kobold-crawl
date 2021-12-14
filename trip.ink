=== trip_room
<- title("Trip", trip_room)
{-> enter | -> returning}

= enter
This room you've walked into is surprisingly empty. Your spear is raised to guard against threats and you appraise the featureless walls with keen eyes. But no sign of a threat not even -
-> trip

= trip
{
    - trip > 4: Nothing happens. {It seems this room has tired of toying with you.|}
    - lucky:<- deduct
    - else:<- restore
}
<- opt
-> navigate

= deduct
~ lucky = false
{Your foot catches on the edge of a badly laid flagstone in the floor. You stagger forwards, barely recovering. Indignation clouds your mind, but you are otherwise unharmed. You take another look around, especially at the floor. You find {loot(2, 3)} gold coins. They provide a salve for your injured pride as you leave.|You tread on a loose floor tile. It rocks, making you stumble onwards a few paces. You return to the offending slab and prod it with your foot, as if to shame it into place. The tile only delivers a mocking clack as you stub it in anger.}
-> DONE

= restore
~ lucky = true
You stop for a moment{, sure that some sort of trap might spring. Proceeding with caution you tap the floor ahead of you with the butt of your spear as you advance. You find a flagstone that seems a little loose and nothing more.<br><br>Perhaps there is still a trap here, but for now you're too wary to fall for it.|. Confident that this room won't punish you for standing still you take some time to stretch your limbs. Feeling a little more spry you make your way to an exit. Fortunately you encounter no obstacles on your way.}
->DONE


= opt
* [Inspect the room.]-> unlucky

= unlucky
~ wisdom++
You pace uncertainly around the room's perimeter. Something feels off about it. You know very little about magic such as curses or wards but you can feel a hidden force here trying to tinker with your fortune. You make a note of this place: the unlucky room.
<- opt
-> navigate

= returning
You return to the {unlucky:unlucky|seemingly empty} room. You're crossing its center as -
-> trip
