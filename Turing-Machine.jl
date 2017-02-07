#= In this file an attempt will be made to create a basic four-tople 
turing machine and implement addition and  substraction =#

 # We begin by implementing the cell that will be on the infinite strip of the machine



type TuringMachine
    pointer_location::Int8 
    instructions::Array 
    current_state::Int8 
    strip::Array
    break_limit::Int8
    break_counter::Int8
    function TuringMachine()
        new(1, [], 1, [], 100, 0)
    end
end




function create_strip(tur_mach::TuringMachine, integer1, integer2)
        tur_mach.strip = ["-", "-"]
        for i=1:integer1
            push!(tur_mach.strip, "x")
        end
        push!(tur_mach.strip, "-")
        for i=1:integer2
            push!(tur_mach.strip, "x")
        end
        push!(tur_mach.strip, "-")
        push!(tur_mach.strip, "-")

end


function addInstruction(tur_mach::TuringMachine, instruction)
        push!(tur_mach.instructions, instruction)
end

function readInstruction(tur_mach::TuringMachine, index::Int64)
    instruction_done = false 
    if tur_mach.current_state == tur_mach.instructions[index][1]
        if tur_mach.strip[tur_mach.pointer_location] == tur_mach.instructions[index][2]
            instruction_done = true
            if tur_mach.instructions[index][3] == "L"
                tur_mach.pointer_location -= 1 
            elseif tur_mach.instructions[index][3] == "R"
                tur_mach.pointer_location +=1
            elseif tur_mach.instructions[index][3] == "x"
                tur_mach.strip[tur_mach.pointer_location] = "x"
            else 
                tur_mach.strip[tur_mach.pointer_location] = "-"
            end
        tur_mach.current_state = tur_mach.instructions[index][4]
        end
    end
end


function resize(tur_mach::TuringMachine)
    if tur_mach.pointer_location >= length(tur_mach.strip)
        push!(tur_mach.strip, "-")
        tur_mach.break_counter += 1
    elseif tur_mach.pointer_location <= 0
        tur_mach.break_counter += 1
        tur_mach.strip = append!(tur_mach.array, ["-"])
    end
    
    if tur_mach.break_counter > tur_mach.break_limit
        return false
    end
    return true
end

function setPointerLocation(tur_mach::TuringMachine)
    index = 1
    while tur_mach.strip[index] != "x"
        index += 1
    end
    tur_mach.pointer_location = index
end

function performTask(tur_mach::TuringMachine)
    setPointerLocation(tur_mach)
    while tur_mach.current_state != 0
        for index = 1:length(tur_mach.instructions)
            readInstruction(tur_mach, index)
            cont = resize(tur_mach)
                if !cont 
                    println("MAXIMUM ADDITION LIMIT EXCEEDED")
                    return
                end
        end
        println(tur_mach.current_state)
        println(tur_mach.strip)
    end
end

function printStrip(tur_mach::TuringMachine)
    for item in tur_mach.strip
        print(item)
    end
    println()
end

turing_machine = TuringMachine()

create_strip(turing_machine, 8, 0)
printStrip(turing_machine)

# Christine Dah-In Chung's Turing Machine for finding the center of a
# an array of odd length


addInstruction(turing_machine, [1, "x", "L", 2])
addInstruction(turing_machine, [1, "-", "x", 0])
addInstruction(turing_machine, [2, "x", "R", 3])
addInstruction(turing_machine, [2, "-", "R", 3])
addInstruction(turing_machine, [3, "x", "R", 4])
addInstruction(turing_machine, [3, "-", "R", 3])
addInstruction(turing_machine, [4, "x", "L", 5])
addInstruction(turing_machine, [4, "-", "L", 6])
addInstruction(turing_machine, [5, "x", "-", 5])
addInstruction(turing_machine, [5, "-", "R", 7])
addInstruction(turing_machine, [6, "x", "-", 6])
addInstruction(turing_machine, [6, "-", "L", 8])
addInstruction(turing_machine, [7, "x", "R", 7])
addInstruction(turing_machine, [7, "-", "L", 1])
addInstruction(turing_machine, [8, "x", "L", 8])
addInstruction(turing_machine, [8, "-", "R", 1]) 

performTask(turing_machine)


# Christine Dah-In Chung implementation of subtraction

# addInstruction(turing_machine, [1, "x", "-", 1])
# addInstruction(turing_machine, [1, "-", "R", 2])
# addInstruction(turing_machine, [2, "x", "R", 2])
# addInstruction(turing_machine, [2, "-", "R", 3])
# addInstruction(turing_machine, [3, "x", "R", 2])
# addInstruction(turing_machine, [3, "-", "L", 4])
# addInstruction(turing_machine, [4, "x", "-", 5])
# addInstruction(turing_machine, [4, "-", "L", 4])
# addInstruction(turing_machine, [5, "x", "L", 5])
# addInstruction(turing_machine, [5, "-", "L", 8])
# addInstruction(turing_machine, [6, "x", "L", 6])
# addInstruction(turing_machine, [6, "-", "L", 7])
# addInstruction(turing_machine, [7, "x", "L", 7])
# addInstruction(turing_machine, [7, "-", "R", 1])
# addInstruction(turing_machine, [8, "x", "L", 6])
# addInstruction(turing_machine, [8, "-", "R", 0]) 


printStrip(turing_machine)


