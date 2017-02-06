# Here we will implement a small algorithm to compute the square root of a function

function approximate_square_root(x, a, recursions)
    if recursions == 0;
        return x   
    else
        return approximate_square_root((1/2)*(x + a/x), a, recursions-1)
    end
end

print(approximate_square_root(2, 3, 2))

