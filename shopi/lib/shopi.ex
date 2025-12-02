defmodule Shopi do
  alias Shopi.Bucket
  use Application

  def start(_type, _args) do
    children = [
      {Registry, name: Shopi, keys: :unique}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def bucket do
    name = {:via, Registry, {Shopi, "shopping"}}
    Bucket.start_link(name: name)

    Bucket.put(name, "milk", 3)
    Bucket.put(name, "eggs", 6)
    m = Bucket.get(name, "milk")
    e = Bucket.get(name, "eggs")
    IO.puts("Before Milk: #{inspect(m)}, Eggs: #{inspect(e)}")

    Bucket.delete(name, "milk")

    m = Bucket.get(name, "milk")
    e = Bucket.get(name, "eggs")
    IO.puts("After Milk: #{inspect(m)}, Eggs: #{inspect(e)}")
  end
end
