=== library
<- title("Library", library)
{-> enter | -> returning}

= enter
You walk into a room where the walls are lined with bookshelves. A closer look reveals that most of the books in this library are fake. Planks of wood, carved and painted. Only 3 of them are real.
There is also a large chair here. You give it a few pokes to see if it's part of a trap but it looks like it's just a big chair.
<- opt
-> navigate

= opt
+ [Read a book.]->choose_book
* {stamina < STAMINA_TOTAL} [Sit in the chair.]
    ~ gainStamina(1)
    You take a moment to rest and sit in the big chair. It creaks suspiciously as you sit down but you eventually let it take all your weight and even lean back.
    It seems quieter in here than in the rest of the dungeon, quite a pleasant reading room despite what it's connected to. When you finally get up again you feel more relaxed.
    <- opt
    -> navigate

= choose_book
You decide to read a book, but which one?
+ [Get Rich Quick by Bokcha Atii.]
    {rich == 0:->rich|->rich_read}
* [Triggering Traps by Gek the Terrible.]->trigger
+ [The Kobold Emancipation by Hneet Emjinti.]->history

= rich
~gold += 3
You take Get Rich Quick by Bokcha Atii down from its shelf. Its weight feels strangely uneven and the pages seem stuck togeher. You open the cover to find that a hole has been cut through all the pages, turning the book into a container. It holds 3 gold coins.
You heed the advice of the book's title and take the gold before putting the book back on the shelf.
<- opt
-> navigate

= rich_read
You take Get Rich Quick by Bokcha Atii down from its shelf. You flip open the cover to see if more gold coins have managed to find their way into its compartment but it only holds the disappointment of nothing.
<- opt
-> navigate

= trigger
~ chance_1 = 60
You take Triggering Traps by Gek the Terrible down from its shelf and the book leaps out of your hands. It opens to reveal rows of sharp teeth and a throat that is deep enough to be impossible. You swiftly bat the monstrous book aside and point your spear at it.
On the floor the book slowly opens its mouth, betting its bite against your spear.
-> trigger_opt

= trigger_opt
+ [Attack Triggering Traps by Gek the Terrible. (%{chance_1})]-> attack
* {inventory ? multipass}[Brandish your pendant.]-> brandish
+ [Escape.]
    You make a dash for an exit. Though you're sure you won't be able to choose your route through here if you return.
    -> navigate

= attack
<- rollChance(chance_1)
{
- isSuccess:You slide your spear under the open cover of the book and flip the beast over. It teeth scrape against floor and you see its spine flex. You strike the book with your spear, the tome lets out an unholy wail and brown smoke leaks out of the wound you've created. You pull the spear free and the book crumbles into ash.
- else:
    ~ loseStamina()
    {
        - stamina > 0:You feint a strike to get the book to snap itself closed but it leaps off of the floor towards you. A panicked twirl of your spear knocks it aside and it flies unnaturally around the room, flapping its cover and pages in a mockery of bird flight. It swoops down to attack and you dive to the floor. It makes {RANDOM(2, 5)} more passes like this, with you diving out of the way before you manage to knock it out of the air and deal a killing blow. The book wails and crumbles into ash.
        - else:You try to stab it in the roof of its mouth but your lunge sends you stumbling forwards. The book-mouth opens impossibly wide and you fall inside. As you slide into the fleshy tunnel you strike your spear into its tongue, aiming to climb out. You coil up to leap out of the teeth rimmed opening before you.
            The teeth snap shut. It is dark and moist. Suddenly you are crushed from all sides. The book is returning to its normal size. You don't survive.
            -> THE_END
    }
}
~ wisdom++
You survey the room, making sure that this was the only lesson the book had to teach. Satisfied the area is clear you feel you learned it well: The Maze Builders have a terrible sense of humour.
<- opt
-> navigate

= returning
You return to the fake library room. <>
{
    -attack:The pile of ash on the floor, the two real books, and the large chair remain unchanged.
    -trigger:The monstrous tome of Triggering Traps by Gek the Terrible waits on the floor. It grins at your arrival.
        -> traps
    -else:The three real books and the large chair are just where you left them.
}
<- opt
-> navigate

= traps
~ chance_1 = 60 + brandish * 5
~ chance_2 = 80 + brandish * 5
+ [Attack the book. (%{chance_1})]-> attack
+ [Run past the book. (%{chance_2})]
    <- rollChance(chance_2)
    {
    - isSuccess:You raise your spear to attack the book, it hisses in reply. Then you run away. You hear the disgrunted flapping of its cover against the floor as it rethinks its tactics, but you've already fled the room.
    - else:
        ~ loseStamina()
        {
            - stamina > 0:You dash to your {~right|left} but the book manages to leap from the floor and bite on to your spear. You're forced to shake it off, stunning it against the shelves of fake books before you can flee.
            - else:You dash to your left and shortly hear a the flapping of a book cover from behind. You turn around to jab at the creature but there's nothing there. Turning full circle you still see no sign of the book. Then you hear a single flap from directly above you. The book hangs motionless above you, open. A gob of spit drops from its mouth and hits you in the eye. You blink out of reflex and suddenly feel rush of air at your face. Two wet walls of flesh slap either side of your head and sharp spiny blades slice through your neck. The last thing you hear could only be the sound of your lifeless body hitting the floor.
                -> THE_END
        }
    }
    -> navigate
* {not brandish && inventory ? multipass}[Brandish your pendant.]-> brandish
+ [{backtrack()}]-> go_direction(-1)

= brandish
You hold up the pendant the Maze Builder gave you before the book. It almost bites it out of your hand. This book does not respect authority. 
    -> traps

= history
You take The Kobold Emancipation by Hneet Emjinti down from its shelf{| again}. {It is a rather large book, too big to read in one sitting. You open it to a random page and read a passage.|}
-> passage

= passage
<i>{&For many years our ancestors gathered around the Great Abyss but no masters came forth. Such is the fate of many kobold tribes who failed to protect their former masters from being slain by the righteous and the greedy.|Some of us trace our lineage to those in servitude to the great dragon Felkar - who was defeated by a kobold. This raises an important question: Was Felkar a worthy master, or are kobolds just bad servants?|-> finish_book}</i>
+ [Return the book to the shelf.]
    You return the book to its shelf.
    <- opt
    -> navigate
+ [Read another passage.]
    You read another passage:
    -> passage

= finish_book
{
    -finish_book == 1:
        ~ wisdom++
}
<i>Eventually the Maze Builders came forth from the depths. Four and four limbed gods who pass through stone and command it. Their desire to create labyrinths and our desire to lay traps was a perfect match. Truly a great and worthy master had come to set the kobolds free from waiting.</i>
You've reached the end of the book. It has an illustration of a Maze Builder. It looks vaguely humanoid but with extra arms, legs, and eyes. It looks impressively abyssal.
+ [Return the book to the shelf.]
    You return the book to its shelf.
    <- opt
    -> navigate
