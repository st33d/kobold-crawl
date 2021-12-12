=== windmill
<- title("Windmill", windmill)
{-> enter | -> returning}

= enter
A horizontal windmill of blades takes up the entire room. Eight double edged swords projecting from a central axle. To traverse the room would mean crawling under or climbing over those sharp edges.
-> opt

= opt
~ temp_chance = 60
~ temp chance_climb = 80
* (look) [Inspect the windmill of blades.]
    ~ wisdom++
    Wary of putting yourself in danger you crouch where you stand to view the trap from a different angle.
    From here the blades form a thick line bisecting the room horizontally. Or at least they would if the line wasn't at a slight angle. You surmise that this trap isn't well constructed and only needs a good shove it the right place to break it. {stamina == 1:A pity you're too exausted for such a task right now.}
    -> opt
* {look && stamina > 1} [Approach the axle to dismantle the trap. (%{temp_chance})]-> break
+ {stamina > 1} [Crawl under the blades. (-1 stamina)]-> crawl
+ [Climb over the blades. (%{chance_climb})]
    <- rollChance(chance_climb)
    {
    - isSuccess:You leap up and land on the hub of the windmill. Here from the center of the room you're free to exit how you choose.
    - else:
        ~ loseStamina()
        {
            - stamina > 0:You take a run up to jump on to the thing but hesitate and trip over instead. It looks like you're crawling through after all.
            - else:You place a hand on top of one of the swords to vault over it. The blade shifts, swinging away from you at amazing speed. They must have greased this thing pretty good. You turn to see another sword coming in fast and try to duck under it.
                You are decapitated.
                -> END
        }
    }
    ->->


+ [Return the way you came.]-> go_direction(-1)

= returning_broken
The contraption remains dismantled. You tread between its swords lying on the floor.
->->

= returning
You return to the windmill of blades. <>
{
    -break:->returning_broken
    -else: They are motionless and sharp.
}
-> opt

= crawl
~ loseStamina()
You drag yourself across the floor. The steel vanes above you keep their vigil and give you a chance to pass.
->->

= break
<- rollChance(temp_chance)
{
- isSuccess:Careful to stay between the blades you move towards the axle. Looking underneath you notice they forgot to attach the windmill to the spindle. You give the hub a decent push and it crashes to the floor away from you.
- else:
    ~ loseStamina()
    {
        - stamina > 0:You reach the hub and see that there is nothing holding the windmill secure on its spindle. It's possible to lift the whole thing off. You cut yourself several times trying to find leverage but manage to find a position where you can use all your strength to bear. It crashes to the floor.
        - else:You reach the hub and carefully place a hand on it. Something feels loose, you could probably dislodge the whole thing with a good push. You give it a shove and hear a clunk, the axle drops a few inches.
            Instead of breaking it you've fixed it. The swords leap into motion. You are left with no option but to be sliced into a grotesque delicatessen display.
            -> END
    }
}
~gold += 2
Inside the hub you can see a gold coin. That must have been the reason you were able to disable it. You use your spear head to dig it out and find another beneath it. You dig that one out too. You check the hub for anything else worth looting but find nothing.
->->
