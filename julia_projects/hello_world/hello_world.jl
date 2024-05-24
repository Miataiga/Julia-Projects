greeting = "haiku.txt"

open(greeting,"r") do f
    for line in eachline(f)
        println(line)
    end
end