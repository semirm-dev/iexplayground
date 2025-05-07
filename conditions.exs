# prefer case over if and cond

x = 1

res =
  case x do
    1 -> "one"
    2 -> "two"
    _ -> "other"
  end

IO.puts(res)

x = 2
IO.puts("new x: #{x}")

res2 =
  case 2 do
    ^x when x > 1 -> "greater than one"
    ^x when x < 1 -> "less than one"
    ^x -> "equal to one"
    _ -> "other"
  end

IO.puts(res2)

file = "nonexistent_file.txt"

case File.read(file) do
  {:ok, body} ->
    IO.puts(body)

  {:error, reason} ->
    IO.puts("Error: #{reason}")
end

x =
  if x > 1 do
    "greater than one"
  else
    "less than one"
  end

IO.puts("x after if: #{x}")

res3 =
  cond do
    x > 1 -> "greater than one"
    x < 1 -> "less than one"
    true -> "equal to one"
  end

IO.puts(res3)
