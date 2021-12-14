=== fresco
<- title("Fresco", fresco)
{-> enter | -> returning}

= enter
Stepping into this room you blink a few times, unsure of what you're seeing. Unlike the rest of the maze the walls, floor, and ceiling are covered in a colourful fresco. The painting depicts kobolds doing all manner of tasks, but averting their gaze from above.
<- opt
-> navigate

= opt
* (dragon)[Look at the ceiling.]
    You look up and instinctively shield yourself from the sight of it. A detailed rendering of a terrifying dragon.
    {
        - lucky:
        ~ lucky = false
        You feel somewhat cursed for having gazed upon it.
    }
    <- opt
    -> navigate
* (stare) {dragon} [Stare at the ceiling.] -> brave
* {stare} [Chisel out the dragon's eyes with your spear.]-> vandal
* [Look at the painted kobolds.]
    ~ wisdom++
    You look at the painted kobolds. Many toil carving through rock and building mazes. The level of detail is such that you can make out individual tasks they perform: the construction of traps and mechanisms, overseer kobolds pointing and directing, farmers cultivating fungus and wheeling supplies. Rarely you can see the outline of a scout kobold, their camouflage only betrayed by their golden eyes.
    These are the kobolds of old who served dragons, instead of the alien Maze Builders you serve now.
    <- opt
    -> navigate

= brave
~ gold++
~ lucky = true
Steeling yourself, you take a longer look at the ceiling. It reminds you that one of your tribe's ancestors had defeated a dragon and banished it from its own mountain. A kobold like none other, proof that such potential exists in your kind.
You notice the dragon's eyes are shining yellow. Perhaps a coin is under there.
<- opt
-> navigate

= vandal
You chisle away at the dragon's face with your spear and underneath the plaster you find a gold coin. A shame that you had to ruin such a nice painting to get your payment.
<- opt
-> navigate

= returning
You return to the painted room. <>
{
    -vandal:The artwork is still impressive despite your vandalism.
    -brave:The dragon's eyes shine golden as you make your way through.
    -else:You are careful to not look up.
}
<- opt
-> navigate
