defmodule Utility do
  def type(value) when is_integer(value), do: "#{value} is an integer"
  def type(value) when is_float(value), do: "#{value} is a float"
end

# ------------------------------------------------------------

IO.inspect(Utility.type(123))
IO.inspect(Utility.type(123.45))

# ------------------------------------------------------------

defprotocol MyProtocol do
  def hello(value)
end

defimpl MyProtocol, for: Integer do
  def hello(value), do: "Hello integer #{value}"
end

defimpl MyProtocol, for: Float do
  def hello(value), do: "Hello float #{value}"
end

IO.inspect(MyProtocol.hello(123))
IO.inspect(MyProtocol.hello(123.45))

# ------------------------------------------------------------

defmodule MyApp do
  defmodule User do
    # @derive lets you automatically implement a protocol for a struct without writing the defimpl manually.
    # @derive lets you hide the struct fields from the inspect output
    @derive [
      {Inspect, only: [:id, :name]}
      # {Jason.Encoder, only: [:id, :name]}
    ]
    defstruct [:id, :name, :email, :password_hash]
  end

  def user do
    user = %User{id: 1, name: "John", email: "john@example.com", password_hash: "1234567890"}

    IO.inspect(user)
    # Jason.encode!(user)
  end
end

MyApp.user()
