#= In this file an attempt will be made to create a basic four-tople 
turing machine and implement addition and  substraction =#

 # We begin by implementing the cell that will be on the infinite strip of the machine



type TuringMachine
    pointer_location::Int8 
    instructions::Array 
    current_state::Int8 
    strip::Array
    function TuringMachine()
        new(1, [], 1, [])
    end
end


function set_pointer_location(tur_mach::TuringMachine, index::Int64)
    tur_mach.pointer_location = index
end


function create_strip(tur_mach::TuringMachine, integer1, integer2)
        tur_mach.strip = ["-"]
        for i=1:integer1
            push!(tur_mach.strip, "x")
        end
        push!(tur_mach.strip, "-")
        for i=1:integer2
            push!(tur_mach.strip, "x")
        end
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

function performTask()

end


turing_machine = TuringMachine()

create_strip(turing_machine, 3, 4)
print(turing_machine.strip)

addInstruction(turing_machine, [1, "-", "x", 2])
readInstruction(turing_machine, 1)


print(turing_machine.strip)

