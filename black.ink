=== black_pool
<- title("The Pool", black_pool)
{-> enter | -> returning}

= enter
You stumble to a stop at the edge of this room. Where the floor should be is just a square of black that absorbs all light. Surrounding it is a thin ledge, enough to support your heels only. The black looks like it might be a pool of something, or perhaps a barrier of magical darkness.
-> opt

= opt
~ temp chance_edge = 70
~ temp chance_walk = 60 + test * 10
+ [Walk around the edge to an exit. (%{chance_edge})]
    Pressing your back against the wall you shuffle your way around the edge of the room. Your toes hang over the thin ledge, threatening to slip forward and disappear into the black.
    <- rollChance(chance_edge)
    -> walkEdge
+ {test == 0} [Test the darkness with your spear.]-> test
+ {test && walk_first} [Walk through the pool of darkness. (%{chance_walk})]->walkThrough
+ {test && not walk_first} [Walk through the pool of darkness. (%{chance_walk})]->walk_first
+ [Return the way you came.]-> go_direction(-1)

= returning
You return to the room with the black floor. Its tenebrous platform continues to hide what lurks below.
-> opt

= walkEdge
{
    - isSuccess:Eventually you manage to reach an exit.
        -> go_direction(1)
    - else:
        ~ loseStamina()
        {
            - stamina <= 0:The stone beneath your feet crumbles. You pitch forwards tumbling head first into the black. There is no obstacle to your descent.-> fall
            - else:You {~stumble|trip} and fall into the pool. A stony floor rudely stops you from falling further. {not test && not lower: You pull yourself up and find yourself only knee deep in darkness. Somewhat bruised and annoyed you |You get up, brush yourself off, and }make your way carefully to an exit.
                -> go_direction(1)
        }
}


= test
You slowly dip your spear into obfuscation. At first there's no resistance, the darkness acting like heavy smoke, then your spear hits stone. Only a third of your spear's length is submerged.
You test elsewhere and get the same results. The "pool" is quite shallow, deep enough to just reach your knees - should you step into it that is.
-> opt

= walk_first
~gold++
-> lower ->
You step on something round and metallic. You freeze - you could be standing on anything right now. Probing it with your toes you deduce it may be a coin. Gingerly you crouch to collect the object. You pull a shiny gold coin out of the darkness.
You resume making your way to an exit, but find no more treasure.
->->

= lower
You lower one foot into the blackness until it reaches a cold stony floor. Then another. You make your way forwards, tapping the space in front with your spear for safety.
->->

= walkThrough
-> lower ->
{
    - isSuccess:You're surprised to make it across unscathed and untested. Perhaps you chose just the right path.
        -> go_direction(1)
    - else:
        ~ loseStamina()
    {
        - stamina <= 0:You get about halfway through the room before your right foot tries to find purchase on nothing. You stagger back.
        That was close.
        You take a step to the left to circle around the hazard. You're pretty sure there was floor to your left a second ago as you stumble sideways into chasm. You pass through the plane of darkness into a cold space. -> fall
        -else:
            {&Confident your path is clear you smash your left big toe into what feels like a raised stone. One whose purpose is purely for the stubbing of toes. It really hurts. You lean on your spear whilst cursing for a minute before making your way to an exit at a much slower pace.|You boldly place a foot ahead and skewer it on something sharp. Crying out in pain you lift your foot to find a rusty nail embedded in it. You pull it out. Shuffling onwards you make your way carefully out of the room.|You advance across the pool only for one of your feet to step into a pothole. Your shin smacks into the side of it and your toes are twisted under your weight as they hit the bottom. You hiss in lieu of cursing, not wanting to provide amusement for whatever beasts await you in adjacent rooms. Using your spear to lean on you retrieve your foot. Then, slowly, carefully, you make your exit.}
                -> go_direction(1)
    } 
}
->->

= fall
After a long fall, something flat and made of stone slams into your side and your head.
The oppressive darkness only makes it easier for life to slip away.
-> END

