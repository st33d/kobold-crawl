VAR toadstool_hit = false
VAR pixel_gold = 0

=== toadstools
<- title("Toadstools", toadstools)
{-> enter | -> returning}

= enter
The floor in this room has been ripped up, exposing the earth and making the air damp. Two huge and poisonous looking toadstools dominate the center of the room. They uproot themselves, standing on fibrous hooves before slowly marching towards you.-> opt

= opt
~ chance_1 = 60 + fight * 10 + advantage * 5
+ {fight < 2}[Attack. (%{chance_1})]-> fight
* (advantage){fight < 2} [Look for an advantage.]
    ~ wisdom++
    You recall something vague about walking mushroom monsters but it's hard to grasp. A tale told by an old kobold that used to fix the plumbing around the mountain. Over time you dismissed it as tall story, no bestiary mentions his turtle people or their partially draconic rulers. You're sure he made a great fuss about attacking from above. {not fight:A sound plan if it's not poisonous.|A risky move whilst there's two of them to deal with.}
    -> opt
+ {toadstool_hit && fight < 2} [Run away.]
    Having scored a victory you take advantage of the situation to exit the room on your own terms.
    -> navigate
+ {!toadstool_hit && fight < 2} [{backtrack()}]-> go_direction(-1)

= returning
~ toadstool_hit = false
You return to the toadstool room. <>
{
    - fight > 1:Hunks of fungus decorate the floor.
        -> navigate
    - fight == 0:The fungi beasts block your passage.
    - fight == 1:The remaining occupant marches towards you seeking retribution.
    
}
-> opt

= fight
~ toadstool_hit = true
<- rollChance(chance_1)
{
- isSuccess:-> survive
- else:
    ~ loseStamina()
    {
        - stamina > 0:-> survive
        - else:-> death
    }
}

= death
You plunge your spear into the dome of {fight == 2:a|the} toadstool and it releases a cloud of spores. You try to escape but a numbness rises up from your legs and pulls you to the floor. You can barely feel the life being stamped out of you afterwards. It is a very considerate death.
-> THE_END

= survive
{
    - fight == 1:
        You strike under the dome of one of the beasts and manage to flip it over. Then you stamp where the stalk meets the umbrella of fronds that makes its maybe head. It cracks in two and deflates in defeat.
        {
            - isSuccess:The other toadstool shuffles towards you seeking revenge.
            - else:The other toadstool rams you and sends you tumbling across the floor.
        }
        -> opt
    -else:
        Finally you remember the secret to success, beasts such as these can be felled with a stomp from above. You leap up and thrust down with both feet into the cap of the monster. There is a snap from beneath you before chunks of fungus explode across the room.
        {
            - not isSuccess:Its remains are a slippery mess and you fall over {RANDOM(2, 4)} times before being able to leave.
        }
        ~ pixel_gold = loot(4, 6)
        On your way out you find {pixel_gold} gold coins that must have been buried in the flesh of your foes. Each one appears to be made of many small squares.
        -> navigate
}
