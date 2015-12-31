defmodule MinimalApplication do
  def start(_type, _args) do
    loop
  end

  defp loop do
    :timer.sleep(1000)
    IO.puts "Running application"
    loop
  end
end
