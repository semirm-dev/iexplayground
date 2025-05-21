# comprehensions are a way to iterate over a list and return a new list (filter, map, etc)
# by default comprehensions return a list, but you can use the :into option to return a different data structure

# ------------------------------------------------------------

values = [good: 1, good: 2, bad: 3, good: 4]
res = for {:good, n} <- values, do: n * n
IO.inspect(res)

# ------------------------------------------------------------

cartesian = for x <- [:a, :b, :c], y <- [1, 2, 3], do: {x, y}
IO.inspect(cartesian)

# ------------------------------------------------------------
