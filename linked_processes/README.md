Exercise to study linked processes and how errors get propagated.

```
$ iex -S mix

iex> :observer.start
# Check applications in observer

iex> LinkedProcesses.kill_process1
# Check applications in observer

iex> recompile
iex> LinkedProcesses.kill_process2
# Check applications in observer

iex> recompile
iex> LinkedProcesses.kill_self
# Check applications in observer
```
