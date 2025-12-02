defmodule Shopi do
  @moduledoc """
  Documentation for `Shopi`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Shopi.hello()
      :world

  """
  def hello do
    :world
  end

  def greet() do
    {:ok, agent} = Agent.start_link(fn -> ["hi"] end)
    IO.puts("Agent started with PID: #{inspect(agent)}")

    Agent.update(agent, fn state ->
      new_state = ["Hello, Shopi!" | state]
      IO.puts("State updated to: #{inspect(new_state)}")
      new_state
    end)

    Agent.get(agent, fn state ->
      IO.puts("Current state: #{inspect(state)}")
      state
    end)

    Agent.stop(agent)
    IO.puts("Agent stopped.")

    # attempting to get state after stopping the agent will result in an error
    # Agent.get(agent, fn state ->
    #   state
    # end)
  end
end
