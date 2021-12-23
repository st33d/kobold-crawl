=== passages
{-> enter | -> returning}

= enter
<hr>
You step inside the maze.
The structure is a morass of prefabricated corridors and rooms. The walls, floor, and ceiling are a cold grey stone. Soon you encounter your first challenge...
-> DONE

= returning
<hr>
{
    - room_index >= 22:{You leave a room you're sure is near the center of the maze. Though the route ahead may lead away from it.|}
}
{
    - wisdom > wisdom_prev:
        ~ wisdom_prev = wisdom
        {~As you venture into the corridors you find a loose wall and push it aside to make a shortcut.|In the passages between rooms you find a button on a wall. You press it and the wall in front of you slides into the floor.|Once more in the maze's conduits, you find a grating at the bottom of a wall, ventilating the passages. It comes off easily and provides a faster route through the labyrinth.|You're surprised to find the labyrinth giving you a break. It's just a straight corridor leading to the next room.|You wander into the hallways and suddenly the walls part before you to reveal the next room.|In the next passage you find an ornate door covered in runes that give off a faint red glow. Opening it reveals a short corridor leading to the next room.|The corridor ahead leads to a T-junction. As you approach it, a four and four limbed figure walks by from the {&right|left} to the {&left|right} and out of sight. You try to follow but they've vanished and you're left looking at the next room.|In the passages you encounter a series of arrows etched into the walls that guide you quickly through the labyrinth.}
    - else:{~The corridor ahead branches, you take the {~right|left} one. Then it branches again into three. After thinking it over you take the {~right|middle|left} one.|The passage ahead leads to a dead end. You're forced to backtrack and take another route.|You leave and get lost in the maze of passages.|You enter the corridors and take several {~right|left} turns before you realise you're going in circles. Then you take another {~right|left} into a new room.|You enter a perfect grid of hallways that seem to stretch on forever. After a few minutes of walking you find a new room on your {~right|left}.|You enter a long tunnel that snakes {~right|left} then {~right|left} then {~right|left} then {~right|left} before finally turning {~right|left} into a new room.|You make good progress through the hallways until a wall up ahead suddenly slides to the {~right|left} and cuts you off. You're forced to retreat to find a new way forwards.|In the passages you encounter a message on a wall saying, "WAIT". You wait a few minutes. Nothing happens. You head onwards but double back a few times to check on that hallway, still nothing.}
}
{
    - depth + wisdom >= 11:{You must have passed the halfway point by now.|}
}
-> DONE

= dejavu
<hr>
You're struck with the sudden sensation that you've done all this before. You were expecting a lot more content, but it's hard to complain when you didn't pay to be here.
-> DONE

= lucky_return
~ lucky = false
~ depth--
{
    - depth < 0:
        ~ depth = 0
}
<hr>
On your way back {~the floor opens up beaneath you dropping you into a chute. You land in a familiar corridor.|the air sparkles around you and you teleport into a passage you've seen before.|the walls shift around you suddenly.} You've ended up nearer the entrance somehow.
-> DONE
