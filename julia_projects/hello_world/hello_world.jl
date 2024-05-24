#=
    I decided to write hello world in this way because this is the last thing
    I remember coding. I was trying to learn data science online a while ago 
    but decided to go to college instead for a more hands-on learning
    experience. That time I was using Python, but I didn't wanna get ahead
    of myself for the languages I'd be learning in college so I chose to learn
    Julia in the meantime!
=#

greeting = "haiku.txt"

open(greeting,"r") do f
    for line in eachline(f)
        println(line)
    end
end