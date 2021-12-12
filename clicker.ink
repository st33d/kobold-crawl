=== clicker
<- title("Click", clicker)
{
    - clicker == 1: -> click1
    - clicker == 2: -> click2
    - not sprung: -> click3
    - else: -> returning
}

= click1
You place a foot down in this room and hear a foreboding click.
* [Hold your position.]
    You stay perfectly still for a minute. Nothing happens.
    ->->
* [Remove your foot, slowly, and return the way you came.]-> go_direction(-1)

= click2
You return to the "clicking room".
* [Gently put one foot on the floor.]
    Your scaly toes caress the stone floor as gently as you can.
* [Prod the floor with your spear.]
    You gently poke the floor with the spear's blade. 
- Another click. Silence follows. Further probing has no effect.
* [Search the room, properly.]
    You check every surface and every nook for answers. Rapping walls and floor with the butt of your spear you make a circuit of the room - discovering almost nothing. Through one crack in one corner you see a glint of gears poised to activate a mechanism. The gap is too small to wedge anything inside.
    Next time you return here something will happen, you're sure of it.
    ->->
->->

= click3
~ temp chance_backflip = 50
You pause at the entrance to the room that clicks.
* [Stride boldly in.]
    You stride boldly in, daring the room to make a noise. Sure enough you hear a click followed by a chorus of plinks. In each corner of the room a small hole has opened.
    * * {stamina > 1}[Dive to the floor. (-1 stamina)]
        ~ loseStamina()
        ~ lucky = true
        You dive and the stony floor slams into your snout as darts whistle over you. You hear them clatter harmlessly into the corners of the room. You slowly raise yourself from the floor, bruised but sure your luck will change for taking the safe option.
    * * [Backflip. (%{chance_backflip})]
        <- rollChance(chance_backflip)
        {
            - isSuccess:Your body arcs through the air, your curving tail completing an "O" through which whistling darts pass through. You land with the grace of a cat. It's a shame that no one was around to see that.
            - else:
                ~loseStamina()
                {
                    - stamina > 0:You jump, wriggle somewhat in the air, and then land on your head. Somewhere above you darts whistle past.
                    - else:You body arcs through the air, almost making a perfect "O". Three whistling darts fly underneath you and a forth slams into your tail. You feel very heavy. That dart must have been poisoned, you think. Perhaps you can sleep it off. You lie down as the numbness takes over. You don't wake up.
                    -> END
                }
        }
+ [It's not worth the risk.]-> go_direction(-1)
-
-> sprung

= sprung
~gold += 4
You inspect the holes that produced the darts and find a gold coin in each. A strange reward for your patience but you'll take what you can get.
->->

= returning
You enter the room that used to click. {You convince yourself for a moment that you heard it click again, but it was likely just one of your joints.|Its silence washes over you}
->->
