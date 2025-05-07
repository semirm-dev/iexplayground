p1 = spawn(fn -> IO.puts("p1 hello") end)
# very likely to be dead
# because it immediately executes and dies
# if it was a long running process or a receiver, it would be alive
# processes are fire-and-forget, immediately execute and die
IO.inspect(p1)
IO.puts(Process.alive?(p1))

# ------------------------------------------------------------

# spawn a new process, isolated from the current process,
# if it crashes, it will not affect the current/other process.
# spawn gives you concurrency. Parallelism. Isolation. Fault-tolerance.
# Without spawn, you're still in the same process — single-threaded execution, no real concurrency, no process isolation.
# whatever is prone to fail, should be spawned

# send is non-blocking, it will not wait for the process to finish
# normally you dont need to spawn a process to send a message

# Rare cases where you need to wrap send in spawn:
# - Want to delay send/2 with :timer.sleep
# - Want to offload some async logic alongside send
# - Need an anonymous, one-off async fire-and-forget message generator

# Example:
# spawn(fn ->
#   :timer.sleep(1000)
#   send(pid, :ping)
# end)
# ✔️ This just delays the send without blocking the current process.

send(self(), {:hello, "hello self"})

# receive is blocking, it will wait for a message
receive do
  {:hello, msg} -> IO.puts(msg)
end

# ------------------------------------------------------------

recPid =
  spawn(fn ->
    for _ <- 1..5 do
      receive do
        {:hello, msg} -> IO.puts(msg)
      end
    end
  end)

send(recPid, {:hello, "hello 1"})
send(recPid, {:hello, "hello 2"})
send(recPid, {:hello, "hello 3"})
send(recPid, {:hello, "hello 4"})
send(recPid, {:hello, "hello 5"})

# ------------------------------------------------------------

# if fails, it will terminate current process
# because it's automatically linked to the current process
# spawn_link(commFail)

# spawn = Task.start()
# spawn_link = Task.start_link()

# ------------------------------------------------------------

receive do
after
  500 -> IO.puts("Timeout")
end
