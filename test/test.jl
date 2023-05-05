using Hello

l = Leaf()
init_leaf(l)
@show l.y


# l.x = 999.0
# l.y[1] = 99.0
# # l.y .= rand(5)
# @show l
# show(l)

# 

l.y[1] = 999.0

@ccall lib.set_2th_value(Ref(l)::Ptr{Leaf}, 3.0::Cdouble)::Cvoid

show(l)
