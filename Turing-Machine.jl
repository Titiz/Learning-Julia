#= In this file an attempt will be made to create a basic four-tople 
turing machine and implement addition, substraction and multiplication. =#

 # We begin by implementing the cell that will be on the infinite strip of the machine



type Cell
    marked::Bool
    Cell() = new(false)
end

function is_marked(cell::Cell)
    return cell.marked
end

function create_strip(integer1, integer2)
    strip = []
    for i=1:integer1
        push!(strip, 1)
    end
    push!(strip, 0)
    for i=1:integer2
        push!(strip, 1)
    end
    push!(strip, 0)
    return strip
end

print(create_strip(3, 4))

