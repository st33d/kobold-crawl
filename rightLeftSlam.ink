LIST slam_sides = right, left
VAR slam_run = right
VAR slam_side = right

=== right_left_slam
~ temp name = "Right Left"
{
    - slam_side == left:
        ~name = "Left Right"
}
<- title(name, right_left_slam)
{-> enter | -> returning}

= enter
You enter this room and thick rectangular wall shoots down from the ceiling and slams into the floor. it cuts off the right side of the room. It rises swiftly. Moments later a similar wall crashes into the floor on the left side. It rises up too.
-> opt

= opt
{not disarm:-> trap | -> navigate}

= trap
~ temp_chance = 50
+ [Run through the right side. (%{temp_chance})]
    ~ slam_run = right
    -> running
+ [Run through the left side. (%{temp_chance})]
    ~ slam_run = left
    -> running
* [Wait.]-> watch
+ {watch && gold > 0} [Disarm the trap. (-1 gold)]-> disarm
+ [Return the way you came.]-> go_direction(-1)

= running
You sprint forth to the {slam_run}. <>
{
    -slam_run == slam_side:-> hit ->
    -else:-> dodge ->
}
~ slamChange()
+ [Exit.]-> go_direction(1) 

= hit
<- rollChance(temp_chance)
{
- isSuccess:You hear the grinding of stone on stone above you and quickly jump over to the {slamOther(slam_run)}, narrowly avoiding being pulped. {As the wall rises you spy {loot(2, 3)} gold coins in the trench the wall has made with its pounding. You pick them up and make a run for an exit.|You run towards an exit before the {slamOther(slam_run)} wall can begin its descent.}
- else:
    ~ loseStamina()
    {
        - stamina > 0:You realise your folly as the {slam_run} side wall descends. {~You jump to the {slamOther(slam_run)} side but fall over and have to scramble to your feet to make it to an exit.|Fortunately you weren't running fast enough to end up under it. Instead your snout smacks into a half lowered wall and you stagger backwards a few paces. That hurt. As the wall rises you run out of the room before you injure yourself further.|Determined to make things worse you trip over the trench the wall's hatred of the floor has made. You tumble into a roll, bruising yourself but the roll throws you beyond the {slam_run} side wall's ire. You get up and get out of there.}
        - else:Dust and chips of stone hit your neck before you feel a blow to the back of your head. Then there is pain and darkness. Any fleeting moments of consciousness you have are smashed away when the wall descends to crush you for the second time.
            -> END
    }
}
->->

= dodge
The wall on {slamOther(slam_run)} side smashes into the floor. You make haste towards an exit as it rises.
->->

= disarm
~ gold--
~ wisdom++
You feed a gold coin into the spinning gears you see within the walls of the room. There's a clunk, then a click, then a clang. The {slam_side} side wall slowly descends and stops halfway. You wait a while, just to be sure of no surprises. Then you make your way out of the room.
-> navigate

= watch
You wait for the next move the trap will make. The {slam_side} side wall drops down and smacks into the floor before rising again. As it does so you notice some of the stonework has come away on the side walls of the room in response to this endless violence. You can see turning gears and machinery. If you fed something in there - like a gold coin - it could bring the trap to a halt.
~ slamChange()
-> opt

= returning
{disarm:-> disarmed ->|-> active ->}
-> opt

= disarmed
You return to the room with the two walls that used to bite the floor. The {slam_side} side wall is still halfway {~down|up}.->->

= active
You return to the room with the two walls that bite the floor. The {slam_side} side wall drops down from the ceiling, hits the floor, then rises.
~ slamChange()
->->

=== function slamChange()
{
    - slam_side == right:
        ~ slam_side = left
    -else:
        ~ slam_side = right
}

=== function slamOther(s)
{
    - s == right:
        ~ return left
    - else:
        ~ return right
}