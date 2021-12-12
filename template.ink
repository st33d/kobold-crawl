=== template
<- title("", template)
{-> enter | -> returning}

= enter
First visit
<- opt
->->

= opt
+ (option_a)a.[] You chose a.
    -> navigate
+ (option_b)b.[] You chose b.
    -> navigate

= opt_chance
~ temp chance = 70

+ [Attack. (%{chance})]
    Let's do this...
    <- rollChance(chance)
    {
    - isSuccess:-> success
    - else: -> failure
    }
+ [Alt Attack. (%{chance})]
    Let's do this...
    <- rollChance(chance)
    {
    - isSuccess:win
    - else:
        ~ loseStamina()
        {
            - stamina > 0:yay
            - else:nay
                -> END
        }
    }
->->

= success
Hooray
->->

= failure
~ loseStamina()
{
    - stamina <= 0:
        Dead.->END
    - else:
        Ouch.
}
->->

= returning
You return.
->->
