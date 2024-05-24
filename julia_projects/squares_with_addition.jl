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