defmodule Processes do
  def start(_type, _args) do
    Task.start_link fn -> create_process(1) end
  end

  def create_process(n) do
    IO.puts n
    spawn(fn -> create_process(n+1) end)
    receive do end
  end
end
