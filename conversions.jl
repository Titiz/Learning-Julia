# You cannot convert a boolean into a string
# Instead we can define a custom method such as:

convert(::Type{Bool}, x::String) = x=="false" ? false : x=="true" ? true : throw(InexactError())

convert(::Type{String}, x::Bool) = x==false ? "false" : x==true ? "true" : throw(InexactError())

println(convert(Bool, "true"))
println(convert(String, false))