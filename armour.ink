=== suit_of_armour
<- title("Armour", suit_of_armour)
{-> enter | -> returning}

= enter
You see a suit of black armour that stands in the center of the room. Wisps of mist leak from the joins between the plates. It turns to look at you with an open face helmet filled with nothing but smoke. Then it thuds towards you.
-> opt

= returning
You return to the room with the black suit of armour. <>
{
    - attack_success > 1:It lies in pieces across the floor, quietly hissing discontent.
        -> navigate
    - attack_success == 1:It stands guard, its arms on the floor. Angry smoke churns out of its arm sockets and helmet.
        -> opt
    - attack_success == 0:It moves to intercept you, arms wide for a deadly embrace.
        -> opt
}

= opt
~ temp chance_flee = 70 + attack_success * 10
~ temp chance_attack = 50 + attack_success * 10
+ {attack_success < 2} [Run past it. (%{chance_flee})]
    <- rollChance(chance_flee)
    {
    - isSuccess:-> flee_success
    - else: -> flee_failure
    }
+ {attack_success < 2} [Attack. (%{chance_attack})]
    You raise your spear and approach the armour...
    <- rollChance(chance_attack)
    {
    - isSuccess:-> attack_success
    - else: -> attack_failure
    }
+ [Return the way you came.]-> go_direction(-1)

= flee_failure
~ loseStamina()
{
    - stamina <= 0:
    With a tackle it knocks you to the ground. You're too tired to fight as it climbs on top of you and brings steel {attack_success < 1:fists|boots} to bear upon your already broken body.->END
    - else:
        {
            - attack_success == 0:It manges to cuff you with one of its metal gauntlets as you pass.
            - attack_success == 1:It kicks your tail with a steely boot you as you pass.
        }
}
+ [Exit.]-> go_direction(1)

= flee_success
It tries to block your path but you fake a {&left|right} and dodge it easily.
+ [Exit.]-> go_direction(1)

= attack_success
{
    - attack_success == 1:
        You run around the back of the plated monstrosity and unhook the clasps that hold its arms on. They clatter to the floor. The armour turns around, looking helplessly at its former limbs, and then at you.
        -> opt
    - attack_success > 1:
        You get around to the side of the suit and with a great breath you blow into a smoking arm socket as hard as you can. Mist gushes out of the other side with a wailing noise before the whole suit falls to pieces.
        -> win
}

= attack_failure
~ loseStamina()
{
    - stamina <= 0:
        {
            - attack_success == 0:
        It snatches the spear off of you with surprising strength before levelling it at your chest. You try to dodge but it skewers you with your own weapon. Your death certainly has the realism the spear was meant for.
            - attack_success == 1:
            With surprising flexibility it performs a roundhouse kick to your head. Theres a disturbing period of darkness before you wake up on the floor. Only to see a metal boot stamp on your face.
        }
        -> END
    - else:
        {
            - attack_success == 0:
            The suit {&bats it aside and punches you in the snout|weaves to your {~right|left} and punches you the ribs}.
            - attack_success == 1:
            With deft feet {it manages to kick you in the shins {RANDOM(3,5)} times|it kicks you in the guts, making you stumble}.
        }
        {stamina == STAMINA_TOTAL / 2: You stagger from your injuries. You're not sure you can take much more of this.}
        -> opt
    
}

= win
 * [Take the armour]
    You pick up the helmet, a small column of vapour trailing from it. You raise the helmet to try it on and hear a quiet, "Yes!"
        * * "No[."]", you reply before dropping the helmet. Falling for such an obvious curse is beneath you.
* [Scatter the armour]
    You kick the pieces of armour away from one another. They let out mournful plumes of vapour. The helmet you leave for last - an inscription on the back of it reads, "eternally guarded, contents discarded".
-
Among the debris you notice a glint of yellow. You find and pick up {loot(2, 4)} gold coins.
-> navigate
