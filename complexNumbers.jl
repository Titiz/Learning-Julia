
# We can represent complex numbers really easily:

complex_number1 = 2+3im
complex_number2 = 4+2im

# We can perform basic computations 

sum = complex_number1 + complex_number2
difference = complex_number1 - complex_number2

# We can use elementary functions with these complex number to obtain approximate values:

complex_sine = sin(1+1im)
complex_cos = sin(1+1im)


# We can take the square root of a complex number as follows:

square_root = sqrt(9-6im)

# We can find the argument of a complex number as follows:

argument = angle(9-6im)

# Here we will check the general solution for cos(z) = 4.

for k=-50:50
    println(cos(log(4+sqrt(15))im + 2 * pi *k))
end


# all of the 100 solutions are very close to 4, when evaluated by Julia. Some where in the order e13 - e15.

# If we use the inbuilt method we get a an accurate solution

print(cos(acos(4 + 0im)))

# Still, the answer is 4.000000000000001 + 0.0im. But if we run this process repeatedly the value does not change.
value = cos(acos(4 + 0im))
for k=0:1000
    value = cos(acos(value))
end

println(value)  #value = 4.000000000000001 + 0.0im

# We can also use exponent to a power. 

power_1 = exp(1+1im)
power_2 = exp(1-1im)
power_3 = exp(1)
power_4 = exp(1im) 


# We now will check a certain property for several values of complex numbers


values = [0, 1, 2, 3, 4, 1im, 2im, 3im, 4im, 1+1im, 1+2im, 2-1im, 1-2im]
property_true = true
for value in values
    property_true = exp(1im*conj(value)) == conj(exp(1im*value))
    println(exp(1im*conj(value)))
    println(conj(exp(1im*value)))
    if !property_true
        println("$value is false")
    end
end

# This helps us identify that the property is valid only when value = 0 + 0im

# Let us examine the function 1/(1+exp(z))



