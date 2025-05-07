defmodule Math do
  # The trailing question mark in zero? means that this function returns a boolean

  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end

  # The underscore in _wont_be_imported means that this function will not be imported
  # when the module is used in another module
  def _wont_be_imported do
    :oops
  end
end

# => true
IO.puts(Math.zero?(0))
# => false
IO.puts(Math.zero?(1))

defmodule Concat do
  # default value is optional, \\
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

# => Hello world
IO.puts(Concat.join("Hello", "world"))
# => Hello_world
IO.puts(Concat.join("Hello", "world", "_"))

# ------------------------------------------------------------

defmodule MyApp do
  # module attributes are inlined at compile time, so avoid overusing them
  # expose them as functions if they are used in multiple places to avoid memory overhead
  @svc_name "MyApp"

  defmodule User do
    @enforce_keys [:name, :age]
    defstruct name: "John", age: 27
  end

  def hello do
    IO.puts("#{@svc_name} says hello")
  end

  def usr do
    user = %User{name: "John", age: 27}
    IO.inspect(user)
  end
end

MyApp.hello()
MyApp.usr()
