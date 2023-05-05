const lib = joinpath(@__DIR__, "../deps/libleaf.dll")

nzero(n) = tuple(zeros(n)...)

@with_kw mutable struct Leaf
  x::Cdouble = 1.0
  # y::Vector{Cdouble} = zeros(5)
  # z::Vector{Cdouble} = zeros(5)
  y::NTuple{5,Cdouble} = nzero(5)
  z::NTuple{5,Cdouble} = nzero(5)
end

function hello()
  # @show lib
  # @ccall lib.hello()::Cvoid
  ccall((:hello, lib), Cvoid, ())
end

function init_leaf(l)
  @ccall lib.init_leaf_struct(Ref(l)::Ptr{Leaf})::Cvoid
end

function set_value(vec::NTuple{N,Float64}, i::Int, value::Cdouble) where N
  @ccall lib.set_value(vec::Ptr{Cdouble}, i::Cint, value::Cdouble)::Cvoid
end


function show(l::Leaf)
  @ccall lib.show(Ref(l)::Ptr{Leaf})::Cvoid
end


export Leaf, hello, show, 
  init_leaf, 
  set_value
