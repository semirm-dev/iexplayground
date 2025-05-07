# Lists
list = [1, 2]
list2 = [3, 4, :amazing, true, 5]
IO.inspect(list)
IO.inspect(list2)

# Adding elements to a list, traversing from left to right
# left side will traverse so it's better to put the shorter list on the left
list3 = list ++ list2
IO.inspect(list3)
IO.inspect(hd(list3))
IO.inspect(tl(list3))

prepend = [-9 | list3]
IO.inspect(prepend)

char_list = [11, 12, 13]
IO.inspect(char_list)

# Tuples
# fast access to data
tuple = {1, 2, 3}
IO.inspect(tuple)
IO.inspect(elem(tuple, 1))

# General rule is to use list for dynamic data, and tuple for fixed data
# output is dynamic -> returns a list
list_returned = String.split("hello beautiful world")
IO.inspect(list_returned)

# output is fixed -> returns a tuple
tuple_returned = String.split_at("hello world", 3)
IO.inspect(tuple_returned)

# Size calculation is fixed, constant time
# Length calculation is dynamic/slow, linear time
