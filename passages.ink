=== passages
{-> enter | -> returning}

= enter
You step inside the maze.
The structure is a morass of prefabricated corridors and rooms. The walls, floor, and ceiling are a cold grey stone. Soon you encounter your first challenge...
->DONE

= returning
{
    - wisdom > wisdom_prev:
        ~ wisdom_prev = wisdom
        {~As you venture into the corridors you find a loose wall and push it aside to make a shortcut.|In the passages between rooms you find a button on a wall. You press it and the wall in front of you slides into the floor.|Once more in the maze's conduits, you find a grating at the bottom of a wall, ventilating the passages. It comes off easily and provides a faster route through the labyrinth.}
    - else:{~The corridor ahead branches, you take the {~right|left} one.|The passage ahead leads to a dead end. You're forced to backtrack and take another route.|You leave and enter the maze of passages.|You enter the corridors and take several {~right|left} turns before you realise you're going in circles. Then you take another {~right|left} into a new room.}
}

{
    - depth >= 16:{You must have passed the halfway point by now.|}
}
->DONE