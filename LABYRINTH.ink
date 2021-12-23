# author: Aaron Steed

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
EXTERNAL changeRooms()
EXTERNAL isLooped()

CONST STAMINA_TOTAL = 5
LIST items = bird, golden_apple, multipass, another_apple, quaid_coin, falconsloth_red, falconsloth_blue, nim_stone, glass_eye, pinch_of_salt, cursed_ring, wind_name, pint_of_black, money_nothing, chip_block

VAR depth = 0// index in stack of rooms
VAR depth_lowest = 0// the lowest depth we've visted
VAR room_index = 0// the index of the room chosen
VAR direction = 1// 1: going deeper -1: going back
VAR inventory = ()// items/conditions you carry
VAR wisdom = 0// used to skip depths
VAR wisdom_prev = 0// used to detect wisdom update in passages
VAR lucky = false// gives advantage on next dice roll
VAR isSuccess = false// did we succeed at <-rollChance()
VAR isEnding = false// is this the end of the maze?
VAR isReachedCenter = false// have we been to the center?
VAR isReplay = false// is this a replay?

// temporaty VARs for tracking chance
VAR chance_1 = 0
VAR chance_2 = 0

VAR gold = 0// score
//VAR stamina = 1
VAR stamina = STAMINA_TOTAL

// =======================================
// CORE LOOP
-> new_room

// external calls
=== function setRoomIndex()
~ room_index = depth
~ return

=== function changeRooms()
~ return

=== function isLooped()
~ return false

=== navigate
+ {depth > 0}[Go back.] -> go_back
+ {not isEnding}[Go deeper.] -> go_deeper

=== go_back
~direction = -1
~depth--
{isReachedCenter && depth > 0 && lucky:
    <- passages.lucky_return
}
{isLooped():
    <- passages.dejavu
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
{isLooped():
    <- passages.dejavu
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
//-> new_room_debug // DEBUG
-> new_room_game

=== new_room_game
~ setRoomIndex()
~ isEnding = false
{ room_index:
    - 0:-> entrance
    - 1:-> canary
    - 2:-> bowl_of_water
    - 3:-> trip_room
    - 4:-> grindstone
    - 5:-> ghost_room
    - 6:-> fresco
    - 7:-> plinth
    - 8:-> grease
    - 9:-> clicker
    - 10:-> finger
    - 11:-> right_left_slam
    - 12:-> food_table
    - 13:-> library
    - 14:-> ceiling
    - 15:-> invisible_wall
    - 16:-> windy
    - 17:-> falconsloth
    - 18:-> blades
    - 19:-> windmill
    - 20:-> eye_thing
    - 21:-> nim_troll
    - 22:-> drinks_bar
    - 23:-> mist
    - 24:-> quaid_doubler
    - 25:-> beligerent_huff
    - 26:-> limerick
    - 27:-> black_pool
    - 28:-> custard
    - 29:-> hands
    - 30:-> flies
    - 31:-> pudding
    - 32:-> toadstools
    - 33:-> suit_of_armour
    - else:
        ~ isEnding = true
        ~ isReachedCenter = true
        -> center
}

// =======================================
// ROOM DEBUGGING
=== new_room_debug
~ setRoomIndex()
~ isEnding = false
{ room_index:
    - 0:-> room1
    - 1:-> custard
    - 2:-> room2
    - 3:-> room3
    - 4:-> room4
    - 5:-> room5
    - else:
        ~ isEnding = true
        ~ isReachedCenter = true
        -> room_end
}

=== room1
<- title("Room 1", room1)
// ~ lucky = true
1-> navigate

=== room2
<- title("Room 2", room2)
// ~ lucky = false
// ~ loseStamina()
2-> navigate

=== room3
<- title("Room 3", room3)
3-> navigate

=== room4
<- title("Room 4", room4)
4-> navigate

=== room5
<- title("Room 5", room5)
// ~ lucky = true
5-> navigate

=== room_end
<- title("End", room1)
End of maze.-> navigate
// =======================================

