=== food_table
<- title("Food", food_table)
{-> enter | -> returning}

= enter
In this room is a table laden with food. Large joints of meat, bread cakes, and fruit make a ramshackle pile of provisions.
<- opt
->->

= opt
* [Take a bite.]
    {
        - lucky:-> stone
        - else:-> bite
    }
* {not bite}[Inspect the table]
    ~ wisdom++
    You walk a circle around the table, careful not to get too close in case you trigger a reaction. It looks a lot like food and nothing more. You take a look under the table. In its shadow you can barely make out a message carved into the floor.
    <i>A banquet fit for a king.</i>
    But the kobolds have no king, or at least the king they did have was banished long ago.
    <- opt
    ->->


= returning
{
    - stone:-> return_stone
    - bite:-> return_bite
    - eat:-> eat
    - else: You return to the room with the table of food.
        <-opt
        ->->
}

= stone
~ lucky = false
~ gold += 2
You pick up an apple from the pile, it feels odd. Tapping it against the table makes a stony sound. You find that the rest of the food here is also made of stone, painted to look real and edible.
Frustrated you search further and find 2 gold coins at the bottom of a bowl of petrified pears. It's something at least.
->->

= bite
You reach towards an apple and it splits open revealing sharp teeth. The other apples follow suit, hissing at you from their hideous little mouths.
-> bite_opt

= bite_opt
~ temp_chance = 70
* [Attack the apples. (%{temp_chance})]-> fight
+ [Return the way you came.]-> go_direction(1)

= return_bite
You return to the room with the table of food. Its monstrous apple guardians, open their jagged mouths to snarl at you.
->bite_opt

= return_stone
You return to the room with the lithlogical banquet. It's still not edible.
->->

= fight
You strike with your spear impaling the nearest apple-thing.
<- rollChance(temp_chance)
Its siblings <>
{
    - isSuccess:leap unnaturally off of the table at you but you're able to bat them aside. One after another you hack them in two with your spear.
    - else:
        {
            - stamina > 0:leap unnaturally off of the table at you. You cut all but one of them down which sinks its teeth into your shoulder. You tear it free before throwing it to the floor and spiking it to a hissing death.
            - else:fly off of the table, their unnatural flight taking you by surprise. You struggle to shake them free but their bite seems to be venomous and convulsions bring you to the floor.
                -> END
        }
}
~gold++
After you dispatch the apples you use your spear to prod the remaining food. It seems safe. You even find a gold coin nestled amoung the produce.
<- eat_opt
->->

= eat
You return to the room with the <>
{
    -not consume:table of food. <>
    -else:empty table of food. <>
}
The smell of dead apples fills the air.
<- eat_opt
->->

= eat_opt
+ {not consume} [Eat.]
    {
       - stamina == STAMINA_TOTAL:The food looks tasty, but perhaps you should save it for later.
            ->->
       -else:-> consume
    }

= consume
~ gainStamina(3)
You eat a hearty meal of meat and bread. Even using the table as a seat to rest your legs.
->->



