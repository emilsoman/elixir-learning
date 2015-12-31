defmodule AppA do
  def start(_type, _args) do
    Task.start_link fn -> loop end
  end

  defp loop do
    :timer.sleep(1000)
    IO.puts "Running AppA"
    loop
  end
end
