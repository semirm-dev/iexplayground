add = fn a, b -> a + b end

res = add.(1, 2)
IO.puts(res)

x = 1
IO.puts(x)

multiply = fn a, b ->
  # x is a local variable, it's not accessible outside the function, nor does it change the value of x outside the function
  x = 2
  IO.puts(x)
  a * b * x
end

res2 = multiply.(2, 2)
IO.puts(res2)
IO.puts(x)

eval = fn
  x when x > 10 -> "greater than 10"
  x when x < 10 -> "less than 10"
  _ -> "equal to 10"
end

IO.puts(eval.(11))
IO.puts(eval.(9))
IO.puts(eval.(10))

fun = &is_atom/1
IO.puts(fun.(:hello))
IO.puts(fun.("hello"))

fun2 = &(&1 + &2)
IO.puts(fun2.(1, 2))
fun2 = &"Good #{&1}"
IO.puts(fun2.("morning"))
