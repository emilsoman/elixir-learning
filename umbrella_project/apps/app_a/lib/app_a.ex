defmodule AppA do
  def start(_type, _args) do
    loop
  end

  defp loop do
    :timer.sleep(1000)
    IO.puts "Running AppA"
    loop
  end
end
