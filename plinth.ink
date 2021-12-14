VAR plinth_coins = 5
VAR plinth_took = 0

=== plinth
<- title("Plinth", plinth)
{-> enter | -> returning}

= enter
In the center of this room you see a simple stone plinth. It is lit from a hole in the ceiling, issuing a light too bright to make out its source. On the plinth are {plinth_coins} gold coins. You take a moment to contemplate how this trap will be sprung.
-> opt

= opt
+ {plinth_took == 0}[Knock the coins off the plinth {trapped:again }with your spear.]-> trapped
+ {plinth_took > 0 && plinth_took < plinth_coins}[Knock the coin off the plinth {trapped:again }with your spear.]-> trapped
+ {plinth_took == 0}[Walk past the plinth.]
    You walk past the display, side-eyeing the tempting offer it presents. {There seems to be no other traps in this room.|}
    -> go_direction(1)
+ {plinth_took == 0}[Return the way you came.]-> go_direction(-1)
+ {plinth_took == plinth_coins-1}[Return through the open exit.]-> go_direction(-1)

= returning
{
    - lift:You return to the room with the upside-down plinth. It teeters a little - threatening to reply to your footfalls - but holds its position.
        -> navigate
    - else:
        You return to the room with the stone plinth. <>
        {
            - plinth_took == plinth_coins-1:A single coin sits on it. The exits are all open, then as soon as you set foot in the room you hear the slide of the iron bars and are left with only one exit.
            - else:The stack of coins still rests on it.
        }
        -> opt
}

= trapped
You extend your spear and poke at the {plinth_took == plinth_coins-1:single coin, knocking it free from its display. It hits the floor, bounces a few times noisily and comes to a halt. The open exit closes.|short stack of gold{trapped > 1: again}, knocking the coins free from their display. {The tintinnabulation of them striking the ground is followed by metallic scraping as iron bars drop down in front of all the exits. They hit the floor with a clang, sealing you against escape.|The exits are closed once more.}}
You pick up the gold coin{plinth_took == plinth_coins-1: |s} and consider your next move.
~ plinth_took = plinth_coins
~ gold += plinth_took
+ [Put all the coins back on the plinth.]
    -> replace_coins
+ [Put one coin back on the plinth.]
    ~ gold--
    ~ plinth_took--
    You put one coin back upon the plinth. In response to this gesture, one of the exits opens. Having been disorientated by the falling bars, you can't remember which exit is which.
    + + [Leave the room.]-> go_direction(-1)
    + + [Put the rest of the coins back on the plinth.]
    -> replace_coins
* (lift){stamina > 1} [Try to lift the bars. (-1 stamina)]
    ~ loseStamina()
    ~ wisdom++
    You grip the bars on one of the exits and struggle to lift it to no avail. Defeated, you turn back to the plinth and you're suddenly struck with an idea.
    You try lifting the plinth. Finding it unconnected to the floor you turn it upside-down, its financial platform now pressed against the flagstones. The bars in front of the exits all rise up. Perhaps with some study you'd be able to discern why this logic can defeat the trap but you're already leaving the room.
        -> navigate

= replace_coins
You restore the stack of coins on the plinth. {plinth_took == plinth_coins:The bars on all the exits rise up|The remaining exit-bars rise up}, allowing you to leave at your leisure.
~ gold -= plinth_took
~ plinth_took = 0
-> opt
