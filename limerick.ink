=== limerick
<- title("Limerick", limerick)
{-> enter | -> returning}

= enter
You enter this room and something seems off.<br>Before you a beast, that's foolish to scoff.<br>Covered in boils, seeping gas over time.<br>Confusing its prey with infectious rhyme.<br>Three feet tall with poison clawed limbs.<br>Reminding you of warning hymns:
Poetry can make you sick.<br>Beware the Festering Limerick.
-> opt

= opt
~ chance_1 = 65 + brandish * 15
~ chance_2 = 45 + brandish * 15
+ [Run away in fear. (%{chance_1})]
    <- rollChance(chance_1)
    {
    - isSuccess:{~You skip aside to your right,<br>around the monstrous blight.<br>The creature reaches after,<br>threatening disaster.<br>You duck and roll beneath its claws,<br>your sequent exit worth applause.<br>Behind you hear a screech,<br>you're glad it's out of reach.|You brandish forth your spear,<br>lest the beast get near.<br>It swipes a deadly slash,<br>you parry and then dash.<br>Its claws clack on the flagstones, as it gives pursuit.<br>You're leaving for a room, it does not pollute.<br>Nimble as you are, you gain a decent distance.<br>You leave the beast behind, beyond its magic puissance.}
    - else:
        ~ loseStamina()
        {
            - stamina > 0:{~The monster leaps, you duck and roll.<br>Tumbling, you lose control.<br>Whilst you flap against the floor,<br>the limerick returns for more.<br>You fearfully spring to your feet,<br>at your back the monster speaks:<br>"Feel my mercy and adjourn,<br>"I'll get you when you return!"|You run round the creature, it's swiftly in pursuit,<br>You've got a decent lead, but freedom it refutes.<br>Round and around the room you circle,<br>Finally you brave reversal.<br>Suddenly<br>you change direction.<br>Try to flee<br>your vivisection.<br>The monster stumbles in surprise, at your little trick.<br>You take advantage and escape the Festering Limerick.}
            - else:You brandish your weapon, and move on hurried feet.<br>The limerick follows, it slowly starts to speak:
                "How tired you are, "you're surely close to death."
                "No I'm not", you cry. But surely out of breath.
                "From tangled marsh and mountain dale I always catch my prey.<br>"Know you in your weakened heart, I feast on you today."
                It stabs you from behind,<br>escape has been declined.<br>You pass out from the pain,<br>unconscious you are slain.
                -> THE_END
        }
    }
    -> navigate
+ [Slay it with your spear. (%{chance_2})]-> slay
+ {gold} [Inspire it to clemency, throw a coin before you flee. (-1 gold)]-> with_gold
* (brandish){inventory ? multipass}[Hold out your pendant, demand repentance.]
    Aloft you hold the Builder's charm.<br>For you are one it should not harm.<br>The creature scowls, backs off a bit.<br>You've gained an edge in defeating it.
    -> opt

= slay
<- rollChance(chance_2)
{
- isSuccess:Steeling yourself you widen your stance,<br>around the monster you start to dance.<br>The creature, arms wide, denies your egress.<br>You strike with your weapon, it dodges, distressed.<br>"Mere kobold", it says, "know you no fear?"<br>"I'll not need it, when you taste my spear."<br>It flinches, it stumbles, it makes a mistake.<br>You take this advantage, and charge without brake.<br>Straight through its middle, you stab the limerick.<br>You wrest your spear quickly, assisted with a kick.<br>It screams, it belows, its wound emits light.
- else:
    ~ loseStamina()
    {
        - stamina > 0:Quick strikes with your spear, hither and yonder.<br>But the beast is too fast, your chance you did squander.<br>It cuffs you aside, pugnacity it chooses.<br>You're dashed to the floor, collecting bruises.<br>It stands above you, ready to gloat.<br>But quick as a flash, your spear's in its throat.<br>Light is spilling, out of the wound.<br>You pull free your weapon, surely it's doomed.<br>The limerick issues a gargling cry,<br>its injury glittering, you hope it will die.<br>Your eyes, you cover, from candescent glare.
        - else:Raising your spear, ready to throw,<br>you take careful aim, for this death blow.<br>You chuck it hard, with strength to shatter.<br>The beast steps aside, to the floor your spear clatters.<br>Awkwardly, you share a glance,<br>then your foe starts to advance.<br>You try to flee.<br>You don't foresee,<br>claws from behind,<br>your bones they grind.<br>Skewered with violence you fall to the floor.<br>On your corpse, the limerick does gnaw.
            -> THE_END
    }
}
~ gold += 3
A flash, a sparkle, it's...
Gone.
Tinkling to the floor where the monster used to be is a handful of gold coins. You pick them up.
Some of the fading rhyming miasma,<br>threatens to speak another stanza.<br>But you're having none of it, you're getting out of here.
<- no_limerick
-> navigate

= with_gold
~ gold--
You cast a golden coin towards the deadly creature.<br>It scuttles to the prize, a flailing limbed reciever.<br>Using this moment you make your escape,<br>you take your purchase: Avoiding a scrape.
-> navigate
    

= returning
{
    -slay:You return to the room where you defeated the Festering Limerick. It no longer holds a curse, of committing you to verse. Albeit the odd exception.
        <- no_limerick
        -> navigate
    -else:Here you stand returned to face the Festering Limerick,<br>Gather fast your sundered thoughts, you'd better act and quick.
        -> opt
}

= no_limerick
* [Inspect the room.]
    ~ wisdom++
    ~ inventory += pinch_of_salt
    You take a walk around the space looking for treasure and secrets. Your only discovery is that the floor at the edges of the room have a thin groove filled with a white crystaline powder. Probably salt. Perhaps it acted a protection circle to keep the magical limerick in place.
    You grab some and put it in your bag, maybe it will stop other creatures from stealing your gold.
    -> navigate
    