=== pudding
<- title("Pudding", pudding)
{-> enter | -> returning}

= enter
As you enter this room you are forced to raise your spear to guard yourself. You see a predator your kind have named the ectopic pudding. A two feet tall tear drop of foam, flesh, and phlegm that hangs horrifyingly in the air. It is not friendly.
-> opt

= returning
You return to the pudding room. <>
    {
        - attack < 2:{The foaming lumps of flesh have disolved a chunk of the floor. In the steaming pit you can see a cache of {loot(2, 3)} gold coins that must have been hidden under the flagstones. You fish them out with your spear.|Clumps of mucus decorate the floor around a blackened crater.}
            ->->
        -else:{~The fleshy mass still hovers there, waiting to strike.|The globule of horror turns to face you.}
            ->opt
    }

= opt
~ temp_chance = 60
~ temp chance_flee = 80
* [Look for an advantage.]
    ~ wisdom++
    You look around to find an advantage to use against this fearsome creature but the room is too spartan to offer assistance.
    Remembering the stories you've been told about the ectopic pudding, you recall that they were long. The monster never went down in one hit, demanding a proper finale. Pehaps your luck would be best spent elsewhere.
    -> opt
+ [Attack (%{temp_chance})]-> attack
+ [Flee (${chance_flee})]
    <- rollChance(chance_flee)
    {
    - isSuccess:You dash around the pudding, keeping it at spear's length.
        ->->
    - else:
        ~ loseStamina()
        {
            - stamina > 0:{~You duck and weave around the pudding but it slaps you with a snotty tendril. It burns your flesh but you have gained an opportunity to escape.|You perform combat roll under the pudding but pull a muscle in the process. You have a chance to exit.|The pudding spits at you as you try to run past it. You are hit but you can get away.}
                ->->
            - else:You try to run past the creature. -> death
        }
    }

= attack
<- rollChance(temp_chance)
{You lunge at the pudding with your spear, tearing into probably skin. The creature lets out a fart of pain.|Putting your palm at the base of the spear you thrust a death strike at the heart of the beast. It shudders flatulently.}
{
- isSuccess:
    {
        -attack >= 2:-> pudding_death
        -else:-> opt
    }
- else:
    ~ loseStamina()
    {
        - stamina > 0:-> hurt
        - else:-> death
    }
}

= pudding_death
The ectopic pudding splashes to the floor. You jump back to avoid its acid. It lets out a final rumbling fart before slowly disolving. You cover your snout and look for an exit.
->->

= hurt
{The pudding squirts a jet of acid at you. You try to dodge but some of it hits, burning your flesh.|The pudding, sensing death, impales itself further. Aiming to meet you in a final embrace. You shake your spear free but you're sprayed with its burning mucus.}
{
    -attack >= 2:-> pudding_death
    -else:-> opt
}

= death
The pudding vomits a thick acid over you. The pain is overwhelming, you black out. Fortunately you are not conscious of what happens next.
-> END
