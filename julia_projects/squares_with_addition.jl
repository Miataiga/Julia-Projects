#=
    This is an algorthim I made in grade ten or nine in math
    class. I was very bad at multiplication and did not want 
    to memorize all the square numbers up to 100. It was very 
    fun and I learned how to do this in my head up to 1024.
    Ironically, I thought about this algorthim so much that 
    I did end up memorizing all the square numbers up to 100 
    for the duration of that class, which was the amount we 
    were meant to know.

    Now it exists in machine form, very cool!
=#

function squares_with_addition(sqr_num)
    acc = 1
    curr_sqr = 1
    for i in 1:sqr_num
        println(curr_sqr)
        acc = acc + 2
        curr_sqr = curr_sqr + acc
    end
end

println("Please provide a reasonable amount of squares you'd like to have:")
user_sqr_num = parse(Int, readline())

squares_with_addition(user_sqr_num)