VAR falconsloth_speed = 0
VAR falconsloth_dead = false

=== falconsloth
<- title("Falconsloth", falconsloth)
{-> enter | -> returning}

= enter
You enter this room to find a beast hanging from bars that cross the ceiling, a falconsloth. It has the head of a falcon and the body of a very large sloth. You've only seen pictures of it till now. You remember that it was supposed to be either incredibly fast or incredibly slow. You've forgotten which.
-> opt

= opt
{
    - falconsloth_dead:->->
    - falconsloth_speed == 0:-> speed0 ->
    - falconsloth_speed == 1:-> speed1
    - falconsloth_speed == 2:-> speed2
}

= speed0
~ temp chance_run = 60
~ temp chance_attack = 50
{remember:
    ~ chance_run += 10
    ~ chance_attack += 10
}
* [Try to remember.]-> remember
+ [Run around the falconsloth.]
    <- set_speed
    {
        -falconsloth_speed == 1:
            You sprint forwards, keeping one eye trained on the beast. When you see that it's moving very slowly you jog to a stop. It is probably making its way towards you but it's hard to tell.
            Unthreatened, you make your way towards an exit at a leisurely pace.
            -> go_direction(1)
        -falconsloth_speed == 2:
            You sprint to the side of it only to find the beast hanging in front of you. You turn to dash around but it appears in front of you again, with no sign of having moved other than its position and a gust of air. You're forced to back off with your spear raised. The falconsloth holds its place whilst staring you down.
            + + [Try running around again. (%{chance_run})]
                ~ temp_chance = chance_run
                -> run_fast
            + + [Attack the falconsloth. (%{chance_attack})]
                ~ temp_chance = chance_attack
                -> attack_fast
            + + [Return the way you came.]-> go_direction(-1)
    }
+ [Attack the falconsloth.]
    <- set_speed
    {
        -falconsloth_speed == 1:
            You dash forwards with your spear leading the charge but its stillness makes you pause. In response to your threat it begins a slow retreat. So slow that you wonder why it's even trying.
            -> opt
        -falconsloth_speed == 2:
            You adjust your grip on your spear, look up, and the falconsloth is hanging from a different set of bars. You pause to reconsider.
            + + [Run around the falconsloth. (%{chance_run})]
                ~ temp_chance = chance_run
                -> run_fast
            + + [Continue the attack. (%{chance_attack})]
                ~ temp_chance = chance_attack
                -> attack_fast
            + + [Return the way you came.]-> go_direction(-1)
    }
+ [Return the way you came.]-> go_direction(-1)

= remember
~wisdom++
You think hard about the pictures you saw. There were two kinds. A pair of breeds growing in similar territory, one of them employing the cunning strategy of appearing like its ferocious cousin.
{
    - lucky:It looks pretty still. You're confident that fortune is on your side.
    - else:You look closer. It's very still but you're sure it was in a different position a second ago.
}-> speed0


= speed1
+ [Walk around the falconsloth.]
    You casually walk around the falconsloth. {~It begins to crane its head to follow you. Too sluggish to keep up with your pace.|It detatches one limb, perhaps to swipe or prod at you but you're not going to wait the hour it will take to find out.|It yawns as you pass. Perhaps describing the quality of its company.}
    -> go_direction(1)
+ [Attack the falconsloth. (%99)]
    ~ falconsloth_dead = true
    You walk up to the falconsloth and stab the motionless target in the heart. It hits the ground with a thump before rolling on to its side. Limbs outstretched, reaching for a ceiling it will never touch again.
    It's not clear who in this room is the real monster.
    ->->

= speed2
~ temp chance_run = 60
~ temp chance_attack = 50
{remember:
    ~ chance_run += 10
    ~ chance_attack += 10
}
+ [Run around the falconsloth. (%{chance_run})]
    ~ temp_chance = chance_run
    -> run_fast
+ [Attack the falconsloth. (%{chance_attack})]
    ~ temp_chance = chance_attack
    -> attack_fast
+ [Return the way you came.]-> go_direction(-1)

= attack_fast
~ falconsloth_dead = true
You thrust your spear towards the beast but there's a snap of wind and its not there anymore.
<- rollChance(temp_chance)
{
    - isSuccess:You have a hunch, it likes to look its prey in the eyes.
        You flip your spear over and stab blindly behind you. You hear a keening cry of pain followed by a thump. A glance behind you confirms your lucky blow did the job, the threat has been vanquished.
    - else:
        ~ loseStamina()
        {
            - stamina > 0:You strike in every direction at once. Surely you will hit something.
                You do. Your spear is in the beast's belly and it lets out a keen of pain. It thrashes with savage speed, shaking you as you hang on to the spear. Finally it goes limp and falls off. Exhausted, you retrieve your spear.
            - else:You turn around and there it is, hanging in the same position. Staring at you with its big black eyes over a hooked beak.
                Your death is fast and by no means merciful.
                -> END
        }
}
Free to survey the room you find a small cloth bag tucked behind the bars the falconsloth was hanging from. It holds {loot(4, 6)} gold coins.
-> navigate

= run_fast
<- rollChance(temp_chance)
{
- isSuccess:{~You run a zig zag across the room and manage to trick your way past the beast. It tries several times to cut you off but you are too wily.|You pretend to leave only to run around the perimeter of the room with your spear in front of you, daring the beast to skewer itself.|You dive through the gap in its pairs of limbs. It appears too stunned by your bravery to pursue. Or it might be daydreaming, you're not staying to find out.}
- else:
    ~ loseStamina()
    {
        - stamina > 0:{~You try many times to dodge around the creature but it keeps cutting you off. Only by working your way towards an exit do you escape.|You run forwards and it suddenly appears in front of you. You roll under it and get up running but you feel its beak nip at your tail as you escape.|You dive through the gap in its pairs of limbs but end up flopping on to its belly. The falconsloth thrashes, throwing you free and providing a window of escape as you pull yourself off of the floor.}
        - else:You leap forwards and you're instantly clotheslined by a beam of feathers and muscle that bars your path. As you land on the floor on your back you see the falconsloth with one arm outstretched. It gazes at you with its round black eyes, arm still extended as if hailing a form of transport it clearly doesn't need. Then there is a feathered blur and an instant of terrible pain. Your death is too quick to describe.
            -> END
    }
}
+ [Exit.]-> go_direction(1)

= returning
You return to the room with the falconsloth. <>
{
    - falconsloth_dead:It's still dead. {You prod it with your spear to be sure and the corpse shrugs a motion it never showed in life.|}
    -falconsloth_speed == 0:It hangs motionless on its bars, staring you down with its big black eyes.
    -falconsloth_speed == 1:{~It begins an approach towards you. At its current rate it should reach you by tomorrow.|It appears to be moving to hang from a different set of bars. Its very boring to watch.}
    -falconsloth_speed == 2:It hangs there not moving. You blink and when you open eyes it is hanging in the same position but much closer.
}
-> opt

= set_speed
{
    -falconsloth_speed == 0:
        {
            - lucky:
                ~ lucky = false
                ~ falconsloth_speed = 1
            -else:
                ~ falconsloth_speed = 2
        }
}
->->