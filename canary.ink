=== canary
<- title("Birdcage", canary)
{-> enter | -> returning}

= enter
At the center of this room hangs a wire cage with several wooden perches. Upon the lowest sits a small yellow bird.
<- opt
-> navigate

= opt
* {!open}[Inspect the bird.]
    ~ wisdom++
    This creature has been used by your tribe for testing the air in caverns. You guess that it serves a similar purpose here. It would be quite embarassing to have monsters that suffocated before they did their job.
    <- opt
    -> navigate
* (open)[Open the cage.]
    You open a little door on the cage and the bird hops on to the bottom of the door frame.
    * * {stamina < STAMINA_TOTAL} [Eat the bird.] -> eat
        
    * * {stamina == STAMINA_TOTAL} [Kill the bird.] -> kill
    * * [Wait.]
    ~ lucky = true
    ~ inventory += bird
    The bird twitches a look at you, questioning its freedom, before fluttering out of the room. You lose sight of it as it goes round a corner. It does not return.
        <- opt
        -> navigate
* {not open && inventory ? multipass} [Brandish your pendant.]
    You hold up the pendant the Maze Builder gave you for the bird to see. But it appears not to care for trinkets.
    <- opt
    -> navigate

= eat
~ gainStamina(1)
You snatch the bird off its perch and give it a few crunches between your teeth before swallowing it whole. It was probably part of some warning system, it will serve you better as a snack.
<- opt
-> navigate

= kill
You snatch the bird off its perch before throwing it to the floor and crushing it underfoot. It was probably part of some warning system.
<- opt
-> navigate

= returning
You return to the room with the <>
{
    - open: open bird cage. <>
        {
        - kill:A small smear of blood and feathers is below it.
        - not eat:{&The bird is not here.|You see the bird sitting on top of the cage. It cocks its head towards you before flying away from you out of the room.}
        }
    - else:bird cage. Its occupant {&hops between the perches|tweets questioningly} at your arrival.
}
<- opt
-> navigate