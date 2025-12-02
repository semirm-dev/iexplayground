defmodule Shopi do
  alias Shopi.Bucket
  use Application

  # means we are implementing the Application required callback
  @impl true
  def start(_type, _args) do
    children = [
      # used to store processes by name for easy lookup,
      # crashed processes are automatically re-registered and access by the same name still
      # usually have 1-3, to group related processes, like namespaces
      # and it is usually only called from dynamic supervisors to register children under a name
      {Registry, name: Shopi, keys: :unique},
      # starting Shopi.Bucket supervised here would make it a singleton, which is not what we want
      # for such use cases where we want multiple buckets (e.g., per user/session) we need to start them dynamically
      # can have millions of processes if needed
      # dynamic supervisor allows starting/stopping children dynamically at runtime
      # each bucket will be its own supervised process
      # it means if a bucket process crashes, only that bucket is affected, not others
      # also allows to scale number of buckets up/down as needed at runtime to a large number of buckets
      {DynamicSupervisor, strategy: :one_for_one, name: Shopi.Bucket}
    ]

    # this is the "implementation" part, start supervisor and return its pid
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def create_bucket(name) do
    DynamicSupervisor.start_child(
      # the dynamic supervisor started under Shopi application
      Shopi.Bucket,
      # the bucket process to be started, which implements start_link/1 (bucket.ex)
      {Shopi.Bucket, name: via(name)}
    )
  end

  def lookup_bucket(name) do
    GenServer.whereis(via(name))
  end

  def put_bucket(name, key, value) do
    case lookup_bucket(name) do
      nil -> {:error, :bucket_not_found}
      bucket -> Bucket.put(bucket, key, value)
    end
  end

  def get_bucket(name, key) do
    case lookup_bucket(name) do
      nil -> {:error, :bucket_not_found}
      bucket -> Bucket.get(bucket, key)
    end
  end

  def delete_bucket(name, key) do
    case lookup_bucket(name) do
      nil -> {:error, :bucket_not_found}
      bucket -> Bucket.delete(bucket, key)
    end
  end

  defp via(name), do: {:via, Registry, {Shopi, name}}
end
