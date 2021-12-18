VAR quaid_dir = "left"
VAR quaid_go_dir = "left"
VAR quaid_fake = false
VAR quaid_death = 0
VAR quaid_run = false

=== function swapQuaidSide()
{
    - quaid_dir == "right":
    ~ quaid_dir = "left"
    - else:
    ~ quaid_dir = "right"
}

=== quaid_doubler
<- title("Quaid", quaid_doubler)
{-> enter | -> returning}

= enter
{
    -RANDOM(0, 1) == 0:{swapQuaidSide()}
}
In this room waits a beast your kind call the quaid doubler.  Two tall monsters covered in muscles. One of them will be a magical illusion, projected to confuse and intimidate. They stare at you with mean eyes, the one on the {quaid_dir} licks its lips.
-> opt

= opt
~ chance_1 = 60 + brandish * 10
~ chance_2 = 75 + brandish * 10
+ [Attack the real one. (%{chance_1})]
    ~quaid_run = false
    You raise your spear ready to strike. But which one will you target?
    -> right_or_left
+ [Run through the illusion. (%{chance_2})]
    ~quaid_run = true
    You bend your knees ready to sprint. But which one will you run through?
    -> right_or_left
* (brandish){inventory ? multipass}[Brandish your pendant.]
    You hold up the pendant the Maze Builder gave you before the doubler. It does not care for it, but you notice the one on the {quaid_dir} start to shimmer.
    -> opt
+ [{backtrack()}]-> go_direction(-1)

= returning
{
    - quaid_death > 0:You return to the room with the dead quaid doubler. <>->dead_quaid
    - else:
    {swapQuaidSide()}
    You return to the room with the quaid doubler. {~The one on the {quaid_dir} flexes its muscles at you.|The figure on the {quaid_dir} points at their eyes with two fingers, then points at you.|The two figures appear to be engaged in some sort of mock wrestling match. They break it up as you enter. It looked like the one on the {quaid_dir} was winning.}
    -> opt
}

= dead_quaid
{
    - quaid_death == 1:Slivers of meaty skin can be seen on every surface.
    - quaid_death == 2:Its meaty sack lies on the floor. {|For a moment you think you seek a second sack next to it. But no. You keep your distance anyway.|}
}
{get_gold == false:{You notice 2 gold coins on the floor. You're certain they weren't there before.|The 2 gold coins are still on the floor.}}
<- dead_opt
-> navigate

= dead_opt
* (get_gold) [Pick up the gold.]
    ~ inventory += quaid_coin
    ~gold += 2
    You pick up the coins, a quaid doubler is embossed on each. Hopefully it's still legal tender.
    -> navigate

= right_or_left
+ [Right.]
    {
        - quaid_dir == "right":
            ~ quaid_fake = true
        - else:
            ~ quaid_fake = false
    }
    ~ quaid_go_dir = "right"
    {
        - quaid_run:->running
        - else:-> attack
    }
+ [Left.]
    {
        - quaid_dir == "left":
            ~ quaid_fake = true
        - else:
            ~ quaid_fake = false
    }
    ~ quaid_go_dir = "left"
    {
        - quaid_run:-> running
        - else:-> attack
    }
* [Examine the doublers.]
~wisdom++
You take a moment to examine the enemy. The two pillars of knobbly virility show no difference between them. To the naked eye they seem identical. You cannot be sure if this illusion reflects light or if it has been projected into your mind. One thing is clear however, it cannot resist taunting you. The one on the {quaid_dir} beckons you to make your stand.
-> right_or_left

= running
You dash towards the one on the {quaid_go_dir}.
{
    - quaid_fake:Both figures bend over to grab you. A wall of brawn is about to smash into your snout but miraculously you pass through it. The illusion continues to shimmer and waver from your passage as you head towards an exit.
    - else:
        <- rollChance(chance_2)
        {
            - isSuccess:Your feet skid on the flagstones and you end up sliding in-between its legs.
            You'll take it. Springing to your feet behind the doubler you bolt towards an exit.
            - else:
                ~loseStamina()
                {
                    - stamina > 0:Your snout smacks into a wall of abs. You stagger backwards and manage to duck as it tries to grab you. This gives you a chance to escape.
                    - else:It reaches out and clamps a meaty hand on your head. You're vaguely aware of the other one, the illusion, leaning back to bray with laughter. It has no neck so it's a very exaggerated movement.
                    There is a cracking noise and a terrible pain in your skull. You pass out as it pulls you into a terminal embrace.
                    -> THE_END
                }
        }
}
+ [Exit. {dirName()}]-> go_direction(1)

= attack
You charge towards the {quaid_go_dir} one.
<- rollChance(chance_1)
{
    - quaid_fake:
        Your spear passes through it.
        {
            - isSuccess:You almost stumble but manage to turn your lunge into a sprint. Looks like you're going to run away instead. The illusion shimmers as you run through it and make for an exit.
            - else:
                ~ loseStamina()
                {
                    - stamina > 0:You stagger forwards and the real quaid gives you kick that sends you sprawling across the floor. You pick yourself up, spear raised towards the real one, and edge towards an exit.
                    - else:
                        You're left stumbling. You turn to attack the other one but it's moved behind you.
                        Suddenly two strong hands grab your snout and the back of your head. They force you to look to the {quaid_dir} very quickly. There is a cracking noise coming from your neck and then you can't feel anything.
                        -> THE_END
                }
        }
        + [Exit.]-> go_direction(1)
    -else:
        {
            - isSuccess:
                ~quaid_death = 1
                You thrust your spear towards its belly but it impressively catches the tip between its abs. The rest of the doubler's muscles inflate to support its grip. You give the spear another shove and the swollen beast explodes with a pop.
                Strips of meaty skin fall the floor and a sweaty smell fills the room. The illusion is nowhere to be seen.
                -> navigate
            - else:
                ~ loseStamina()
                {
                    - stamina > 0:
                        ~quaid_death = 2
                        Your spear drives deep into its belly with a squeaking noise. The doubler looks down at you before striking you with {RANDOM(3, 5)} punches.
                        You manage to wrestle your spear free and air begins rush out of the hole. The quaid's illusion looks on in horror as its source deflates into a lifeless sack. Then it fades, allowing you to leave without being judged.
                        -> navigate
                    - else:
                        "Ha ha ha!" it laughs, "you think this is the real quaid?"
                        You hesitate. No one mentioned these things could talk. Stupified, you turn to attack the other one.
                        "It is!" says the one on your {quaid_dir}.
                        You try to correct your strike but it's too late. The quaid your spear hits begins to shimmer and the powerful arms of the other scoop you up. Your bones snap and splinter under its deadly embrace. There is no escape.
                        -> THE_END
                }
        }
        
}



