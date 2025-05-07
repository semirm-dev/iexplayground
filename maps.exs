# keyword list are lists of tuples with a key and a value
# they are used to pass options to functions
# not used in pattern matching
# keyword lists are simply lists, and as such they provide the same linear performance characteristics:
# the longer the list, the longer it will take to find a key, to count the number of items, and so on.

# Elixir developers typically prefer to use the map.key syntax and pattern matching
# instead of the functions in the Map module when working with maps because they lead to an assertive style of programming.

res = [parts: 3, trim: true]
IO.inspect(res)
IO.puts(res[:parts])

res2 = [{:parts, 3}, {:trim, true}] == [parts: 3, trim: true]
IO.inspect(res2)

# Whenever you need to store key-value pairs, maps are the "go to" data structure
# they are used in pattern matching

map = %{:name => "John", :age => 23}
IO.inspect(map)
IO.inspect(map.name)

map2 = %{name: "John", age: 23}
IO.inspect(map2)
IO.inspect(map2.name)

# update operator, | is used to update the map, key must exist
map2 = %{map | age: 25}
IO.inspect(map2)

users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]

IO.inspect(users)
IO.inspect(users[:john].age)

# put_in is used to update the map, update operator, key must exist
users = put_in(users[:john].age, 31)
IO.inspect(users)

users = update_in(users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end)
IO.inspect(users)

# When you see the functions get, fetch, and fetch! for key-value data structures, you can expect the following behaviours:
# - get returns a default value (which itself defaults to nil) if the key is not present, or returns the requested value.
# - fetch returns :error if the key is not present, or returns {:ok, value} if it is.
# - fetch! raises if the key is not present, or returns the requested value.
