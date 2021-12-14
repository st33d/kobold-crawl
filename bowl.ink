=== bowl_of_water
<- title("Bowl", bowl_of_water)
{-> enter | -> returning}

= enter
You enter this room and see a stone bowl sitting on a plinth. The bowl is full of what appears to be water.
<- opt
-> navigate

= returning
{
    -drink:You return to the room with the empty bowl of water.
    -else:You return to the room with the bowl of water.
}
<- opt
-> navigate

= opt
+ {not drink}[Take a drink.]
    {
        - stamina < STAMINA_TOTAL:
        -> drink
        -else:
        You're not in need of a drink right now. {You prod the water with a clawed finger, but it does not seem dangerous.|The water looks as clear as when you first saw it.} Perhaps you should save this for later.
        -> navigate
        
    }
* (inspect)[Inspect the plinth.]
    You inspect the plinth. It appears unremarkable, but in bending over to get a good look you notice something on the underside of the bowl. A message forming circlet around the plinth. Bidding you to walk around to read it.
    <- opt
    -> navigate
* {inspect}[Read the message on the bowl.]
    ~ wisdom++
    You walk around the bowl, reading the message on its underside.
    <i>I assure you that the water in the bowl is completely safe.</i>
    {
        -drink:It's a bit late for warnings or recommendations. At least you got a gold coin out of it.
        -else:You pause to consider its meaning, unsure of whether you've gained knowledge or lost it. You tap the surface of the "water" with the head of your spear and watch a droplet roll down the blade, fall off and harmlessly hit your foot. It's probably water.
    }
    <- opt
    -> navigate

= drink
~ gainStamina(2)
~ gold++
You drink from the bowl. The water is especially refreshing and invigorating. You wait to see if some awful side effect comes to pass, but no, you're fine.
At the bottom of the bowl you notice a gold coin acting as a plug, you pick it out and the rest of the water drains away.
<- opt
-> navigate
