defmodule AsyncTask do
  def start(_type, _arg) do
    Task.start_link fn -> start_app end
  end

  def start_app do
    task = Task.async(fn -> get_value end)
    IO.puts "Hello" <> Task.await(task)
  end

  def get_value do
    :timer.sleep(2000)
    "World"
  end
end
