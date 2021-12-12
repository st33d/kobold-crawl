=== flies
<- title("Flies", flies)
{-> enter | -> returning}

= enter
The walls in this room are seemingly black. You casually wave a buzzing fly away from your face before you are forced to dismiss another, and another. The room hums as the black peels away from the walls and the room fills with flies.
-> opt

= opt
~ temp_chance = 60 + run_circle * 25
+ {!dead_flies}[Swat some flies. (%{temp_chance})]-> swat
* [Run in a circle. (-1 stamina)] -> run_circle
+ {!dead_flies}[Return the way you came.]-> go_direction(-1)

= run_circle
~ loseStamina()
~ wisdom++
Sensing the aggression of the flies you run a circle around the room to make them give chase. They coalesce into a humming tentacle - something you can strike easier. With your new battle tactic you feel better equipped to take on your enemy.
-> opt
    
= returning
You return to the room of flies. <>
{
    - not dead_flies:They still fill the room. An angry cloud that denies you the opportunity to pass.-> opt
    - else:-> dead_flies
}
= swat
<- rollChance(temp_chance)
{not isSuccess:
    ~loseStamina()
}
{
    -stamina <= 0:->exhausted
    -else:
    {You thrust your spear into the mass of flies, again and again. Stabbing and twirling. You throw a kick in there as well for effect. You're pretty sure you managed to get at least half of them.|You put down your spear and resort swatting the flies with your hands. It takes some time but eventually you murder every last one of them.-> dead_flies }
    <- opt
    + [Get out of there.]-> go_direction(1)
}

= dead_flies
The floor and walls {are|are still} covered in a paste of dead insects.
{not get_gold:You notice slivers of yellow shining through the pulp. Gold perhaps.}
<- gold_getting
->->

= gold_getting
* [Get the gold.]-> get_gold
->->

= get_gold
You find {loot(2, 4)} gold coins.
->->

= exhausted
{
    - flies > 0: You frantically stab, stamp, and slap every fly in the room. Finally the buzzing ceases and you 
    - else: You strike out at every fly in the room. A ceaseless montage of slaps, stabs, and stamps. There are too many. You 
}<> collapse in exhaustion. You know that if you pass out you will surely be dispatched in your sleep. You close your eyes for a brief moment and never open them again. -> END