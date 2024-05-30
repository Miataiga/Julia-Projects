#=
    Here I just wanted to create a text adventure type game that 
    was easy to read and edit, unlike the big chain of conditional 
    stuff that I saw when I searched up how to make one.

    I ended up making my first struct, 2D Array, and because I 
    know that ifelse mashing is unpleasant (the whole reason I 
    started this project), I was devasted to hear that Julia has 
    no built in Switch Statements.

    Luckily, I found someone online who was talking about 
    Short-Circuit Operators and learned a lot about what you 
    can and can't do with those which was fun.

    I also learned a lot about how Arrays and For Statements 
    work which you can see a lot of.

    Overall, as my first big project in Julia, I am very proud 
    of this little text adventure. I wanna keep it small like 
    this for now, but maybe later I'll do a text adventure 2 
    with more mechanics.
=#

mutable struct Entity
    name::String
    location::String
    x::Int64
    y::Int64
end

mutable struct Object
    name::String
    location::String
end

player = Entity("Player", "Garden", 1, 1)

cool_rock = Object("Cool Rock", "Cool Cave")
skateboard_dog = Object("Skateboard Dog", "Skate Park")
green_bug = Object("Green Bug", "Old Log")
nonsecret_frog = Object("Nonsecret Frog", "Pond")
dancing_bird = Object("Dancing Bird", "Bird Nest")
hopes_and_dreams = Object("pile of Hopes and Dreams", "Bottomless Pit")
secret_frog = Object("Secret Frog", "Garden")

Objects = [cool_rock, skateboard_dog, green_bug, nonsecret_frog, dancing_bird, hopes_and_dreams]
Inventory = [secret_frog]

Map = ["Garden" "Cool Cave" "Skate Park"; "Big Tree" "Small House" "Pond"; "Old Log" "Bird Nest" "Bottomless Pit"]
#=
    Garden-------Cool Cave----Skate Park--
    --------------------------------------
    Big Tree----Small House-----Pond------
    --------------------------------------
    Old Log------Bird Nest--Bottomless Pit
=#

# One day I will change these values to check the size of the Map Array.
function move_north()
    if player.y != 1
        player.y = player.y - 1
    else
        println("*You cannot go any further North!*")
    end
end
function move_east()
    if player.x != 3
        player.x = player.x + 1
    else
        println("*You cannot go any further East!*")
    end
end
function move_south()
    if player.y != 3
        player.y = player.y + 1
    else
        println("*You cannot go any further South!*")
    end
end
function move_west()
    if player.x != 1
        player.x = player.x - 1
    else
        println("*You cannot go any further West!*")
    end
end

function swap!(toArray, fromArray, index)
    push!(toArray, fromArray[index])
    deleteat!(fromArray, index)
end

function grab_object(input)
    for (index, value) in pairs(Objects)
        if input == ("grab " * value.name) && player.location == value.location
            println("*You grabbed the ", value.name, "*")
            swap!(Inventory, Objects, index)
            return input
        end
    end
end

function drop_object(input)
    for (index, value) in pairs(Inventory)
        if input == ("drop " * value.name)
            println("*You dropped the ", value.name, "*")
            value.location = player.location
            swap!(Objects, Inventory, index)
            return input
        end
    end
end

function list_actions()
    input = readline()
    input == "n" && return move_north()
    input == "e" && return move_east()
    input == "s" && return move_south()
    input == "w" && return move_west()
    input == grab_object(input) && return
    input == drop_object(input) && return

    println("*Invalid command. Don't forget case sensitivity.*")
end

println("All commands and names are case sensitive!")
while true
    player.location = Map[player.y, player.x]
    println("You are in the ", player.location)
    for (index, value) in pairs(Objects)
        if value.location == player.location
            println("You can see a ", value.name)
        end
    end
    println("Move in a direction by typing 'n','e','s', or 'w'")
    println("Grab or Drop an object by typing 'grab (object name)' or 'drop (object name)'")
    list_actions()
end