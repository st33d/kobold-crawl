=== grindstone
<- title("Grindstone", grindstone)
{-> enter | -> returning}

= enter
You enter this room and find a grindstone sticking out of the floor. It has a seat and foot pedals next to it made of rock. You give one of the pedals a push with your foot. It takes all of your weight to push it down. The grindstone executes a lazy spin in reply before coming to a halt.{stamina == 1: If you weren't so exhausted you'd probably make use of it.}
<- opt
-> navigate

= opt
+ {stamina > 1 && TURNS_SINCE(-> sharpen) != 0} [Sharpen your spear. (-1 stamina)]-> sharpen
* {sharpen} [Inspect the grindstone.]
    ~wisdom++
    You give the device further inspection. You can't find a way to make operating it easier, its parts are all made of the heaviest carved stone. They probably didn't want you to leave with any of it.
    On the side of the wheel you notice little pictures of kobolds. You lean on the foot pedal once more and as the wheel spins the drawings blur and come together to form an animated kobold running away from something. Every revolution it chances a look behind at an unseen predator.
    <- opt
    -> navigate

= returning
You return to the room with the grindstone. It persists in being awkwardly beneficial.{stamina == 1: If you weren't so exhausted you'd probably make use of it.}
<- opt
-> navigate

= sharpen
You sit down to sharpen your spear. <>
{
    - not lucky:
        ~ loseStamina()
        ~ lucky = true
        {The pedals are mercilessly stubborn. Eventually you get the wheel up to speed and set about sharpening your spear. You clear away all of the tarnished metal leaving a gleaming edge.|You trudge out another spin from this petrified exercise machine. Your spear is already sharp, but good omens come from sharpening spears. You clean off some dust and add a bevel to the butt of the spear to make it nicer to handle.|You work up a good spin from the wheel, your legs becoming used to this routine. There's a few spinters you've noticed on the shaft of your spear, you shave them off with this iteration of the grindstone.|You can't get enough of this. Your spear won't get any sharper but you caress the spear head near to the wheel to get those precious good omens.}
            A little out of breath, you get up and leave with your improved spear.
    
    -else:, but as you do you notice your spear is pretty sharp already. Perhaps you should tackle a few more rooms before using the grindstone.
}
<- opt
-> navigate