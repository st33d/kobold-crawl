=== invisible_wall
<- title("Invisible", invisible_wall)
{-> enter | -> returning}

= enter
This room looks suspiciously empty. You take a step forwards and your snout bumps into an invisible wall. It seems to block access to the rest of the room.
{
    - lucky:
        * [Check how tall the wall is.]-> crawl
}
-> opt

= opt
~ chance_1 = 60
+ [Try to break through the wall (%{chance_1})] -> break_wall
+ [{backtrack()}]-> go_direction(-1)

= break_wall
You charge into the transparency before you.
<- rollChance(chance_1)
{
- isSuccess:-> empty
- else:
    ~ loseStamina()
    {
        - stamina > 0:You're suprised to find it move from your effort. {RANDOM(2, 5)} tries later and you feel it tip over. A loud stony wham issues from the space before you. You're able to walk over the wall now, despite how confusing it is to do so.
            On your way over you spot a gold coin, right under the center of the slab. {stamina == 1:You're too weak to lift it.}
            <- do_you_even
            -> navigate
        - else:and hear a shattering sound. As you tumble to the floor, you feel sharp things pierce you. A large invisible blade of the wall skewers you through the middle. Your life drains out, down and over shards that become more visible the closer you are to death.
            -> THE_END
    }
}

= returning
{
    - crawl:You return to the room with the invisible wall. A few taps with your spear reveal it still doesn't connect with the floor.
        <- inspect_opt
        -> navigate
    - empty:You return to the room that temporarily had an invisible wall. It's still not there, despite the room looking exactly like it did before.
        <- inspect_opt
        -> navigate
    - do_you_even:You return to the room where you pushed over an invisible wall. {not lift_slab:The coin under it has not moved. {stamina == 1:You're too weak to lift it. }|You take care not to stub your toe.}
        <- do_you_even
        -> navigate
    - else:You return to the room with the invisible wall. It remains transparent and unviolated.-> opt
}

= empty
and run into empty space. The wall has vanished, leaving as much trace as it had to begin with. Perhaps you should appreciate your fortune and leave before it returns.
<- inspect_opt
-> navigate

= crawl
~ lucky = false
Tapping up and down the wall with your spear you find that the wall doesn't connect to the floor by at least 2 feet. Enough for a kobold to get through unimpeded. Clearly a trap for humans.
<- inspect_opt
-> navigate

= do_you_even
* {stamina > 1}[Lift the slab to get the coin. (-1 stamina)]
    ->lift_slab
* [Inspect the room.]
    -> inspect ->
    <- do_you_even
    -> navigate

= inspect_opt
* [Inspect the room.]
    -> inspect ->
    -> navigate

= inspect
~ wisdom++
The room betrays no mark of your adventure in it. {do_you_even && lift_slab:(Except for the coin.)}
Walls, floor, and ceiling are covered in plain stonework. They refuse to show any secret configurations or further treasures to liberate. You breathe a sigh and look down, only to see you're standing on some writing at the very edge of the room. You have to step back to read it.
<i>MIND YOUR SNOUT</i>
-> navigate

= lift_slab
~ loseStamina()
~ gold++
You wedge your claws under the edge of nothing and lift, wiggling your grip further in as you do. When you get it up to your waist you wedge it on your hips and awkwardly scrape the coin out of its display case with your spear.
Your prize in the clear you drop the slab. It slams down and leaves you to marvel at how the dust raised refuses to settle on it.
-> navigate
