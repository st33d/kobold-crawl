=== windy
<- title("Wind", windy)
{-> enter | -> returning}

= enter
You step into a column of frigid air, finding yourself in an atrium. The ceiling is too far up to be visible. You're standing on a wire mesh, you look down and see beneath it is a great windmill. It creaks into motion, sending a steady breeze that soon becomes a gale.
There's also a gold coin on the floor nearby - it would be risky to try and get it before you escape.
+ [Get the coin]
    ~ gold++
    You run over to the coin and pick it up. Before being -> flung
+ [Run out of the room.]
    You hurry out of the room before whatever machination gets fully under way.
    ->->

= opt
{not penny:-> dismantle|->->}

= dismantle
~ temp_chance = 70
+ [Crawl through. (%{temp_chance})]-> crawl
* (look) [Look for a way to dismantle the trap.]
    ~ wisdom++
    The mesh reaches the edge of the room, clearly to stop you from working your way around the perimeter. Each wire of mesh at the edge is tied to a small metal pin, haphazardly hammered into the stone work. You could probably pry it free with your spear.
    -> dismantle
+ {lip == 0 && look}[Dismantle the trap. (%{temp_chance})]-> lip
+ {lip && gold > 0}[Throw a coin into the gears. (-1 gold)]-> penny
+ [Return the way you came.]-> returning

= lip
You pick a spot where the mesh floor meets the wall and use your spear's head to try and create an opening.
<- rollChance(temp_chance)
{
- isSuccess:Fortunately you've attacked an area that was attached poorly and it comes free with no effort.
- else:
    ~ loseStamina()
    {
        - stamina > 0:After a few minutes of work you've pried up a lip of floor that you peel up to make an entrance for yourself.
        - else:It's a bit too small though. You step around the other side of the lip to pull it up some more - forgetting about the storm of wind until you're lifted free of the floor.
            -> fly
    }
}
In the space below you can see a huge wooden shaft ending in a complex differential gear train. If you threw something in there, like a coin, it would probably break it.
-> opt

= penny
~ gold--
You throw a coin into the gears of the drive chain powering the windmill. There is an almighty crack as the unstoppable force of the gears meets an awkward object. Through your feet you feel the splinter and snap of wooden parts beneath the dungeon floor. The death throes of the windmill sends a final cough of splinters at its mesh platform before groaning to a halt. 
-> opt

= crawl
Lying low, gripping the mesh floor, you crawl forwards into the tornado before you.
<- rollChance(temp_chance)
{
- isSuccess:{&You struggle through the initial wall of wind. Only to be -> flung|You hear a loud clunk and the windmill slows to a halt. You must have triggered something to turn it off. You look around quickly to see what it was. A second clunk. The windmill below starts to turn again - you take advantage of this small mercy and flee the room.}
- else:
    ~ loseStamina()
    {
        - stamina > 0:You play it safe, locking yourself to the floor at three points before each advance.
        It takes long time to get out of there.
        - else:Reaching back to pull your spear along with you, your grip falters and you are lifted from the mesh floor. <>-> fly
    }
}
->->

= flung
lifted free of the floor to fly a full circuit of the room, then thrown out of one of the room's exits. At least it's not the one you entered by.
+ [Leave.]-> go_direction(1)

= fly
You fly upwards into the gale, tumbling over and over. This comedy continues for at least a minute as you are propelled up and up. Eventually the violent winds slow down to a gentle buffeting. And then the wind stops.
Completely.
You make a desperate swim to grab on to the walls but you're in the dead center of the room.
You fall.
The ground rushes to meet you, the mesh in front of it a further insult. You attempt to angle yourself such that the blow will kill you outright - choosing to be diced back to front.
It takes a week to clean your corpse out of this room.
->END

= returning
You return to the room with the <>
{
    -not penny:column of wind. You stand outside of it, looking into a hurricane on a leash. The mesh floor {lip:rattles where you prised up a section of it.|looks loose at the edges, perhaps you could pry up a part of it to dismantle the trap.}
    -else:defeated wind trap. {Its torn up mesh floor looks like it's raising a hand in surrender. Your instincts get the better of you and you raise a hand in reply.|}
}
-> opt
