INCLUDE entrance.ink
INCLUDE center.ink
INCLUDE template.ink
INCLUDE passages.ink
INCLUDE functions.ink
INCLUDE armour.ink
INCLUDE beholder.ink
INCLUDE black.ink
INCLUDE blades.ink
INCLUDE bowl.ink
INCLUDE canary.ink
INCLUDE ceiling.ink
INCLUDE clicker.ink
INCLUDE custard.ink
INCLUDE doubler.ink
INCLUDE drinks.ink
INCLUDE falconsloth.ink
INCLUDE finger.ink
INCLUDE flies.ink
INCLUDE food.ink
INCLUDE fresco.ink
INCLUDE ghost.ink
INCLUDE grease.ink
INCLUDE grindstone.ink
INCLUDE hands.ink
INCLUDE huff.ink
INCLUDE invisible.ink
INCLUDE library.ink
INCLUDE limerick.ink
INCLUDE mist.ink
INCLUDE nim.ink
INCLUDE plinth.ink
INCLUDE pudding.ink
INCLUDE rightLeftSlam.ink
INCLUDE toadstools.ink
INCLUDE trip.ink
INCLUDE wind.ink
INCLUDE windmill.ink
INCLUDE TODO.txt


EXTERNAL setRoomIndex()
CONST STAMINA_TOTAL = 5
LIST events = minotaur
LIST items = potion, bird, golden_apple, lanyard

VAR depth = 0// index in stack of rooms
VAR depth_lowest = 0// the lowest depth we've visted
VAR room_index = 0// the index of the room chosen
VAR direction = 1// 1: going deeper -1: going back
VAR inventory = ()// items/conditions you carry
VAR witness = ()// events
VAR temp_chance = 0// temporary VAR for tracking chance between knots
VAR wisdom = 0// used to skip depths
VAR wisdom_prev = 0// used to detect wisdom update in passages
VAR lucky = false// gives advantage on next dice roll
VAR isSuccess = false// did we succeed at <-rollChance()
VAR isEnding = false// is this the end of the maze?
VAR isReroll = false// did we reroll this room when backtracking?
VAR isReachedCenter = false// have we been to the center?

VAR gold = 0// score
VAR stamina = 2
//VAR stamina = STAMINA_TOTAL

//~inventory += potion

// =======================================
// CORE LOOP
-> new_room

// external call
=== function setRoomIndex()
~ room_index = depth
~ return

=== navigate
+ {depth > 0}[Go back.] -> go_back
+ {not isEnding}[Go deeper.] -> go_deeper

=== go_back
~direction = -1
~depth--
{depth > 0 && lucky:
    <- passages.lucky_return
}
{
    - inventory ? potion && stamina < STAMINA_TOTAL: -> passages.potion_opt ->
}
// (depth {depth})
-> new_room

=== go_deeper
~direction = 1
~depth++
{depth > depth_lowest:
    ~depth_lowest = depth
    <- passages
}
{
    - inventory ? potion && stamina < STAMINA_TOTAL: -> passages.potion_opt ->
}
// (depth {depth})
-> new_room

=== go_direction(change)
~ direction = direction * change
{
    - direction > 0:-> go_deeper
    - else:-> go_back
}

=== new_room
-> new_room_debug // DEBUG
//-> new_room_game

=== new_room_game
~ setRoomIndex()
~ isEnding = false
{ room_index:
    - 0:-> entrance ->
    - 1:-> canary ->
    - 2:-> bowl_of_water ->
    - 3:-> trip_room ->
    - 4:-> grindstone ->
    - 5:-> ghost_room ->
    - 6:-> fresco ->
    - 7:-> plinth ->
    - 8:-> grease ->
    - 9:-> clicker ->
    - 10:-> drinks_bar ->
    - 11:-> finger ->
    - 12:-> right_left_slam ->
    - 13:-> food_table ->
    - 14:-> library ->
    - 15:-> ceiling ->
    - 16:-> invisible_wall ->
    - 17:-> windy ->
    - 18:-> falconsloth ->
    - 19:-> blades ->
    - 20:-> windmill ->
    - 21:-> eye_thing ->
    - 22:-> nim_troll ->
    - 23:-> flies ->
    - 24:-> mist ->
    - 25:-> quaid_doubler ->
    - 26:-> suit_of_armour ->
    - 27:-> beligerent_huff ->
    - 28:-> black_pool ->
    - 29:-> custard ->
    - 30:-> hands ->
    - 31:-> pudding ->
    - 32:-> toadstools ->
    - else:
        ~ isEnding = true
        ~ isReachedCenter = true
        -> center ->
}
-> navigate

// =======================================
// ROOM DEBUGGING
=== new_room_debug
~ setRoomIndex()
~ isEnding = false
{ room_index:
    - 0:-> room1 ->
    - 1:-> blades ->
    - 2:-> room2 ->
    - 3:-> room3 ->
    - 4:-> room4 ->
    - 5:-> room5 ->
    - else:
        ~ isEnding = true
        ~ isReachedCenter = true
        -> room_end ->
}
-> navigate

=== room1
<- title("Room 1", room1)
// ~ lucky = true
1->->

=== room2
<- title("Room 2", room2)
// ~ lucky = false
// ~ loseStamina()
2->->

=== room3
<- title("Room 3", room3)
3->->

=== room4
<- title("Room 4", room4)
4->->

=== room5
<- title("Room 5", room5)
// ~ lucky = true
5->->

=== room_end
<- title("End", room1)
End of maze.->->
// =======================================

