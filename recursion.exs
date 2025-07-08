# Recursive call must be the last thing → no code after the recursion.
# Returning a variable right after recursion is fine (result = recursion(); return result) — ✔️ no problem.
# Early returns (inside if, case, cond) are okay — as long as in recursion branches, recursion is last.
# Passing parameters (even functions) into recursion is fine — ✔️ safe.
# Using or modifying recursion result after it returns breaks tail recursion — ❌ unsafe.
# Invoke callbacks before recursion, not after, if you need to..

# Doing extra work (e.g., string building, list prepending, callback invocation) after the recursive call.
# Combining multiple recursive results (e.g., fib(n-1) + fib(n-2)) — creates work after recursion.
# Building a result after recursion instead of accumulating it during recursion..

defmodule Recursion do
  def sum_to(0), do: 0

  def sum_to(n) when n > 0 do
    n + sum_to(n - 1) # ❌ breaks tail recursion
  end

  def sum_to_tail(0), do: 0

  def sum_to_tail(n) when n > 0 do
    sum_to_tail(n - 1, n) # ✔️ tail recursion
  end
end
