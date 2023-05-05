l = Leaf()
l.x = 999.0
# l.y .= rand(5)
@show l
# show(l)
# @ccall lib.hello()::Cvoid
# ccall((:hello, lib), Cvoid, ())

# ccall((:hello, lib), Cvoid, ())
# @ccall lib.init_leaf_struct(Ref(l)::Ptr{Leaf})::Cvoid
l.y[1] = 999.0

@ccall lib.set_2th_value(Ref(l)::Ptr{Leaf}, 3.0::Cdouble)::Cvoid

show(l)
# l.y[1] = 999.0

# @ccall lib.init_leaf_struct2(Ref(l)::Ptr{Leaf})::Cvoid
# @show l
# @show l.y

# 结论: julia unable to change the value of C array
