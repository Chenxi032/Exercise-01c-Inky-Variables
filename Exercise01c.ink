/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR food = 0

VAR Name = ""
VAR tourches = 0    

-> memory
== memory  ==
Before you enter the cave, you can call one of your best friends. so you don't have to enter the cave along. who would you call?
*[Bill]
    ~ Name = "Bill"
    -> cave_mouth
*[Peter]
    ~ Name = "Peter"
    -> cave_mouth
*[Ben]
    ~ Name = "Ben"
    -> cave_mouth
== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.if only {Name} can see you now

you have {tourches} tourches now



+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {tourches > 0 } [Light Torch] -> east_tunnel_lit
*{Name == "Bill"} [What?]-> GoodEnding
+ [Go Back] -> cave_mouth
-> END

=== GoodEnding ===
bill finds a cable car, and because he's heavy enough he takes you out on the cable car
-> END

== west_tunnel ==
You are in the west
{Name == "Ben":Ben feel there might be exit at front.} 
*{Name == "Ben"} [Exit]-> Exit

{Name == "Peter": Peter find something at corner.} 
*{Name == "Peter"} [Check it out]-> Foods

{Name == "Bill": Bill don't feel well and passed out.} 
*{Name == "Bill"} [What?]-> Bad_END
+ [Go Back] -> cave_mouth
-> END

=== Bad_END ===
Bill so over weight and he passed out, you can't carry him, so you two died in the cave.
-> END

=== Foods
Peter find a bag with foods
~ food = food + 10000
you have {food} food, that is enough to live here
->END

=== Exit ===
There is an Exit at front we made it out!!

->END


=== torch_pickup ===
~ tourches = tourches +1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END