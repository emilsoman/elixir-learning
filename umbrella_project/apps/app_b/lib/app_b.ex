defmodule AppB do
  def start(_type, _args) do
    Task.start_link fn -> loop end
  end

  defp loop do
    :timer.sleep(1000)
    IO.puts "Running AppB"
    loop
  end
end
