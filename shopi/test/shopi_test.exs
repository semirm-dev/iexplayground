defmodule ShopiTest do
  use ExUnit.Case
  doctest Shopi

  test "greets the world" do
    assert Shopi.hello() == :world
  end
end
