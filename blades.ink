=== blades
<- title("The Gouge", blades)
{-> enter | -> returning}

= enter
You enter this space and your eye is drawn to a deep gouge that runs around the entire room at waist height. Something will come out of that gap, you're sure of it.
-> opt
->->

= opt
~ temp chance_crawl = 60
~ temp chance_catch = 70
+ [Crawl. (%{chance_crawl})]
    Let's do this...
    <- rollChance(chance_crawl)
    {
    - isSuccess:-> crawl_success
    - else: -> crawl_failure
    }
+ [Attempt to catch whatever comes out. (%{chance_catch})]
    You position yourself ready to stop the trap.
    <- rollChance(chance_catch)
    Huge cantilevered blades swing out from the gouges. <>
    {
    - isSuccess:-> catch_success
    - else: -> catch_failure
    }
+ [Return the way you came.]-> go_direction(-1)

= catch_success
You step out of the path of one blade and into that of the bar that carries it. You push back against the lever and hear grinding noises in the walls. The whole trap mechanism shudders to a halt.
~gold++
On the floor next to a wall you notice a gold coin. Easy to miss whilst the blades are threatening you. You pick it up.
->->

= catch_failure
~ loseStamina()
{
    - stamina <= 0:
        As big blades swing out from the gaps you realise you're in no position to catch their mechanism. You try to dodge but they cut you in two. After your torso hits the ground you're given a view of your legs and tail, a steady and gruesome tripod.
        Then you black out.
        -> END
    - else:
        You've misjudged your position. {~You dive to the floor, bruising yourself in the process - but the blades pass over you.|You leap to one side but the blades still manage to cut you as they pass.}
        You make your way out before the mechanism activates again.
}
->->

= crawl_success
You crawl slowly across the floor and huge cantilevered blades swing out from the gouges. They pass harmlessly over you.
{As you make your way across the flagstones you find a message scratched into the stonework: "Waist not, want not." You continue your crawl, away from this room's sense of humour.|}
->->

= crawl_failure
~ loseStamina()
You crawl carefully across the floor, head down. Hearing nothing from above you raise your head to see what's going on.
{
    - stamina <= 0:
        Something big and metal flashes by just below your snout. Your neck hurts, you can't feel your body, the world tips sideways. Then you black out.->END
    - else:
        An armature holding a giant blade smacks into your head. You lie there stunned for a few seconds before continuing your crawl out of there.
}
->->

= returning
{catch_success: -> solved}
You return to the room with the gouge running around it.
-> opt

= solved
You return to the room of blades. {You stick to the room's perimeter in case a secondary mechanism activates.|The scythes on their huge levers hang motionless.}
->->





