# Streams build a series of computations that are invoked only when we pass the underlying stream to the Enum module.
# Streams are useful when working with large, possibly infinite, collections.

# Streams are lazy, they don't evaluate until we ask for the result.
# Streams are infinite, they can be as long as we want.
# Streams are composable, we can use them in a pipeline.

res = 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(&(rem(&1, 2) != 0)) |> Enum.sum()
IO.inspect(res)

res2 = 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(&(rem(&1, 2) != 0)) |> Enum.sum()
IO.inspect(res2)

stream = Stream.cycle([1, 2, 3])
IO.inspect(stream)
res3 = stream |> Enum.take(10) |> Enum.sum()
IO.inspect(res3)

# Stream.resource/3 which can be used to wrap around resources, guaranteeing they are opened right before enumeration
# and closed afterwards, even in the case of failures.
