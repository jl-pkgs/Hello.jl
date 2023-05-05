using Libdl

println(pwd())
println("Hello world!")

run(`
  gcc leaf.c -O2 -fPIC -shared -o libleaf.$(dlext)
`)
