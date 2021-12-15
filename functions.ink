=== function cameFrom(-> x)
	~ return TURNS_SINCE(x) == 0

=== function oxfordList(list, if_empty)
{LIST_COUNT(list):
- 2:
    {LIST_MIN(list)} and {listWithCommas(list - LIST_MIN(list), if_empty)}
- else:
    ~ listWithCommas(list, if_empty)
}
    
=== function listWithCommas(list, if_empty)
{LIST_COUNT(list):
- 2:
    {LIST_MIN(list)}, and {listWithCommas(list - LIST_MIN(list), if_empty)}
- 1:
    {list}
- 0:
    {if_empty}
- else:
    {LIST_MIN(list)}, {listWithCommas(list - LIST_MIN(list), if_empty)}
}
    
=== function getChance(base, list, value)
{LIST_COUNT(list) == 0:
    ~ return base
}
{inventory ? LIST_MIN(list):
    ~ return getChance(base + value, list - LIST_MIN(list), value)
}
~ return base

=== function clamp(value, min, max)
{
    - value < min: ~ return min
    - value > max: ~ return max
    - else: ~ return value
}
    
=== function loseStamina()
~ stamina -= 1
<i>lost 1 stamina, {stamina} remain</i>
    
=== function gainStamina(value)
~ temp current = stamina
~ stamina += value
{stamina > STAMINA_TOTAL:
    ~ stamina = STAMINA_TOTAL
}
<i>gained {stamina-current} stamina, {stamina} total</i>

=== function tensOf(n)
{n < 10:0{n}|{n}}

=== function loot(min, max)
~ temp c = RANDOM(min, max)
~ gold += c
~ return c

=== title(name, knot)
<hr>
<center><h3>{name} <>
{
    - knot > 1: ({knot}{ordinal(knot)} visit)
}
</h3></center>
->DONE

=== function ordinal(n)
~ n = n % 10
{
    - n == 1: ~ return "st"
    - n == 2: ~ return "nd"
    - n == 3: ~ return "rd"
    - else: ~ return "th"
}

=== rollChance(perc)
~ temp roll = RANDOM(1, 100)
{
    // advantage when lucky
    - lucky:
        ~ lucky = false
        ~ roll = RANDOM(1, perc)
        // ~ temp roll2 = RANDOM(1, 100)
        // {
        //     - roll2 < roll:
        //         ~ roll = roll2
        // }
}
~ isSuccess = roll <= perc
<i>{tensOf(roll)}/{tensOf(perc)}: {isSuccess:Success|Failure}</i>
-> DONE

=== exitOption
+ [Exit.] -> go_direction(1)


=== function pickOne(a, b)
~temp r = RANDOM(0, 1)
{
    -r == 0:
    ~return a
    -else:
    ~return b
}

