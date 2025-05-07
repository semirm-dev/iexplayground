# alias -> is used to give a name to a module, doesnt load/execute/import anything
# import -> is used to import functions/macros into the current scope so you can call them without the module name
# require -> is used to make macros available
# use -> is used automatically setup code (through 'using' macro)

# Tips:
# - Prefer alias for modules — no namespace pollution.
# - Use import selectively (only: [name: arity]!) — avoid massive import clashing.
# - use only trusted libraries — it injects code into your module.
# - require only for macros, normal functions don’t need it.

# ------------------------------------------------------------

pid =
  spawn(fn ->
    # blocking until a message is received
    receive do
      {:hello, msg} -> IO.puts(msg)
    after
      100 -> IO.puts("Timeout")
    end
  end)

Process.sleep(200)

send(pid, {:hello, "hello"})

# ------------------------------------------------------------
