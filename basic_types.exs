integer = 1
float = 1.0
string = "Hello, World!" <> " woow => #{1 + 1}"
boolean = 1 == 1 and 2 == 2
boolean2 = 1 == 1.0
boolean3 = 1 == 1.1
atom = :hello

IO.puts(integer)
IO.puts(float)
IO.puts(string)
IO.puts("string is #{String.length(string)} characters long")
IO.puts(boolean)
IO.puts(boolean2)
IO.puts(boolean3)
IO.puts(atom)

a = 1
IO.puts(a)
# accessing current/existing value of a, it must match the value of a
^a = 1
IO.puts(a)
b = 2
a = 2
IO.puts(a)
IO.puts(b)
