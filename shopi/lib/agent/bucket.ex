defmodule Agent.Bucket do
  use Agent

  def start_link(opts) do
    Agent.start_link(fn -> %{} end, opts)
  end

  def put(bucket, key, value) do
    # When a long action is performed on the server, all other requests to that particular server will wait until the action is done,
    # which may cause some clients to timeout.

    # client action
    Agent.update(bucket, fn state ->
      # server action
      Map.put(state, key, value)
    end)
  end

  def get(bucket, key) do
    Agent.get(bucket, fn state ->
      Map.get(state, key)
    end)
  end

  def delete(bucket, key) do
    # because get_and_update needs to return the value
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
