=== custard
<- title("Custard", custard)
{-> enter | -> returning}

= enter
You can only stand at the edge of this room as there is a pool of murky liquid where the floor should be. The substance in the pool appears to be a combination of ash and mucus. It looks deep, you can't see to the bottom.
-> opt

= opt
~ chance_1 = 60 + test_water * 15
+ {!test_water && !swim} [Test the "water" with your spear.]-> test_water
+ {!test_water && !swim} [Swim across. (%{chance_1})]-> swim
+ {test_water || swim} [Run across. (%{chance_1})]-> run
+ [{backtrack()}]-> go_direction(-1)

= returning
You return to the room with the murky pool. <>
{
    - test_water || swim:The glutinous morass that fills it is motionless.
    - else:The ashen snot that fills it appears curiously still.
}
-> opt

= test_water
~ gold++
You prod the mire with the butt of your spear and it puts up a gelatious resistance. The skin of the jelly then breaks leaking a thick ooze. A gold coin is spat out of this wound. You spend a minute fishing it out with your spear. And then another minute cleaning it.
-> opt


= swim
You take a run up and dive on to the pool, only to bounce when you discover it has a rubbery surface. A second later the murk begins to sag and feel sticky.
~ chance_1 = 60
- (escape)
+ [Try to escape. (%{chance_1})]
    <- rollChance(chance_1)
    {
        - isSuccess:You wobble your way on to your feet. As you push against the pool's skin it hardens. You find that a good stamping routine keeps you afloat on this strange substance. With constant sticky stamps you march towards an exit.
        - else:
            ~ loseStamina()
            {
                - stamina > 0:You struggle up to your feet but you're begining to sink. With great effort you pull your legs free and attempt a hurried march to the pool's opposite edge. Each successive stamp gives more resistance as you escape.
                - else:-> sink
            }
    }
    + + [Exit. {dirName()}]-> go_direction(1)
* [Look for something to grab.]
    ~ wisdom++
    ~ chance_1 += 15
    Scanning the room you calculate that you have landed roughly in the center of the pool, as far as possible from anything to hold on to. Looking into the pool you see cloudy darkness, as if its depths could go on forever. Back near the edge where you leapt you can see a glint of gold forever drifting down, rocked by your hasty crash, never to be seen again.
    You've learned a lot from this position in the center of the room.
    -> escape

= run
You take a step back and then dash across the pool.
<- rollChance(chance_1)
{
    -isSuccess:As you trot heavy footed across the pool it chooses to hold your weight.
    -else:
        ~ loseStamina()
        {
         - stamina > 0:You stumble and fall. The pool is surprisingly hard as you smack into it, knocking the wind out of you. Then you quickly get up and stamp to an exit before it can become soft again.
         - else: -> sink
        }
}
+ [Exit. {dirName()}]-> go_direction(1)


= sink
Beneath you, you see a large bubble of trapped air, allowed to rise from your violence to the pool's sturdy skin. Your clawed toes pierce its surface and it breaks free with a gloopy pop. The air inside exchanges places with you and you slip into the pool's depths. Every struggle only takes you deeper. It is a very unpleasant death.
-> THE_END




